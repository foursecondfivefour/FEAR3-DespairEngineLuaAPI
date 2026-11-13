local mainGlobal = _G
local GameScript = Despair.GameScript
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local LuaHelpers = GameScript.LuaHelpers
local Player = Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Objectives = Game.Objectives
local Graphics = Game.Graphics
local Regions = Game.Regions
local Sets = Game.Sets
local Utilities = GameScript.Utilities
local MP = Game.MP
local Physics = Game.Physics
local AI = Game.AI
local FEAR = GameScript.FEAR
local Audio = GameScript.Audio
local Camera = Game.Camera
local Math3d = GameScript.LuaMath3d
local ObjectState = GameScript.ObjectState
local ObjectTags = Game.ObjectTags
module(...)
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
local next = mainGlobal.next
bEnabled = true
myObject = nil
Super = nil
local staggerSpawns = true
local spawnInterval = 2
local maxSpawnsPerInterval = 1
local numAIsToSpawn = 0
local bStaggeredSpawnsRegistered = false
local bRampUpTimerRegistered = false
local bEnterRampUpTimerRegistered = false
kRampUp, kSustain, kRampDown, kRest = 0, 1, 2, 3
kRampUpGraceTime = 5
stateStartTime = 0
currentState = kRest
currentWave = 0
local heavyFogAudio = {
  curAlpha = 0,
  targetAlpha = 0,
  updating = false,
  kBusName = "World",
  kEffectName = "WorldReverb"
}
local fogEffectSettings = {updating = false}
local lowDryLevelQuarryAudioParams = {
  dryLevel = -3000,
  room = -1000,
  roomHF = -1000,
  roomRolloff = 0,
  decayTime = 1.49,
  decayHFRatio = 0.83,
  reflections = -10000,
  reflectDelay = 0.061,
  reverb = 500,
  reverbDelay = 0.025,
  diffusion = 100,
  density = 100,
  hrReference = 5000
}
heavyFogAudio.targetValues = lowDryLevelQuarryAudioParams
local heavyFogCameraFilterRegionsRegistered = false
local playersInFogVolumeRefCount = {}
local fogVolumeActivationTime = 0
local playersEligibleForHeavyFogAchievement = {}
local spawnHarvesters = false
kMinDistThreshold, kMaxDistThreshold = 5, 30
numAIs = 0
kAITypes_NumDifficulties, kAITypes_NumVarieties = 5, 5
numAIsKilledThisWave = 0
spawnedEnemyInfo = {}
aiSquads = {}
aiOrders = {}
allSpawnPoints = {}
customSpawnpoints = {}
local deferredSpawnTime = 0.09
local spawnPointCacheUpdate = 0.25
local spawnPointCache
local spawnPointTimeStamp = 0
local numPlayers = Player.GetNumPlayers()
local maxPlayer = numPlayers - 1
harvesterSpawnPoints = nil
debugDrawDirectorInfoOnly = false
debugArrows = {}
debugCycleThroughWaves = false
debugVeryShortWaves = false
debugDisableHarvesters = false
debugFakeMaxPlayers = false
waveInfo = nil
masterRegionSet = nil
aiSquad = nil
newWaveMsgId, beginRestPeriodMsgId = nil, nil

function GetFirstLocalPlayer()
  local localPlayerIndex = GameScript.PlayerIndex.kNotAGlobalPlayer
  local numPlayers = Player.GetNumPlayers()
  for index = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) and Player.IsLocalPlayer(index) then
      localPlayerIndex = index
    end
  end
  return localPlayerIndex
end

function GetFirstValidSpawnedEnemy()
  local numEnemies = #spawnedEnemyInfo
  for i = 1, numEnemies do
    if IsEnemyLoadedAndLiving(spawnedEnemyInfo[i].object) then
      return spawnedEnemyInfo[i].object
    end
  end
end

function MakeChild(ownerObject)
  if _M.Super == nil then
    _M.Super = {}
    for key, value in pairs(_M) do
      if type(value) == "function" then
        _M.Super[key] = value
      end
    end
  end
  local child = {}
  mainGlobal.setmetatable(child, {__index = _M, __newindex = _M})
  child.myObject = ownerObject
  return child
end

function NewWave(waveNum)
  local newWave = {
    restTime = 5,
    rampUpTime = 3,
    sustainTime = 20,
    maxEnemies1P = 6,
    enemyInfo = {}
  }
  
  function newWave.AddEnemy(wave, enemyTypeString, spawnWeight, optionalSpawnpoints)
    table.insert(wave.enemyInfo, {
      type = enemyTypeString,
      weight = spawnWeight,
      spawnpoints = optionalSpawnpoints
    })
  end
  
  if debugCycleThroughWaves or debugVeryShortWaves then
    function newWave.RestTime(wave, time)
      wave.restTime = 15
    end
    
    function newWave.RampUpTime(wave, time)
      wave.rampUpTime = 5
    end
    
    function newWave.SustainTime(wave, time)
      wave.sustainTime = 2
      wave.sustainEnemyCount = nil
    end
    
    function newWave.SustainEnemyCount(wave, enemies)
      wave.sustainTime = 2
      wave.sustainEnemyCount = nil
    end
    
    function newWave.MaxEnemies1P(wave, num)
      wave.maxEnemies1P = 1
    end
    
    function newWave.MaxEnemies2P(wave, num)
      wave.maxEnemies2P = 1
    end
    
    function newWave.MaxEnemies3P(wave, num)
      wave.maxEnemies3P = 1
    end
    
    function newWave.MaxEnemies4P(wave, num)
      wave.maxEnemies4P = 1
    end
  else
    function newWave.RestTime(wave, time)
      wave.restTime = time
    end
    
    function newWave.RampUpTime(wave, time)
      wave.rampUpTime = time
    end
    
    function newWave.SustainTime(wave, time)
      wave.sustainTime = time
      wave.sustainEnemyCount = nil
    end
    
    function newWave.SustainEnemyCount(wave, enemies)
      wave.sustainEnemyCount = enemies
      wave.sustainTime = nil
    end
    
    function newWave.MaxEnemies1P(wave, num)
      wave.maxEnemies1P = num
    end
    
    function newWave.MaxEnemies2P(wave, num)
      wave.maxEnemies2P = num
    end
    
    function newWave.MaxEnemies3P(wave, num)
      wave.maxEnemies3P = num
    end
    
    function newWave.MaxEnemies4P(wave, num)
      wave.maxEnemies4P = num
    end
  end
  
  function newWave.GetMaxEnemies(wave)
    if not debugFakeMaxPlayers then
      local numActivePlayers = MP.GetNumberOfActivePlayers()
      if numActivePlayers == 2 and wave.maxEnemies2P ~= nil then
        return wave.maxEnemies2P
      elseif numActivePlayers == 3 and wave.maxEnemies3P ~= nil then
        return wave.maxEnemies3P
      elseif numActivePlayers == 4 and wave.maxEnemies4P ~= nil then
        return wave.maxEnemies4P
      end
      return wave.maxEnemies1P
    else
      return wave.maxEnemies4P
    end
  end
  
  waveInfo = newWave
  return waveInfo
end

function ClearWaveTable()
  waveInfo = nil
end

function PopulateWaveTable(waveTable)
  Debug.PrintError("PopulateWaveTable() must be defined by any director derived from AIDirectorBase.")
end

