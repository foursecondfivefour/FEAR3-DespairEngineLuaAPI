local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local Utilities = GameScript.Utilities
local SafeZoneObjPtr = Support.ImportSingleObject("Safe Zone", "Zone that allows Fettel to escape being tethered")
local WarningZone1ObjPtr = Support.ImportSingleObject("Warning Zone 1", "Zone that causes Fettel to see low warning FX")
local WarningZone2ObjPtr = Support.ImportSingleObject("Warning Zone 2", "Zone that causes Fettel to see medium warning FX")
local WarningZone3ObjPtr = Support.ImportSingleObject("Warning Zone 3", "Zone that causes Fettel to see high warning FX")
local TetherZoneObjPtr = Support.ImportSingleObject("Tether Zone", "Zone that causes Fettel to be tethered (with timeout FX)")
local ClearBreadcrumbs = Support.ImportBoolVariableWithDefault("Clear Breadcrumbs", "Turn this on if the tether region is placed such that PM's tether breadcrumbs should no be used", false)
local DisableRegions = Support.ImportFloatVariableWithDefault("Number of Disable Regions", "Number of region levels that will disable this tether block, starting at the Tether and working back to Safe.  Max is 5, min is 1", 5)
local SpawnTagSet = Support.ImportSetObject("Spawn Tag Set", "Object containing a set of spawn tag objects")
local LocalTimeoutPeriod = 0.01
local Warning1Pct = 0.3
local Warning2Pct = 0.6
local Warning3Pct = 0.8
local anchorPlayerID = GameScript.PlayerIndex.kGlobalPlayer1
local tetherPlayerID = GameScript.PlayerIndex.kGlobalPlayer2
local anchorPlayerInSafe = false
local anchorPlayerInWarning1 = false
local anchorPlayerInWarning2 = false
local anchorPlayerInWarning3 = false
local anchorPlayerInTether = false
local tetherPlayerInSafe = false
local tetherPlayerInWarning1 = false
local tetherPlayerInWarning2 = false
local tetherPlayerInWarning3 = false
local tetherPlayerInTether = false
local currentTetherZone = GameScript.TetherZone.kZoneSafe
local timeoutLock = false
local tetherSpawnTagOverride = false

function Initialize()
  Callbacks.RegisterPlayerEnterExitRegion(SafeZoneObjPtr, "PlayerEnteredSafeZone", "PlayerExitedSafeZone")
  Callbacks.RegisterPlayerEnterExitRegion(WarningZone1ObjPtr, "PlayerEnteredWarning1Zone", "PlayerExitedWarning1Zone")
  Callbacks.RegisterPlayerEnterExitRegion(WarningZone2ObjPtr, "PlayerEnteredWarning2Zone", "PlayerExitedWarning2Zone")
  Callbacks.RegisterPlayerEnterExitRegion(WarningZone3ObjPtr, "PlayerEnteredWarning3Zone", "PlayerExitedWarning3Zone")
  Callbacks.RegisterPlayerEnterExitRegion(TetherZoneObjPtr, "PlayerEnteredTetherZone", "PlayerExitedTetherZone")
  if 5 < DisableRegions then
    DisableRegions = 5
  elseif DisableRegions < 1 then
    DisableRegions = 1
  end
end

function GetPlayerIndicies()
  anchorPlayerID, tetherPlayerID = Utilities.GetPointManFettelIndices()
end

function DisableScript()
  if Player.IsLocalPlayer(tetherPlayerID) then
    Player.SetLocalTetherZone(tetherPlayerID, GameScript.TetherZone.kZoneSafe)
  end
  if tetherSpawnTagOverride then
    Player.DisableTetherSpawnTagSet(SpawnTagSet)
  end
  Support.ExitScript()
end

function TimeoutLockDone()
  timeoutLock = false
end

