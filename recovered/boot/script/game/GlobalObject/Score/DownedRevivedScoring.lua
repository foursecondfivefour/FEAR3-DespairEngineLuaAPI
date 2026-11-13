local Game = GameScript.Game
local Player = Game.Player
local MP = Game.MP
local Death = Game.Death
local ObjectTags = Game.ObjectTags
local Score = GameScript.FEARScore
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local FEAR = GameScript.FEAR
Support.ExportFloatVariable("Last Downed Player", -1, "The last player who was knocked into last stand")
local myObject = Game.GetMyObject()
local globalPlayer1 = GameScript.PlayerIndex.kGlobalPlayer1
local maxPlayers = GameScript.PlayerIndex.kMaxGlobalPlayers
local notAPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
local headshotDeathType = GameScript.ScoreDeathType.HeadShot
local playerTransferMsg = GameScript.MsgCallback.PlayerTransferControlMessage
local usableMsg = GameScript.MsgCallback.UsablesStartUsingMessage
local objectStateChangeMsg = GameScript.MsgCallback.ObjectStateChangeMessage
local damageMsg = GameScript.MsgCallback.DamageMessage
local sprintStartMsg = GameScript.MsgCallback.SprintStartMessage
local sprintStopMsg = GameScript.MsgCallback.SprintStopMessage
local possessionEndedMsg = GameScript.MsgCallback.PossessionEndedMessage
local objectInteractionStatusMsg = GameScript.MsgCallback.ObjectInteractionStatusMessage
local slowMoRechargedMsg = GameScript.MsgCallback.SlowMoRechargedMessage
local ammoCarrierPickUpMsg = GameScript.MsgCallback.AmmoPickupForCarrierMessage
local firstMeleeMsg = GameScript.MsgCallback.MeleeFirstHitMessage
local nearDeathState = GameScript.ObjectState.NearDeath
local activeCoverState = GameScript.ObjectState.Cover
local reviverMissionCategory = GameScript.MissionScoreCategory.Revive
local saviorKillMissionCategory = GameScript.MissionScoreCategory.SaviorKill
local challenges = GameScript.BoostChallenge
local playerAvatars = {}
local playerAvatarNames = {}
local playerSpawned = {}
local revengeTargets = {}
local revivingPlayer = {}
local revivingHealth = {}
local nearDeathPlayers = {}
local activeCoverPlayers = {}
local numPlayersInActiveCover = 0
local possessingPlayers = {}
local numPlayersPossessing = 0
local fullSlowMoPlayer = notAPlayer
local checkingFullSlowMoPlayer = notAPlayer
local endingPossessionPlayer = notAPlayer
local playerMantleTimes = {}
local playerSlideKickMeleeTimes = {}
local gameIsPaused = false
local inPhantomZone = false
local numLastStandsCurrentMission = 0

function ResetChallenges(index)
  if index ~= notAPlayer then
    Score.ResetChallengeProgress(index, challenges.Kills)
    Score.ResetChallengeProgress(index, challenges.SadKiller)
  end
end

