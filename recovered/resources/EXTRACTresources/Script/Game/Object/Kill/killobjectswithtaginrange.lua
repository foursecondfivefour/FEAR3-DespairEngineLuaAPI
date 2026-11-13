GameScript.Support.AddDescription("Script to kill Objects with a given Object Tag within a certain range.")
local Game = GameScript.Game
local Regions = Game.Regions
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local ObjectTags = GameScript.Game.ObjectTags
local objectTag = Support.ImportStringVariable("Object Tag", "Object Tag to check for")
local killType = Support.ImportFloatVariable("Kill Type", "What type of kill message should be sent to the object(s)?" .. "0 = Delete (Instant), 1 = Kill (Effects), 2 = Kill Intro (Recommended)")
local distance = Support.ImportFloatVariable("Distance", "Kill Object Tags within this distance")
local killObject
local myObject = Game.GetMyObject()
local objectTagTable = ObjectTags.GetObjectsWithTag(objectTag)
if objectTagTable then
  for key, object in pairs(objectTagTable) do
    if object and distance > Utilities.GetDistanceBetweenObjects(object, myObject) then
      Game.Kill(object, killType)
    end
  end
end
