local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local ObjectsToEnable = Support.ImportObjectHandleVariable("Objects To Enable", "The objects we want to enable")
local RepeatEnable = Support.ImportBoolVariableWithDefault("Enable over and over?", "A False setting will result in this script running one time.", false)
local TimeBetweenEnables = Support.ImportFloatVariableWithDefault("Time Between Enables", "if doing multiple enables, this is the time between runs", 0)
local textMssg = Support.ImportStringVariableWithDefault("Txt Message", "Text message to be sent to the randomly chosen object", "")
Support.ExportFloatVariable("lastObject", 0, "remembers which object was chosen previously")
Extern.lastObject = #ObjectsToEnable + 1

function RandomEnable()
  local whichObjectIndex
  if #ObjectsToEnable == 1 then
    whichObjectIndex = 1
  else
    local numObjectsToChoose = #ObjectsToEnable - 1
    whichObjectIndex = Support.GetRandomInteger(1, numObjectsToChoose)
    if whichObjectIndex >= Extern.lastObject then
      whichObjectIndex = whichObjectIndex + 1
    end
  end
  Extern.lastObject = whichObjectIndex
  RandomObject = ObjectsToEnable[whichObjectIndex]
  if RandomObject and Game.IsLoaded(RandomObject) then
    Game.SendTextMessage(RandomObject, textMssg)
  end
end

if ObjectsToEnable and 0 < #ObjectsToEnable then
  if RepeatEnable and 0 <= TimeBetweenEnables then
    Callbacks.RegisterForTimer("RandomEnable", TimeBetweenEnables, true)
  else
    RandomEnable()
  end
end