function PlayerTransferredControl(info)
  local index = info.globalPlayerIndex
  local newAvatar = info.currentPlayerAvatarObject
  local oldAvatar = info.previousPlayerAvatarObject
  local newAvatarName, oldAvatarName
  local oldAvatarWasMech = false
  local newAvatarIsMech = false
  local oldAvatarWasPossessed = false
  if oldAvatar ~= nil and Game.IsLoaded(oldAvatar) then
    oldAvatarName = Game.GetName(oldAvatar)
  end
  if newAvatar ~= nil and Game.IsLoaded(newAvatar) then
    newAvatarName = Game.GetName(newAvatar)
  end
  Debug.PrintInfo("MATT: PlayerTransferControl from " .. tostring(oldAvatarName) .. "(" .. tostring(oldAvatar) .. ") to " .. tostring(newAvatarName) .. "(" .. tostring(newAvatar) .. "), currently cached is " .. tostring(playerAvatarNames[index]) .. "(" .. tostring(playerAvatars[index]) .. ")")
  if oldAvatar ~= nil and Game.IsLoaded(oldAvatar) then
    if oldAvatar == playerAvatars[index] or oldAvatarName == playerAvatarNames[index] then
      UnregisterForMessages(oldAvatar)
      oldAvatarWasMech = ObjectTags.DoesObjectHaveTag(oldAvatar, "Power Armor")
      oldAvatarWasPossessed = Game.IsPossessed(oldAvatar)
      if oldAvatarWasPossessed then
        Callbacks.UnregisterForMsg(possessionEndedMsg, oldAvatar, "PlayerEndsPossession")
        possessingPlayers[index] = nil
        numPlayersPossessing = numPlayersPossessing - 1
        if numPlayersPossessing == 0 then
          Callbacks.UnregisterForTimer("PlayerPossessionTick")
        end
        if numPlayersPossessing < 0 then
          numPlayersPossessing = 0
        end
      end
      if activeCoverPlayers[index] ~= nil then
        activeCoverPlayers[index] = nil
        numPlayersInActiveCover = numPlayersInActiveCover - 1
        if numPlayersInActiveCover == 0 then
          Callbacks.UnregisterForTimer("PlayerActiveCoverTick")
        end
        if numPlayersInActiveCover < 0 then
          numPlayersInActiveCover = 0
        end
      end
    else
      Debug.PrintWarning("PlayerTransferredControl avatar mismatch: script thinks the player was " .. tostring(playerAvatarNames[index]) .. "(" .. tostring(playerAvatars[index]) .. ") but the message says it was " .. tostring(oldAvatarName) .. "(" .. tostring(oldAvatar) .. ")")
      if playerAvatars[index] ~= nil then
        UnregisterForMessages(playerAvatars[index])
        oldAvatarWasMech = ObjectTags.DoesObjectHaveTag(playerAvatars[index], "Power Armor")
        oldAvatarWasPossessed = Game.IsPossessed(playerAvatars[index])
        if oldAvatarWasPossessed then
          Callbacks.UnregisterForMsg(possessionEndedMsg, playerAvatars[index], "PlayerEndsPossession")
          possessingPlayers[index] = nil
          numPlayersPossessing = numPlayersPossessing - 1
          if numPlayersPossessing == 0 then
            Callbacks.UnregisterForTimer("PlayerPossessionTick")
          end
          if numPlayersPossessing < 0 then
            numPlayersPossessing = 0
          end
        end
        if activeCoverPlayers[index] ~= nil then
          activeCoverPlayers[index] = nil
          numPlayersInActiveCover = numPlayersInActiveCover - 1
          if numPlayersInActiveCover == 0 then
            Callbacks.UnregisterForTimer("PlayerActiveCoverTick")
          end
          if numPlayersInActiveCover < 0 then
            numPlayersInActiveCover = 0
          end
        end
      end
    end
    playerAvatars[index] = nil
    playerAvatarNames[index] = nil
  end
  if newAvatar ~= nil and Game.IsLoaded(newAvatar) then
    if playerAvatars[index] == nil and playerAvatarNames[index] == nil then
      RegisterForMessages(newAvatar)
      newAvatarIsMech = ObjectTags.DoesObjectHaveTag(newAvatar, "Power Armor")
      if Game.IsPossessed(newAvatar) and possessingPlayers[index] == nil then
        possessingPlayers[index] = true
        if numPlayersPossessing == 0 then
          Callbacks.RegisterForTimer("PlayerPossessionTick", 1, true)
        end
        numPlayersPossessing = numPlayersPossessing + 1
        Callbacks.RegisterForMsg(possessionEndedMsg, newAvatar, "PlayerEndsPossession")
      end
    elseif playerAvatars[index] ~= newAvatar then
      if playerAvatarNames[index] ~= newAvatarName then
        Debug.PrintWarning("PlayerTransferredControl avatar mismatch: script thinks the player is " .. tostring(playerAvatarNames[index]) .. "(" .. tostring(playerAvatars[index]) .. ") but the message says it is " .. tostring(newAvatarName) .. "(" .. tostring(newAvatar) .. ")")
      else
        Debug.PrintWarning("PlayerTransferredControl avatar mismatch: message refers to a different object (script is" .. tostring(playerAvatars[index]) .. ", msg is " .. tostring(newAvatar) .. "), but they have the same name (" .. tostring(playerAvatarNames[index]) .. ")")
      end
      oldAvatar = playerAvatars[index]
      if oldAvatar ~= nil and Game.IsLoaded(oldAvatar) then
        UnregisterForMessages(oldAvatar)
        oldAvatarWasMech = ObjectTags.DoesObjectHaveTag(oldAvatar, "Power Armor")
        oldAvatarWasPossessed = Game.IsPossessed(oldAvatar)
        if oldAvatarWasPossessed then
          Callbacks.UnregisterForMsg(possessionEndedMsg, oldAvatar, "PlayerEndsPossession")
          possessingPlayers[index] = nil
          numPlayersPossessing = numPlayersPossessing - 1
          if numPlayersPossessing == 0 then
            Callbacks.UnregisterForTimer("PlayerPossessionTick")
          end
          if numPlayersPossessing < 0 then
            numPlayersPossessing = 0
          end
        end
      end
      UnregisterForMessages(newAvatar)
      RegisterForMessages(newAvatar)
      newAvatarIsMech = ObjectTags.DoesObjectHaveTag(newAvatar, "Power Armor")
      if Game.IsPossessed(newAvatar) and possessingPlayers[index] == nil then
        possessingPlayers[index] = true
        if numPlayersPossessing == 0 then
          Callbacks.RegisterForTimer("PlayerPossessionTick", 1, true)
        end
        numPlayersPossessing = numPlayersPossessing + 1
        Callbacks.RegisterForMsg(possessionEndedMsg, newAvatar, "PlayerEndsPossession")
      end
    end
    playerAvatars[index] = newAvatar
    playerAvatarNames[index] = newAvatarName
    if playerSpawned[index] == false then
      playerSpawned[index] = true
      if FEAR.GetSlowMoPercentRemaining(newAvatar) == 1 then
        PlayerHasFullSlowMo(newAvatar, index)
      end
    end
  end
  if oldAvatarWasMech and not newAvatarIsMech and not inPhantomZone then
    Score.ResetBoostProgress(index, challenges.MechAssault)
  end
  if oldAvatarWasPossessed and not newAvatarIsMech then
    Score.ResetBoostProgress(index, challenges.HostStreak)
    Score.ResetBoostProgress(index, challenges.HostHeadShots)
    Score.ResetBoostProgress(index, challenges.ExtendedStay)
    Score.ResetBoostProgress(index, challenges.WadeGhostPossessKillsSingle)
  end
