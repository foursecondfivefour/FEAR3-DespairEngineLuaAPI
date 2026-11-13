local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Player = Game.Player
local ObjectTags = Game.ObjectTags
local Energy = GameScript.Game.Energy
local Utilities = GameScript.Utilities
local GS = GameScript
Support.AddDescription("Set Fettel's Energy Level, if he exists.")
local amount = Support.ImportFloatVariableWithDefault("Add Amount", "Add energy level amount?", 0.25)
local avatarFettel = Utilities.GetFettelAvatar()
if avatarFettel ~= nil then
  local energyComponentName = "Ghost Power Meter"
  local fCurrentPower = Energy.GetEnergyLevel(avatarFettel, energyComponentName)
  Energy.SetEnergyLevelOnObject(avatarFettel, energyComponentName, fCurrentPower + amount)
end
