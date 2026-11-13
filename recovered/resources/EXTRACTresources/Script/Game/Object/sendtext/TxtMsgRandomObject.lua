local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Util = GameScript.Utilities
local ObjectsToEnable = Support.ImportObjectHandleVariable("Object(s) to Enable", "Object(s) to that will be randomly chosen from to enable")
local TimeBetweenEnables = Support.ImportFloatVariable("Time Between Enables", "This is how often the a new object will be chosen to enable")
local DisableOld = Support.ImportFloatVariable("Disable Previous?", "Should the script disable the previous object before it enables the next?")
local textEnable = Support.ImportStringVariable("Enable Text", "Text message sent to the object when intending to enable it.")
local textDisable = Support.ImportStringVariable("Disable Text", "Text message sent to the object when intending to disable it.")
local WaitToRun = Support.ImportBoolVariableWithDefault("Wait to randomize?", "Should the script wait an initial delay before it runs the first time?", true)
local RandomObject

function RandomEnable()
  if ObjectsToEnable then
    if DisableOld and RandomObject and Game.IsLoaded(RandomObject) then
      Game.SendTextMessage(RandomObject, textDisable)
    end
    local numToRandom = #ObjectsToEnable * 2
    local result = Util.GetRandomInteger(1, numToRandom) / 2
    local ObjectNum = math.ceil(result)
    local RandomObject = ObjectsToEnable[ObjectNum]
    if RandomObject and Game.IsLoaded(RandomObject) then
      Game.SendTextMessage(RandomObject, textEnable)
    end
  end
end

if not WaitToRun then
  RandomEnable()
end
Callbacks.RegisterForTimer("RandomEnable", TimeBetweenEnables, true)