end

function PlayerStateChanged(info)
  if MP.IsClient() then
    return
  end
  local avatar = info.object
  if avatar == nil then
    return
  end
  local index = Player.GetPlayerIndexByObject(avatar)
  if index == notAPlayer then
    return
  end
  local oldState = info.oldState
  local newState = info.newState
  if oldState ~= nearDeathState and newState == nearDeathState then
    ResetChallenges(index)
    nearDeathPlayers[index] = true
    numLastStandsCurrentMission = numLastStandsCurrentMission + 1
  elseif oldState == nearDeathState and newState ~= nearDeathState then
    revengeTargets[index] = nil
    local reviverIndex = revivingPlayer[index]
    if reviverIndex == nil then
    else
      local remainingHealth = revivingHealth[index]
      if remainingHealth ~= nil and 0.85 < remainingHealth then
        Score.AwardBoostRequirement(reviverIndex, challenges.PickUpArtist, 1)
      end
    end
    revivingPlayer[index] = nil
    nearDeathPlayers[index] = nil
    Score.ResetChallengeProgress(index, challenges.LastStandKills)
  end
  if oldState ~= activeCoverState and newState == activeCoverState then
    if activeCoverPlayers[index] == nil then
      activeCoverPlayers[index] = true
      if numPlayersInActiveCover == 0 then
        Callbacks.RegisterForTimer("PlayerActiveCoverTick", 1, true)
      end
      numPlayersInActiveCover = numPlayersInActiveCover + 1
    end
  elseif oldState == activeCoverState and newState ~= activeCoverState and activeCoverPlayers[index] ~= nil then
    activeCoverPlayers[index] = nil
    numPlayersInActiveCover = numPlayersInActiveCover - 1
    if numPlayersInActiveCover == 0 then
      Callbacks.UnregisterForTimer("PlayerActiveCoverTick")
    end
    if numPlayersInActiveCover < 0 then
      numPlayersInActiveCover = 0
    end
  end
