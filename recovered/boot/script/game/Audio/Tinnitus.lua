local Audio = GameScript.Audio
local Utilities = GameScript.Utilities
local Game = GameScript.Game
local Player = Game.Player
local radius = GameScript.Support.ImportFloatVariableWithDefault("Radius", "Maximum distance at which to apply tinnitus effects.", 10)
local myObject = Game.GetMyObject()

local function CheckTinnitus(obj, radius)
  local playerObject = Player.GetPlayerControlledObjectByIndex(GameScript.PlayerIndex.kGlobalPlayer1)
  if playerObject then
    local distance = Utilities.GetDistanceBetweenObjects(obj, playerObject)
    if radius > distance then
      Audio.ApplyTinnitus(5 * (1 - distance / radius))
    end
  end
end

if myObject ~= nil then
  CheckTinnitus(myObject, radius)
end
