local GS = GameScript
local Callbacks = GS.Callbacks
local Support = GS.Support
local Game = GS.Game
local Player = GS.Game.Player
local ObjectTags = Game.ObjectTags
local Physics = Game.Physics
local MP = Game.MP
local AI = Game.AI
local Sets = Game.Sets
Support.RegisterObjectTemplateVariable("SpawnedEnemy", "The object template for the spawned enemy")
local kMaxNumSpawnedAI = Support.ImportFloatVariableWithDefault("Max Num Spawned AI", "The maximum number of spawned AI form one players possessed phase caster", 2)
local kMinRestingSpeed = 0.075
local myObject = Game.GetMyObject()
local minColNormal = 0.68

function ClientOnCollisionMessage(colMsg)
  if colMsg.normalY >= minColNormal then
    Game.SendTextMessage(myObject, "SpawnPortalEffects")
    Callbacks.UnregisterForMsg(GS.MsgCallback.CollisionMessage, myObject, "ClientOnCollisionMessage")
  end
end

function HostOnCollisionMessage(colMsg)
  if colMsg.normalY >= minColNormal then
    Game.SendTextMessage(myObject, "SpawnPortalEffects")
    local spawnPosition = Game.GetPosition(myObject)
    local spawnRotation = Game.GetRotation(myObject)
    local spawnedAI = Game.SpawnWithRotation("SpawnedEnemy", spawnPosition, spawnRotation)
    local ownerObject = Game.GetOwnerObjectChangeHandlingObject(myObject)
    if ownerObject ~= nil then
      local playerIndex = Player.GetPlayerIndexByObject(ownerObject)
      local playerContObject = Player.GetPlayerControlledObjectByIndex(playerIndex)
      Game.CopyNation(playerContObject, spawnedAI)
      local playerObject = Player.GetPlayerAvatarObjectByIndex(playerIndex)
      Game.SetOwnerObject(playerObject, spawnedAI, true)
      local playerSquadSet
      if playerIndex == GS.PlayerIndex.kGlobalPlayer2 then
        playerSquadSet = ObjectTags.GetObjectsWithTag("MPPhaseCasterSpawnSquadP2")
      elseif playerIndex == GS.PlayerIndex.kGlobalPlayer3 then
        playerSquadSet = ObjectTags.GetObjectsWithTag("MPPhaseCasterSpawnSquadP3")
      elseif playerIndex == GS.PlayerIndex.kGlobalPlayer4 then
        playerSquadSet = ObjectTags.GetObjectsWithTag("MPPhaseCasterSpawnSquadP4")
      else
        playerSquadSet = ObjectTags.GetObjectsWithTag("MPPhaseCasterSpawnSquadP1")
      end
      if playerSquadSet ~= nil then
        for key, set in pairs(playerSquadSet) do
          if set ~= nil then
            local numObjectsInSet = Sets.GetNumObjectsInSet(set)
            if numObjectsInSet >= kMaxNumSpawnedAI then
              local objectsInSet = Sets.GetObjectsInSet(set)
              for k, object in pairs(objectsInSet) do
                Game.Damage(object, 100000)
                break
              end
            end
            Sets.AddObjectToSet(set, spawnedAI)
          end
        end
      end
    end
    Callbacks.UnregisterForMsg(GS.MsgCallback.CollisionMessage, myObject, "HostOnCollisionMessage")
    Game.Kill(myObject, 1)
  end
end

if MP.IsClient() then
  Callbacks.RegisterForMsg(GS.MsgCallback.CollisionMessage, myObject, "ClientOnCollisionMessage")
else
  Callbacks.RegisterForMsg(GS.MsgCallback.CollisionMessage, myObject, "HostOnCollisionMessage")
end
