local mainGlobal = _G
local GS = Despair.GameScript
local Helpers = GS.LuaHelpers
local Game = GS.Game
local Player = Game.Player
local Util = GS.Utilities
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
local next = mainGlobal.next
module(...)
local Regions = GS.Game.Regions

function IsPlayerInRegions(PlayerIndex, RegionTable)
  local Controlled = Player.GetPlayerControlledObjectByIndex(PlayerIndex)
  return IsPlayerObjectInRegions(Controlled, RegionTable)
end

function IsPlayerObjectInRegions(PlayerObject, RegionTable)
  if RegionTable == nil then
    return false
  end
  if PlayerObject == nil then
    return false
  end
  if type(RegionTable) == "userdata" then
    if IsInRegion(RegionTable, PlayerObject) then
      return true
    end
  else
    for key, value in pairs(RegionTable) do
      if IsInRegion(value, PlayerObject) then
        return true
      end
    end
  end
  return false
end

function AllPlayersInTableOfRegions(RegionTable)
  for globalIndex in Util.AllPlayers() do
    if IsPlayerInRegions(globalIndex, RegionTable) == false then
      return false
    end
  end
  return true
end

AllPlayersInRegions = AllPlayersInTableOfRegions

function NoPlayerInRegions(RegionTable)
  for globalIndex in Util.AllPlayers() do
    if IsPlayerInRegions(globalIndex, RegionTable) then
      return false
    end
  end
  return true
end
