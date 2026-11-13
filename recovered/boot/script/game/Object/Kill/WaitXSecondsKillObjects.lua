local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local timeTillKill = Support.ImportFloatVariable("Kill Timer", "How long before we kill the specified object(s)")
local killType = Support.ImportFloatVariable("Kill Type", "What type of kill message should be sent to the object(s)?" .. "0 = Delete (Instant), 1 = Kill (Effects), 2 = Kill Intro (Recommended)")
Support.ImportObjectHandleVariable("Object(s) To Kill", "The object(s) to be killed")
local IsPeriodic = Support.ImportBoolVariableWithDefault("Periodic", "Repeat the call every 'TimeInSeconds' seconds.", true)

function KillObjects()
  local objsToKill = Support.GetImportObjectTable("Object(s) To Kill")
  for k, v in pairs(objsToKill) do
    Game.Kill(v, killType)
  end
end

Callbacks.RegisterForTimer("KillObjects", timeTillKill, IsPeriodic)
