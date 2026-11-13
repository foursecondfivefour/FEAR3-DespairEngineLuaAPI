local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local ObjectTags = Game.ObjectTags
local Energy = Game.Energy
local Utilities = GameScript.Utilities
Support.AddDescription("Set Fettel's Energy Level, if he exists.")
local amount = Support.ImportFloatVariableWithDefault("Meter Amount", "Set energy level to?", 0.75)
local avatarFettel = Utilities.GetFettelAvatar()
if avatarFettel ~= nil then
  Energy.SetEnergyLevelOnObject(avatarFettel, "Ghost Power Meter", amount)
end