end

function PlayerActiveCoverTick()
  if gameIsPaused then
    return
  end
  for index, value in pairs(activeCoverPlayers) do
    if value ~= nil then
      Score.AwardBoostRequirement(index, challenges.PitchingTent, 1)
      Score.AwardBoostRequirement(index, challenges.CampALot, 1)
    end
  end
end

function PlayerWasUsed(info)
  if MP.IsClient() then
    return
  end
  local avatarUsed = info.usedObject
  if avatarUsed == nil then
    return
  end
  local usedPlayerIndex = Player.GetPlayerIndexByObject(avatarUsed)
  if usedPlayerIndex == notAPlayer then
    return
  end
  local userPlayerIndex = info.userPlayerIndex
  if userPlayerIndex == notAPlayer then
    return
  end
  if userPlayerIndex == usedPlayerIndex then
    return
  end
  revivingPlayer[usedPlayerIndex] = userPlayerIndex
  revivingHealth[usedPlayerIndex] = Game.GetSpecificHitPointPercent(avatarUsed, "NearDeathHealth")
end

function PlayerTookDamage(msg)
  local playerObj = msg.damagedObject
  local playerIndex = Player.GetPlayerIndexByObject(playerObj)
  local damageAmount = msg.fDamage
  if playerIndex == notAPlayer then
    return
  end
  Score.ResetChallengeProgress(playerIndex, challenges.Invincible)
  Score.ResetChallengeProgress(playerIndex, challenges.Godlike)
  Score.ResetChallengeProgress(playerIndex, challenges.WadeCreepRepel)
  if Game.IsSuspended(playerObj) then
    local shieldingObj = Game.GetSuspendingObject(playerObj)
    local shieldingIndex = Player.GetPlayerIndexByObject(shieldingObj)
    local damageIndex = msg.nSrcPlayerIndex
    if shieldingIndex ~= notAPlayer and shieldingIndex ~= damageIndex and damageIndex ~= playerIndex then
      Score.AwardChallengeRequirement(playerIndex, challenges.ShieldPrevent, damageAmount)
      Score.AwardChallengeRequirement(shieldingIndex, challenges.ShieldPrevent, damageAmount)
    end
  end
end

function DamageWasExplosive(dmgType)
  return dmgType == 2 or dmgType == 25 or dmgType == 27 or dmgType == 31
end

function PlayerEndsPossession(msg)
  local index = Player.GetPlayerIndexByObject(msg.possessedObject)
  if index ~= notAPlayer and msg.nType == 3 then
    endingPossessionPlayer = index
    Callbacks.RegisterForTimer("PlayerEndPossessionTimerCallback", 0.5, false)
  end
end

function PlayerEndPossessionTimerCallback()
  if endingPossessionPlayer == notAPlayer then
    Debug.PrintError("Calling PlayerEndPossessionTimerCallback when we don't have a player who ended possession!")
    return
  end
  Score.AwardBoostRequirement(endingPossessionPlayer, challenges.Multitasking, 1)
  Score.AwardBoostRequirement(endingPossessionPlayer, challenges.Kills, 1)
  Score.AwardBoostRequirement(endingPossessionPlayer, challenges.SadKiller, 1)
  Score.AwardMissionPointOccurences(endingPossessionPlayer, GameScript.MissionScoreCategory.Kills, 1)
  endingPossessionPlayer = notAPlayer
end

