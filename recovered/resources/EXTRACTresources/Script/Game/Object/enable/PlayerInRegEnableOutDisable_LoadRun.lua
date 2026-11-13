local Game = GameScript.Game
local Camera = GameScript.Game.Camera
local Physics = GameScript.Game.Physics
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local myObj = Game.GetMyObject()
local RegionList = Support.ImportObjectHandleVariable("Region(s)", "A player entering this region(s), will enable/disable the object(s)")
local ObjectList = Support.ImportObjectHandleVariable("Object(s)", "The object(s) that will be Enabled/Disabled")
local testAllInside = Support.ImportFloatVariable("All Players Inside?", "Is it necessary to have all players inside the region(s) before we enable the object(s)? 0 false; 1 true")
local Require_All_Inside = Support.NumberToBool(testAllInside)
local Require_All_Outside = Support.NumberToBool(Support.ImportFloatVariable("All Players Outside?", "Is it necessary to have all players outside the region(s) before we disable the object(s)? 0 false; 1 true"))

function PlayerEntersRegion()
  if Require_All_Inside and Game.Regions.AllPlayersInTableOfRegions(RegionList) or not Require_All_Inside then
    ObjectList = Support.GetImportObjectTable("Object(s)")
    for key, value in pairs(ObjectList) do
      if Game.IsLoaded(value) then
        Game.EnableAllEnableables(value, true)
      else
        Debug.PrintWarning(Game.GetName(Game.GetMyObject()) .. ": Your object is no longer loaded!")
      end
    end
  end
end

function PlayerLeavesRegion(PlayerInfo)
  if Require_All_Outside then
    if not Game.Regions.NoPlayerInRegions(RegionList) then
      return
    end
  elseif PlayerInfo.object and Game.Regions.IsPlayerInRegions(Player.GetPlayerIndexByObject(PlayerInfo.object), RegionList) then
    return
  end
  ObjectList = Support.GetImportObjectTable("Object(s)")
  for key, value in pairs(ObjectList) do
    if Game.IsLoaded(value) then
      if value == myObj then
        Debug.PrintWarning(Game.GetName(Game.GetMyObject()) .. ": Disabling your own object")
      end
      Game.EnableAllEnableables(value, false)
    else
      Debug.PrintWarning(Game.GetName(myObj) .. ": Your object is no longer loaded!")
    end
  end
end

function InitialEnableDisable()
  if Require_All_Inside and Game.Regions.AllPlayersInTableOfRegions(RegionList) or not Require_All_Inside and not Game.Regions.NoPlayerInRegions(RegionList) then
    for key, value in pairs(ObjectList) do
      Game.EnableAllEnableables(value, true)
    end
  else
    for key, value in pairs(ObjectList) do
      if value == myObj then
        Debug.PrintWarning(Game.GetName(Game.GetMyObject()) .. ": Disabling your own object in intial pass")
      end
      Game.EnableAllEnableables(value, false)
    end
  end
end

function HandleLoadChanges()
  ObjectList = Support.GetImportObjectTable("Object(s)")
  Callbacks.RegisterForTimer("InitialEnableDisable", 0, false)
end

if RegionList and ObjectList then
  for key, value in pairs(RegionList) do
    Callbacks.RegisterPlayerEnterExitRegion(value, "PlayerEntersRegion", "PlayerLeavesRegion")
  end
  InitialEnableDisable()
else
  Debug.PrintError(Game.GetName(myObj) .. ": One of the required fields contained no data")
end
Callbacks.RegisterForMsg(GameScript.MsgCallback.LoadChangesCompleteMessage, myObj, "HandleLoadChanges")