function NormalizeWaveTableWeights()
  if waveInfo.enemyInfo == nil then
    Debug.PrintError("NormalizeWaveTableWeights() has failed due to waveInfo.enemyInfo being nil or otherwise empty")
    return
  end
  local totalWeight = 0
  for e, enemyInfo in ipairs(waveInfo.enemyInfo) do
    totalWeight = totalWeight + enemyInfo.weight
  end
  if totalWeight <= 0 then
    Debug.PrintError("NormalizeTableWeights() has failed due to totalWeight being <= 0.")
    return
  end
  for e, enemyInfo in ipairs(waveInfo.enemyInfo) do
    enemyInfo.weight = enemyInfo.weight / totalWeight
  end
end

function GetSpawnersFromMasterList()
  local masterRegionList = Sets.GetObjectsInSet(masterRegionSet)
  local masterSpawnerList = {}
  local masterSpawnerCount = 0
  for r, spawnRegion in pairs(masterRegionList) do
    local spawnerList = Sets.GetObjectsInSet(spawnRegion)
    for s, spawner in pairs(spawnerList) do
      if Game.IsLoaded(spawner) then
        local spawnInfo = {
          pos = Game.GetPosition(spawner),
          rot = Game.GetRotation(spawner),
          point = spawner
        }
        table.insert(masterSpawnerList, spawnInfo)
      end
    end
  end
  return masterSpawnerList
end

function UpdateAllSpawnPointList()
  allSpawnPoints = GetSpawnersFromMasterList()
end

function BroadcastMissionMessage(missionMessageTextID)
  local broadcastObjects = Support.GetImportObjectTable("Status Message Registry")
  if broadcastObjects ~= nil then
    for i, object in ipairs(broadcastObjects) do
      if object ~= nil and object ~= myObject then
        Game.SendMissionEventMessage(object, missionMessageTextID)
      end
    end
  end
end

function StartNewWave()
  numAIsSpawnedThisWave = 0
  numAIsKilledThisWave = 0
  if newWaveMsgId ~= nil then
    BroadcastMissionMessage(newWaveMsgId)
  end
  PlaySoundWaveAmbient()
end

function EnterRampUpState()
  bEnterRampUpTimerRegistered = false
  if #allSpawnPoints == 0 then
    Callbacks.RegisterForTimer("EnterRampUpState", 1, false)
    bEnterRampUpTimerRegistered = true
    return
  end
  stateStartTime = Support.GetGameTime()
  currentState = kRampUp
  StartNewWave()
  Callbacks.RegisterForTimer("DoRampUpState", kRampUpGraceTime, false)
  bRampUpTimerRegistered = true
end

function DoRampUpState()
  bRampUpTimerRegistered = false
  local enemiesLeftToSpawn = waveInfo:GetMaxEnemies() - numAIsSpawnedThisWave
  if enemiesLeftToSpawn <= 0 then
    EnterSustainState()
    local enemiesLeftToKill = waveInfo.sustainEnemyCount - numAIsKilledThisWave
    if enemiesLeftToKill <= waveInfo:GetMaxEnemies() then
      EnterRampDownState()
    end
  else
    GetRandomSpawnPoint()
    local spawnResult = SpawnAI()
    if spawnResult ~= nil then
      enemiesLeftToSpawn = enemiesLeftToSpawn - 1
    end
    if enemiesLeftToSpawn <= 0 then
      EnterSustainState()
    else
      local rampingUpElapsedTime = Support.GetGameTime() - stateStartTime
      local timeLeftToRampUp = waveInfo.rampUpTime - rampingUpElapsedTime + kRampUpGraceTime
      local timePerEnemy = timeLeftToRampUp / enemiesLeftToSpawn
      local minTime = timePerEnemy - 0.25
      local maxTime = timePerEnemy + 0.25
      maxTime = math.min(maxTime, timeLeftToRampUp)
      maxTime = math.max(maxTime, minTime)
      Callbacks.RegisterForTimer("DoRampUpState", Utilities.GetRandomRealNumber(minTime, maxTime), false)
      bRampUpTimerRegistered = true
    end
  end
end

function EnableStaggeredSpawning(bEnableStaggering)
  if bEnableStaggering ~= nil then
    staggerSpawns = bEnableStaggering
  end
end

function SetSpawnInterval(interval)
  if interval ~= nil then
    spawnInterval = interval
  end
  if spawnInterval < 0 then
    spawnInterval = 0
  end
end

function SetMaxSpawnsPerInterval(max)
  if max ~= nil then
    maxSpawnsPerInterval = max
  end
  if maxSpawnsPerInterval < 0 then
    maxSpawnsPerInterval = 0
  end
end

function StaggeredSpawns()
  local numSpawned = 0
  local maxEnemiesToSpawn = 0
  local enemiesLeftToKill = 0
  if (currentState == kSustain or currentState == kRampUp) and waveInfo ~= nil then
    enemiesLeftToKill = waveInfo.sustainEnemyCount - numAIsKilledThisWave
    if numAIsToSpawn > maxSpawnsPerInterval then
      maxEnemiesToSpawn = maxSpawnsPerInterval
    else
      maxEnemiesToSpawn = numAIsToSpawn
    end
    for i = 0, maxEnemiesToSpawn do
      if 0 < enemiesLeftToKill then
        GetRandomSpawnPoint()
        SpawnAI()
        numSpawned = numSpawned + 1
        if numAIs >= waveInfo:GetMaxEnemies() and waveInfo:GetMaxEnemies() ~= 0 then
          numAIsToSpawn = 0
          break
        end
      else
        break
      end
    end
    numAIsToSpawn = numAIsToSpawn - numSpawned
  else
  end
  if numAIsToSpawn <= 0 then
    numAIsToSpawn = 0
    bStaggeredSpawnsRegistered = false
  else
    Callbacks.RegisterForTimer("StaggeredSpawns", spawnInterval, false)
  end
end

function EnterSustainState()
  stateStartTime = Support.GetGameTime()
  currentState = kSustain
  if waveInfo.sustainTime ~= nil and waveInfo.sustainTime ~= -1 then
    Callbacks.RegisterForTimer("EnterRampDownState", waveInfo.sustainTime, false)
  end
end

function EnterRampDownState()
  if staggerSpawns and bStaggeredSpawnsRegistered then
    bStaggeredSpawnsRegistered = false
    Callbacks.UnregisterForTimer("StaggeredSpawns")
  end
  if numAIs == 0 then
    EnterRestState()
    return
  end
  if debugCycleThroughWaves then
    stateStartTime = Support.GetGameTime()
    currentState = kRampDown
    local numEnemies = #spawnedEnemyInfo
    for e = numEnemies, 1, -1 do
      Game.Damage(spawnedEnemyInfo[e].object, 99999)
    end
    return nil
  end
  if FEAR.UpdateAISettingsForAggressiveAttack ~= nil and 0 < #spawnedEnemyInfo then
    local enemyInfo = spawnedEnemyInfo[1]
    if IsEnemyLoadedAndLiving(enemyInfo.object) then
      FEAR.UpdateAISettingsForAggressiveAttack(enemyInfo.object)
    end
    enemyInfo.aggressiveAttackSet = true
    if #spawnedEnemyInfo > 1 then
      enemyInfo = spawnedEnemyInfo[2]
      if IsEnemyLoadedAndLiving(enemyInfo.object) then
        FEAR.UpdateAISettingsForAggressiveAttack(enemyInfo.object)
      end
      enemyInfo.aggressiveAttackSet = true
    end
  end
  stateStartTime = Support.GetGameTime()
  currentState = kRampDown
