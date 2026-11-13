local Game = GameScript.Game
local AI = GameScript.Game.AI
local Camera = GameScript.Game.Camera
local Physics = GameScript.Game.Physics
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local RegionList = Support.ImportObjectHandleVariable("Region(s)", "A player entering this region(s), will enable/disable the object(s)")
local ObjectList = Support.ImportObjectHandleVariable("Object(s)", "The object(s) that will be Enabled/Disabled")
local Require_All_Inside = Support.NumberToBool(Support.ImportFloatVariable("All Players Inside?", "Is it necessary to have all players inside the region(s) before we enable the object(s)? 0 false; 1 true"))

function PlayerEntersRegion()
  if Require_All_Inside and Game.Regions.AllPlayersInTableOfRegions(RegionList) or not Require_All_Inside then
    for key, value in pairs(ObjectList) do
      if Game.IsLoaded(value) then
        Game.EnableAllEnableables(value, true)
      else
        Debug.PrintWarning(Game.GetName(Game.GetMyObject()) .. ": Your object is no longer loaded!")
      end
    end
  end
end

if RegionList and ObjectList then
  for key, value in pairs(RegionList) do
    Callbacks.RegisterPlayerEnterExitRegion(value, "PlayerEntersRegion", "")
  end
  if Require_All_Inside and Game.Regions.AllPlayersInTableOfRegions(RegionList) or not Require_All_Inside and not Game.Regions.NoPlayerInRegions(RegionList) then
    for key, value in pairs(ObjectList) do
      Game.EnableAllEnableables(value, true)
    end
  end
else
  Debug.PrintError(Game.GetName(Game.GetMyObject()) .. ": One of the required fields contained no data")
end
