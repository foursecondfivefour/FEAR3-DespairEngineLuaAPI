local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Player = Game.Player
local Support = GS.Support
local Debug = GS.Debug
local Regions = Game.Regions
local Sets = Game.Sets
local Utilities = GS.Utilities
local MP = Game.MP
local Physics = Game.Physics
local ObjectTags = Game.ObjectTags
local FEAR = GS.FEAR
local math3d = GS.LuaMath3d
local CarriedStatus = GS.InventoryItemCarriedStatus
local myObject = Game.GetMyObject()
local kSMGIndex = 1
local kARIndex = 2
local kShotgunIndex = 3
local kUziIndex = 4
local kNumStandardWeapons = 4
local kFragIndex = 5
local kSmokeIndex = 6
local kFlashIndex = 7
local kNumStandardGrenadeTypes = 3
local kPenetratorIndex = 1
local kSniperIndex = 2
local kRLIndex = 3
local kPhaseBeamIndex = 4
local kRiotShieldIndex = 5
local kNumSpecialWeapons = 5
local kZapIndex = 6
local kProximityMineIndex = 7
local kNumSpecialGrenadeTypes = 2
local RackStandardWeaponSpawners = {}
RackStandardWeaponSpawners[kSMGIndex] = Support.ImportSingleObject("SMG Weapon Rack Spawner", "Spawner in the weapon rack that spawn the SMG")
RackStandardWeaponSpawners[kARIndex] = Support.ImportSingleObject("------Assault Rifle Weapon Rack Spawner", "Spawner in the weapon rack that spawn the Assault Rifle")
RackStandardWeaponSpawners[kShotgunIndex] = Support.ImportSingleObject("------Shotgun Weapon Rack Spawner", "Spawner in the weapon rack that spawn the Shotgun")
RackStandardWeaponSpawners[kUziIndex] = Support.ImportSingleObject("------Uzi Weapon Rack Spawner", "Spawner in the weapon rack that spawn the Uzi")
RackStandardWeaponSpawners[kFragIndex] = Support.ImportSingleObject("------Frag Grenade Weapon Rack Spawner", "Spawner in the weapon rack that spawn the Frag Grenade")
RackStandardWeaponSpawners[kSmokeIndex] = Support.ImportSingleObject("------Smoke Grenade Weapon Rack Spawner", "Spawner in the weapon rack that spawn the Frag Grenade")
RackStandardWeaponSpawners[kFlashIndex] = Support.ImportSingleObject("------Flash Grenade Weapon Rack Spawner", "Spawner in the weapon rack that spawn the Frag Grenade")
local NumInitialStandardWeapons = {}
NumInitialStandardWeapons[kSMGIndex] = Support.ImportFloatVariable("Initial Number of SMGs", "")
NumInitialStandardWeapons[kARIndex] = Support.ImportFloatVariable("------Initial Number of Assault Rifles", "")
NumInitialStandardWeapons[kShotgunIndex] = Support.ImportFloatVariable("------Initial Number of Shotguns", "")
NumInitialStandardWeapons[kUziIndex] = Support.ImportFloatVariable("------Initial Number of Uzis", "")
NumInitialStandardWeapons[kFragIndex] = Support.ImportFloatVariable("------Initial Number of Frag Grenades", "")
NumInitialStandardWeapons[kSmokeIndex] = Support.ImportFloatVariable("------Initial Number of Smoke Grenades", "")
NumInitialStandardWeapons[kFlashIndex] = Support.ImportFloatVariable("------Initial Number of Flash Grenades", "")
local NumStandardWeaponsAvailable = {}
local RackStandardWeaponObjectsArray = {}
local RackSpecialWeaponSpawners = {}
RackSpecialWeaponSpawners[kPenetratorIndex] = Support.ImportSingleObject("Penetrator Rack Spawners", "Spawners in the weapon rack that spawn the Penetrator")
RackSpecialWeaponSpawners[kSniperIndex] = Support.ImportSingleObject("------Sniper Weapon Rack Spawner", "Spawners in the weapon rack that spawn the Sniper Rifle")
RackSpecialWeaponSpawners[kRLIndex] = Support.ImportSingleObject("------Rocket Launcher Weapon Rack Spawner", "Spawners in the weapon rack that spawn the Rocket Launcher")
RackSpecialWeaponSpawners[kPhaseBeamIndex] = Support.ImportSingleObject("------Phase Beam Weapon Rack Spawner", "Spawners in the weapon rack that spawn the Phase Beam")
RackSpecialWeaponSpawners[kRiotShieldIndex] = Support.ImportSingleObject("------Riot Shield Weapon Rack Spawner", "Spawners in the weapon rack that spawn the Riot Shield")
RackSpecialWeaponSpawners[kZapIndex] = Support.ImportSingleObject("------Zap Grenade Weapon Rack Spawner", "Spawners in the weapon rack that spawn the Zap Grenade")
RackSpecialWeaponSpawners[kProximityMineIndex] = Support.ImportSingleObject("------Proximity Mine Weapon Rack Spawner", "Spawners in the weapon rack that spawn the Proximity Mine")
local NumInitialSpecialWeapons = {}
NumInitialSpecialWeapons[kPenetratorIndex] = Support.ImportFloatVariable("Initial Number of Penetrators", "")
NumInitialSpecialWeapons[kSniperIndex] = Support.ImportFloatVariable("------Initial Number of Sniper Rifles", "")
NumInitialSpecialWeapons[kRLIndex] = Support.ImportFloatVariable("------Initial Number of Rocket Launchers", "")
NumInitialSpecialWeapons[kPhaseBeamIndex] = Support.ImportFloatVariable("------Initial Number of Phase Beams", "")
NumInitialSpecialWeapons[kRiotShieldIndex] = Support.ImportFloatVariable("------Initial Number of Riot Shields", "")
NumInitialSpecialWeapons[kZapIndex] = Support.ImportFloatVariable("------Initial Number of Zap Grenades", "")
NumInitialSpecialWeapons[kProximityMineIndex] = Support.ImportFloatVariable("------Initial Number of Proximity Mines", "")
local NumSpecialWeaponsAvailable = {}
local RackSpecialWeaponObjectsArray = {}
local BeginRestPeriodMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Rest Period", "")
local kMaxNumWaves = 20
local kNumWaves = Support.ImportFloatVariableWithDefault("Num Waves (max " .. kMaxNumWaves .. ")", "", 20)
local StandardWeaponPickupsAllowedForWave = {}
for i = 1, kMaxNumWaves do
  StandardWeaponPickupsAllowedForWave[i] = {}
  StandardWeaponPickupsAllowedForWave[i][kSMGIndex] = Support.ImportFloatVariableWithDefault("Wave " .. i .. " Num SMGs", "The number of SMGs a single crate carries", 2)
  StandardWeaponPickupsAllowedForWave[i][kARIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num AR", "The number of Assault Rifles a single crate carries", 2)
  StandardWeaponPickupsAllowedForWave[i][kShotgunIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Shotgun", "The number of Shotguns a single crate carries", 2)
  StandardWeaponPickupsAllowedForWave[i][kUziIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Uzi", "The number of Uzis a single crate carries", 2)
  StandardWeaponPickupsAllowedForWave[i][kFragIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Frag Grenades", "The number of Frag Grenades a single crate carries", 2)
  StandardWeaponPickupsAllowedForWave[i][kSmokeIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Smoke Grenades", "The number of Smoke Grenades a single crate carries", 0)
  StandardWeaponPickupsAllowedForWave[i][kFlashIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Flash Grenades", "The number of Flash Grenades a single crate carries", 0)
end
local SpecialWeaponPickupsAllowedForWave = {}
for i = 1, kMaxNumWaves do
  SpecialWeaponPickupsAllowedForWave[i] = {}
  SpecialWeaponPickupsAllowedForWave[i][kPenetratorIndex] = Support.ImportFloatVariableWithDefault("Special Weapon Wave " .. i .. " Num Penetrators", "The number of Penetrators a single crate carries", 0)
  SpecialWeaponPickupsAllowedForWave[i][kSniperIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Sniper", "The number of Sniper Rifles a single crate carries", 0)
  SpecialWeaponPickupsAllowedForWave[i][kRLIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Rocket Launcher", "The number of Rocket Launchers a single crate carries", 0)
  SpecialWeaponPickupsAllowedForWave[i][kPhaseBeamIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Phase Beams", "The number of Phase Beams a single crate carries", 0)
  SpecialWeaponPickupsAllowedForWave[i][kRiotShieldIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Riot Shields", "The number of Riot Shields a single crate carries", 0)
  SpecialWeaponPickupsAllowedForWave[i][kZapIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Zap Grenades", "The number of Zap Grenades a single crate carries", 0)
  SpecialWeaponPickupsAllowedForWave[i][kProximityMineIndex] = Support.ImportFloatVariableWithDefault("     Wave " .. i .. " Num Proximity Mines", "The number of Proximity Mines a single crate carries", 0)
end
local regionSet = Support.ImportSetObject("Region Set", "The set of regions to bring the weapon pickups to so they are collected")
local WeaponCrateRetrievedMsgId = Support.ImportStaticTextVariable("MissionEvent: Weapon Crate Retrieved", "")
local CurrentStandardWeaponSpawner1 = -1
local CurrentStandardWeaponSpawner2 = -1
local CurrentStandardGrenadeSpawner = -1
local CurrentSpecialWeaponSpawner = -1
local CurrentSpecialGrenadeSpawner = -1
local CurrentWaveNum = 1
local CurrentNumValidStandardWeaponTypes = 0
local CurrentNumValidStandardGrenadeTypes = 0
local CurrentNumValidSpecialWeaponTypes = 0
local CurrentNumValidSpecialGrenadeTypes = 0
Support.ExportFloatVariable("Player1InRetrieveRegion", 0, "")
Support.ExportFloatVariable("Player2InRetrieveRegion", 0, "")
Support.ExportFloatVariable("Player3InRetrieveRegion", 0, "")
Support.ExportFloatVariable("Player4InRetrieveRegion", 0, "")
local localPlayer1InRetrieveRegion = 0
local localPlayer2InRetrieveRegion = 0
local localPlayer3InRetrieveRegion = 0
local localPlayer4InRetrieveRegion = 0
Support.ExportFloatVariable("SMGsCollected", 0, "")
Support.ExportFloatVariable("ARsCollected", 0, "")
Support.ExportFloatVariable("ShotgunsCollected", 0, ".")
Support.ExportFloatVariable("UzisCollected", 0, "")
Support.ExportFloatVariable("FragGrenadesCollected", 0, "")
Support.ExportFloatVariable("SmokeGrenadesCollected", 0, "")
Support.ExportFloatVariable("FlashGrenadesCollected", 0, "")
Support.ExportFloatVariable("PenetratorsCollected", 0, "")
Support.ExportFloatVariable("SnipersCollected", 0, "")
Support.ExportFloatVariable("RLsCollected", 0, "")
Support.ExportFloatVariable("RiotShieldsCollected", 0, "")
Support.ExportFloatVariable("PhaseBeamsCollected", 0, "")
Support.ExportFloatVariable("ZapGrenadesCollected", 0, "")
Support.ExportFloatVariable("ProximityMinesCollected", 0, "")
local SMGName = Support.ImportStaticTextVariableWithDefault("SMGName", "", 145022)
local ARName = Support.ImportStaticTextVariableWithDefault("ARName", "", 145023)
local ShotgunName = Support.ImportStaticTextVariableWithDefault("ShotgunName", "", 145024)
local UziName = Support.ImportStaticTextVariableWithDefault("UziName", "", 145026)
local FragGrenadeName = Support.ImportStaticTextVariableWithDefault("FragGrenadeName", "", 145029)
local FlashGrenadeName = Support.ImportStaticTextVariableWithDefault("FlashGrenadeName", "", 145031)
local PenetratorName = Support.ImportStaticTextVariableWithDefault("PenetratorName", "", 145027)
local SniperRifleName = Support.ImportStaticTextVariableWithDefault("SniperRifleName", "", 145025)
local RLName = Support.ImportStaticTextVariableWithDefault("RLName", "", 145034)
local RiotShieldName = Support.ImportStaticTextVariableWithDefault("RiotShieldName", "", 145035)
local PhaseBeamName = Support.ImportStaticTextVariableWithDefault("PhaseBeamName", "", 145028)
local ZapGrenadeName = Support.ImportStaticTextVariableWithDefault("ZapGrenadeName", "", 145030)
local SMGsCollected = 0
local ARsCollected = 0
local ShotgunsCollected = 0
local UzisCollected = 0
local FragGrenadesCollected = 0
local SmokeGrenadesCollected = 0
local FlashGrenadesCollected = 0
local PenetratorsCollected = 0
local SnipersCollected = 0
local RLsCollected = 0
local RiotShieldsCollected = 0
local PhaseBeamsCollected = 0
local ZapGrenadesCollected = 0
local ProximityMinesCollected = 0
local LowAmmoVOSent = false
Support.ExportFloatVariable("TotalNumberOfWeapons", 0, "")
local LowWeaponAmount = 4
local WeaponRackReferencePosition = Support.ImportSingleObject("Weapon Rack Reference Position", "")
local numberOfReturnedCrates = {}

function SendLowAmmoVO()
  local myPos = Game.GetPosition(WeaponRackReferencePosition)
  local bestPlayerObject
  local bestPlayerDist = 99999999
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    playerObject = Player.GetPlayerControlledObjectByIndex(index)
    if playerObject ~= nil then
      local playerPos = Game.GetPosition(playerObject)
      if math.abs(playerPos.y - myPos.y) < 2 then
        playerPos.y = 0
        myPos.y = 0
        local distanceSqrd = math3d.DistanceBetweenPositionsSquared(playerPos, myPos)
        if bestPlayerDist > distanceSqrd then
          bestPlayerDist = distanceSqrd
          bestPlayerObject = playerObject
        end
      end
    end
  end
  if bestPlayerObject ~= nil then
    Game.SendTextMessage(bestPlayerObject, "SFX_LowAmmo")
    LowAmmoVOSent = true
  end
end

function CheckForLowAmmoAndSendVO()
  if not LowAmmoVOSent and Extern.TotalNumberOfWeapons < LowWeaponAmount then
    SendLowAmmoVO()
  end
end

function CheckForAmmoAndResetVO(inventoryMessage)
  if Extern.TotalNumberOfWeapons >= LowWeaponAmount then
    LowAmmoVOSent = false
  end
end

function OnAnyStandardWeaponRackPickupInventoryStatusChange(inventoryMessage)
  for i = 1, #NumStandardWeaponsAvailable do
    if RackStandardWeaponObjectsArray[i] == inventoryMessage.item and (inventoryMessage.carriedStatus == CarriedStatus.Selected or inventoryMessage.carriedStatus == CarriedStatus.Unselected) then
      Callbacks.UnregisterForMsg(GS.MsgCallback.ItemStatusForItemMessage, RackStandardWeaponObjectsArray[i], "OnAnyStandardWeaponRackPickupInventoryStatusChange")
      Callbacks.UnregisterForMsg(GS.MsgCallback.AllAmmoPickedUpMessage, RackStandardWeaponObjectsArray[i], "OnAnyStandardWeaponRackPickupExhausted")
      RackStandardWeaponObjectsArray[i] = nil
      EnableStandardWeaponSpawner(i)
      if i < kNumStandardWeapons then
        Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons - 1
        CheckForLowAmmoAndSendVO()
      end
      break
    end
  end
end

function OnAnyStandardWeaponRackPickupExhausted(exhaustedObject)
  for i = 1, #NumStandardWeaponsAvailable do
    if RackStandardWeaponObjectsArray[i] == exhaustedObject then
      Callbacks.UnregisterForMsg(GS.MsgCallback.ItemStatusForItemMessage, RackStandardWeaponObjectsArray[i], "OnAnyStandardWeaponRackPickupInventoryStatusChange")
      Callbacks.UnregisterForMsg(GS.MsgCallback.AllAmmoPickedUpMessage, RackStandardWeaponObjectsArray[i], "OnAnyStandardWeaponRackPickupExhausted")
      RackStandardWeaponObjectsArray[i] = nil
      if i < kNumStandardWeapons then
        Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons - 1
        CheckForLowAmmoAndSendVO()
      end
      EnableStandardWeaponSpawner(i)
      break
    end
  end
end

function OnAnyStandardWeaponRackPickupSpawned(spawnMessage)
  for i = 1, #RackStandardWeaponSpawners do
    if spawnMessage.spawner == RackStandardWeaponSpawners[i] then
      RackStandardWeaponObjectsArray[i] = spawnMessage.object
      NumStandardWeaponsAvailable[i] = NumStandardWeaponsAvailable[i] - 1
      Callbacks.RegisterForMsg(GS.MsgCallback.ItemStatusForItemMessage, RackStandardWeaponObjectsArray[i], "OnAnyStandardWeaponRackPickupInventoryStatusChange")
      Callbacks.RegisterForMsg(GS.MsgCallback.AllAmmoPickedUpMessage, RackStandardWeaponObjectsArray[i], "OnAnyStandardWeaponRackPickupExhausted")
      Game.EnableAllEnableables(RackStandardWeaponSpawners[i], false)
      break
    end
  end
end

function OnAnySpecialWeaponRackPickupInventoryStatusChange(inventoryMessage)
  for i = 1, #NumSpecialWeaponsAvailable do
    if RackSpecialWeaponObjectsArray[i] == inventoryMessage.item and (inventoryMessage.carriedStatus == CarriedStatus.Selected or inventoryMessage.carriedStatus == CarriedStatus.Unselected) then
      Callbacks.UnregisterForMsg(GS.MsgCallback.ItemStatusForItemMessage, RackSpecialWeaponObjectsArray[i], "OnAnySpecialWeaponRackPickupInventoryStatusChange")
      Callbacks.UnregisterForMsg(GS.MsgCallback.AllAmmoPickedUpMessage, RackSpecialWeaponObjectsArray[i], "OnAnySpecialWeaponRackPickupExhausted")
      RackSpecialWeaponObjectsArray[i] = nil
      EnableSpecialWeaponSpawner(i)
      if i < kNumStandardWeapons then
        Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons - 1
        CheckForLowAmmoAndSendVO()
      end
      break
    end
  end
end

function OnAnySpecialWeaponRackPickupExhausted(exhaustedObject)
  for i = 1, #NumSpecialWeaponsAvailable do
    if RackSpecialWeaponObjectsArray[i] == exhaustedObject then
      Callbacks.UnregisterForMsg(GS.MsgCallback.ItemStatusForItemMessage, RackSpecialWeaponObjectsArray[i], "OnAnySpecialWeaponRackPickupInventoryStatusChange")
      Callbacks.UnregisterForMsg(GS.MsgCallback.AllAmmoPickedUpMessage, RackSpecialWeaponObjectsArray[i], "OnAnySpecialWeaponRackPickupExhausted")
      RackSpecialWeaponObjectsArray[i] = nil
      EnableSpecialWeaponSpawner(i)
      if i < kNumStandardWeapons then
        Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons - 1
        CheckForLowAmmoAndSendVO()
      end
      break
    end
  end
end

function OnAnySpecialWeaponRackPickupSpawned(spawnMessage)
  for i = 1, #RackSpecialWeaponSpawners do
    if spawnMessage.spawner == RackSpecialWeaponSpawners[i] then
      RackSpecialWeaponObjectsArray[i] = spawnMessage.object
      NumSpecialWeaponsAvailable[i] = NumSpecialWeaponsAvailable[i] - 1
      Callbacks.RegisterForMsg(GS.MsgCallback.ItemStatusForItemMessage, RackSpecialWeaponObjectsArray[i], "OnAnySpecialWeaponRackPickupInventoryStatusChange")
      Callbacks.RegisterForMsg(GS.MsgCallback.AllAmmoPickedUpMessage, RackSpecialWeaponObjectsArray[i], "OnAnySpecialWeaponRackPickupExhausted")
      Game.EnableAllEnableables(RackSpecialWeaponSpawners[i], false)
      break
    end
  end
end

function RegisterForWeaponRackSpawnerMessage()
  for i = 1, #RackStandardWeaponSpawners do
    NumStandardWeaponsAvailable[i] = 0
    RackStandardWeaponObjectsArray[i] = nil
    if RackStandardWeaponSpawners[i] ~= myObject then
      Callbacks.RegisterForMsg(GS.MsgCallback.SpawnerMessage, RackStandardWeaponSpawners[i], "OnAnyStandardWeaponRackPickupSpawned")
    end
  end
  for i = 1, #RackSpecialWeaponSpawners do
    NumSpecialWeaponsAvailable[i] = 0
    RackSpecialWeaponObjectsArray[i] = nil
    if RackSpecialWeaponSpawners[i] ~= myObject then
      Callbacks.RegisterForMsg(GS.MsgCallback.SpawnerMessage, RackSpecialWeaponSpawners[i], "OnAnySpecialWeaponRackPickupSpawned")
    end
  end
end

function EnableStandardWeaponSpawner(weaponTypeIndex)
  if 0 < NumStandardWeaponsAvailable[weaponTypeIndex] then
    Game.EnableAllEnableables(RackStandardWeaponSpawners[weaponTypeIndex], true)
  end
end

function EnableSpecialWeaponSpawner(weaponTypeIndex)
  if 0 < NumSpecialWeaponsAvailable[weaponTypeIndex] then
    Game.EnableAllEnableables(RackSpecialWeaponSpawners[weaponTypeIndex], true)
  end
end

function InitializeWeaponRackSpawners()
  for i = 1, #NumInitialStandardWeapons do
    if 0 < NumInitialStandardWeapons[i] then
      NumStandardWeaponsAvailable[i] = NumInitialStandardWeapons[i]
      if i < kNumStandardWeapons then
        Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons + NumInitialStandardWeapons[i]
      end
      EnableStandardWeaponSpawner(i)
    end
  end
  for i = 1, #NumInitialSpecialWeapons do
    if 0 < NumInitialSpecialWeapons[i] then
      NumSpecialWeaponsAvailable[i] = NumInitialSpecialWeapons[i]
      if i < kNumSpecialWeapons then
        Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons + NumInitialSpecialWeapons[i]
      end
      EnableSpecialWeaponSpawner(i)
    end
  end
end

function UpdateNumValidStandardWeaponTypesForWave(waveIndex)
  CurrentNumValidStandardWeaponTypes = 0
  for i = 1, kNumStandardWeapons do
    if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][i] then
      CurrentNumValidStandardWeaponTypes = CurrentNumValidStandardWeaponTypes + 1
    end
  end
  CurrentNumValidStandardGrenadeTypes = 0
  for i = kNumStandardWeapons + 1, kNumStandardWeapons + kNumStandardGrenadeTypes do
    if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][i] then
      CurrentNumValidStandardGrenadeTypes = CurrentNumValidStandardGrenadeTypes + 1
    end
  end
end

function GetRandomValidStandardWeaponTypeForWave(waveIndex)
  if CurrentNumValidStandardWeaponTypes <= 0 then
    Debug.PrintError("Error in standard weapon wave " .. waveIndex .. ". Need at least 2 valid standard weapon types for each wave")
    return -1
  elseif CurrentNumValidStandardWeaponTypes == 1 then
    Debug.PrintError("Error in standard weapon wave " .. waveIndex .. ". Need at least 2 valid standard weapon types for each wave")
    for i = 1, #StandardWeaponPickupsAllowedForWave[waveIndex] do
      if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][i] then
        return i
      end
    end
  elseif 2 <= CurrentNumValidStandardWeaponTypes then
    local weaponSpawnerIndex = Utilities.GetRandomInteger(1, kNumStandardWeapons)
    if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][weaponSpawnerIndex] then
      return weaponSpawnerIndex
    else
      local newWeaponSpawnerIndex = weaponSpawnerIndex + 1
      while newWeaponSpawnerIndex ~= weaponSpawnerIndex do
        if newWeaponSpawnerIndex > kNumStandardWeapons then
          newWeaponSpawnerIndex = 1
        end
        if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][newWeaponSpawnerIndex] then
          return newWeaponSpawnerIndex
        end
        newWeaponSpawnerIndex = newWeaponSpawnerIndex + 1
      end
    end
  end
end

function GetNextValidStandardWeaponTypeForWave(currentWeaponSpawnerIndex, waveIndex)
  if CurrentNumValidStandardWeaponTypes <= 1 then
    local errorMessage = "Error in standard weapon wave " .. waveIndex .. ". Need at least 2 valid standard weapon types for each wave"
    Debug.PrintError(errorMessage)
    return currentWeaponSpawnerIndex
  elseif CurrentNumValidStandardWeaponTypes == 2 then
    local newWeaponSpawnerIndex = currentWeaponSpawnerIndex + 1
    while newWeaponSpawnerIndex ~= currentWeaponSpawnerIndex do
      if newWeaponSpawnerIndex > kNumStandardWeapons then
        newWeaponSpawnerIndex = 1
      end
      if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][newWeaponSpawnerIndex] then
        return newWeaponSpawnerIndex
      end
      newWeaponSpawnerIndex = newWeaponSpawnerIndex + 1
    end
  elseif 2 < CurrentNumValidStandardWeaponTypes then
    local newWeaponSpawnerIndex = currentWeaponSpawnerIndex + 1
    while newWeaponSpawnerIndex ~= currentWeaponSpawnerIndex do
      if newWeaponSpawnerIndex > kNumStandardWeapons then
        newWeaponSpawnerIndex = 1
      end
      if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][newWeaponSpawnerIndex] and CurrentStandardWeaponSpawner1 ~= newWeaponSpawnerIndex and CurrentStandardWeaponSpawner2 ~= newWeaponSpawnerIndex then
        return newWeaponSpawnerIndex
      end
      newWeaponSpawnerIndex = newWeaponSpawnerIndex + 1
    end
  end
end

function ActivateRandomStandardWeaponSpawner()
  if 0 < CurrentNumValidStandardWeaponTypes then
    if CurrentStandardWeaponSpawner1 == -1 then
      CurrentStandardWeaponSpawner1 = GetRandomValidStandardWeaponTypeForWave(CurrentWaveNum)
      CurrentStandardWeaponSpawner2 = GetNextValidStandardWeaponTypeForWave(CurrentStandardWeaponSpawner1, CurrentWaveNum)
    else
      CurrentStandardWeaponSpawner1 = GetNextValidStandardWeaponTypeForWave(CurrentStandardWeaponSpawner1, CurrentWaveNum)
      CurrentStandardWeaponSpawner2 = GetNextValidStandardWeaponTypeForWave(CurrentStandardWeaponSpawner2, CurrentWaveNum)
    end
    local numWeaponsToEnable = StandardWeaponPickupsAllowedForWave[CurrentWaveNum][CurrentStandardWeaponSpawner1]
    if CurrentStandardWeaponSpawner1 == kSMGIndex then
      Extern.SMGsCollected = Extern.SMGsCollected + numWeaponsToEnable
    elseif CurrentStandardWeaponSpawner1 == kARIndex then
      Extern.ARsCollected = Extern.ARsCollected + numWeaponsToEnable
    elseif CurrentStandardWeaponSpawner1 == kShotgunIndex then
      Extern.ShotgunsCollected = Extern.ShotgunsCollected + numWeaponsToEnable
    elseif CurrentStandardWeaponSpawner1 == kUziIndex then
      Extern.UzisCollected = Extern.UzisCollected + numWeaponsToEnable
    end
    NumStandardWeaponsAvailable[CurrentStandardWeaponSpawner1] = NumStandardWeaponsAvailable[CurrentStandardWeaponSpawner1] + numWeaponsToEnable
    Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons + numWeaponsToEnable
    EnableStandardWeaponSpawner(CurrentStandardWeaponSpawner1)
    numWeaponsToEnable = StandardWeaponPickupsAllowedForWave[CurrentWaveNum][CurrentStandardWeaponSpawner2]
    if CurrentStandardWeaponSpawner2 == kSMGIndex then
      Extern.SMGsCollected = Extern.SMGsCollected + numWeaponsToEnable
    elseif CurrentStandardWeaponSpawner2 == kARIndex then
      Extern.ARsCollected = Extern.ARsCollected + numWeaponsToEnable
    elseif CurrentStandardWeaponSpawner2 == kShotgunIndex then
      Extern.ShotgunsCollected = Extern.ShotgunsCollected + numWeaponsToEnable
    elseif CurrentStandardWeaponSpawner2 == kUziIndex then
      Extern.UzisCollected = Extern.UzisCollected + numWeaponsToEnable
    end
    NumStandardWeaponsAvailable[CurrentStandardWeaponSpawner2] = NumStandardWeaponsAvailable[CurrentStandardWeaponSpawner2] + numWeaponsToEnable
    Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons + numWeaponsToEnable
    EnableStandardWeaponSpawner(CurrentStandardWeaponSpawner2)
    CheckForAmmoAndResetVO()
    PrintGunsCollectedMessage()
  end
end

function GetRandomValidStandardGrenadeTypeForWave(waveIndex)
  local GrenadeStartingIndex = kNumStandardWeapons + 1
  local GrenadeEndingIndex = kNumStandardWeapons + kNumStandardGrenadeTypes
  if CurrentNumValidStandardGrenadeTypes <= 0 then
    return -1
  elseif CurrentNumValidStandardGrenadeTypes == 1 then
    for i = GrenadeStartingIndex, GrenadeEndingIndex do
      if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][i] then
        return i
      end
    end
  elseif 2 <= CurrentNumValidStandardGrenadeTypes then
    local grenadeSpawnerIndex = Utilities.GetRandomInteger(GrenadeStartingIndex, GrenadeEndingIndex)
    if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][grenadeSpawnerIndex] then
      return grenadeSpawnerIndex
    else
      local newGrenadeSpawnerIndex = grenadeSpawnerIndex + 1
      while newGrenadeSpawnerIndex ~= grenadeSpawnerIndex do
        if newGrenadeSpawnerIndex > kNumSpecialWeapons then
          newGrenadeSpawnerIndex = 1
        end
        if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][newGrenadeSpawnerIndex] then
          return newGrenadeSpawnerIndex
        end
        newGrenadeSpawnerIndex = newGrenadeSpawnerIndex + 1
      end
    end
  end
  return -1
end

function GetNextValidStandardGrenadeTypeForWave(currentGrenadeSpawnerIndex, waveIndex)
  local GrenadeStartingIndex = kNumStandardWeapons + 1
  local GrenadeEndingIndex = kNumStandardWeapons + kNumStandardGrenadeTypes
  if CurrentNumValidStandardGrenadeTypes <= 1 then
    return currentGrenadeSpawnerIndex
  elseif 2 <= CurrentNumValidStandardGrenadeTypes then
    local newGrenadeSpawnerIndex = currentGrenadeSpawnerIndex + 1
    while newGrenadeSpawnerIndex ~= currentGrenadeSpawnerIndex do
      if GrenadeEndingIndex < newGrenadeSpawnerIndex then
        newGrenadeSpawnerIndex = GrenadeStartingIndex
      end
      if 0 < StandardWeaponPickupsAllowedForWave[waveIndex][newGrenadeSpawnerIndex] then
        return newGrenadeSpawnerIndex
      end
      newGrenadeSpawnerIndex = newGrenadeSpawnerIndex + 1
    end
  end
  return -1
end

function ActivateRandomStandardGrenadeSpawner()
  if 0 < CurrentNumValidStandardGrenadeTypes then
    if CurrentStandardGrenadeSpawner == -1 then
      CurrentStandardGrenadeSpawner = GetRandomValidStandardGrenadeTypeForWave(CurrentWaveNum)
    else
      CurrentStandardGrenadeSpawner = GetNextValidStandardGrenadeTypeForWave(CurrentStandardGrenadeSpawner, CurrentWaveNum)
    end
    local numWeaponsToEnable = StandardWeaponPickupsAllowedForWave[CurrentWaveNum][CurrentStandardGrenadeSpawner]
    NumStandardWeaponsAvailable[CurrentStandardGrenadeSpawner] = NumStandardWeaponsAvailable[CurrentStandardGrenadeSpawner] + numWeaponsToEnable
    EnableStandardWeaponSpawner(CurrentStandardGrenadeSpawner)
    if CurrentStandardGrenadeSpawner == kFragIndex then
      Extern.FragGrenadesCollected = Extern.FragGrenadesCollected + numWeaponsToEnable
    elseif CurrentStandardGrenadeSpawner == kSmokeIndex then
      Extern.SmokeGrenadesCollected = Extern.SmokeGrenadesCollected + numWeaponsToEnable
    elseif CurrentStandardGrenadeSpawner == kFlashIndex then
      Extern.FlashGrenadesCollected = Extern.FlashGrenadesCollected + numWeaponsToEnable
    end
    PrintGunsCollectedMessage()
  end
end

function UpdateNumValidSpecialWeaponTypesForWave(waveIndex)
  CurrentNumValidSpecialWeaponTypes = 0
  for i = 1, #SpecialWeaponPickupsAllowedForWave[waveIndex] do
    if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][i] then
      CurrentNumValidSpecialWeaponTypes = CurrentNumValidSpecialWeaponTypes + 1
    end
  end
  CurrentNumValidSpecialGrenadeTypes = 0
  for i = kNumSpecialWeapons + 1, kNumSpecialWeapons + kNumSpecialGrenadeTypes do
    if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][i] then
      CurrentNumValidSpecialGrenadeTypes = CurrentNumValidSpecialGrenadeTypes + 1
    end
  end