end

function EnterRestState()
  if currentWave > 1 then
    if staggerSpawns and bStaggeredSpawnsRegistered then
      bStaggeredSpawnsRegistered = false
      Callbacks.UnregisterForTimer("StaggeredSpawns")
    end
    OnEndOfContractionsWave()
  end
  currentWave = currentWave + 1
  Callbacks.RegisterForTimer("EnterRampUpState", waveInfo.restTime, false)
  bEnterRampUpTimerRegistered = true
  if PlaySoundNewWave ~= nil then
    local newWaveSoundDelay = waveInfo.restTime - 10
    if newWaveSoundDelay < 0.1 then
      newWaveSoundDelay = 0.1
    end
    Callbacks.RegisterForTimer("PlaySoundNewWave", newWaveSoundDelay, false)
  end
end

function OnEndOfContractionsWave()
  OnAIDeath = Super.OnAIDeath
  stateStartTime = Support.GetGameTime()
  currentState = kRest
  AwardHeavyFogAchievements()
  StopSoundWaveAmbient()
  StopHarvesterSpawning()
  KillAllHarvesters()
  BroadcastMissionMessage(beginRestPeriodMsgId)
  PlaySoundWaveOver()
end

function AwardHeavyFogAchievements()
  if not MP.IsClient() then
    for playerIndex = GameScript.PlayerIndex.kGlobalPlayer1, Player.GetNumPlayers() do
      if playersEligibleForHeavyFogAchievement[playerIndex] == true then
        GameScript.Game.AwardAchievementOccurrence(playerIndex, GameScript.Achievements.Deep_Fog_No_LS_Contractions)
      end
    end
  end
end

function PlaySoundNewWave()
  Game.SendTextMessage(myObject, "play sound wave start")
end

function PlaySoundWaveAmbient()
  Game.SendTextMessage(myObject, "play sound wave ambient")
  Game.SendTextMessage(myObject, "play sound fog approach")
end

function StopSoundWaveAmbient()
  Game.SendTextMessage(myObject, "stop sound wave ambient")
end

function PlaySoundWaveOver()
  Game.SendTextMessage(myObject, "play sound wave over")
  Game.SendTextMessage(myObject, "play sound fog recede")
end

function OnPlayerStateChange(info)
  local index = Player.GetPlayerIndexByObject(info.object)
  if playersEligibleForHeavyFogAchievement[index] and info.newState == ObjectState.NearDeath then
    playersEligibleForHeavyFogAchievement[index] = false
  end
end

function OnPlayerDeath(deathMsg)
  playersInFogVolumeRefCount[deathMsg.victimPlayerIndex] = 0
end

function OnAnyDeath(deathMsg)
  local victim = deathMsg.victimPlayerIndex
  if victim ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    OnPlayerDeath(deathMsg)
  end
end

function CheckForAIDeaths()
  local numEnemies = #spawnedEnemyInfo
  for e = numEnemies, 1, -1 do
    if not IsEnemyLoadedAndLiving(spawnedEnemyInfo[e].object) then
      OnAIDeath()
      table.remove(spawnedEnemyInfo, e)
    end
  end
end

function OnAIDeath(deathMsg)
  numAIsKilledThisWave = numAIsKilledThisWave + 1
  numAIs = numAIsSpawnedThisWave - numAIsKilledThisWave
  if numAIs >= waveInfo:GetMaxEnemies() and waveInfo:GetMaxEnemies() ~= 0 then
    return
  end
  if bEnabled then
    if currentState == kSustain or currentState == kRampUp then
      if not staggerSpawns then
        SpawnAI()
      else
        numAIsToSpawn = numAIsToSpawn + 1
        if not bStaggeredSpawnsRegistered then
          bStaggeredSpawnsRegistered = true
          Callbacks.RegisterForTimer("StaggeredSpawns", spawnInterval, false)
        end
      end
      if waveInfo.sustainEnemyCount ~= nil then
        local enemiesLeftToKill = waveInfo.sustainEnemyCount - numAIsKilledThisWave
        if enemiesLeftToKill <= waveInfo:GetMaxEnemies() then
          EnterRampDownState()
        end
      end
    elseif currentState == kRampDown then
      if numAIsKilledThisWave == numAIsSpawnedThisWave then
        EnterRestState()
      elseif 0 < #spawnedEnemyInfo then
        local enemyInfo = spawnedEnemyInfo[1]
        if IsEnemyLoadedAndLiving(enemyInfo.object) then
          FEAR.UpdateAISettingsForAggressiveAttack(enemyInfo.object)
        end
        enemyInfo.aggressiveAttackSet = true
        if 1 < #spawnedEnemyInfo then
          enemyInfo = spawnedEnemyInfo[2]
          if IsEnemyLoadedAndLiving(enemyInfo.object) then
            FEAR.UpdateAISettingsForAggressiveAttack(enemyInfo.object)
          end
          enemyInfo.aggressiveAttackSet = true
        end
      end
    end
  end
end

function RespawnLostEnemy(enemyObject)
  local kShowRespawnArrows = false
  local oldEnemyPosition = Game.GetPosition(enemyObject)
  Game.Kill(enemyObject, 0)
  numAIsSpawnedThisWave = numAIsSpawnedThisWave - 1
  numAIs = numAIsSpawnedThisWave - numAIsKilledThisWave
  local newEnemy = SpawnAI()
  if newEnemy == nil then
    Debug.PrintToScreenWithTimer("Spawn() failed!", 10, Utilities.kRed, false)
  end
  if kShowRespawnArrows then
    oldEnemyPosition.y = oldEnemyPosition.y + 0.5
    local newEnemyPosition = Game.GetPosition(newEnemy)
    newEnemyPosition.y = newEnemyPosition.y + 0.5
    local newArrow = {
      Origin = oldEnemyPosition,
      EndPoint = newEnemyPosition,
      Time = Support.GetGameTime()
    }
    table.insert(debugArrows, newArrow)
  end
end

function SpawnAI(optionalTemplateName, optionalSpawnpointTable)
  local templateName = optionalTemplateName == nil and GetRandomTemplateToSpawn() or optionalTemplateName
  local spawnPoint = GetRandomSpawnPoint(optionalSpawnpointTable)
  if spawnPoint == nil then
    Debug.PrintToScreenWithTimer("NO SPAWN POINTS FOUND! FAIL! NO PLAYER IS IN ANY REGION WITH SPAWN POINTS. THE SCRIPT IS BROKEN.", 10, Utilities.kRed, false)
    return nil
  end
  local position = spawnPoint.pos
  local orientation = spawnPoint.rot
  local newAI = Game.SpawnWithRotation(templateName, position, orientation)
  if newAI ~= nil then
    if aiSquad ~= nil then
      Sets.AddObjectToSet(aiSquad, newAI)
    end
    numAIsSpawnedThisWave = numAIsSpawnedThisWave + 1
    spawnedEnemy = GetFirstValidSpawnedEnemy()
    if spawnedEnemy ~= nil then
      Game.CopyNation(spawnedEnemy, newAI)
    end
    table.insert(spawnedEnemyInfo, {
      object = newAI,
      respawnCandidate = true,
      aggressiveAttackSet = false
    })
  else
    Debug.PrintError("SpawnAI() could not spawn " .. templateName .. " at location [" .. math.floor(position.x) .. ", " .. math.floor(position.y) .. ", " .. math.floor(position.z) .. "]")
    return nil
  end
  numAIs = numAIsSpawnedThisWave - numAIsKilledThisWave
  return newAI
