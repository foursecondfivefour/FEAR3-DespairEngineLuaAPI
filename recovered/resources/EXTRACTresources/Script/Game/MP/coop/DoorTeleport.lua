GameScript.Support.AddDescription("Script to teleport Fettel using an existing object's location and rotation.  Will keep trying until it finds fettel and teleports him.")
local Game = GameScript.Game
local Player = Game.Player
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local ObjectTags = Game.ObjectTags
local LocationTable = Support.ImportSingleObject("Teleport Location", "Teleport object to this location")
local RotationTable = Support.ImportSingleObject("Rotation of Location", "Teleport object with orientation to this location")
local TeleportLocation = Game.GetPosition(LocationTable)
local Rotation = Game.GetRotation(RotationTable)
local Region = Game.GetMyObject()

function Teleport(msg)
  local object = msg.object
  if Game.IsRiding(object) then
    local playerIndex = Player.GetPlayerIndexByObject(object)
    object = Player.GetPlayerControlledObjectByIndex(playerIndex)
  end
  Game.TeleportObjectWithRotation(object, TeleportLocation, Rotation)
end

Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Point Man"), "Teleport", "")
Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Fettel"), "Teleport", "")
