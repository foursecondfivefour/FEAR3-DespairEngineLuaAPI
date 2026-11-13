GameScript.Support.AddDescription("Script to teleport pointman and tether fettel using existing objects' location and rotation.  Whole process should take about 1.5-2 seconds.")
local Game = GameScript.Game
local Player = Game.Player
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local ObjectTags = Game.ObjectTags
local Callbacks = GameScript.Callbacks
local teleportPointMan = Support.ImportBoolVariableWithDefault("Teleport Point Man?", "Should we teleport Point Man?", true)
local teleportFettel = Support.ImportBoolVariableWithDefault("Teleport Fettel?", "Should we teleport Fettel?", true)
local teleportFettelWithBody = Support.ImportBoolVariableWithDefault("Fettel Keeps Body?", "Does Fettel get to teleport with his body?", true)
local LocationTable1 = Support.ImportSingleObject("Teleport Location 1", "Teleport Point Man to this location")
local RotationTable1 = Support.ImportSingleObject("Rotation of Location 1", "Teleport Point Man with orientation to this location")
local LocationTable2 = Support.ImportSingleObject("Teleport Location 2", "Teleport Fettel to this location if he keeps his body")
local RotationTable2 = Support.ImportSingleObject("Rotation of Location 2", "Teleport Fettel with orientation to this location if he keeps his body")
local SpawnTagSet = Support.ImportSetObject("Spawn Tag Set", "Object containing a set of spawn tag objects to tether Fettel.  These should probably be playerspawnlocations that are disabled.")
local PointManPlayerID, FettelPlayerID, PointMan, Fettel
local TeleportLocation1 = Game.GetPosition(LocationTable1)
local Rotation1 = Game.GetRotation(RotationTable1)
local TeleportLocation2 = Game.GetPosition(LocationTable2)
local Rotation2 = Game.GetRotation(RotationTable2)
local PointManIsLocal = false
local FettelIsLocal = false
local FettelAlone = false

function TeleportPointManAfterEject()
  local pm = Player.GetPlayerControlledObjectByIndex(PointManPlayerID)
  if pm and TeleportLocation1 and Rotation1 then
    Game.TeleportObjectWithRotation(pm, TeleportLocation1, Rotation1)
  end
end

function TeleportFettelAfterEject()
  local fet = Player.GetPlayerControlledObjectByIndex(FettelPlayerID)
  if fet and TeleportLocation2 and Rotation2 then
    Game.TeleportObjectWithRotation(fet, TeleportLocation2, Rotation2)
  end
end

function KillFettelPossessedBody()
  Fettel = Player.GetPlayerControlledObjectByIndex(FettelPlayerID)
  if Fettel and Game.IsLoaded(Fettel) and not ObjectTags.DoesObjectHaveTag(Fettel, "Fettel") then
    Game.Kill(Fettel, 1)
  end
  Callbacks.RegisterForTimer("TeleportFettelAfterEject", 0.5, false)
end

function KickFettelOut()
  Fettel = Player.GetPlayerControlledObjectByIndex(FettelPlayerID)
  if Fettel ~= nil and ObjectTags.DoesObjectHaveTag(Fettel, "Power Armor") then
    local InventoryTable = Game.GetInventoryItems(Fettel, 4)
    if InventoryTable[1] then
      Game.ForceRiderOutOfVehicle(InventoryTable[1], Fettel, true)
    end
  else
  end
  if teleportFettelWithBody then
    Callbacks.RegisterForTimer("TeleportFettelAfterEject", 0.5, false)
  else
    Callbacks.RegisterForTimer("KillFettelPossessedBody", 0.5, false)
  end
end

function KickPointManOut()
  if PointMan ~= nil then
    local InventoryTable = Game.GetInventoryItems(PointMan, 4)
    if InventoryTable[1] then
      Game.ForceRiderOutOfVehicle(InventoryTable[1], PointMan, true)
    end
    Callbacks.RegisterForTimer("TeleportPointManAfterEject", 0.5, false)
  else
  end
end

function Setup()
  PointManPlayerID, FettelPlayerID = Utilities.GetPointManFettelIndices()
  if PointManPlayerID == GameScript.PlayerIndex.kNotAGlobalPlayer and FettelPlayerID ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    FettelAlone = true
  end
  if PointManPlayerID and PointManPlayerID ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    PointMan = Player.GetPlayerControlledObjectByIndex(PointManPlayerID)
    if PointMan then
      PointManIsLocal = Player.IsLocalPlayer(PointManPlayerID)
      if PointManIsLocal and teleportPointMan then
        if not ObjectTags.DoesObjectHaveTag(PointMan, "Point Man") then
          KickPointManOut()
        else
          TeleportPointManAfterEject(PointMan)
        end
      end
    end
  end
  if FettelPlayerID and FettelPlayerID ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    Fettel = Player.GetPlayerControlledObjectByIndex(FettelPlayerID)
    if Fettel then
      Debug.PrintInfo("Fettel Controlled Object: " .. Game.GetName(Fettel))
      FettelIsLocal = Player.IsLocalPlayer(FettelPlayerID)
      Debug.PrintInfo("Fettel Found - Local = " .. tostring(FettelIsLocal))
      if FettelIsLocal and teleportFettel then
        Callbacks.RegisterForTimer("KickFettelOut", 1, false)
      end
    end
  end
end

Setup()
