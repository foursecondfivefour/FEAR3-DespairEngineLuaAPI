GameScript.Support.RegisterObjectTemplateVariable("Object #1", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #2", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #3", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #4", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #5", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #6", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #7", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #8", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #9", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #10", "Object template object that can be randomly chosen")
local Game = GameScript.Game
local Debug = GameScript.Debug
local Utilities = GameScript.Utilities
local ParticleFXObject
local Self = Game.GetMyObject()

function SpawnParticle()
  local numToRandom = 20
  local RandomNum = Utilities.GetRandomInteger(1, numToRandom) / 2
  RandomNum = math.ceil(RandomNum)
  if RandomNum == 1 then
    ParticleFXObject = Game.SpawnWithRotation("Object #1", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 2 then
    ParticleFXObject = Game.SpawnWithRotation("Object #2", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 3 then
    ParticleFXObject = Game.SpawnWithRotation("Object #3", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 4 then
    ParticleFXObject = Game.SpawnWithRotation("Object #4", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 5 then
    ParticleFXObject = Game.SpawnWithRotation("Object #5", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 6 then
    ParticleFXObject = Game.SpawnWithRotation("Object #6", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 7 then
    ParticleFXObject = Game.SpawnWithRotation("Object #7", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 8 then
    ParticleFXObject = Game.SpawnWithRotation("Object #8", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 9 then
    ParticleFXObject = Game.SpawnWithRotation("Object #9", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 10 then
    ParticleFXObject = Game.SpawnWithRotation("Object #10", Game.GetPosition(Self), Game.GetRotation(Self))
  end
end

SpawnParticle()