end

function GetRandomValidSpecialWeaponTypeForWave(waveIndex)
  if CurrentNumValidSpecialWeaponTypes <= 0 then
    return -1
  elseif CurrentNumValidSpecialWeaponTypes == 1 then
    for i = 1, #SpecialWeaponPickupsAllowedForWave[waveIndex] do
      if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][i] then
        return i
      end
    end
  elseif 2 <= CurrentNumValidSpecialWeaponTypes then
    local weaponSpawnerIndex = Utilities.GetRandomInteger(1, kNumSpecialWeapons)
    if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][weaponSpawnerIndex] then
      return weaponSpawnerIndex
    else
      local newWeaponSpawnerIndex = weaponSpawnerIndex + 1
      while newWeaponSpawnerIndex ~= weaponSpawnerIndex do
        if newWeaponSpawnerIndex > kNumSpecialWeapons then
          newWeaponSpawnerIndex = 1
        end
        if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][newWeaponSpawnerIndex] then
          return newWeaponSpawnerIndex
        end
        newWeaponSpawnerIndex = newWeaponSpawnerIndex + 1
      end
    end
  end
  return -1
end

function GetNextValidSpecialWeaponTypeForWave(currentWeaponSpawnerIndex, waveIndex)
  if CurrentNumValidSpecialWeaponTypes <= 1 then
    return currentWeaponSpawnerIndex
  elseif 2 <= CurrentNumValidSpecialWeaponTypes then
    local newWeaponSpawnerIndex = currentWeaponSpawnerIndex + 1
    while newWeaponSpawnerIndex ~= currentWeaponSpawnerIndex do
      if newWeaponSpawnerIndex > kNumSpecialWeapons then
        newWeaponSpawnerIndex = 1
      end
      if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][newWeaponSpawnerIndex] then
        return newWeaponSpawnerIndex
      end
      newWeaponSpawnerIndex = newWeaponSpawnerIndex + 1
    end
  end
  return -1
