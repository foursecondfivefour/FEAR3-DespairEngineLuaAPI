GameScript.Support.AddDescription("Script to teleport both players using existing objects' location and rotation")
local Game = GameScript.Game
local Player = Game.Player
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local ObjectTags = Game.ObjectTags
local teleportPointMan = Support.ImportBoolVariableWithDefault("Teleport Point Man?", "Should we teleport Point Man?", true)
local teleportFettel = Support.ImportBoolVariableWithDefault("Teleport Fettel?", "Should we teleport Fettel?", true)
local teleportFettelWithBody = Support.ImportBoolVariableWithDefault("Fettel Keeps Body?", "Does Fettel get to teleport with his body?", true)
local LocationTable1 = Support.ImportSingleObject("Teleport Location 1", "Teleport Point Man to this location")
local RotationTable1 = Support.ImportSingleObject("Rotation of Location 1", "Teleport Point Man with orientation to this location")
local LocationTable2 = Support.ImportSingleObject("Teleport Location 2", "Teleport Fettel to this location")
local RotationTable2 = Support.ImportSingleObject("Rotation of Location 2", "Teleport Fettel with orientation to this location")
local PointManPlayerID = GameScript.PlayerIndex.kGlobalPlayer1
local FettelPlayerID = GameScript.PlayerIndex.kGlobalPlayer2
local PointMan, Fettel
local TeleportLocation1 = Game.GetPosition(LocationTable1)
local Rotation1 = Game.GetRotation(RotationTable1)
local TeleportLocation2 = Game.GetPosition(LocationTable2)
local Rotation2 = Game.GetRotation(RotationTable2)
local PointManIsLocal = false
local FettelIsLocal = false

function EnterRegion()
  if PointManIsLocal and teleportPointMan and TeleportLocation1 and Rotation1 then
    Game.TeleportObjectWithRotation(PointMan, TeleportLocation1, Rotation1)
  end
  if FettelIsLocal and teleportFettel and TeleportLocation2 and Rotation2 then
    Game.TeleportObjectWithRotation(Fettel, TeleportLocation2, Rotation2)
  end
end

function Setup()
  PointManPlayerID, FettelPlayerID = Utilities.GetPointManFettelIndices()
  if PointManPlayerID ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    PointMan = Player.GetPlayerAvatarObjectByIndex(PointManPlayerID)
    if PointMan then
      PointManIsLocal = Player.IsLocalPlayer(PointManPlayerID)
      Player.ClearTetherBreadcrumbs(PointManPlayerID)
    end
  end
  if FettelPlayerID ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    Fettel = Player.GetPlayerControlledObjectByIndex(FettelPlayerID)
    if Fettel then
      FettelIsLocal = Player.IsLocalPlayer(FettelPlayerID)
      if FettelIsLocal and teleportFettel and not teleportFettelWithBody and not ObjectTags.DoesObjectHaveTag(Fettel, "Fettel") then
        Game.Kill(Fettel, 1)
        Fettel = Player.GetPlayerAvatarObjectByIndex(FettelPlayerID)
      end
    end
  end
end

Setup()
EnterRegion()