function CheckTetherZone()
  local anchorPlayerWarningZonePct = 0
  local tetherPlayerWarningZonePct = 0
  local anchorPlayerRegion = 0
  local tetherPlayerRegion = 0
  local anchorPlayerZone = GameScript.TetherZone.kZoneSafe
  if anchorPlayerID ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    if anchorPlayerInTether then
      anchorPlayerZone = GameScript.TetherZone.kZoneTimeout
      anchorPlayerWarningZonePct = 1
      anchorPlayerRegion = 5
      if ClearBreadcrumbs then
        Player.ClearTetherBreadcrumbs(anchorPlayerID)
      end
    elseif anchorPlayerInWarning3 then
      anchorPlayerZone = GameScript.TetherZone.kZoneWarning
      anchorPlayerWarningZonePct = Warning3Pct
      anchorPlayerRegion = 4
    elseif anchorPlayerInWarning2 then
      anchorPlayerZone = GameScript.TetherZone.kZoneWarning
      anchorPlayerWarningZonePct = Warning2Pct
      anchorPlayerRegion = 3
    elseif anchorPlayerInWarning1 then
      anchorPlayerZone = GameScript.TetherZone.kZoneWarning
      anchorPlayerWarningZonePct = Warning1Pct
      anchorPlayerRegion = 2
    elseif anchorPlayerInSafe then
      anchorPlayerRegion = 1
    end
  end
  local tetherPlayerZone = GameScript.TetherZone.kZoneSafe
  if tetherPlayerID ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    if tetherPlayerInTether then
      tetherPlayerZone = GameScript.TetherZone.kZoneTimeout
      tetherPlayerWarningZonePct = 1
      tetherPlayerRegion = 5
    elseif tetherPlayerInWarning3 then
      tetherPlayerZone = GameScript.TetherZone.kZoneWarning
      tetherPlayerWarningZonePct = Warning3Pct
      tetherPlayerRegion = 4
    elseif tetherPlayerInWarning2 then
      tetherPlayerZone = GameScript.TetherZone.kZoneWarning
      tetherPlayerWarningZonePct = Warning2Pct
      tetherPlayerRegion = 3
    elseif tetherPlayerInWarning1 then
      tetherPlayerZone = GameScript.TetherZone.kZoneWarning
      tetherPlayerWarningZonePct = Warning1Pct
      tetherPlayerRegion = 2
    elseif tetherPlayerInSafe then
      tetherPlayerRegion = 1
    end
  end
  if (anchorPlayerID == GameScript.PlayerIndex.kNotAGlobalPlayer or anchorPlayerRegion > 5 - DisableRegions) and (tetherPlayerID == GameScript.PlayerIndex.kNotAGlobalPlayer or tetherPlayerRegion > 5 - DisableRegions) then
    DisableScript()
    return
  end
  if Player.IsLocalPlayer(tetherPlayerID) and not timeoutLock and anchorPlayerID ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    local newTetherZone = GameScript.TetherZone.kZoneSafe
    local newWarningPct = 0
    if anchorPlayerRegion > tetherPlayerRegion then
      newTetherZone = anchorPlayerZone
      newWarningPct = anchorPlayerWarningZonePct
    else
      newTetherZone = tetherPlayerZone
      newWarningPct = tetherPlayerWarningZonePct
    end
    if SpawnTagSet and Game.IsLoaded(SpawnTagSet) then
      if 0 < anchorPlayerRegion and not tetherSpawnTagOverride then
        Player.EnableTetherSpawnTagSet(SpawnTagSet)
        tetherSpawnTagOverride = true
      elseif anchorPlayerRegion == 0 and tetherSpawnTagOverride then
        Player.DisableTetherSpawnTagSet(SpawnTagSet)
        tetherSpawnTagOverride = false
      end
    end
    if newTetherZone ~= currentTetherZone then
      if newTetherZone == GameScript.TetherZone.kZoneTimeout then
        timeoutLock = true
        Player.SetLocalTetherTimeoutPeriod(tetherPlayerID, LocalTimeoutPeriod)
        Callbacks.RegisterForTimer("TimeoutLockDone", LocalTimeoutPeriod, false)
      end
      Player.SetLocalTetherZone(tetherPlayerID, newTetherZone)
      currentTetherZone = newTetherZone
    end
    Player.SetLocalTetherWarningPct(tetherPlayerID, newWarningPct)
  end
end

function PlayerEnteredSafeZone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInSafe = true
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInSafe = true
  end
  CheckTetherZone()
end

function PlayerExitedSafeZone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInSafe = false
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInSafe = false
  end
  CheckTetherZone()
end

function PlayerEnteredWarning1Zone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInWarning1 = true
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInWarning1 = true
  end
  CheckTetherZone()
end

function PlayerExitedWarning1Zone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInWarning1 = false
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInWarning1 = false
  end
  CheckTetherZone()
end

function PlayerEnteredWarning2Zone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInWarning2 = true
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInWarning2 = true
  end
  CheckTetherZone()
end

function PlayerExitedWarning2Zone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInWarning2 = false
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInWarning2 = false
  end
  CheckTetherZone()
end

function PlayerEnteredWarning3Zone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInWarning3 = true
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInWarning3 = true
  end
  CheckTetherZone()
end

function PlayerExitedWarning3Zone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInWarning3 = false
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInWarning3 = false
  end
  CheckTetherZone()
end

function PlayerEnteredTetherZone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInTether = true
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInTether = true
  end
  CheckTetherZone()
end

function PlayerExitedTetherZone(msgData)
  if msgData.object == nil then
    return
  end
  GetPlayerIndicies()
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    anchorPlayerInTether = false
  elseif playerIndex == tetherPlayerID then
    tetherPlayerInTether = false
  end
  CheckTetherZone()
end

Initialize()