end

function GetRandomAITemplateForDifficulty(difficulty)
  if difficulty < 1 or difficulty > kAITypes_NumDifficulties then
    Debug.PrintWarning("GetRandomAITemplate() was passed a bad value (" .. difficulty .. ")")
    return nil
  end
  local numVarieties = #kAITypeNames[difficulty].variety
  if numVarieties == 0 then
    Debug.PrintToScreenWithTimer("Please fill in the new multi-variety AI template variables.", 10, Utilities.kRed, false)
    return kAIType[difficulty]
  end
  local varIndex = Utilities.GetRandomInteger(1, numVarieties)
  return kAITypeNames[difficulty].variety[varIndex]
end

function GetRandomTemplateToSpawn()
  local randDifficulty = Utilities.GetRandomInteger(waveInfo.difficultyRange.min, waveInfo.difficultyRange.max)
  return GetRandomAITemplateForDifficulty(randDifficulty)
end

function GetRandomSpawnPoint(optionalSpawnpointTable)
  local kDebugPrintSpawnerInfo = true
  local nearbySpawners = {}
  local secondChanceMaxDist = kMaxDistThreshold * 2
  local secondChanceSpawners = {}
  local lastResortSpawners = {}
  local allSpawners = optionalSpawnpointTable ~= nil and optionalSpawnpointTable or allSpawnPoints
  if Support.GetGameTime() - spawnPointTimeStamp > spawnPointCacheUpdate then
    for k, curSpawner in pairs(allSpawners) do
      if GetIsSpawnPointDistValid(curSpawner) then
        table.insert(nearbySpawners, curSpawner)
      elseif GetIsSpawnPointDistValid(curSpawner, secondChanceMaxDist) then
        table.insert(secondChanceSpawners, curSpawner)
      else
        table.insert(lastResortSpawners, curSpawner)
      end
    end
    local resultSpawner = LuaHelpers.GetRandomItemFromTableMeetingCondition(nearbySpawners, GetIsSpawnPointLOSValid)
    if resultSpawner == nil then
      resultSpawner = LuaHelpers.GetRandomItemFromTableMeetingCondition(secondChanceSpawners, GetIsSpawnPointLOSValid)
      if not kDebugPrintSpawnerInfo or resultSpawner ~= nil then
      end
    end
    if resultSpawner == nil then
      resultSpawner = LuaHelpers.GetRandomItemFromTableMeetingCondition(lastResortSpawners, GetIsSpawnPointLOSValid)
      if not kDebugPrintSpawnerInfo or resultSpawner ~= nil then
      end
    end
    if resultSpawner == nil then
      resultSpawner = LuaHelpers.GetRandomItemFromTable(secondChanceSpawners)
      if not kDebugPrintSpawnerInfo or resultSpawner ~= nil then
      end
    end
    if resultSpawner == nil then
      resultSpawner = LuaHelpers.GetRandomItemFromTable(nearbySpawners)
      if not kDebugPrintSpawnerInfo or resultSpawner ~= nil then
      end
    end
    if resultSpawner == nil then
      resultSpawner = LuaHelpers.GetRandomItemFromTable(lastResortSpawners)
      if not kDebugPrintSpawnerInfo or resultSpawner ~= nil then
      end
    end
    if kDebugPrintSpawnerInfo and resultSpawner == nil then
      Debug.PrintToOutputAndScreenWithTimer("COULD NOT FIND ANY SPAWNER", 10, Utilities.kRed)
    end
    SetCachedSpawnPoint(resultSpawner, optionalTemplateName)
    return GetCachedSpawnPoint(optionalTemplateName)
  else
    return GetCachedSpawnPoint()
  end
end

function DistanceBetweenPositions(posA, posB)
  local vectAtoB = GameScript.LuaMath3d.VectorSubtract(posA, posB)
  return GameScript.LuaMath3d.VectorLength(vectAtoB)
end

function GetCachedSpawnPoint()
  return spawnPointCache
end

function SetCachedSpawnPoint(point)
  spawnPointTimeStamp = Support.GetGameTime()
  spawnPointCache = point
end

function GetIsSpawnPointDistValid(spawnInfo)
  local isValid = false
  for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, maxPlayer do
    local distance = Player.GetPlayerDistanceToPosition(curPlayerIndex, spawnInfo.pos)
    if distance > kMinDistThreshold and distance < kMaxDistThreshold then
      isValid = true
      break
    end
  end
  return isValid
end

function GetIsSpawnPointLOSValid(spawnInfo)
  local isValid = true
  local spawnerPos = spawnInfo.pos
  for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, maxPlayer do
    if Game.IsPlayerLookRotFacingObject(curPlayerIndex, spawnInfo.point, 50) then
      local useHeadPosition = true
      local defaultReturn = false
      local canSeeSpawner = Player.DoesPlayerHaveLineOfSightToPosition(spawnerPos, curPlayerIndex, useHeadPosition, defaultReturn)
      if canSeeSpawner then
        isValid = false
        break
      end
    end
  end
  return isValid
end

function GetLocalActivePlayers()
  local localPlayerList = {}
  local activePlayerList = GetActivePlayers()
  for p, curPlayer in ipairs(activePlayerList) do
    if Player.IsLocalPlayer(curPlayer.Index) then
      table.insert(localPlayerList, curPlayer)
    end
  end
  return localPlayerList
end

function GetActivePlayers()
  local curPlayerIndex = 0
  local curPlayer
  local activePlayerList = {}
  local numPlayers = Player.GetNumPlayers()
  for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(curPlayerIndex) then
      local curPlayer = {}
      curPlayer.Index = curPlayerIndex
      curPlayer.Object = Player.GetPlayerAvatarObjectByIndex(curPlayerIndex)
      if curPlayer.Object ~= nil then
        table.insert(activePlayerList, curPlayer)
      end
    end
  end
  return activePlayerList
end

function IsEnemyLoadedAndLiving(enemyObject)
  if enemyObject == nil then
    return false
  elseif not Game.IsLoaded(enemyObject) then
    return false
  elseif not Game.HasHitPoints(enemyObject) then
    return false
  elseif Game.GetHitPointPercent(enemyObject) <= 0 then
    return false
  end
  return true
end

function RespawnLostEnemies()
  if #spawnedEnemyInfo == 0 then
    return
  end
  for e, enemyInfo in ipairs(spawnedEnemyInfo) do
    enemyInfo.doRespawn = enemyInfo.respawnCandidate
  end
  local masterRegionList = Sets.GetObjectsInSet(masterRegionSet)
  local uniqueRegionList = {}
  for r, region in pairs(masterRegionList) do
    LuaHelpers.AddUniqueItemToTable(uniqueRegionList, region)
  end
  for e, enemyInfo in ipairs(spawnedEnemyInfo) do
    if not Game.IsLoaded(enemyInfo.object) or CanAnyPlayerSeeEnemy(enemyInfo.object) then
      enemyInfo.doRespawn = false
    else
      for r, region in ipairs(uniqueRegionList) do
        if enemyInfo.doRespawn and Regions.IsInRegion(region, enemyInfo.object) then
          enemyInfo.doRespawn = false
        end
      end
    end
  end
  local e = #spawnedEnemyInfo
  while 0 < e do
    if spawnedEnemyInfo[e].doRespawn then
      RespawnLostEnemy(spawnedEnemyInfo[e].object)
      table.remove(spawnedEnemyInfo, e)
      break
    end
    e = e - 1
  end
