local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Player = Game.Player
local FEAR = GameScript.FEAR
local Physics = Game.Physics
local Regions = Game.Regions
local ObjectsToControl = Support.ImportObjectHandleVariable("Object(s) to Control", "All the objects selected here will have the SAME randomization")
local AnimationVariableName = Support.ImportStringVariable("Animation Variable", "The Animation Variable name")
local MinTimeBetweenSpeedChanges = Support.ImportFloatVariableWithDefault("Min Time Between Speed Changes", "Time in seconds", 30)
local MaxTimeBetweenSpeedChanges = Support.ImportFloatVariableWithDefault("Max Time Between Speed Changes", "Time in seconds", 60)
local MinSpeed = Support.ImportFloatVariableWithDefault("Min Speed", "Multiplier; 1 is normal speed", 1)
local MaxSpeed = Support.ImportFloatVariableWithDefault("Max Speed", "Multiplier; 1 is normal speed", 1)
local StartSpeed = Support.ImportFloatVariableWithDefault("Start Speed", "Multiplier; 1 is normal speed", 1)

function SetAnimationSpeed()
  Debug.PrintInfoIf(g_debugMode > 0, "SetAnimationSpeed")
  SetAnimationVariable(GenerateRandomValue(MinSpeed, MaxSpeed))
  Callbacks.RegisterForTimer("SetAnimationSpeed", GenerateRandomValue(MinTimeBetweenSpeedChanges, MaxTimeBetweenSpeedChanges), false)
end

function SetAnimationVariable(SpeedMultiplier)
  for key, value in pairs(ObjectsToControl) do
    if Game.IsLoaded(value) then
      Debug.PrintInfoIf(g_debugMode > 0, "SetAnimationVariable " .. SpeedMultiplier)
      Game.SetAnimationVariable(value, AnimationVariableName, SpeedMultiplier)
    end
  end
end

function GenerateRandomValue(Min, Max)
  Debug.PrintInfoIf(g_debugMode > 0, "GenerateRandomValue: min " .. Min .. " max " .. Max)
  local RandomPercent = Util.GetRandomPercent()
  local Value = Min
  if RandomPercent then
    Value = RandomPercent * (Max - Min) + Min
  end
  return Value
end

Debug.PrintInfoIf(g_debugMode > 0, "MAIN BODY")
if ObjectsToControl then
  SetAnimationVariable(StartSpeed)
  Callbacks.RegisterForTimer("SetAnimationSpeed", GenerateRandomValue(MinTimeBetweenSpeedChanges, MaxTimeBetweenSpeedChanges), false)
end
