local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local LuaHelpers = GameScript.LuaHelpers
local Player = Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Objectives = Game.Objectives
local Graphics = Game.Graphics
local Regions = Game.Regions
local Sets = Game.Sets
local Utilities = GameScript.Utilities
local Physics = Game.Physics
local ObjectTags = Game.ObjectTags
local masterRegionSet = Support.ImportFirstObject("Active Region Set", "The set to dummy objects marking where AIs can spawn")
local debugDraw = Support.ImportBoolVariableWithDefault("Debug Draw", "", false)
local autoPopulate = Support.ImportBoolVariableWithDefault("Auto Populate?", "The region should search for all spawn points inside itself when added to the master region set (NOTE: This can be quite expensive)", true)
local myObject = Game.GetMyObject()
local numPlayersInRegion = 0
local haveAddedSpawners = false
local spawnerObjectTag = ObjectTags.GetObjectTagUID("Multiplayer game type-specific")

function PlayerEntersRegion()
  numPlayersInRegion = numPlayersInRegion + 1
  if numPlayersInRegion == 1 then
    Sets.AddObjectToSet(masterRegionSet, myObject)
  end
end

function PlayerExitsRegion()
  numPlayersInRegion = numPlayersInRegion - 1
  if numPlayersInRegion == 0 then
    Sets.RemoveObjectFromSet(masterRegionSet, myObject)
  end
end

function SpawnerAddedToRegion(spawner)
  Sets.AddObjectToSet(myObject, spawner.object)
end

function SpawnerRemovedFromRegion()
  Sets.RemoveObjectToSet(myObject, spawner.object)
end

function SpawnPosDebugString(vect)
  return "(" .. math.floor(vect.x) .. ", " .. math.floor(vect.z) .. ")"
end

function GetSpawnersFromMasterList()
  local masterRegionList = Sets.GetObjectsInSet(masterRegionSet)
  local masterSpawnerList = {}
  local masterSpawnerCount = 0
  for r, spawnRegion in pairs(masterRegionList) do
    local spawnerList = Sets.GetObjectsInSet(spawnRegion)
    for s, spawner in pairs(spawnerList) do
      table.insert(masterSpawnerList, spawner)
    end
  end
  return masterSpawnerList
end

function VerifyRegionHasSpawners()
  local numSpawners = Sets.GetNumObjectsInSet(myObject)
  if numSpawners == 0 then
    Debug.PrintToScreenWithTimer(Game.GetName(myObject) .. " contains no spawners; add some or delete this region", 10, Utilities.kYellow, false)
  end
end

function DebugDrawMySpawners()
  local spawnerList = Sets.GetObjectsInSet(myObject)
  for s, spawner in pairs(spawnerList) do
    if Game.IsLoaded(spawner) then
      local spawnerPos = Game.GetPosition(spawner)
      Debug.DrawSphere(spawnerPos, 0.45, Utilities.kRed)
    end
  end
end

Callbacks.RegisterPlayerEnterExitRegion(myObject, "PlayerEntersRegion", "PlayerExitsRegion")
if masterRegionSet ~= nil then
  if autoPopulate then
    Callbacks.RegisterObjectTagEnterExitRegion(myObject, spawnerObjectTag, "SpawnerAddedToRegion", "SpawnerRemovedFromRegion")
    Callbacks.RegisterForTimer("VerifyRegionHasSpawners", 3, false)
  else
    Debug.PrintInfo("Auto population of your set is disabled, I hope your set actually has spawn points")
  end
else
  Debug.PrintWarning("--- No master set was specified.")
end
