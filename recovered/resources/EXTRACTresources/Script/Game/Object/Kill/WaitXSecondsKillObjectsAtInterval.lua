local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local intervalKill = Support.ImportFloatVariable("Interval", "Interval between killing specified object(s)")
local killType = Support.ImportFloatVariable("Kill Type", "What type of kill message should be sent to the object(s)?" .. "0 = Delete (Instant), 1 = Kill (Effects), 2 = Kill Intro (Recommended)")
Support.ImportObjectHandleVariable("Object(s) Set To Kill", "The object(s) set to be killed")
local IsPeriodic = Support.ImportBoolVariableWithDefault("Periodic", "Repeat the call every 'TimeInSeconds' seconds.", true)
local times = 0
local count = 0

function KillObjects()
  local objsToKill = Support.GetImportObjectTable("Object(s) Set To Kill")
  if objsToKill and 0 < #objsToKill and times == 0 then
    times = #objsToKill
  end
  if objsToKill and 0 < #objsToKill and count < times then
    local key, value
    key, value = next(objsToKill)
    Game.Kill(value, killType)
    count = count + 1
  else
    GameScript.Exit()
  end
end

Callbacks.RegisterForTimer("KillObjects", intervalKill, IsPeriodic)
