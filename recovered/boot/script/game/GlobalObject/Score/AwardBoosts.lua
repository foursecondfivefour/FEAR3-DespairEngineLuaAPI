local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Player = Game.Player
local Score = GameScript.FEARScore
local Death = Game.Death
local Debug = GameScript.Debug
local ObjectTags = Game.ObjectTags
local Utilities = GameScript.Utilities
local MP = Game.MP
local notAPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
local player1 = GameScript.PlayerIndex.kGlobalPlayer1
local maxPlayers = GameScript.PlayerIndex.kMaxGlobalPlayers
local headshotDeathType = GameScript.ScoreDeathType.HeadShot
local meleeDeathType = GameScript.ScoreDeathType.Melee
local grenadeDeathType = GameScript.ScoreDeathType.Grenade
local grenadeDeathLeeway = 0.5
local slideKickKillLeeway = 0.5
local slowMoActivateMsg = GameScript.MsgCallback.SlowMoActivatedMessage
local slowMoDeactivateMsg = GameScript.MsgCallback.SlowMoDeactivatedMessage
local aiFlashBangMsg = GameScript.MsgCallback.AIFlashBangMessage
local pauseMsg = GameScript.MsgCallback.PauseGameMessage
local challenges = GameScript.BoostChallenge
local uziWeaponType = 3
local smgWeaponType = 4
local shotgunWeaponType = 5
local rocketWeaponType = 6
local pistolWeaponType = 7
local arWeaponType = 8
local sniperWeaponType = 12
local penetratorWeaponType = 13
local fragGenadeWeaponType = 16
local zapGrenadeWeaponType = 18
local beamWeaponType = 19
local stunWeaponType = 20
local riotShieldWeaponType = 22
local suspendWeaponType = 23
local stompDamageType = "Mech MeleeStomp"
local suicideMineDamageType = "Suicide Mine"
local bulletMechDamageType = "Bullet Mech"
local playerKillTimes = {}
local playerGrenadeKillTimes = {}
local recentKillRecords = {}
local slowMoOn = false
local playerSlowMoOn = false
local pointManSlowMoIndex = notAPlayer
local highlightReelTracking = {}
local gameIsPaused = false

