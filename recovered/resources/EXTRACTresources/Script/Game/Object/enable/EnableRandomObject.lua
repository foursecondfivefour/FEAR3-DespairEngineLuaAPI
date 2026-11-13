local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local ObjectsToEnable = Support.ImportObjectHandleVariable("Object(s) to Enable", "Object(s) to that will be randomly chosen from to enable")
local TimeBetweenEnables = Support.ImportFloatVariable("Time Between Enables", "This is how often the a new object will be chosen to enable")
local DisableOld = Support.ImportFloatVariable("Disable Previous?", "Should the script disable the previous object before it enables the next?")
local WaitToRun = Support.ImportBoolVariableWithDefault("Wait to randomize?", "Should the script wait an initial delay before it runs the first time?", true)
local Periodic = Support.ImportBoolVariableWithDefault("Periodic", "Should the script run more then once?", true)
local RandomObject

function RandomEnable()
  if ObjectsToEnable then
    Utilities.GenerateRandomSeed()
    if DisableOld and RandomObject and Game.IsLoaded(RandomObject) then
      Game.EnableAllEnableables(RandomObject, false)
    end
    local numToRandom = #ObjectsToEnable * 2
    local result = Utilities.GetRandomInteger(1, numToRandom) / 2
    result = math.ceil(result)
    RandomObject = ObjectsToEnable[result]
    if RandomObject and Game.IsLoaded(RandomObject) then
      Game.EnableAllEnableables(RandomObject, true)
    end
  end
end

if not WaitToRun then
  RandomEnable()
  if TimeBetweenEnables ~= 0 then
    Callbacks.RegisterForTimer("RandomEnable", TimeBetweenEnables, Periodic)
  end
else
  Callbacks.RegisterForTimer("RandomEnable", TimeBetweenEnables, Periodic)
end