end

function ActivateRandomSpecialWeaponSpawner()
  if 0 < CurrentNumValidSpecialWeaponTypes then
    if CurrentSpecialWeaponSpawner == -1 then
      CurrentSpecialWeaponSpawner = GetRandomValidSpecialWeaponTypeForWave(CurrentWaveNum)
    else
      CurrentSpecialWeaponSpawner = GetNextValidSpecialWeaponTypeForWave(CurrentSpecialWeaponSpawner, CurrentWaveNum)
    end
    local numWeaponsToEnable = SpecialWeaponPickupsAllowedForWave[CurrentWaveNum][CurrentSpecialWeaponSpawner]
    if CurrentSpecialWeaponSpawner == kPenetratorIndex then
      Extern.PenetratorsCollected = Extern.PenetratorsCollected + numWeaponsToEnable
    elseif CurrentSpecialWeaponSpawner == kSniperIndex then
      Extern.SnipersCollected = Extern.SnipersCollected + numWeaponsToEnable
    elseif CurrentSpecialWeaponSpawner == kRLIndex then
      Extern.RLsCollected = Extern.RLsCollected + numWeaponsToEnable
    elseif CurrentSpecialWeaponSpawner == kRiotShieldIndex then
      Extern.RiotShieldsCollected = Extern.RiotShieldsCollected + numWeaponsToEnable
    elseif CurrentSpecialWeaponSpawner == kPhaseBeamIndex then
      Extern.PhaseBeamsCollected = Extern.PhaseBeamsCollected + numWeaponsToEnable
    end
    NumSpecialWeaponsAvailable[CurrentSpecialWeaponSpawner] = NumSpecialWeaponsAvailable[CurrentSpecialWeaponSpawner] + numWeaponsToEnable
    Extern.TotalNumberOfWeapons = Extern.TotalNumberOfWeapons + numWeaponsToEnable
    EnableSpecialWeaponSpawner(CurrentSpecialWeaponSpawner)
    CheckForAmmoAndResetVO()
    PrintGunsCollectedMessage()
  else
    ActivateRandomStandardWeaponSpawner()
  end