end

function CanAnyPlayerSeeEnemy(enemyObject)
  local enemyPos = Game.GetPosition(enemyObject)
  for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers - 1 do
    if Game.IsPlayerLookRotFacingObject(curPlayerIndex, enemyObject, 50) then
      local useHeadPosition = true
      local defaultReturn = false
      enemyPos.y = enemyPos.y + 1.5
      local hasLineOfSight = Player.DoesPlayerHaveLineOfSightToPosition(spawnerPos, curPlayerIndex, useHeadPosition, defaultReturn)
      if hasLineOfSight then
        return true
      end
    end
  end
  return false
end

function RegisterHeavyFogCameraFilterRegions()
  local heavyFogRegions = Support.GetImportObjectTable("Heavy Fog Camera Filter Regions")
  if heavyFogRegions == nil then
    return
  end
  fogVolumeActivationTime = Support.GetGameTime()
  for index = GameScript.PlayerIndex.kGlobalPlayer1, Player.GetNumPlayers() do
    playersEligibleForHeavyFogAchievement[index] = false
  end
  for i, region in ipairs(heavyFogRegions) do
    if region ~= nil and region ~= myObject then
      if Callbacks.RegisterPlayerHeadEnterExitRegion ~= nil then
        Callbacks.RegisterPlayerHeadEnterExitRegion(region, "OnHeavyFogRegionEnter", "OnHeavyFogRegionExit")
      else
        Callbacks.RegisterPlayerEnterExitRegion(region, "OnHeavyFogRegionEnter", "OnHeavyFogRegionExit")
      end
    end
  end
  heavyFogCameraFilterRegionsRegistered = true
end

function UnregisterHeavyFogCameraFilterRegions()
  if not heavyFogCameraFilterRegionsRegistered then
    return
  end
  local heavyFogRegions = Support.GetImportObjectTable("Heavy Fog Camera Filter Regions")
  if heavyFogRegions == nil then
    return
  end
  for i, region in ipairs(heavyFogRegions) do
    if region ~= nil and region ~= myObject then
      Callbacks.UnregisterPlayerEnterExitRegion(region, "OnHeavyFogRegionEnter", "OnHeavyFogRegionExit")
    end
  end
  for index = GameScript.PlayerIndex.kGlobalPlayer1, Player.GetNumPlayers() do
    if Player.IsLocalPlayer(index) and playersInFogVolumeRefCount[index] ~= nil and 0 < playersInFogVolumeRefCount[index] then
      StopHeavyFogCameraFilter(Player.GetPlayerAvatarObjectByIndex(index))
      StopHeavyFogAudioEffects()
    end
  end
  heavyFogCameraFilterRegionsRegistered = false
end

function GetPlayerObjsInHeavyFog()
  local playerObjsInFog = {}
  local numPlayers = Player.GetNumPlayers()
  for index = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    if playersInFogVolumeRefCount[index] ~= nil and 0 < playersInFogVolumeRefCount[index] then
      table.insert(playerObjsInFog, Player.GetPlayerAvatarObjectByIndex(index))
    end
  end
  return playerObjsInFog
end

function IsAnyPlayerInHeavyFog()
  for p, inFog in ipairs(playersInFogVolumeRefCount) do
    if 0 < inFog then
      return true
    end
  end
  return false
end

function enableHarvesters()
  spawnHarvesters = true
end

function OnHeavyFogRegionEnter(info)
  if not heavyFogCameraFilterRegionsRegistered then
    return
  end
  if info.object == nil then
    return
  end
  local index = Player.GetPlayerIndexByObject(info.object)
  if playersInFogVolumeRefCount[index] == nil or playersInFogVolumeRefCount[index] == 0 then
    if not MP.IsClient() then
      if Support.GetGameTime() < fogVolumeActivationTime + 10 and not Player.IsPlayerInState(index, ObjectState.NearDeath) then
        playersEligibleForHeavyFogAchievement[index] = true
      end
      if currentState ~= kRest and not IsAnyPlayerInHeavyFog() and spawnHarvesters then
        StartHarvesterSpawning()
      end
    end
    if Player.IsLocalPlayer(index) then
    end
    StartHeavyFogCameraFilter(info.object)
  end
  if playersInFogVolumeRefCount[index] == nil then
    playersInFogVolumeRefCount[index] = 1
  else
    playersInFogVolumeRefCount[index] = playersInFogVolumeRefCount[index] + 1
  end
end

function OnHeavyFogRegionExit(info)
  if info.object == nil then
    return
  end
  local index = Player.GetPlayerIndexByObject(info.object)
  if playersInFogVolumeRefCount[index] ~= nil and 0 < playersInFogVolumeRefCount[index] then
    playersInFogVolumeRefCount[index] = playersInFogVolumeRefCount[index] - 1
  end
  if playersInFogVolumeRefCount[index] == 0 then
    if not MP.IsClient() then
      if playersEligibleForHeavyFogAchievement[index] then
        playersEligibleForHeavyFogAchievement[index] = false
      end
      if not IsAnyPlayerInHeavyFog() then
        StopHarvesterSpawning()
      end
    end
    if Player.IsLocalPlayer(index) then
    end
    StopHeavyFogCameraFilter(info.object)
  end
end

function StartHeavyFogCameraFilter(playerObj)
end

function StopHeavyFogCameraFilter(playerObj)
end

function SetHeavyFogCameraFilterColorForLocalPlayers(color)
  local numPlayers = Player.GetNumPlayers()
  for index = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) and Player.IsLocalPlayer(index) then
      Camera.SetCameraFilterColor(index, "heavy fog color", color)
    end
  end
end

function UpdateFogEffectValues()
  local effectObject = fogEffectSettings.effectObject
  if effectObject then
    local timePer = (Support.GetGameTime() - fogEffectSettings.startTime) / fogEffectSettings.transitionTime
    if timePer < 0 then
      timePer = 0
    elseif 1 <= timePer then
      timePer = 1
      Callbacks.UnregisterForTimer("UpdateFogEffectValues")
      fogEffectSettings.updating = false
    end
    local fogEffectPos = Game.GetPosition(effectObject)
    fogEffectPos.y = fogEffectSettings.startHeight * (1 - timePer) + fogEffectSettings.endHeight * timePer
    Game.TeleportObjectToPosition(effectObject, fogEffectPos)
    local color = {}
    color.r = fogEffectSettings.startColor.r * (1 - timePer) + fogEffectSettings.endColor.r * timePer
    color.g = fogEffectSettings.startColor.g * (1 - timePer) + fogEffectSettings.endColor.g * timePer
    color.b = fogEffectSettings.startColor.b * (1 - timePer) + fogEffectSettings.endColor.b * timePer
    color.a = fogEffectSettings.startColor.a * (1 - timePer) + fogEffectSettings.endColor.a * timePer
    Graphics.SetNamedMaterialColor(effectObject, "solid_diffuse", color)
  else
    Callbacks.UnregisterForTimer("UpdateFogEffectValues")
    fogEffectSettings.updating = false
  end
end