function PlayerPossessionTick()
  if gameIsPaused then
    return
  end
  for index, value in pairs(possessingPlayers) do
    if value ~= nil then
      Score.AwardBoostRequirement(index, challenges.NiceWheels, 1)
      Score.AwardBoostRequirement(index, challenges.Intruder, 1)
      Score.AwardBoostRequirement(index, challenges.ExtendedStay, 1)
    end
  end
end

function PlayerInteractedWithObject(msg)
  local index = Player.GetPlayerIndexByObject(msg.listenerObject)
  if index ~= notAPlayer and msg.state == 1 and (msg.interactionIndex == 4 or msg.interactionIndex == 5 or msg.interactionIndex == 15 or msg.interactionIndex == 16) then
    local currentTime = Support.GetGameTime()
    playerMantleTimes[index] = currentTime
  end
end

function PlayerHasFullSlowMo(avatar, playerIndex)
  local index = playerIndex
  if playerIndex == nil then
    index = Player.GetPlayerIndexByObject(avatar)
  end
  if index ~= notAPlayer then
    if index == fullSlowMoPlayer then
      return
    end
    if fullSlowMoPlayer ~= notAPlayer then
      Debug.PrintWarning("We have more than one player with full slow-mo! Fix the DownedRevivedScoring.lua!")
      return
    end
    fullSlowMoPlayer = index
  end
end

function SlowMoStarted(msg)
  if msg.bPlayerOriginated == true then
    if fullSlowMoPlayer ~= notAPlayer then
      checkingFullSlowMoPlayer = fullSlowMoPlayer
    end
    fullSlowMoPlayer = notAPlayer
  end
end

function SlowMoEnded()
  if checkingFullSlowMoPlayer ~= notAPlayer then
    local avatar = Player.GetPlayerAvatarObjectByIndex(checkingFullSlowMoPlayer)
    if avatar ~= nil and FEAR.GetSlowMoPercentRemaining(avatar) == 0 then
      Score.AwardBoostRequirement(checkingFullSlowMoPlayer, challenges.BigSpender, 1)
    end
  end
  checkingFullSlowMoPlayer = notAPlayer
end

function PlayerPickedUpAmmo(msg)
  local avatar = msg.carrierObject
  if avatar ~= nil then
    local index = Player.GetPlayerIndexByObject(avatar)
    if index ~= notAPlayer then
      Score.AwardBoostRequirement(index, challenges.JunkCollectorLow, 1)
      Score.AwardBoostRequirement(index, challenges.JunkCollector, 1)
      Score.AwardBoostRequirement(index, challenges.CollectionAgent, 1)
    end
  end
end

function PlayerHasMeleed(msg)
  local avatar = msg.attacker
  if avatar ~= nil and (ObjectTags.DoesObjectHaveTag(avatar, "Point Man") or Game.IsPossessed(avatar)) and msg.attack == 7 then
    local index = Player.GetPlayerIndexByObject(avatar)
    if index ~= notAPlayer then
      playerSlideKickMeleeTimes[index] = Support.GetGameTime()
    end
  end
end

