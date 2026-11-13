local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Graphics = Game.Graphics
local fValue1 = Support.ImportWatchVariable("Value 1", "The script will expose the minimum of values 1 and 2 as Min Value")
local fValue2 = Support.ImportWatchVariable("Value 2", "The script will expose the minimum of values 1 and 2 as Min Value")
Support.ExportFloatVariable("Min Value", 0, "The minimum of Values 1 and 2.")
Extern.fMinValue = 0

function CalculateValue()
  if fValue1 > fValue2 then
    Extern.fMinValue = fValue2
  else
    Extern.fMinValue = fValue1
  end
end

function WatchChanged(msg)
  CalculateValue()
end

CalculateValue()
Callbacks.RegisterForWatchVariableChange("Value 1", "WatchChanged")
Callbacks.RegisterForWatchVariableChange("Value 2", "WatchChanged")
Callbacks.RegisterForPostCheckpointActivation("CalculateValue")
