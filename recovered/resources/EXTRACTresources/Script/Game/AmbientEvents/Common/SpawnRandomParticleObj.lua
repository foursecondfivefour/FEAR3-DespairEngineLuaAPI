GameScript.Support.RegisterObjectTemplateVariable("Particle FX #1", "Particle FX template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Particle FX #2", "Particle FX template object that can be randomly chosen")
local Game = GameScript.Game
local Debug = GameScript.Debug
local Utilities = GameScript.Utilities
local ParticleFXObject
local Self = Game.GetMyObject()

function SpawnParticle()
  local numToRandom = 4
  local RandomNum = Utilities.GetRandomInteger(1, numToRandom) / 2
  RandomNum = math.ceil(RandomNum)
  if RandomNum == 1 then
    ParticleFXObject = Game.SpawnWithRotation("Particle FX #1", Game.GetPosition(Self), Game.GetRotation(Self))
  else
    ParticleFXObject = Game.SpawnWithRotation("Particle FX #2", Game.GetPosition(Self), Game.GetRotation(Self))
  end
end

SpawnParticle()
