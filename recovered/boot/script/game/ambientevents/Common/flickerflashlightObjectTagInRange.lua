local Debug = GameScript.Debug
local Support = GameScript.Support
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Utilities = GameScript.Utilities
local Player = Game.Player
Support.RegisterCurveTemplateVariable("flicker curve", "flashlight flicker curve")
local duration = Support.ImportFloatVariable("Flicker Duration", "How many seconds does the flicker last?")
local bTurnOffAtCompletion = Support.ImportBoolVariable("Turn Off at Completion?", "Does this flicker turn the flashlight off when it is done? 1 = yes, 0 = no")
local bAllowLightTurnOn = Support.ImportBoolVariable("Allow Toggling Light?", "Can the player turn the fashlight on/off while it is flickering? 1 = yes, 0 = no")
local bForceLightOn = Support.ImportBoolVariable("Force Light On?", "Do we force the flashlight to be on so that the effect is always visible? 1 = yes, 0 = no")
local range = Support.ImportFloatVariableWithDefault("Range", "Range to see if the Object Tag is within", 5)
local objectTag = Support.ImportStringVariable("Object Tag", "Object Tag to check for")
local myObject = Game.GetMyObject()

function CheckForObjectTag()
  local allAI = Game.ObjectTags.GetObjectsWithTag(objectTag)
  for name, aiObject in pairs(allAI) do
    if aiObject ~= nil and Game.IsLoaded(aiObject) then
      if g_debugMode > 0 then
        Debug.PrintInfo("In CheckForObjectTag: Found an object with Object Tag " .. objectTag .. ": " .. Game.GetName(aiObject))
      end
      if Utilities.GetDistanceBetweenObjects(myObject, aiObject) <= range then
        DoFlicker()
      end
    end
  end
end

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
  local thisPlayerIndex = Player.GetPlayerIndexByObject(myObject)
  GameScript.FEAR.FlickerPlayerFlashlight(thisPlayerIndex, flickerInfo)
end

Callbacks.RegisterForTimer("CheckForObjectTag", 1, true)
