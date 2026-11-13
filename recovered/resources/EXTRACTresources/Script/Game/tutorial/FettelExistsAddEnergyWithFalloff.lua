local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Player = Game.Player
local ObjectTags = Game.ObjectTags
local Energy = GameScript.Game.Energy
local Utilities = GameScript.Utilities
local GS = GameScript
Support.AddDescription("Set Fettel's Energy Level, if he exists.")
local MaxEnergyAddAmount = Support.ImportFloatVariableWithDefault("Max Add Amount", "Max energy to add if picked up when item is first created.", 0.15)
local MinEnergyAddAmount = Support.ImportFloatVariableWithDefault("Min Add Amount", "Min energy to add at time right before item is reaped.", 0.1)
local TimeFromCreationPercent = Support.ImportWatchVariable("Max Time From Creation %", "What percentage of this object's max life time has this object existed? This should point to a watch variable of a 'Time From Creation' component")
Support.RegisterCurveTemplateVariable("Energy Falloff Curve", "The falloff curve that defines the amount of energy over time the pickup will provide the player. The curve scales between 'Max Add Amount' & 'Min Add Amount.'")
local CurveFunction
local avatarFettel = Utilities.GetFettelAvatar()
if avatarFettel ~= nil then
  local energyComponentName = "Ghost Power Meter"
  local fCurrentPower = Energy.GetEnergyLevel(avatarFettel, energyComponentName)
  CurveFunction = Utilities.GetCurveFunction("Energy Falloff Curve", MaxEnergyAddAmount, MinEnergyAddAmount)
  local fTimeFromCreationPercent = Support.GetImportWatchVariableValue("Max Time From Creation %")
  local fEnergyToGrantPlayer = CurveFunction(fTimeFromCreationPercent)
  Energy.SetEnergyLevelOnObject(avatarFettel, energyComponentName, fCurrentPower + fEnergyToGrantPlayer)
end
