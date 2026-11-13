local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Debug = GameScript.Debug
Support.AddDescription("Enable an object or objects in a set after 'Time In Seconds' has elapsed")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")
local TimeInSeconds = Support.ImportFloatVariable("Time In Seconds", "Delay before starting the script")
local IsPeriodic = Support.ImportBoolVariable("Periodic", "Do we repeat the call every 'Time In Seconds' seconds?")

function Enable()
  if enableObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      if nextObj and Game.IsLoaded(nextObj) then
        Game.EnableAllEnableables(nextObj, true)
      end
    end
  end
end

Callbacks.RegisterForTimer("Enable", TimeInSeconds, IsPeriodic)
