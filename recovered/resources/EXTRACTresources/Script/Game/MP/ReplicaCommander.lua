local Game = GameScript.Game
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Player = GameScript.Game.Player
local Utilities = GameScript.Utilities
local MP = Game.MP
local myObject = Game.GetMyObject()
local currentAISpawned = 0
local playerIndex = -1
local bHostIsLocalPlayer = false
local kMaxAI = 6
local kTooCloseDistance = 5
local inventoryStrings = {
  "SMG",
  "UZI",
  "Assault Rifle",
  "Shotgun"
}
Support.ExportFloatVariable("CanSpawnAI", 1, "Can the Replica Commander currently spawn AI?")
Support.ImportWatchVariable("InventoryGroup", "The currently selected invnetory group.")

function OnAIDeath(deathMsg)
  if deathMsg == nil then
    return
  end
  if deathMsg.victimPlayerIndex == GameScript.PlayerIndex.kNotAGlobalPlayer then
    currentAISpawned = currentAISpawned - 1
    if currentAISpawned < kMaxAI then
      Extern.CanSpawnAI = 1
    end
  end
end

function OnAISpawn(spawnMsg)
  if spawnMsg.text == "AISpawned" then
    currentAISpawned = currentAISpawned + 1
    if currentAISpawned >= kMaxAI then
      Extern.CanSpawnAI = 0
    end
  end
end

function DebugInventoryUpdate()
  Debug.PrintToScreen("Can Spawn " .. Extern.CanSpawnAI, 0.75, 0.75)
  if Extern.CanSpawnAI == 1 then
    local inventoryGroup = Support.GetImportWatchVariableValue("InventoryGroup")
    Debug.PrintToScreen(inventoryStrings[inventoryGroup + 1], 0.5, 0.5)
  else
    Debug.PrintToScreen("X", 0.5, 0.5)
  end
end

function SpawnLimitCheck()
  local numPlayers = Player.GetNumPlayers()
  for curPlayer = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers - 1 do
    if curPlayer ~= playerIndex then
      otherPlayer = Player.GetPlayerControlledObjectByIndex(curPlayer)
      if otherPlayer ~= nil then
        distToPlayer = Utilities.GetDistanceBetweenObjects(myObject, otherPlayer)
        if distToPlayer < 5 then
          Extern.CanSpawnAI = 0
          return
        elseif distToPlayer < 15 then
          local inputData = {
            dist = 15,
            collisGroup = 12,
            checkProxies = true
          }
          myPos = Game.GetPosition(myObject)
          playerPos = Game.GetPosition(otherPlayer)
          dirVector = {
            x = myPos.x - playerPos.x,
            y = myPos.y - playerPos.y,
            z = myPos.z - playerPos.z
          }
          local hasHit = Utilities.CastRay(Game.GetPosition(otherPlayer), dirVector, inputData)
          if hasHit == false then
            Extern.CanSpawnAI = 0
            return
          end
        end
      end
    end
  end
  if currentAISpawned < kMaxAI then
    Extern.CanSpawnAI = 1
  end
end

function HostUpdate()
  if bHostIsLocalPlayer then
    DebugInventoryUpdate()
  end
end

playerIndex = Player.GetPlayerIndexByObject(myObject)
if Player.IsLocalPlayer(playerIndex) then
  if MP.IsClient() then
    Callbacks.RegisterForUpdateEveryFrame("DebugInventoryUpdate")
  else
    bHostIsLocalPlayer = true
  end
end
if not MP.IsClient() then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerDeathMessage, myObject, "OnAIDeath")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, myObject, "OnAISpawn")
  Callbacks.RegisterForUpdateEveryFrame("HostUpdate")
end
