local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Player = Game.Player
local MP = Game.MP
local Utilities = GameScript.Utilities
local ObjectTags = Game.ObjectTags
Support.AddDescription("Disables all player spawn locations but one.  Used before killing and respawning players over the network to get rid of their inventory.")
local enableSpawn = Support.ImportObjectHandleVariable("Spawn To Enable", "The Player Spawn Location to Enable")
local enableAfter = Support.ImportObjectHandleVariable("Object To Enable After", "The Object(s) to Enable after the script has done its work")

function Enable(enableObj)
  if enableObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      if nextObj and Game.IsLoaded(nextObj) then
        Game.EnableAllEnableables(nextObj, true)
        Debug.PrintInfo("Enabling Spawn Location: " .. Game.GetName(nextObj))
      end
    end
  end
end

function DisableAllOtherSpawnLocations()
  local spawnLocations = ObjectTags.GetObjectsWithTag("PlayerSpawnLocation")
  if spawnLocations then
    for key, nextObj in pairs(spawnLocations) do
      if nextObj and Game.IsLoaded(nextObj) then
        Game.EnableAllEnableables(nextObj, false)
        Debug.PrintInfo("Disabling Spawn Location: " .. Game.GetName(nextObj))
      end
    end
  else
    Debug.PrintInfo("No spawn locations found")
  end
  Enable(enableSpawn)
  Enable(enableAfter)
end

DisableAllOtherSpawnLocations()
