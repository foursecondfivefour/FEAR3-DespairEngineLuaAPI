local GS = GameScript
local Game = GS.Game
local AI = Game.AI
local Callbacks = GS.Callbacks
local Debug = GS.Debug
local Support = GS.Support
local timer = Support.ImportFloatVariableWithDefault("Timer", "Length of time to be Stunned", 5)
local scriptObject = Game.GetMyObject()
local stunned = 0

function Unstun()
  stunned = 0
  AI.EnableAIObject(scriptObject, true)
end

function OnTextMessage(message)
  if message.text == "Stunned" then
    if stunned then
      Callbacks.UnregisterForTimer("Unstun", timer, false)
    end
    stunned = 1
    AI.EnableAIObject(scriptObject, false)
    Callbacks.RegisterForTimer("Unstun", timer, false)
  end
end

Callbacks.RegisterForMsg(GS.MsgCallback.TextMessage, scriptObject, "OnTextMessage")
