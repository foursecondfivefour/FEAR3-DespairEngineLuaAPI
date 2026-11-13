local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Support = GameScript.Support
local scriptObject = Game.GetMyObject()
local kBlackoutOff = 0
local kBlackoutOn = 100
Support.ExportFloatVariable("BlackoutSetting", kBlackoutOff, "Controls showing or hiding the full screen blackout HUD component")
local DefaultOn = Support.ImportBoolVariableWithDefault("Start On", "Should the blackout default to starting in the on state?", false)

function HandleTextMessage(textMessage)
  if textMessage.text == "HUDFadeToBlack" then
    Extern.BlackoutSetting = kBlackoutOn
  elseif textMessage.text == "HUDFadeFromBlack" then
    Extern.BlackoutSetting = kBlackoutOff
  end
end

if DefaultOn then
  Extern.BlackoutSetting = kBlackoutOn
end
Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, scriptObject, "HandleTextMessage")