function OnDeath(info)
  if MP.IsClient() then
    return
  end
  local killerIndex = info.killerPlayerIndex
  local killedObject = info.killedObject
  local currentTime = Support.GetGameTime()
  if killedObject == nil or not Game.IsLoaded(killedObject) then
    return
  end
  if ObjectTags.DoesObjectHaveTag(killedObject, "Creep") then
    return
  end
  local victimIndex = Player.GetPlayerIndexByObject(killedObject)
  if victimIndex ~= notAPlayer then
    ResetAllBoosts(victimIndex)
  end
  if killerIndex == notAPlayer then
    return
  end
  local killerControlledObject = Player.GetPlayerControlledObjectByIndex(killerIndex)
  local killerAvatarObject = Player.GetPlayerAvatarObjectByIndex(killerIndex)
  if not (killerControlledObject ~= nil and Game.IsLoaded(killerControlledObject)) or killerAvatarObject == nil or not Game.IsLoaded(killerAvatarObject) then
    return
  end
  if victimIndex == killerIndex then
    return
  end
  local killerIsPointMan = ObjectTags.DoesObjectHaveTag(killerControlledObject, "Point Man")
  local killerIsFettel = ObjectTags.DoesObjectHaveTag(killerControlledObject, "Fettel")
  local killerIsMech = ObjectTags.DoesObjectHaveTag(killerControlledObject, "Power Armor")
  local killerIsPossessed = Game.IsPossessed(killerControlledObject)
  local pointManIndex = notAPlayer
  if killerIsPointMan then
    pointManIndex = killerIndex
  else
    local pointManTable = ObjectTags.GetObjectsWithTag("Point Man")
    for key, pointMan in pairs(pointManTable) do
      pointManIndex = Player.GetPlayerIndexByObject(pointMan)
    end
  end
  local damageInfo = Death.GetLastDamageInfoFromObject(killedObject)
  local weaponType = damageInfo.weaponType
  local damageType = damageInfo.type
  Score.AwardBoostRequirement(killerIndex, challenges.Kills, 1)
  Score.AwardBoostRequirement(killerIndex, challenges.SadKiller, 1)
  local inActiveCover = Game.IsActiveCoverOn(killerControlledObject)
  if inActiveCover then
    Score.AwardBoostRequirement(killerIndex, challenges.Covert, 1)
    Score.AwardBoostRequirement(killerIndex, challenges.CoverUp, 1)
    if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
      Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostCoverKills, 1)
    end
  end
  if Game.IsSuspended(killedObject) then
    local suspender = Game.GetSuspendingObject(killedObject)
    if suspender ~= nil then
      local suspenderIndex = Player.GetPlayerIndexByObject(suspender)
      if suspenderIndex ~= notAPlayer and suspenderIndex ~= killerIndex then
        Score.AwardBoostRequirement(killerIndex, challenges.Hangman, 1)
        Score.AwardBoostRequirement(suspenderIndex, challenges.Hangman, 1)
      end
    end
  end
  if slowMoOn then
    if killerIndex == pointManIndex then
      Score.AwardBoostRequirement(killerIndex, challenges.Slowly, 1)
      Score.AwardBoostRequirement(killerIndex, challenges.Plaid, 1)
      Score.AwardBoostRequirement(killerIndex, challenges.SlowYourRole, 1)
      if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
        Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostSloMoSingle, 1)
        Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostSloMo, 1)
      end
    end
    if Utilities.IsFettelIndex(killerIndex) and playerSlowMoOn then
      Score.AwardBoostRequirement(killerIndex, challenges.FettelSloMo, 1)
      if pointManIndex ~= notAPlayer then
        Score.AwardBoostRequirement(pointManIndex, challenges.FettelSloMo, 1)
      end
    end
  end
  if info.deathType == headshotDeathType then
    Score.AwardBoostRequirement(killerIndex, challenges.Headshots, 1)
    Score.AwardBoostRequirement(killerIndex, challenges.MegaHeadshots, 1)
    if slowMoOn and killerIndex == pointManIndex then
      Score.AwardBoostRequirement(killerIndex, challenges.PerfectSoldier, 1)
    end
    if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
      Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostHeadShot, 1)
    end
  end
  if info.deathType == meleeDeathType then
    Score.AwardBoostRequirement(killerIndex, challenges.MeleeKills, 1)
    if killerIsMech then
      Score.AwardBoostRequirement(killerIndex, challenges.WarMachine, 1)
    else
      local meleeAttack = Game.GetLastMeleeAttack(killerControlledObject)
      if killerIsPointMan or killerIsPossessed then
        if meleeAttack == 5 then
          Score.AwardBoostRequirement(killerIndex, challenges.AmericanMe, 1)
        end
      elseif killerIsFettel then
        if meleeAttack == 2 then
          Score.AwardBoostRequirement(killerIndex, challenges.Crusher, 1)
          if pointManIndex ~= notAPlayer then
            Score.AwardBoostRequirement(pointManIndex, challenges.Crusher, 1)
          end
        elseif meleeAttack == 3 then
          Score.AwardBoostRequirement(killerIndex, challenges.AmericanMe, 1)
        end
      end
      if killerIsPointMan and slowMoOn and highlightReelTracking[meleeAttack] ~= true then
        highlightReelTracking[meleeAttack] = true
        Score.AwardBoostRequirement(killerIndex, challenges.HighlightReel, 1)
      end
      if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
        Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostMeleeKills, 1)
      end
    end
  end
  local isGrenadeKill = info.deathType == grenadeDeathType
  if isGrenadeKill then
    local lastGrenadeKillTime = playerGrenadeKillTimes[killerIndex]
    if lastGrenadeKillTime == nil or currentTime > lastGrenadeKillTime + grenadeDeathLeeway then
      Score.ResetBoostProgress(killerIndex, challenges.GrenadeKills)
    end
    Score.AwardBoostRequirement(killerIndex, challenges.GrenadeKills, 1)
    playerGrenadeKillTimes[killerIndex] = currentTime
    if weaponType ~= -1 and weaponType ~= 6 and weaponType ~= 10 and weaponType ~= 15 and weaponType ~= 16 and weaponType ~= 17 and weaponType ~= 18 and weaponType ~= 21 and weaponType ~= 23 then
      Score.AwardBoostRequirement(killerIndex, challenges.FragFest, 1)
    elseif killerIsMech and damageType ~= bulletMechDamageType and damageType ~= stompDamageType and (weaponType == -1 or weaponType == 19) then
      Score.AwardBoostRequirement(killerIndex, challenges.FragFest, 1)
    end
  end
  if not killerIsMech then
    AwardWeaponTypeKill(killerIndex, weaponType, isGrenadeKill, killedObject)
  end
  if damageType == stompDamageType then
    Score.AwardBoostRequirement(killerIndex, challenges.WarMachine, 1)
    Score.AwardBoostRequirement(killerIndex, challenges.MeleeKills, 1)
  end
  if damageType == suicideMineDamageType and not isGrenadeKill then
    Score.AwardBoostRequirement(killerIndex, challenges.FragFest, 1)
  end
