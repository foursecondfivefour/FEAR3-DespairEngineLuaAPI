local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local MP = Game.MP
local ObjectsToEnable = Support.ImportObjectHandleVariable("Object(s) to Enable", "Object(s) to that will be randomly chosen from to enable")
local TimeBetweenEnables = Support.ImportFloatVariable("Time Between Enables", "This is how often the a new object will be chosen to enable")
local DisableOld = Support.ImportFloatVariable("Disable Previous?", "Should the script disable the previous object before it enables the next?")
local WaitToRun = Support.ImportBoolVariableWithDefault("Wait to randomize?", "Should the script wait an initial delay before it runs the first time?", true)
GameScript.Support.ExportFloatVariable("NetResult", 0, "Random selection that is returned.")
local RandomObject
local kHackDelay = 0.06666666666666667

function EnableNow()
  if DisableOld and RandomObject and Game.IsLoaded(RandomObject) then
    Game.EnableAllEnableables(RandomObject, false)
  end
  RandomObject = ObjectsToEnable[Extern.NetResult]
  if RandomObject and Game.IsLoaded(RandomObject) then
    Game.EnableAllEnableables(RandomObject, true)
    GameScript.Support.ExitScript()
  end
end

function RandomEnable()
  if ObjectsToEnable then
    Utilities.GenerateRandomSeed()
    local numToRandom = #ObjectsToEnable * 2
    local result = Utilities.GetRandomInteger(1, numToRandom) / 2
    result = math.ceil(result)
    Extern.NetResult = result
    EnableNow()
  end
end

if not MP.IsClient() then
  if not WaitToRun then
    Callbacks.RegisterForTimer("RandomEnable", kHackDelay, true)
  end
  local periodTime = TimeBetweenEnables
  if kHackDelay > periodTime then
    periodTime = kHackDelay
  end
  Callbacks.RegisterForTimer("RandomEnable", TimeBetweenEnables, true)
else
  Callbacks.RegisterForScriptValueUpdated("EnableNow")
end
