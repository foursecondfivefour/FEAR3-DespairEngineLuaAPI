local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
Support.RegisterWorldVectorVariable("Desired Worlds", "The worlds that we want to start streaming")
Support.RegisterWorldVectorVariable("Required Worlds", "The worlds that must exist when a player enters this region (must have been desired first!)")
local save = Support.ImportBoolVariableWithDefault("Auto Save?", "If system enablers autosave and this is true then an auto save will occur, use false to disable the autosave feature", true)
local DelayTime = Support.ImportFloatVariableWithDefault("Delay Time", "Time in seconds to wait before streaming.", 0)

function Stream()
  GameScript.Game.StreamWorlds("Desired Worlds", "Required Worlds")
  if save then
    GameScript.Game.SaveGame()
  end
  GameScript.Debug.PrintInfoIf(g_debugMode > 0, "StreamDesiredRequiredWorlds")
end

if 0 < DelayTime then
  Callbacks.RegisterForTimer("Stream", DelayTime, false)
else
  Stream()
end