end

function GetRandomValidSpecialGrenadeTypeForWave(waveIndex)
  local GrenadeStartingIndex = kNumSpecialWeapons + 1
  local GrenadeEndingIndex = kNumSpecialWeapons + kNumSpecialGrenadeTypes
  if CurrentNumValidSpecialGrenadeTypes <= 0 then
    return -1
  elseif CurrentNumValidSpecialGrenadeTypes == 1 then
    for i = GrenadeStartingIndex, GrenadeEndingIndex do
      if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][i] then
        return i
      end
    end
  elseif 2 <= CurrentNumValidSpecialGrenadeTypes then
    local grenadeSpawnerIndex = Utilities.GetRandomInteger(GrenadeStartingIndex, GrenadeEndingIndex)
    if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][grenadeSpawnerIndex] then
      return grenadeSpawnerIndex
    else
      local newGrenadeSpawnerIndex = grenadeSpawnerIndex + 1
      while newGrenadeSpawnerIndex ~= grenadeSpawnerIndex do
        if newGrenadeSpawnerIndex > kNumSpecialWeapons then
          newGrenadeSpawnerIndex = 1
        end
        if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][newGrenadeSpawnerIndex] then
          return newGrenadeSpawnerIndex
        end
        newGrenadeSpawnerIndex = newGrenadeSpawnerIndex + 1
      end
    end
  end
  return -1
