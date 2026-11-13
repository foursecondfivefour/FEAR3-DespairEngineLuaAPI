local GS = GameScript
local Callbacks = GS.Callbacks
local Support = GS.Support
local Game = GS.Game
local MP = Game.MP
local Msg = GS.MsgCallback
local Util = GS.Utilities
local Math3d = GS.LuaMath3d
local Debug = GS.Debug
local MyObject = Game.GetMyObject()
local Offset = Support.ImportFloatVariable("Offset", "Offset from ground.")
local CurrentGameDifficulty = Support.ImportWatchVariable("Current Game Difficulty", "What difficulty is the game currently being played?")
Support.RegisterObjectTemplateVariable("Easy - Spawned Object Template", "This is the power-up object template to spawn on Easy")
Support.RegisterObjectTemplateVariable("Normal - Spawned Object Template", "This is the power-up object template to spawn on Normal")
Support.RegisterObjectTemplateVariable("Hard - Spawned Object Template", "This is the power-up object template to spawn on Hard")
Support.RegisterObjectTemplateVariable("Insane - Spawned Object Template", "This is the power-up object template to spawn on Insane")

function OnDoDying()
  OnDeath()
end

function OnDeath()
  if MP.IsClient() then
    return
  end
  local initialPos = Game.GetPosition(MyObject)
  initialPos.y = initialPos.y + 0.5
  local directionPos = Game.GetPosition(MyObject)
  directionPos.y = directionPos.y - 1
  local RayCastVector = Math3d.VectorSubtract(directionPos, initialPos)
  local vectorLength = Math3d.VectorNormalize(RayCastVector)
  local CollisionGroup = GS.CollisionGroups.PlayerPeople
  local Options = {
    dist = 10,
    collisGroup = CollisionGroup,
    checkProxies = false
  }
  local ResultsTable = Util.GetRayCollisionDistance(initialPos, RayCastVector, Options)
  SpawnPos = Game.GetPosition(MyObject)
  SpawnPos.y = SpawnPos.y + 0.5 + Offset
  if ResultsTable.hasHit then
    SpawnPos.y = SpawnPos.y - ResultsTable.collisDist
  end
  CurrentGameDifficulty = Support.GetImportWatchVariableValue("Current Game Difficulty")
  local SpawnedObject
  if CurrentGameDifficulty == 0 then
    SpawnedObject = Game.Spawn("Easy - Spawned Object Template", SpawnPos)
  elseif CurrentGameDifficulty == 1 then
    SpawnedObject = Game.Spawn("Normal - Spawned Object Template", SpawnPos)
  elseif CurrentGameDifficulty == 2 then
    SpawnedObject = Game.Spawn("Hard - Spawned Object Template", SpawnPos)
  else
    SpawnedObject = Game.Spawn("Insane - Spawned Object Template", SpawnPos)
  end
  ExitScript()
end

function ExitScript()
  Callbacks.UnregisterForMsg(Msg.DoDyingMessage, MyObject, "OnDoDying")
  Callbacks.UnregisterForMsg(Msg.DeleteObjectMessage, MyObject, "OnDeath")
  Support.ExitScript()
end

if MP.IsClient() then
  ExitScript()
else
  local gameMode = MP.GetGameMode()
  if gameMode == GS.MPGameMode.kCoop or gameMode == -1 then
    Callbacks.RegisterForMsg(Msg.DoDyingMessage, MyObject, "OnDoDying")
    Callbacks.RegisterForMsg(Msg.DeleteObjectMessage, MyObject, "OnDeath")
  else
    ExitScript()
  end
end