function SetFogEffectValues(effectObject, startHeight, endHeight, startColor, endColor, transitionTime)
  fogEffectSettings.effectObject = effectObject
  fogEffectSettings.endHeight = endHeight
  fogEffectSettings.endColor = endColor
  fogEffectSettings.startTime = Support.GetGameTime()
  fogEffectSettings.transitionTime = transitionTime
  if not fogEffectSettings.updating then
    fogEffectSettings.startHeight = startHeight
    fogEffectSettings.startColor = startColor
    Callbacks.RegisterForTimer("UpdateFogEffectValues", 0.1, true)
    fogEffectSettings.updating = true
  end
end

function StartHeavyFogAudioEffects()
  if heavyFogAudio.targetAlpha == 0 and not heavyFogAudio.updating then
    local busName = heavyFogAudio.kBusName
    local effectName = heavyFogAudio.kEffectName
    heavyFogAudio.baseValues = {}
    heavyFogAudio.baseValues.dryLevel = Audio.GetEffectParam(busName, effectName, 0)
    heavyFogAudio.baseValues.room = Audio.GetEffectParam(busName, effectName, 1)
    heavyFogAudio.baseValues.roomHF = Audio.GetEffectParam(busName, effectName, 2)
    heavyFogAudio.baseValues.roomRolloff = Audio.GetEffectParam(busName, effectName, 3)
    heavyFogAudio.baseValues.decayTime = Audio.GetEffectParam(busName, effectName, 4)
    heavyFogAudio.baseValues.decayHFRatio = Audio.GetEffectParam(busName, effectName, 5)
    heavyFogAudio.baseValues.reflections = Audio.GetEffectParam(busName, effectName, 6)
    heavyFogAudio.baseValues.reflectDelay = Audio.GetEffectParam(busName, effectName, 7)
    heavyFogAudio.baseValues.reverb = Audio.GetEffectParam(busName, effectName, 8)
    heavyFogAudio.baseValues.reverbDelay = Audio.GetEffectParam(busName, effectName, 9)
    heavyFogAudio.baseValues.diffusion = Audio.GetEffectParam(busName, effectName, 10)
    heavyFogAudio.baseValues.density = Audio.GetEffectParam(busName, effectName, 11)
    heavyFogAudio.baseValues.hrReference = Audio.GetEffectParam(busName, effectName, 12)
    heavyFogAudio.baseValues.roomLF = Audio.GetEffectParam(busName, effectName, 13)
    heavyFogAudio.baseValues.lrReference = Audio.GetEffectParam(busName, effectName, 14)
  end
  if not heavyFogAudio.updating then
    Callbacks.RegisterForTimer("UpdateHeavyFogAudioEffects", 0.1, true)
    heavyFogAudio.updating = true
  end
  heavyFogAudio.targetAlpha = 1
end

function StopHeavyFogAudioEffects()
  if not heavyFogAudio.updating and heavyFogAudio.curAlpha ~= 0 then
    Callbacks.RegisterForTimer("UpdateHeavyFogAudioEffects", 0.1, true)
    heavyFogAudio.updating = true
  end
  heavyFogAudio.targetAlpha = 0
end

function ImmediateStopHeavyFogAudioEffects()
  if heavyFogAudio.updating then
    heavyFogAudio.updating = false
    Callbacks.UnregisterForTimer("UpdateHeavyFogAudioEffects")
  end
  if heavyFogAudio.curAlpha ~= 0 then
    LerpHeavyFogAudioSettings(heavyFogAudio.baseValues, heavyFogAudio.targetValues, 0)
    heavyFogAudio.curAlpha = 0
    heavyFogAudio.targetAlpha = 0
  end
end

function UpdateHeavyFogAudioEffects()
  if heavyFogAudio.curAlpha == heavyFogAudio.targetAlpha then
    Callbacks.UnregisterForTimer("UpdateHeavyFogAudioEffects")
    heavyFogAudio.updating = false
    return
  end
  local kFadeTime = 1
  local kAlphaDelta = 0.1 / kFadeTime
  if heavyFogAudio.curAlpha < heavyFogAudio.targetAlpha then
    heavyFogAudio.curAlpha = heavyFogAudio.curAlpha + kAlphaDelta
    if heavyFogAudio.curAlpha > heavyFogAudio.targetAlpha then
      heavyFogAudio.curAlpha = heavyFogAudio.targetAlpha
    end
  else
    heavyFogAudio.curAlpha = heavyFogAudio.curAlpha - kAlphaDelta
    if heavyFogAudio.curAlpha < heavyFogAudio.targetAlpha then
      heavyFogAudio.curAlpha = heavyFogAudio.targetAlpha
    end
  end
  if heavyFogAudio.curAlpha == heavyFogAudio.targetAlpha then
    Callbacks.UnregisterForTimer("UpdateHeavyFogAudioEffects")
    heavyFogAudio.updating = false
  end
  LerpHeavyFogAudioSettings(heavyFogAudio.baseValues, heavyFogAudio.targetValues, heavyFogAudio.curAlpha)
end

function LerpHeavyFogAudioSettings(settingsA, settingsB, alpha)
  local SetEffect = Audio.SetEffectParam
  local Lerp = Utilities.LerpRealNumber
  local busName = heavyFogAudio.kBusName
  local effectName = heavyFogAudio.kEffectName
  if settingsB.dryLevel ~= nil then
    SetEffect(busName, effectName, 0, Lerp(settingsA.dryLevel, settingsB.dryLevel, alpha))
  end
  if settingsB.room ~= nil then
    SetEffect(busName, effectName, 1, Lerp(settingsA.room, settingsB.room, alpha))
  end
  if settingsB.roomHF ~= nil then
    SetEffect(busName, effectName, 2, Lerp(settingsA.roomHF, settingsB.roomHF, alpha))
  end
  if settingsB.roomRolloff ~= nil then
    SetEffect(busName, effectName, 3, Lerp(settingsA.roomRolloff, settingsB.roomRolloff, alpha))
  end
  if settingsB.decayTime ~= nil then
    SetEffect(busName, effectName, 4, Lerp(settingsA.decayTime, settingsB.decayTime, alpha))
  end
  if settingsB.decayHFRatio ~= nil then
    SetEffect(busName, effectName, 5, Lerp(settingsA.decayHFRatio, settingsB.decayHFRatio, alpha))
  end
  if settingsB.reflections ~= nil then
    SetEffect(busName, effectName, 6, Lerp(settingsA.reflections, settingsB.reflections, alpha))
  end
  if settingsB.reflectDelay ~= nil then
    SetEffect(busName, effectName, 7, Lerp(settingsA.reflectDelay, settingsB.reflectDelay, alpha))
  end
  if settingsB.reverb ~= nil then
    SetEffect(busName, effectName, 8, Lerp(settingsA.reverb, settingsB.reverb, alpha))
  end
  if settingsB.reverbDelay ~= nil then
    SetEffect(busName, effectName, 9, Lerp(settingsA.reverbDelay, settingsB.reverbDelay, alpha))
  end
  if settingsB.diffusion ~= nil then
    SetEffect(busName, effectName, 10, Lerp(settingsA.diffusion, settingsB.diffusion, alpha))
  end
  if settingsB.density ~= nil then
    SetEffect(busName, effectName, 11, Lerp(settingsA.density, settingsB.density, alpha))
  end
  if settingsB.hrReference ~= nil then
    SetEffect(busName, effectName, 12, Lerp(settingsA.hrReference, settingsB.hrReference, alpha))
  end
  if settingsB.roomLF ~= nil then
    SetEffect(busName, effectName, 13, Lerp(settingsA.roomLF, settingsB.roomLF, alpha))
  end
  if settingsB.lrReference ~= nil then
    SetEffect(busName, effectName, 14, Lerp(settingsA.lrReference, settingsB.lrReference, alpha))
  end