end

function GetNextValidSpecialGrenadeTypeForWave(currentGrenadeSpawnerIndex, waveIndex)
  local GrenadeStartingIndex = kNumSpecialWeapons + 1
  local GrenadeEndingIndex = kNumSpecialWeapons + kNumSpecialGrenadeTypes
  if CurrentNumValidSpecialGrenadeTypes <= 1 then
    return currentGrenadeSpawnerIndex
  elseif 2 <= CurrentNumValidSpecialGrenadeTypes then
    local newGrenadeSpawnerIndex = currentGrenadeSpawnerIndex + 1
    while newGrenadeSpawnerIndex ~= currentGrenadeSpawnerIndex do
      if GrenadeEndingIndex < newGrenadeSpawnerIndex then
        newGrenadeSpawnerIndex = GrenadeStartingIndex
      end
      if 0 < SpecialWeaponPickupsAllowedForWave[waveIndex][newGrenadeSpawnerIndex] then
        return newGrenadeSpawnerIndex
      end
      newGrenadeSpawnerIndex = newGrenadeSpawnerIndex + 1
    end
  end
end

function ActivateRandomSpecialGrenadeSpawner()
  if 0 < CurrentNumValidSpecialGrenadeTypes then
    if CurrentSpecialGrenadeSpawner == -1 then
      CurrentSpecialGrenadeSpawner = GetRandomValidSpecialGrenadeTypeForWave(CurrentWaveNum)
    else
      CurrentSpecialGrenadeSpawner = GetNextValidSpecialGrenadeTypeForWave(CurrentSpecialGrenadeSpawner, CurrentWaveNum)
    end
    local numWeaponsToEnable = SpecialWeaponPickupsAllowedForWave[CurrentWaveNum][CurrentSpecialGrenadeSpawner]
    NumSpecialWeaponsAvailable[CurrentSpecialGrenadeSpawner] = NumSpecialWeaponsAvailable[CurrentSpecialGrenadeSpawner] + numWeaponsToEnable
    EnableSpecialWeaponSpawner(CurrentSpecialGrenadeSpawner)
    if CurrentSpecialGrenadeSpawner == kZapIndex then
      Extern.ZapGrenadesCollected = Extern.ZapGrenadesCollected + numWeaponsToEnable
    elseif CurrentSpecialGrenadeSpawner == kProximityMineIndex then
      Extern.ProximityMinesCollected = Extern.ProximityMinesCollected + numWeaponsToEnable
    end
    PrintGunsCollectedMessage()
  else
    ActivateRandomStandardGrenadeSpawner()
  end