function OnDeath(info)
  local killerIndex = info.killerPlayerIndex
  local killedObject = info.killedObject
  if killerIndex == notAPlayer then
    return
  end
  if killedObject == nil or not Game.IsLoaded(killedObject) then
    return
  end
  if ObjectTags.DoesObjectHaveTag(killedObject, "Creep") then
    return
  end
  local killerControlledObject = Player.GetPlayerControlledObjectByIndex(killerIndex)
  local killerIsMech = ObjectTags.DoesObjectHaveTag(killerControlledObject, "Power Armor")
  local killerIsPointMan = ObjectTags.DoesObjectHaveTag(killerControlledObject, "Point Man")
  local killerIsPossessed = Game.IsPossessed(killerControlledObject)
  Score.AwardBoostRequirement(killerIndex, challenges.Invincible, 1)
  Score.AwardBoostRequirement(killerIndex, challenges.Godlike, 1)
  if killerIsMech then
    Score.AwardBoostRequirement(killerIndex, challenges.MechAssault, 1)
  end
  if nearDeathPlayers[killerIndex] == true then
    Score.AwardBoostRequirement(killerIndex, challenges.LastStandKills, 1)
  end
  for index, target in pairs(revengeTargets) do
    if target ~= nil and target == killedObject then
      if index == killerIndex then
      else
        Score.AwardMissionPointOccurences(killerIndex, saviorKillMissionCategory, 1)
      end
      revengeTargets[index] = nil
    end
  end
  local currentTime = Support.GetGameTime()
  if playerMantleTimes[killerIndex] ~= nil and currentTime <= playerMantleTimes[killerIndex] + 3 then
    Score.AwardBoostRequirement(killerIndex, challenges.Parkour, 1)
    Score.AwardBoostRequirement(killerIndex, challenges.ParkourLow, 1)
  end
  if playerSlideKickMeleeTimes[killerIndex] ~= nil and currentTime <= playerSlideKickMeleeTimes[killerIndex] + 3 and info.deathType ~= GameScript.ScoreDeathType.Melee then
    Score.AwardBoostRequirement(killerIndex, challenges.SlideShot, 1)
  end
  if possessingPlayers[killerIndex] ~= nil then
    Score.AwardBoostRequirement(killerIndex, challenges.HostKills, 1)
    Score.AwardBoostRequirement(killerIndex, challenges.MegaHostKills, 1)
    Score.AwardBoostRequirement(killerIndex, challenges.HostStreak, 1)
    if info.deathType == headshotDeathType then
      Score.AwardBoostRequirement(killerIndex, challenges.HostHeadShots, 1)
    end
    if ObjectTags.DoesObjectHaveTag(killedObject, "WadeGhostSoldier") then
      Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostPossessKills, 1)
      Score.AwardBoostRequirement(killerIndex, challenges.WadeGhostPossessKillsSingle, 1)
    end
  end
  local victimIndex = Player.GetPlayerIndexByObject(killedObject)
  if victimIndex == notAPlayer then
    return
  end
  if killedObject == playerAvatars[victimIndex] or Game.GetName(killedObject) == playerAvatarNames[victimIndex] then
    UnregisterForMessages(killedObject)
  end
  if activeCoverPlayers[victimIndex] ~= nil then
    activeCoverPlayers[victimIndex] = nil
    numPlayersInActiveCover = numPlayersInActiveCover - 1
    if numPlayersInActiveCover == 0 then
      Callbacks.UnregisterForTimer("PlayerActiveCoverTick")
    end
    if numPlayersInActiveCover < 0 then
      numPlayersInActiveCover = 0
    end
  end
  if possessingPlayers[victimIndex] ~= nil then
    possessingPlayers[victimIndex] = nil
    numPlayersPossessing = numPlayersPossessing - 1
    if numPlayersPossessing == 0 then
      Callbacks.UnregisterForTimer("PlayerPossessionTick")
    end
  end
end

function RegisterForMessages(avatar)
  Callbacks.RegisterForMsg(usableMsg, avatar, "PlayerWasUsed")
  Callbacks.RegisterForMsg(objectStateChangeMsg, avatar, "PlayerStateChanged")
  Callbacks.RegisterForMsg(damageMsg, avatar, "PlayerTookDamage")
  Callbacks.RegisterForMsg(objectInteractionStatusMsg, avatar, "PlayerInteractedWithObject")
  Callbacks.RegisterForMsg(slowMoRechargedMsg, avatar, "PlayerHasFullSlowMo")
  Callbacks.RegisterForMsg(ammoCarrierPickUpMsg, avatar, "PlayerPickedUpAmmo")
  Callbacks.RegisterForMsg(firstMeleeMsg, avatar, "PlayerHasMeleed")
end