end

function GetRandomHarvesterSpawnTime()
  if currentState == kRampDown and #spawnedEnemyInfo <= 3 then
    return Utilities.GetRandomRealNumber(2, 3.5)
  end
  return Utilities.GetRandomRealNumber(3, 5)
end

function KillAllHarvesters()
  local objects = ObjectTags.GetObjectsWithTag("MP Paranormal Object")
  for _, v in pairs(objects) do
    Game.Kill(v, GameScript.KillObjectMessageType.Instant)
  end
end

function StartHarvesterSpawning()
  if not debugDisableHarvesters then
    Callbacks.RegisterForTimer("SpawnHarvesterAndScheduleNext", GetRandomHarvesterSpawnTime(), false)
  end
end

function StopHarvesterSpawning()
  if not debugDisableHarvesters then
    Callbacks.UnregisterForTimer("SpawnHarvesterAndScheduleNext")
  end
end

function SpawnHarvesterAndScheduleNext()
  if currentState == kRest then
    return
  end
  local playerObjs = GetPlayerObjsInHeavyFog()
  if playerObjs == nil or #playerObjs == 0 then
    Callbacks.RegisterForTimer("SpawnHarvesterAndScheduleNext", 1, false)
    return
  end
  local targetPlayer = LuaHelpers.GetRandomItemFromTable(playerObjs)
  local spawnPoint = GetHarvesterSpawnpoint(targetPlayer)
  if spawnPoint == nil then
    Callbacks.RegisterForTimer("SpawnHarvesterAndScheduleNext", 1, false)
    return
  end
  local spawnPos = Game.GetPosition(spawnPoint)
  local targetLocation = Game.GetPosition(targetPlayer)
  local harvesterToTargetVect = Math3d.VectorSubtract(targetLocation, spawnPos)
  harvesterToTargetVect.y = 0
  Math3d.VectorNormalize(harvesterToTargetVect)
  local spawnRot = Math3d.GetRotationForForward(harvesterToTargetVect)
  Game.SpawnWithRotation("Harvester Object Template", spawnPos, spawnRot)
  Callbacks.RegisterForTimer("SpawnHarvesterAndScheduleNext", GetRandomHarvesterSpawnTime(), false)
end

function GetHarvesterSpawnpoint(targetObj)
  if harvesterSpawnPoints == nil or #harvesterSpawnPoints == 0 then
    return nil
  end
  local targetPos = Game.GetPosition(targetObj)
  local kDistThreshold = 10
  local nearbySpawnpoints = {}
  local nearbySpawnpointsInView = {}
  local closestDist
  for k, spawnPoint in pairs(harvesterSpawnPoints) do
    local spawnPointPos = Game.GetPosition(spawnPoint)
    local distToTarget = DistanceBetweenPositions(targetPos, spawnPointPos)
    if kDistThreshold > distToTarget then
      table.insert(nearbySpawnpoints, spawnPoint)
      local playerIndex = Player.GetPlayerIndexByObject(targetObj)
      if Game.IsPlayerLookRotFacingObject(playerIndex, spawnPoint, 50) then
        table.insert(nearbySpawnpointsInView, spawnPoint)
      end
    end
    if closestDist == nil or closestDist > distToTarget then
      closestDist = distToTarget
    end
  end
  if 0 < #nearbySpawnpointsInView then
    return LuaHelpers.GetRandomItemFromTable(nearbySpawnpointsInView)
  elseif 0 < #nearbySpawnpoints then
    return LuaHelpers.GetRandomItemFromTable(nearbySpawnpoints)
  end
  return nil
end

function KillAllCastingProjectiles()
  local objects = ObjectTags.GetObjectsWithTag("Casting Projectile")
  for _, v in pairs(objects) do
    Game.Kill(v, GameScript.KillObjectMessageType.Instant)
  end
end

local lineList = {}

function DebugDisplay()
  DrawDirectorInfoDisplay()
  if debugDrawDirectorInfoOnly then
    return
  end
  for k, line in pairs(lineList) do
    Debug.DrawLine(line.startPos, line.endPos, line.color)
  end
end

function DebugDrawSpawnPoints()
  lineList = {}
  if allSpawnPoints ~= nil then
    for k, spawnPoint in pairs(allSpawnPoints) do
      local color = Utilities.kRed
      if GetIsSpawnPointDistValid(spawnPoint) then
        color = Utilities.kGreen
      elseif GetIsSpawnPointDistValid(spawnPoint, kMaxDistThreshold * 2) then
        color = Utilities.kOrange
      end
      local spawnPointPos = spawnPoint.pos
      Debug.DrawSphere(spawnPointPos, 0.5, color)
      spawnPointPos.y = spawnPointPos.y + 1.5
      for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, maxPlayer do
        local lineColor = Utilities.kBlack
        if Game.IsPlayerLookRotFacingObject(curPlayerIndex, spawnPoint.point, 50) then
          lineColor = Utilities.kYellow
          local useHeadPosition = true
          local defaultReturn = false
          local canSeeSpawner = Player.DoesPlayerHaveLineOfSightToPosition(spawnerPointPos, curPlayerIndex, useHeadPosition, defaultReturn)
          if canSeeSpawner then
            lineColor = Utilities.kGreen
          end
        end
        table.insert(lineList, {
          startPos = playerPos,
          endPos = spawnPointPos,
          color = lineColor
        })
      end
    end
  end
end