end

function RemoveCrateFromInventory(playerObject)
  augInv = Game.GetInventoryItemsByTypeAndName(playerObject, 3, "Medkit Inventory")
  local playerIndex = Player.GetPlayerIndexByObject(playerObject)
  for k, obj in pairs(augInv) do
    if ObjectTags.DoesObjectHaveTag(obj, "MPSpecialWeaponsCrate") then
      ActivateRandomSpecialWeaponSpawner()
      ActivateRandomSpecialGrenadeSpawner()
    else
      ActivateRandomStandardWeaponSpawner()
      ActivateRandomStandardGrenadeSpawner()
    end
    Game.SendMissionEventMessage(obj, WeaponCrateRetrievedMsgId)
    Game.SendTextMessage(myObject, "Crate Returned " .. playerIndex)
    Game.SendTextMessage(playerObject, "WeaponCrateRemoved")
  end
end

function PlayerEntersRegion(PlayerInfo)
  if PlayerInfo.object ~= nil then
    RemoveCrateFromInventory(PlayerInfo.object)
    local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object)
    if playerIndex == 0 then
      Extern.Player1InRetrieveRegion = 1
    elseif playerIndex == 1 then
      Extern.Player2InRetrieveRegion = 1
    elseif playerIndex == 2 then
      Extern.Player3InRetrieveRegion = 1
    elseif playerIndex == 3 then
      Extern.Player4InRetrieveRegion = 1
    end
  end
