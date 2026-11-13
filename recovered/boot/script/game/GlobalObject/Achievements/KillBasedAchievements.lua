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
local achievements = GameScript.Achievements
local notAPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
local player1 = GameScript.PlayerIndex.kGlobalPlayer1
local maxPlayers = GameScript.PlayerIndex.kMaxGlobalPlayers
local nearDeathState = GameScript.ObjectState.NearDeath
local headshotDeathType = GameScript.ScoreDeathType.HeadShot
local meleeDeathType = GameScript.ScoreDeathType.Melee
local grenadeDeathType = GameScript.ScoreDeathType.Grenade
local slowMoActivateMsg = GameScript.MsgCallback.SlowMoActivatedMessage
local slowMoDeactivateMsg = GameScript.MsgCallback.SlowMoDeactivatedMessage
local playerTransferMsg = GameScript.MsgCallback.PlayerTransferControlMessage
local possessionEndedMsg = GameScript.MsgCallback.PossessionEndedMessage
local slideKickKillLeeway = 0.5
local sniperWeaponType = 12
local consecutiveSniperHeadshotsNeeded = 10
local playerSlowMoSlideKickKillTimes = {}
local playerConsecutiveSniperHeadshots = {}
local slowMoOn = false

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
  local victimIndex = Player.GetPlayerIndexByObject(killedObject)
  if ObjectTags.DoesObjectHaveTag(killedObject, "Creep") then
    return
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
  local killerIsPossessed = Game.IsPossessed(killerControlledObject)
  local damageInfo = Death.GetLastDamageInfoFromObject(killedObject)
  local weaponType = damageInfo.weaponType
  local damageType = damageInfo.type
  Game.AwardAchievementOccurrence(killerIndex, achievements.Lots_Of_Kills)
  if slowMoOn then
    Game.AwardAchievementOccurrence(killerIndex, achievements.Slow_Mo_Kills)
  end
  if Death.IsDamagePinning(damageInfo) then
    Game.AwardAchievementOccurrence(killerIndex, achievements.Pinning_Kills)
  end
  if Game.IsSuspended(killedObject) then
    local suspender = Game.GetSuspendingObject(killedObject)
    if suspender ~= nil then
      local suspenderIndex = Player.GetPlayerIndexByObject(suspender)
      if suspenderIndex ~= notAPlayer and suspenderIndex ~= killerIndex then
        Game.AwardAchievementOccurrence(killerIndex, achievements.Kill_Suspended_Enemies)
        Game.AwardAchievementOccurrence(suspenderIndex, achievements.Suspended_Enemies_Killed)
      end
    end
  end
  if info.deathType == headshotDeathType and weaponType == sniperWeaponType then
    if playerConsecutiveSniperHeadshots[killerIndex] == nil then
      playerConsecutiveSniperHeadshots[killerIndex] = 1
    else
      playerConsecutiveSniperHeadshots[killerIndex] = playerConsecutiveSniperHeadshots[killerIndex] + 1
      if playerConsecutiveSniperHeadshots[killerIndex] >= consecutiveSniperHeadshotsNeeded then
        Game.AwardAchievementOccurrence(killerIndex, achievements.Consecutive_Sniper_Headshots)
      end
    end
  else
    playerConsecutiveSniperHeadshots[killerIndex] = 0
  end
  if info.deathType == meleeDeathType then
    local meleeAttack = Game.GetLastMeleeAttack(killerControlledObject)
    if not killerIsFettel then
      if meleeAttack == 7 or meleeAttack == 8 then
        Game.AwardAchievementOccurrence(killerIndex, achievements.Slide_Jump_Kick_Kills)
      end
      if meleeAttack == 7 and slowMoOn then
        local lastSlowMoSlideKickTime = playerSlowMoSlideKickKillTimes[killerIndex]
        if lastSlowMoSlideKickTime ~= nil and currentTime <= lastSlowMoSlideKickTime + slideKickKillLeeway then
          Game.AwardAchievementOccurrence(killerIndex, achievements.Slide_Kick_SlowMo_Multikill)
        end
        playerSlowMoSlideKickKillTimes[killerIndex] = currentTime
      end
    end
    local inventoryItems = Game.GetInventoryItems(killerControlledObject, 1)
    for key, weapon in pairs(inventoryItems) do
      if ObjectTags.DoesObjectHaveTag(weapon, "Crowbar") then
        Debug.PrintInfo("Crowbar Kill!")
        Game.AwardAchievementOccurrence(killerIndex, achievements.Crowbar_Kills)
      end
    end
  end
end

function PlayerTransferredControl(info)
  local newAvatar = info.currentPlayerAvatarObject
  local oldAvatar = info.previousPlayerAvatarObject
  if oldAvatar ~= nil and Game.IsPossessed(oldAvatar) then
    Callbacks.UnregisterForMsg(possessionEndedMsg, oldAvatar, "PlayerEndsPossession")
  end
  if Game.IsPossessed(newAvatar) then
    Callbacks.RegisterForMsg(possessionEndedMsg, newAvatar, "PlayerEndsPossession")
  end
end

function PlayerEndsPossession(msg)
  local index = Player.GetPlayerIndexByObject(msg.possessedObject)
  if index ~= notAPlayer and msg.nType == 3 then
    Game.AwardAchievementOccurrence(index, achievements.Lots_Of_Kills)
  end
end

function OnSlowMoActivated(msg)
  slowMoOn = true
end

function OnSlowMoDeactivated()
  slowMoOn = false
end

local myObject = Game.GetMyObject()
Callbacks.RegisterForMsg(slowMoActivateMsg, myObject, "OnSlowMoActivated")
Callbacks.RegisterForMsg(slowMoDeactivateMsg, myObject, "OnSlowMoDeactivated")
Callbacks.RegisterForMsg(playerTransferMsg, myObject, "PlayerTransferredControl")
Score.RegisterForDeath("OnDeath")
