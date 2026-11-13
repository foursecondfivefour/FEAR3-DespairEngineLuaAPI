local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Support = GameScript.Support
local kFadeOutOff = 0
local kFadeOutOn = 100
local scriptObject = Game.GetMyObject()
Support.ExportFloatVariable("VehicleFade", kFadeOutOff, "Controls showing or hiding the full screen blackout HUD component")

function FadeEnd()
  Extern.VehicleFade = kFadeOutOff
end

function OnAnimationAnnotation(msg)
  if msg.text == "FadeStartEntry" then
    Extern.VehicleFade = kFadeOutOn
    Callbacks.RegisterForTimer("FadeEnd", 1, false)
  end
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.AnimationAnnotation, scriptObject, "OnAnimationAnnotation")
