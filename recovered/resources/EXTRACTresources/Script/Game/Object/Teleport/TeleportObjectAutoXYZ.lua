GameScript.Support.AddDescription("Script to teleport an object using an existing object's location and rotation")
local Game = GameScript.Game
local Support = GameScript.Support
local TeleportObject = Support.ImportSingleObject("Teleport Object", "Teleport this object")
local LocationTable = Support.ImportSingleObject("Teleport Location", "Teleport object to this location")
local RotationTable = Support.ImportSingleObject("Rotation of Location", "Teleport object with orientation to this location")
local TeleportLocation = Game.GetPosition(LocationTable)
local Rotation = Game.GetRotation(RotationTable)

function EnterRegion()
  Game.TeleportObjectWithRotation(TeleportObject, TeleportLocation, Rotation)
end

EnterRegion()
