local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local _leftLeg = Support.ImportWatchVariable("LeftLeg", "The Watch Variable whose value will be polled")
local _rightLeg = Support.ImportWatchVariable("RightLeg", "The Watch Variable whose value will be polled")
local _leftArm = Support.ImportWatchVariable("LeftArm", "The Watch Variable whose value will be polled")
local _rightArm = Support.ImportWatchVariable("RightArm", "The Watch Variable whose value will be polled")
Support.ExportFloatVariable("CanPossess", 1, "If this value is greater than 0.0 the cultist can be possessed.")

function UpdateEveryFrame()
  if _leftLeg == 1 or _rightLeg == 1 or _leftArm == 1 and _rightArm == 1 then
    Extern.CanPossess = 0
    Support.ExitScript()
  end
end

function LeftLegChange(msg)
  _leftLeg = msg.newValue
  UpdateEveryFrame()
end

function RightLegChange(msg)
  _rightLeg = msg.newValue
  UpdateEveryFrame()
end

function LeftArmChange(msg)
  _leftArm = msg.newValue
  UpdateEveryFrame()
end

function RightArmChange(msg)
  _rightArm = msg.newValue
  UpdateEveryFrame()
end

Callbacks.RegisterForWatchVariableChange("LeftLeg", "LeftLegChange")
Callbacks.RegisterForWatchVariableChange("RightLeg", "RightLegChange")
Callbacks.RegisterForWatchVariableChange("LeftArm", "LeftArmChange")
Callbacks.RegisterForWatchVariableChange("RightArm", "RightArmChange")
