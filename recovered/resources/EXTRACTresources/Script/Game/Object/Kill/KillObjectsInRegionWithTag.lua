GameScript.Support.AddDescription("Script to kill Objects which enter region")
local Game = GameScript.Game
local Regions = Game.Regions
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local ObjectTags = GameScript.Game.ObjectTags
local objectTag = Support.ImportStringVariable("Object Tag", "Object Tag to check for")
local region = Support.ImportRegionObject("Region To Monitor", "Region used to monitor for enter and kill objects")
local killType = Support.ImportFloatVariable("Kill Type", "What type of kill message should be sent to the object(s)?" .. "0 = Delete (Instant), 1 = Kill (Effects), 2 = Kill Intro (Recommended)")
local realObjectTag = ObjectTags.GetObjectTagUID(objectTag)
local killObject

function KillObjects(Info)
  killObject = Info.object
  Game.Kill(killObject, killType)
end

Callbacks.RegisterObjectTagEnterExitRegion(region, realObjectTag, "KillObjects", "")