end

function PlayerLeavesRegion(PlayerInfo)
  if PlayerInfo.object ~= nil then
    local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object)
    if playerIndex == 0 then
      Extern.Player1InRetrieveRegion = 0
    elseif playerIndex == 1 then
      Extern.Player2InRetrieveRegion = 0
    elseif playerIndex == 2 then
      Extern.Player3InRetrieveRegion = 0
    elseif playerIndex == 3 then
      Extern.Player4InRetrieveRegion = 0
    end
  end
end

function ProcessMissionEventMessage(missionEventMessage)
  if missionEventMessage.textID == BeginRestPeriodMsgId then
    CurrentStandardWeaponSpawner1 = -1
    CurrentStandardWeaponSpawner2 = -1
    CurrentStandardGrenadeSpawner = -1
    CurrentSpecialWeaponSpawner = -1
    CurrentSpecialGrenadeSpawner = -1
    CurrentWaveNum = CurrentWaveNum + 1
    if CurrentWaveNum > kMaxNumWaves then
      CurrentWaveNum = 1
    end
    UpdateNumValidStandardWeaponTypesForWave(CurrentWaveNum)
    UpdateNumValidSpecialWeaponTypesForWave(CurrentWaveNum)
  end
end

function PrintGunsCollectedMessage()
  if SMGsCollected ~= Extern.SMGsCollected then
    local difference = Extern.SMGsCollected - SMGsCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, SMGName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    SMGsCollected = Extern.SMGsCollected
  end
  if ARsCollected ~= Extern.ARsCollected then
    local difference = Extern.ARsCollected - ARsCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, ARName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    ARsCollected = Extern.ARsCollected
  end
  if ShotgunsCollected ~= Extern.ShotgunsCollected then
    local difference = Extern.ShotgunsCollected - ShotgunsCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, ShotgunName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    ShotgunsCollected = Extern.ShotgunsCollected
  end
  if UzisCollected ~= Extern.UzisCollected then
    local difference = Extern.UzisCollected - UzisCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, UziName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    UzisCollected = Extern.UzisCollected
  end
  if FragGrenadesCollected ~= Extern.FragGrenadesCollected then
    local difference = Extern.FragGrenadesCollected - FragGrenadesCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, FragGrenadeName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    FragGrenadesCollected = Extern.FragGrenadesCollected
  end
  if SmokeGrenadesCollected ~= Extern.SmokeGrenadesCollected then
    local difference = Extern.SmokeGrenadesCollected - SmokeGrenadesCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStringValueToAnnouncementPacket(announcementID, "Smoke Grenade")
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    SmokeGrenadesCollected = Extern.SmokeGrenadesCollected
  end
  if FlashGrenadesCollected ~= Extern.FlashGrenadesCollected then
    local difference = Extern.FlashGrenadesCollected - FlashGrenadesCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, FlashGrenadeName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    FlashGrenadesCollected = Extern.FlashGrenadesCollected
  end
  if PenetratorsCollected ~= Extern.PenetratorsCollected then
    local difference = Extern.PenetratorsCollected - PenetratorsCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, PenetratorName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    PenetratorsCollected = Extern.PenetratorsCollected
  end
  if SnipersCollected ~= Extern.SnipersCollected then
    local difference = Extern.SnipersCollected - SnipersCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, SniperRifleName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    SnipersCollected = Extern.SnipersCollected
  end
  if RLsCollected ~= Extern.RLsCollected then
    local difference = Extern.RLsCollected - RLsCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, RLName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    RLsCollected = Extern.RLsCollected
  end
  if RiotShieldsCollected ~= Extern.RiotShieldsCollected then
    local difference = Extern.RiotShieldsCollected - RiotShieldsCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, RiotShieldName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    RiotShieldsCollected = Extern.RiotShieldsCollected
  end
  if PhaseBeamsCollected ~= Extern.PhaseBeamsCollected then
    local difference = Extern.PhaseBeamsCollected - PhaseBeamsCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, PhaseBeamName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    PhaseBeamsCollected = Extern.PhaseBeamsCollected
  end
  if ZapGrenadesCollected ~= Extern.ZapGrenadesCollected then
    local difference = Extern.ZapGrenadesCollected - ZapGrenadesCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStaticTextValueToAnnouncementPacket(announcementID, ZapGrenadeName)
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    ZapGrenadesCollected = Extern.ZapGrenadesCollected
  end
  if ProximityMinesCollected ~= Extern.ProximityMinesCollected then
    local difference = Extern.ProximityMinesCollected - ProximityMinesCollected
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapons added to Rack")
    FEAR.AddNumberValueToAnnouncementPacket(announcementID, difference)
    FEAR.AddStringValueToAnnouncementPacket(announcementID, "Proximity Mine")
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    ProximityMinesCollected = Extern.ProximityMinesCollected
  end
