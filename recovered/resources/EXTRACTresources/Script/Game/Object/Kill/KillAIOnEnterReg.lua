GameScript.Support.AddDescription("Script to kill AI which enter region")
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Region = Support.ImportRegionObject("Region To Monitor", "Region used to monitor for enter and kill objects")
local killType = Support.ImportFloatVariable("Kill Type", "What type of kill message should be sent to the object(s)?" .. "0 = Delete (Instant), 1 = Kill (Effects), 2 = Kill Intro (Recommended)")
local killObject

function KillObjects(Info)
  killObject = Info.object
  Game.Kill(killObject, killType)
end

Callbacks.RegisterAIEnterExitRegion(Region, "KillObjects", "")
