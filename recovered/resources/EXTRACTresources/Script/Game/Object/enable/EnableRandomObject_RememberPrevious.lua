local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local ObjectsToEnable = Support.ImportObjectHandleVariable("Objects To Enable", "The objects we want to enable")
local RepeatEnable = Support.ImportBoolVariableWithDefault("Enable over and over?", "A False setting will result in this script running one time.", false)
local DelayTime = Support.ImportFloatVariableWithDefault("Delay Time", "This event must be enabled after the save", 0)
Support.ExportFloatVariable("lastObject", 0, "remembers which object was chosen previously")
Extern.lastObject = #ObjectsToEnable + 1
local RandomObject

function RandomEnable()
  local whichObjectIndex
  if #ObjectsToEnable == 1 then
    whichObjectIndex = 1
  else
    local numObjectsToChoose
    if Extern.lastObject == #ObjectsToEnable + 1 then
      numObjectsToChoose = #ObjectsToEnable
    else
      numObjectsToChoose = #ObjectsToEnable - 1
    end
    whichObjectIndex = Support.GetRandomInteger(1, numObjectsToChoose)
    if whichObjectIndex >= Extern.lastObject then
      whichObjectIndex = whichObjectIndex + 1
    end
  end
  Extern.lastObject = whichObjectIndex
  RandomObject = ObjectsToEnable[whichObjectIndex]
  Callbacks.RegisterForTimer("EnableRandomlyChosen", DelayTime, false)
end

function EnableRandomlyChosen()
  if RandomObject and Game.IsLoaded(RandomObject) then
    Game.EnableAllEnableables(RandomObject, true)
  end
end

function FirstTime()
  if Extern.lastObject == #ObjectsToEnable + 1 then
    RandomEnable()
  end
end

if ObjectsToEnable and 0 < #ObjectsToEnable then
  Callbacks.RegisterForTimer("FirstTime", 0, false)
  Callbacks.RegisterForPostCheckpointActivation("RandomEnable")
end