end

function AwardWeaponTypeKill(killerIndex, weaponType, isGrenadeKill, killedObject)
  if not isGrenadeKill then
    if weaponType == uziWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.BulletHose, 1)
      if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
        Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostUziKills, 1)
      end
    elseif weaponType == smgWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.Standard, 1)
    elseif weaponType == shotgunWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.Boomstick, 1)
      if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
        Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostShotgunKills, 1)
      end
    elseif weaponType == pistolWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.PopGun, 1)
      if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
        Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostHGKills, 1)
      end
    elseif weaponType == arWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.AssaultPro, 1)
      if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
        Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostARKills, 1)
      end
    elseif weaponType == sniperWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.SniperKills, 1)
    elseif weaponType == penetratorWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.Ventilation, 1)
    elseif weaponType == beamWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.LaserPointer, 1)
    elseif weaponType == stunWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.LittleBrother, 1)
      if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
        Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostStunKills, 1)
      end
    elseif weaponType == riotShieldWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.RiotShield, 1)
    elseif weaponType == suspendWeaponType then
      Score.AwardBoostRequirement(killerIndex, challenges.ISuck, 1)
    end
  end
  if weaponType == rocketWeaponType then
    Score.AwardBoostRequirement(killerIndex, challenges.Hurricane, 1)
  elseif weaponType == fragGenadeWeaponType then
    Score.AwardBoostRequirement(killerIndex, challenges.Potato, 1)
  elseif weaponType == zapGrenadeWeaponType then
    Score.AwardBoostRequirement(killerIndex, challenges.Shocker, 1)
  end
end

function OnSlowMoActivated(msg)
  slowMoOn = true
  if msg.bPlayerOriginated == true then
    playerSlowMoOn = true
    Callbacks.RegisterForGlobalTimer("SlowMoTick", 1, true)
    if pointManSlowMoIndex == notAPlayer then
      local pointManObjects = ObjectTags.GetObjectsWithTag("Point Man")
      for key, object in pairs(pointManObjects) do
        pointManSlowMoIndex = Player.GetPlayerIndexByObject(object)
      end
    end
  end
end

function OnSlowMoDeactivated()
  if playerSlowMoOn then
    Callbacks.UnregisterForTimer("SlowMoTick")
  end
  slowMoOn = false
  playerSlowMoOn = false
  for index = player1, maxPlayers do
    if Player.IsActivePlayer(index) then
      Score.ResetBoostProgress(index, challenges.SlowYourRole)
      Score.ResetBoostProgress(index, challenges.PerfectSoldier)
      Score.ResetBoostProgress(index, challenges.HighlightReel)
      Score.ResetBoostProgress(index, challenges.WadeGhostSloMoSingle)
    end
  end
  highlightReelTracking = {}
end

function SlowMoTick()
  if gameIsPaused then
    return
  end
  if pointManSlowMoIndex ~= notAPlayer then
    Score.AwardBoostRequirement(pointManSlowMoIndex, challenges.Reflexes, 1)
    Score.AwardBoostRequirement(pointManSlowMoIndex, challenges.NothingDouble, 1)
  end
end

function ResetAllBoosts(killedPlayerIndex)
  for key, boost in pairs(challenges) do
    Score.ResetBoostProgress(killedPlayerIndex, boost)
  end
  if Utilities.IsPointManIndex(killedPlayerIndex) then
    highlightReelTracking = {}
  end
end

function OnAIFlashBanged(msg)
  if msg.srcPlayerIndex ~= notAPlayer then
    Score.AwardBoostRequirement(msg.srcPlayerIndex, challenges.Exposure, 1)
  end
end

function GamePaused(msg)
  gameIsPaused = msg.paused
end

function OnTextMessage(msg)
  if msg.text == "Mission Ended" and playerSlowMoOn then
    playerSlowMoOn = false
    Callbacks.UnregisterForTimer("SlowMoTick")
  end
end

local myObject = Game.GetMyObject()
Callbacks.RegisterForMsg(slowMoActivateMsg, myObject, "OnSlowMoActivated")
Callbacks.RegisterForMsg(slowMoDeactivateMsg, myObject, "OnSlowMoDeactivated")
Callbacks.RegisterForMsg(aiFlashBangMsg, myObject, "OnAIFlashBanged")
Callbacks.RegisterForMsg(pauseMsg, myObject, "GamePaused")
Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, myObject, "OnTextMsg")
Score.RegisterForDeath("OnDeath")