function UnregisterForMessages(avatar)
  Callbacks.UnregisterForMsg(usableMsg, avatar, "PlayerWasUsed")
  Callbacks.UnregisterForMsg(objectStateChangeMsg, avatar, "PlayerStateChanged")
  Callbacks.UnregisterForMsg(damageMsg, avatar, "PlayerTookDamage")
  Callbacks.UnregisterForMsg(objectInteractionStatusMsg, avatar, "PlayerInteractedWithObject")
  Callbacks.UnregisterForMsg(slowMoRechargedMsg, avatar, "PlayerHasFullSlowMo")
  Callbacks.UnregisterForMsg(ammoCarrierPickUpMsg, avatar, "PlayerPickedUpAmmo")
  Callbacks.UnregisterForMsg(firstMeleeMsg, avatar, "PlayerHasMeleed")
end

function GamePaused(msg)
  gameIsPaused = msg.paused
end

function OnTextMsg(msg)
  if msg.text == "Phantom Zone Start" then
    inPhantomZone = true
  elseif msg.text == "Phantom Zone End" then
    inPhantomZone = false
  elseif msg.text == "Mission Started" then
    numLastStandsCurrentMission = 0
  elseif msg.text == "Mission Ended" then
    if numLastStandsCurrentMission == 0 and not Score.GetGameLoadedSinceMissionStarted() then
      local lowestDifficultyUsed = Score.GetLowestDifficultyUsed()
      for index = globalPlayer1, maxPlayers do
        if index ~= nil and Player.IsActivePlayer(index) and GameScript.MissionScoreCategory.CleanRunBonus then
          Score.AwardMissionPointOccurences(index, GameScript.MissionScoreCategory.CleanRunBonus, lowestDifficultyUsed)
        end
      end
    end
    if 0 < numPlayersPossessing then
      numPlayersPossessing = 0
      possessingPlayers = {}
      Callbacks.UnregisterForTimer("PlayerPossessionTick")
    end
    if 0 < numPlayersInActiveCover then
      numPlayersInActiveCover = 0
      activeCoverPlayers = {}
      Callbacks.UnregisterForTimer("PlayerActiveCoverTick")
    end
  end
end

function RegisterForGameMessages()
  Callbacks.RegisterForMsg(playerTransferMsg, myObject, "PlayerTransferredControl")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PauseGameMessage, myObject, "GamePaused")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, myObject, "OnTextMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.SlowMoActivatedMessage, myObject, "SlowMoStarted")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.SlowMoDeactivatedMessage, myObject, "SlowMoEnded")
end

function GetInitialPlayerData()
  for index = globalPlayer1, maxPlayers do
    playerSpawned[index] = false
    local currentAvatar = Player.GetPlayerControlledObjectByIndex(index)
    if currentAvatar ~= nil then
      local currentName = Game.GetName(currentAvatar)
      playerAvatars[index] = currentAvatar
      playerAvatarNames[index] = currentName
      playerSpawned[index] = true
      RegisterForMessages(currentAvatar)
      if FEAR.GetSlowMoPercentRemaining(currentAvatar) == 1 then
        PlayerHasFullSlowMo(currentAvatar, index)
      end
      if Game.IsPossessed(currentAvatar) and possessingPlayers[index] == nil then
        possessingPlayers[index] = true
        if numPlayersPossessing == 0 then
          Callbacks.RegisterForTimer("PlayerPossessionTick", 1, true)
        end
        numPlayersPossessing = numPlayersPossessing + 1
        Callbacks.RegisterForMsg(possessionEndedMsg, currentAvatar, "PlayerEndsPossession")
      end
    end
  end
end

function OnCheckpointReload()
  Callbacks.RegisterForTimer("DummyFunc", 0, false)
  Callbacks.UnregisterAllMsgCallbacks()
  fullSlowMoPlayer = notAPlayer
  checkingFullSlowMoPlayer = notAPlayer
  possessingPlayers = {}
  if 0 < numPlayersPossession then
    Callbacks.UnregisterForTimer("PlayerPossessionTick")
  end
  numPlayersPossessing = 0
  RegisterForGameMessages()
  GetInitialPlayerData()
  Callbacks.UnregisterForTimer("DummyFunc")
end

RegisterForGameMessages()
Callbacks.RegisterForPostCheckpointActivation("OnCheckpointReload")
Score.RegisterForDeath("OnDeath")
GetInitialPlayerData()
