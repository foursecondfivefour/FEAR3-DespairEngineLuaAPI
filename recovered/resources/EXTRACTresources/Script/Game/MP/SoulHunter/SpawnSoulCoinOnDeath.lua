local GS = GameScript
local Callbacks = GS.Callbacks
local Support = GS.Support
local Game = GS.Game
local Self = Game.GetMyObject()
local MP = Game.MP
local Msg = GS.MsgCallback
local Debug = GS.Debug
local Utilities = GS.Utilities
local MyObject = Game.GetMyObject()
Support.RegisterObjectTemplateVariable("Spawned Object Template", "")
local spawnOffset = Support.ImportFloatVariableWithDefault("Spawn Offset", "How High Off The Ground To Appear!", 1.35)

function OnDeath()
  local SpawnPos = Game.GetPosition(Self)
  SpawnPos.y = SpawnPos.y + spawnOffset
  local SpawnedObject = Game.Spawn("Spawned Object Template", SpawnPos)
  Game.CopyNation(MyObject, SpawnedObject)
end

function ExitScript()
  Callbacks.UnregisterForMsg(Msg.DoDyingMessage, Self, "OnDeath")
  Support.ExitScript()
end

function OnTextMessage(Message)
  if Message.text == "DisableCoinDrop" then
    ExitScript()
  end
end

if not MP.IsClient() then
  Callbacks.RegisterForMsg(Msg.DoDyingMessage, Self, "OnDeath")
  Callbacks.RegisterForMsg(Msg.MPGameOverMsg, Self, "ExitScript")
  Callbacks.RegisterForMsg(GS.MsgCallback.TextMessage, Self, "OnTextMessage")
end
