local Debug = GameScript.Debug
local Support = GameScript.Support
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
Support.RegisterCurveTemplateVariable("flicker curve", "flashlight flicker curve")
local duration = Support.ImportFloatVariable("Flicker Duration", "How many seconds does the flicker last?")
local bTurnOffAtCompletion = Support.ImportBoolVariable("Turn Off at Completion?", "Does this flicker turn the flashlight off when it is done? 1 = yes, 0 = no")
local bAllowLightTurnOn = Support.ImportBoolVariable("Allow Toggling Light?", "Can the player turn the fashlight on/off while it is flickering? 1 = yes, 0 = no")
local bForceLightOn = Support.ImportBoolVariable("Force Light On?", "Do we force the flashlight to be on so that the effect is always visible? 1 = yes, 0 = no")
local bLoop = Support.ImportBoolVariableWithDefault("Flicker continuously?", "If the value is true, this script will flicker the flashlight continuously until the script " .. "is stopped. If the value is false, the script will issue one flicker command and then stop.", false)

function DoFlicker()
  local flickerInfo = {}
  flickerInfo.curve = "flicker curve"
  flickerInfo.flickerTime = duration
  flickerInfo.turnOffAtCompletion = bTurnOffAtCompletion
  flickerInfo.allowTurnOn = bAllowLightTurnOn
  flickerInfo.forceFlashlightOn = bForceLightOn
  if g_debugMode > 0 then
    local color = {
      r = 255,
      g = 255,
      b = 255,
      a = 255
    }
    Debug.PrintToScreenWithTimer("Flickering flashlight", duration, color, true)
  end
  GameScript.FEAR.FlickerPlayerFlashlight(GameScript.PlayerIndex.kGlobalPlayer1, flickerInfo)
end

local myObject = Game.GetMyObject()
if myObject then
  DoFlicker()
  if bLoop then
    Callbacks.RegisterForTimer("DoFlicker", duration, true)
  end
end