function DebugDrawSpawnpointInfo()
  local xPos, yPos = 0.5, 0.15
  
  local function PrintLine(text, color)
    Debug.SetOnScreenTextColor(color.r, color.g, color.b)
    Debug.PrintToScreen(text, xPos, yPos)
    yPos = yPos + 0.03
  end
  
  if allSpawnPoints == nil then
    PrintLine("spawnpoint list is nil", Utilities.kGrey)
  else
    PrintLine("spawnpoints (" .. #allSpawnPoints .. ")", Utilities.kWhite)
    xPos = xPos + 0.01
    if #allSpawnPoints == 0 then
      PrintLine("none", Utilities.kGrey)
    else
      for k, spawnPoint in pairs(allSpawnPoints) do
        local spName = Game.GetName(spawnPoint.point)
        local spPos = spawnPoint.pos
        spPos.x = math.floor(spPos.x)
        spPos.z = math.floor(spPos.z)
        PrintLine(spName .. "(" .. spPos.x .. ", " .. spPos.z .. ")", Utilities.kWhite)
      end
    end
  end
end

function DebugDrawArrows()
  local kDisplaySeconds = 30
  local numArrows = #debugArrows
  for a = numArrows, 1, -1 do
    local arrow = debugArrows[a]
    Debug.DrawArrow(arrow.Origin, arrow.EndPoint, 0.2, Utilities.kYellow)
    local arrowAge = currentTime - arrow.Time
    if kDisplaySeconds < arrowAge then
      table.remove(debugArrows, a)
    end
  end
end

function GetCurrentWaveDebugText()
  return "Wave " .. currentWave
end

function DrawDirectorInfoDisplay()
  local MakeEnemyCount = function(num)
    local result = ""
    for i = 1, num do
      result = result .. "|"
    end
    return result
  end
  Debug.PrintToScreen(GetCurrentWaveDebugText(), 0.1, 0.15)
  local currentTime = Support.GetGameTime()
  local stateColor = Utilities.kRed
  local curStateName
  if currentState == kRampUp then
    local timeInState = currentTime - stateStartTime
    local timeLeft = math.floor(waveInfo.rampUpTime - timeInState) + 1 + kRampUpGraceTime
    timeLeft = math.max(timeLeft, 0)
    curStateName = "Ramp Up (~" .. timeLeft .. ")"
    stateColor = timeLeft > kRampUpGraceTime and Utilities.kOrange or Utilities.kYellow
  elseif currentState == kSustain then
    if waveInfo.sustainTime ~= nil then
      if waveInfo.sustainTime == -1 then
        curStateName = "Sustain (infinite)"
      else
        local timeInState = currentTime - stateStartTime
        curStateName = "Sustain (" .. math.floor(waveInfo.sustainTime - timeInState) + 1 .. ")"
      end
    elseif waveInfo.sustainEnemyCount ~= nil then
      curStateName = "Sustain (" .. waveInfo.sustainEnemyCount - numAIsKilledThisWave .. " left to kill)"
    end
    stateColor = Utilities.kGreen
  elseif currentState == kRampDown then
    curStateName = "Ramp Down (" .. numAIs .. " still alive)"
    stateColor = Utilities.kOrange
  elseif currentState == kRest then
    local timeInState = currentTime - stateStartTime
    curStateName = "Rest (" .. math.floor(waveInfo.restTime - timeInState) + 1 .. ")"
  else
    curStateName = "Unknown"
  end
  Debug.SetOnScreenTextColor(stateColor.r, stateColor.g, stateColor.b)
  Debug.PrintToScreen(curStateName, 0.1, 0.18)
  Debug.SetOnScreenTextColor(Utilities.kGrey.r, Utilities.kGrey.g, Utilities.kGrey.b)
  local maxEnemyTicks = ""
  if currentState == kRampUp or currentState == kSustain then
    maxEnemyTicks = MakeEnemyCount(waveInfo:GetMaxEnemies())
  end
  Debug.PrintToScreen("AIs: " .. maxEnemyTicks, 0.1, 0.21)
  Debug.SetOnScreenTextColor(Utilities.kWhite.r, Utilities.kWhite.g, Utilities.kWhite.b)
  Debug.PrintToScreen("AIs: " .. MakeEnemyCount(#spawnedEnemyInfo), 0.1, 0.21)
end

function PrintAIInfo()
  local textPosX = 0.5
  local textPosY = 0.21
  for e, enemyInfo in ipairs(spawnedEnemyInfo) do
    local enemyObject = enemyInfo.object
    local loadedAndLiving = false
    local enemyName = "nil"
    if enemyObject and Game.IsLoaded(enemyObject) then
      enemyName = Game.GetName(enemyObject)
      if Game.HasHitPoints(enemyObject) and Game.GetHitPointPercent(enemyObject) > 0 then
        loadedAndLiving = true
      end
    end
    local textColor = loadedAndLiving and Utilities.kGreen or Utilities.kRed
    Debug.SetOnScreenTextColor(textColor.r, textColor.g, textColor.b)
    Debug.PrintToScreen(enemyName, textPosX, textPosY)
    textPosY = textPosY + 0.03
  end
  Debug.SetOnScreenTextColor(Utilities.kWhite.r, Utilities.kWhite.g, Utilities.kWhite.b)
end

function DrawLinesToAI()
  local linecolors = {
    Utilities.kRed,
    Utilities.kBlue,
    Utilities.kYellow,
    Utilities.kOrange
  }
  for e, enemyInfo in ipairs(spawnedEnemyInfo) do
    local enemyObject = enemyInfo.object
    if IsEnemyLoadedAndLiving(enemyObject) then
      for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers - 1 do
        if DoesPlayerHavePosition(curPlayerIndex) then
          local playerPos = GetPlayerPosition(curPlayerIndex)
          playerPos.y = playerPos.y + 1.5
          local enemyPos = Game.GetPosition(enemyObject)
          enemyPos.y = enemyPos.y + 1.5
          Debug.DrawLine(playerPos, enemyPos, linecolors[p])
        end
      end
    end
  end
end

function HandleEnableDisableTextMessage(textMsg)
  if textMsg.msg == kDisableText then
    if bEnabled then
      bEnabled = false
      currentState = kRampDown
    end
  elseif textMsg.msg == kEnableText and not bEnabled then
    bEnabled = true
    if numAIsKilledThisWave == numAIsSpawnedThisWave then
      EnterRestState()
    end
  end
end

function Reset()
  if bRampUpTimerRegistered then
    Callbacks.UnregisterForTimer("DoRampUpState")
  end
  if bEnterRampUpTimerRegistered then
    Callbacks.UnregisterForTimer("EnterRampUpState")
  end
  currentState = kRest
  currentWave = 0
  numAIs = 0
  numAIsKilledThisWave = 0
  numAIsSpawnedThisWave = 0
  stateStartTime = 0
  spawnedEnemyInfo = {}
  allSpawnPoints = {}
  enemyTemplates = {}
  aiSquads = {}
  aiOrders = {}
  customSpawnpoints = {}
  waveInfo = nil
  if Super ~= nil then
    OnAIDeath = Super.OnAIDeath
    PopulateWaveTable = Super.PopulateWaveTable
    NewWave = Super.NewWave
    GetRandomTemplateToSpawn = Super.GetRandomTemplateToSpawn
    SpawnAI = Super.SpawnAI
    StartNewWave = Super.StartNewWave
    EnterRestState = Super.EnterRestState
    GetCurrentWaveDebugText = Super.GetCurrentWaveDebugText
    PlaySoundNewWave = Super.PlaySoundNewWave
    PlaySoundWaveAmbient = Super.PlaySoundWaveAmbient
    PlaySoundWaveOver = Super.PlaySoundWaveOver
  end
  bStaggeredSpawnsRegistered = false
  bRampUpTimerRegistered = false
  bEnterRampUpTimerRegistered = false
  fogEffectSettings.updating = false
  spawnHarvesters = false
end

function DoWaves()
  if not MP.IsClient() then
    PopulateWaveTable()
    spawnPointTimeStamp = Support.GetGameTime()
    Callbacks.RegisterForTimer("UpdateAllSpawnPointList", 3, true)
    Callbacks.RegisterForTimer("CheckForAIDeaths", 2, true)
    currentWave = 0
    spawnedEnemyInfo = {}
    EnterRestState()
    Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerDeathMessage, myObject, "OnAnyDeath")
    RegisterForPlayerStateChanges()
  end
end

function RegisterForPlayerStateChanges()
  local activePlayerList = GetActivePlayers()
  for index, curPlayer in ipairs(activePlayerList) do
    Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, curPlayer.Object, "OnPlayerStateChange")
  end
end

function ExitScript()
  allSpawnPoints = {}
  ImmediateStopHeavyFogAudioEffects()
  if fogEffectSettings.updating then
    Callbacks.UnregisterForTimer("UpdateFogEffectValues")
    fogEffectSettings.updating = false
  end
  UnregisterHeavyFogCameraFilterRegions()
  playersInFogVolumeRefCount = {}
  Support.ExitScript()
end
