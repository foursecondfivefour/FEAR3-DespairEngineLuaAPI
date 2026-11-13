local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
Support.RegisterWorldVectorVariable("Desired Worlds", "The worlds that we want to start streaming")
Support.RegisterWorldVectorVariable("Required Worlds", "The worlds that must exist when a player enters this region (must have been desired first!)")
local save = Support.ImportBoolVariableWithDefault("Auto Save?", "If system enablers autosave and this is true then an auto save will occur, use false to disable the autosave feature", true)
local regionObj = Support.ImportRegionObject("StreamingRegion", "Region to kick off streaming")
local Require_All_Inside = Support.NumberToBool(Support.ImportFloatVariable("All Players Inside?", "Is it necessary to have all players inside the region(s) before we enable the object(s)? 0 false; 1 true"))
local DelayTime = Support.ImportFloatVariableWithDefault("Delay Time", "Time in seconds to wait before streaming.", 0)

function Stream()
  GameScript.Game.StreamWorlds("Desired Worlds", "Required Worlds")
  if save then
    GameScript.Game.SaveGame()
  end
  GameScript.Debug.PrintInfoIf(g_debugMode > 0, "StreamDesiredRequiredWorlds")
end

function OnEnter()
  if not Require_All_Inside or Game.Regions.AllPlayersInTableOfRegions(regionObj) then
    if DelayTime <= 0 then
      Stream()
    else
      Callbacks.RegisterForTimer("Stream", DelayTime, false)
    end
    Callbacks.UnregisterPlayerEnterExitRegion(regionObj, "OnEnter", "")
  end
end

if regionObj ~= nil then
  Callbacks.RegisterPlayerEnterExitRegion(regionObj, "OnEnter", "")
  GameScript.Debug.PrintInfoIf(0 < g_debugMode, "StreamWorldsOnRegion startup")
end