end

function HandleClients()
  PrintGunsCollectedMessage()
  local playerObject
  if localPlayer1InRetrieveRegion ~= Extern.Player1InRetrieveRegion then
    localPlayer1InRetrieveRegion = Extern.Player1InRetrieveRegion
    if localPlayer1InRetrieveRegion == 1 then
      playerObject = Player.GetPlayerAvatarObjectByIndex(0)
      if playerObject ~= nil then
        RemoveCrateFromInventory(playerObject)
      end
    end
  end
  if localPlayer2InRetrieveRegion ~= Extern.Player2InRetrieveRegion then
    localPlayer2InRetrieveRegion = Extern.Player2InRetrieveRegion
    if localPlayer2InRetrieveRegion == 1 then
      playerObject = Player.GetPlayerAvatarObjectByIndex(1)
      if playerObject ~= nil then
        RemoveCrateFromInventory(playerObject)
      end
    end
  end
  if localPlayer3InRetrieveRegion ~= Extern.Player3InRetrieveRegion then
    localPlayer3InRetrieveRegion = Extern.Player3InRetrieveRegion
    if localPlayer3InRetrieveRegion == 1 then
      playerObject = Player.GetPlayerAvatarObjectByIndex(2)
      if playerObject ~= nil then
        RemoveCrateFromInventory(playerObject)
      end
    end
  end
  if localPlayer4InRetrieveRegion ~= Extern.Player4InRetrieveRegion then
    localPlayer4InRetrieveRegion = Extern.Player4InRetrieveRegion
    if localPlayer4InRetrieveRegion == 1 then
      playerObject = Player.GetPlayerAvatarObjectByIndex(3)
      if playerObject ~= nil then
        RemoveCrateFromInventory(playerObject)
      end
    end
  end
  if Extern.TotalNumberOfWeapons < LowWeaponAmount then
    if not LowAmmoVOSent then
      SendLowAmmoVO()
    end
  else
    LowAmmoVOSent = false
  end
end

if MP.IsClient() then
  LowAmmoVOSent = true
  Callbacks.RegisterForScriptValueUpdated("HandleClients")
else
  RegisterForWeaponRackSpawnerMessage()
  UpdateNumValidStandardWeaponTypesForWave(CurrentWaveNum)
  UpdateNumValidSpecialWeaponTypesForWave(CurrentWaveNum)
  Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, myObject, "ProcessMissionEventMessage")
  local regionObjs = Sets.GetObjectsInSet(regionSet)
  if regionObjs ~= nil then
    for k, region in pairs(regionObjs) do
      Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersRegion", "PlayerLeavesRegion")
    end
  end
  InitializeWeaponRackSpawners()
end
