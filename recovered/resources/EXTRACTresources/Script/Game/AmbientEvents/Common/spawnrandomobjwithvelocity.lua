GameScript.Support.RegisterObjectTemplateVariable("Object #1", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #2", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #3", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #4", "Object template object that can be randomly chosen")
GameScript.Support.RegisterObjectTemplateVariable("Object #5", "Object template object that can be randomly chosen")
local velocity = GameScript.Support.ImportFloatVariable("Velocity", "Speed (m/s) that the spawned object will move in the direction that the script object is facing.")
local Game = GameScript.Game
local Debug = GameScript.Debug
local Utilities = GameScript.Utilities
local SpawnedObj
local Self = Game.GetMyObject()
local forward = GameScript.Game.GetForward(Self)
if forward then
  forward.x = forward.x * velocity
  forward.y = forward.y * velocity
  forward.z = forward.z * velocity
end

function SpawnObject()
  local numToRandom = 10
  local RandomNum = Utilities.GetRandomInteger(1, numToRandom) / 2
  RandomNum = math.ceil(RandomNum)
  if RandomNum == 1 then
    SpawnedObj = Game.SpawnWithRotation("Object #1", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 2 then
    SpawnedObj = Game.SpawnWithRotation("Object #2", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 3 then
    SpawnedObj = Game.SpawnWithRotation("Object #3", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 4 then
    SpawnedObj = Game.SpawnWithRotation("Object #4", Game.GetPosition(Self), Game.GetRotation(Self))
  elseif RandomNum == 5 then
    SpawnedObj = Game.SpawnWithRotation("Object #5", Game.GetPosition(Self), Game.GetRotation(Self))
  end
  GameScript.Game.Physics.SetVelocity(SpawnedObj, forward)
end

SpawnObject()
