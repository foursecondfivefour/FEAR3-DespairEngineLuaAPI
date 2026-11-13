local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Regions = Game.Regions
local BothPlayersRequired = Support.ImportBoolVariableWithDefault("Require Both Players in Region?", "Should the script require both players to be in the region?", false)
local RegionTable = Support.ImportObjectHandleVariable("Region(s)", "The region we'll be testing against")
local TxtObjectTable = Support.ImportObjectHandleVariable("Object(s) to Message", "The objects to send the message to")
local runOnce = Support.ImportBoolVariableWithDefault("Run Once", "Deactivate the script once all players are within region?", false)

function EnterRegion()
  if BothPlayersRequired and Regions.AllPlayersInTableOfRegions(RegionTable) or not BothPlayersRequired then
    for k, obj in pairs(TxtObjectTable) do
      if obj and Game.IsLoaded(obj) then
        Game.EnableAllUsables(obj, true)
      end
    end
    if runOnce then
      Support.ExitScript()
    end
  end
end

function ExitRegion()
  for k, obj in pairs(TxtObjectTable) do
    if obj and Game.IsLoaded(obj) then
      Game.EnableAllUsables(obj, false)
    end
  end
end

if RegionTable and TxtObjectTable then
  for k, region in pairs(RegionTable) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "EnterRegion", "ExitRegion")
  end
else
  Debug.PrintError("No valid region supplied")
end
