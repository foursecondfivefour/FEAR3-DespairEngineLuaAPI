local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local ObjectTags = GameScript.Game.ObjectTags
local distance = Support.ImportFloatVariable("Distance", "Distance from this object to test for Power Armors")
local message = Support.ImportStringVariable("Text Message", "Text Message to send to Power Armors in range")
local timer = Support.ImportFloatVariable("Timer", "Check every this many seconds")
local scriptObject = Game.GetMyObject()

function CheckForZap()
  local objTable = ObjectTags.GetObjectsWithTag("Power Armor")
  for key, object in pairs(objTable) do
    if object ~= nil and Utilities.GetDistanceBetweenObjects(object, scriptObject) < distance then
      Game.SendTextMessage(object, message)
    end
  end
end

Callbacks.RegisterForTimer("CheckForZap", timer, true)
