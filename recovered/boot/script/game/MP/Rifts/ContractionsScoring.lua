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
local Utilities = GameScript.Utilities
local debugPrintEnabled = Support.ImportBoolVariableWithDefault("Debug Print", "Prints score awards to screen", false)
local newWaveMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin New Wave", "")
local beginRestPeriodMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Rest Period", "")
local barrierRepairedMsgId = Support.ImportStaticTextVariableWithDefault("MissionEvent: Barrier Repaired Message", "", 153154)
local ShowSummaryText = Support.ImportStaticTextVariableWithDefault("MissionEvent: Show Summary", "", 144001)
local HideSummaryText = Support.ImportStaticTextVariableWithDefault("MissionEvent: Hide Summary", "", 144002)
local SinglePlayerModifier = Support.ImportFloatVariableWithDefault("Single Player Score Modifier", "Must be between 0 and 1.0", 0.1)
local SinglePlayerMinimumPoints = Support.ImportFloatVariableWithDefault("Single Player Minimum Points", "Minimum modified points", 10)
local WaveBonusValue = Support.ImportFloatVariableWithDefault("Wave Bonus Value", "Team points awarded for the completion of each wave", 1000)
local InvincibleBonusValue = Support.ImportFloatVariableWithDefault("Invincible Bonus Value", "Team points awarded for avoiding last stand during a wave", 500)
local ReviveBonusValue = Support.ImportFloatVariableWithDefault("Revive Bonus Value", "Points awarded for reviving a player", 20)
local BarricadeBonusValue = Support.ImportFloatVariableWithDefault("Barricade Bonus Value", "Points awarded for repairing a barricade", 50)
local CrateBonusValue = Support.ImportFloatVariableWithDefault("Crate Bonus Value", "Points awarded for returning a crate", 200)
local KillsBonusValue = Support.ImportFloatVariableWithDefault("Kills Bonus Value", "Points awarded for killing an enemy", 100)
local myObject = Game.GetMyObject()
local globalPlayer1 = GameScript.PlayerIndex.kGlobalPlayer1
local globalPlayer4 = GameScript.PlayerIndex.kGlobalPlayer4
local maxPlayers = GameScript.PlayerIndex.kMaxGlobalPlayers
local notAPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
local playerTransferMsg = GameScript.MsgCallback.PlayerTransferControlMessage
local usableMsg = GameScript.MsgCallback.UsablesStartUsingMessage
local objectStateChangeMsg = GameScript.MsgCallback.ObjectStateChangeMessage
local missionEventMsg = GameScript.MsgCallback.MissionEventMessage
local nearDeathState = GameScript.ObjectState.NearDeath
local carryingCrateState = GameScript.ObjectState.ShieldsActivated
local ContractionsRevive = GameScript.MissionScoreCategory.ContractionsRevive
local ContractionsKills = GameScript.MissionScoreCategory.ContractionsKills
local ContractionsBarricadeRepair = GameScript.MissionScoreCategory.ContractionsBarricadeRepair
local ContractionsCrates = GameScript.MissionScoreCategory.ContractionsCrates
local ContractionsWaves = GameScript.MissionScoreCategory.ContractionsWaves
local ContractionsInvincible = GameScript.MissionScoreCategory.ContractionsInvincible
local playerAvatars = {}
local playerAvatarNames = {}
local revivingPlayer = {}
local nearDeathPlayers = {}
local waveIsActive = false
local wavesSurvived = 0
local wavesInvincible = 0
local wavePlayersDowned = 0
local msgBonusWaveValue = 0
local msgBonusInvincibleValue = 0

function DebugPrintIfEnabled(message)
  if debugPrintEnabled then
    Debug.PrintToOutputAndScreenWithTimer("SCORE: " .. message, 5, Utilities.kYellow)
  end
end

function ModifyScoreSinglePlayer(value)
  value = value * SinglePlayerModifier
  if value < SinglePlayerMinimumPoints then
    value = SinglePlayerMinimumPoints
  end
  return math.floor(value)
end

function PlayerTransferredControl(info)
  local index = info.globalPlayerIndex
  local newAvatar = info.currentPlayerAvatarObject
  local oldAvatar = info.previousPlayerAvatarObject
  local newAvatarName, oldAvatarName
  local oldAvatarWasMech = false
  local newAvatarIsMech = false
  if oldAvatar ~= nil and Game.IsLoaded(oldAvatar) then
    oldAvatarName = Game.GetName(oldAvatar)
  end
  if oldAvatar ~= nil and Game.IsLoaded(oldAvatar) and (oldAvatar == playerAvatars[index] or oldAvatarName == playerAvatarNames[index]) then
    UnregisterForMessages(oldAvatar)
    oldAvatarWasMech = ObjectTags.DoesObjectHaveTag(oldAvatar, "Power Armor")
  end
  if newAvatar ~= nil and Game.IsLoaded(newAvatar) then
    newAvatarName = Game.GetName(newAvatar)
  end
  if newAvatar ~= nil and Game.IsLoaded(newAvatar) and newAvatar ~= playerAvatars[index] and newAvatarName ~= playerAvatarNames[index] then
    RegisterForMessages(newAvatar)
    newAvatarIsMech = ObjectTags.DoesObjectHaveTag(newAvatar, "Power Armor")
  end
  playerAvatars[index] = newAvatar
  playerAvatarNames[index] = newAvatarName
end

function PlayerStateChanged(info)
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
    nearDeathPlayers[index] = true
    wavesInvincible = 0
    wavePlayersDowned = wavePlayersDowned + 1
  elseif oldState == nearDeathState and newState ~= nearDeathState then
    if not MP.IsClient() then
      local reviverIndex = revivingPlayer[index]
      if reviverIndex == nil then
        Debug.PrintWarning("There was no reviving player for player " .. index .. "!")
      else
        DebugPrintIfEnabled("player " .. reviverIndex + 1 .. " revived a teammate")
        Score.AwardMissionPointOccurences(reviverIndex, ContractionsRevive, 1)
        Score.AwardMissionPoints(reviverIndex, ContractionsRevive, ReviveBonusValue)
      end
      revivingPlayer[index] = nil
      nearDeathPlayers[index] = nil
    end
  elseif oldState == carryingCrateState and newState ~= carryingCrateState and not MP.IsClient() then
    DebugPrintIfEnabled("player " .. index + 1 .. " collected a crate")
    Score.AwardMissionPointOccurences(index, ContractionsCrates, 1)
    crateBonus = CrateBonusValue
    if MP.GetNumberOfActivePlayers() == 1 then
      crateBonus = ModifyScoreSinglePlayer(crateBonus)
    end
    Score.AwardMissionPoints(index, ContractionsCrates, crateBonus)
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
  DebugPrintIfEnabled("player " .. killerIndex + 1 .. " killed an enemy")
  Score.AwardMissionPointOccurences(killerIndex, ContractionsKills, 1)
  killBonus = KillsBonusValue
  if MP.GetNumberOfActivePlayers() == 1 then
    killBonus = ModifyScoreSinglePlayer(killBonus)
  end
  Score.AwardMissionPoints(killerIndex, ContractionsKills, killBonus)
end

function OnMissionEventMessage(msg)
  if msg.textID == newWaveMsgId then
    waveIsActive = true
    wavesInvincible = wavesInvincible + 1
    Score.CalculateMissionScore()
    Score.ResetRoundPoints()
  elseif msg.textID == beginRestPeriodMsgId and waveIsActive then
    wavesSurvived = wavesSurvived + 1
    local waveBonus = WaveBonusValue
    local invincibleBonus = InvincibleBonusValue
    if MP.GetNumberOfActivePlayers() == 1 then
      waveBonus = ModifyScoreSinglePlayer(WaveBonusValue)
      invincibleBonus = ModifyScoreSinglePlayer(InvincibleBonusValue)
    end
    DebugPrintIfEnabled("team completed a wave")
    if 0 < wavesInvincible then
      local invincibleWavePointTable = {
        1,
        1,
        1,
        2,
        2,
        2,
        3,
        3,
        3,
        4,
        4,
        4,
        5,
        5,
        5,
        6,
        6,
        6,
        7,
        7,
        7
      }
      invincibleBonus = invincibleBonus * invincibleWavePointTable[wavesInvincible]
    else
      invincibleBonus = 0
    end
    if not MP.IsClient() then
      for curPlayer = globalPlayer1, globalPlayer4 do
        if Player.IsActivePlayer(curPlayer) then
          if 0 < waveBonus then
            Score.AwardMissionPointOccurences(curPlayer, ContractionsWaves, 1)
            Score.AwardMissionPoints(curPlayer, ContractionsWaves, waveBonus)
          end
          if 0 < invincibleBonus then
            Score.AwardMissionPointOccurences(curPlayer, ContractionsInvincible, 1)
            Score.AwardMissionPoints(curPlayer, ContractionsInvincible, invincibleBonus)
          end
        end
      end
      if wavePlayersDowned == 0 and Game.GetDifficulty() == 4 then
        for key, index in pairs(GameScript.PlayerIndex) do
          if Player.IsActivePlayer(index) then
            Game.AwardAchievementOccurrence(index, GameScript.Achievements.Hard_Wave_No_LS_Contractions)
          end
        end
      end
    end
    msgBonusWaveValue = waveBonus * Score.GetScoreMultiplier()
    msgBonusInvincibleValue = invincibleBonus * Score.GetScoreMultiplier()
    Callbacks.RegisterForTimer("DisplayBonusMessages", 1, false)
    waveIsActive = false
    wavePlayersDowned = 0
  end
end

function ShowSummaryTextDisplay()
  Game.BroadcastMissionEventMessage(__nullobject, ShowSummaryText)
  Callbacks.RegisterForTimer("HideSummaryTextDisplay", 3, false)
end

function HideSummaryTextDisplay()
  Game.BroadcastMissionEventMessage(__nullobject, HideSummaryText)
end

function DisplayBonusMessages()
  local announcementID = FEAR.CreateAnnoucementPacket(globalPlayer1, GameScript.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Contraction Wave Score")
  FEAR.AddNumberValueToAnnouncementPacket(announcementID, msgBonusWaveValue)
  FEAR.SetAnnoucementPacketPriority(announcementID, GameScript.AnnouncementDisplayPriority.kDisplayPriorityMedium)
  FEAR.BroadcastAnnoucementPacket(announcementID)
  announcementID = FEAR.CreateAnnoucementPacket(globalPlayer1, GameScript.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Contraction Survival Bonus")
  FEAR.AddNumberValueToAnnouncementPacket(announcementID, msgBonusInvincibleValue)
  FEAR.SetAnnoucementPacketPriority(announcementID, GameScript.AnnouncementDisplayPriority.kDisplayPriorityMedium)
  FEAR.BroadcastAnnoucementPacket(announcementID)
  msgBonusWaveValue = 0
  msgBonusInvincibleValue = 0
  Callbacks.RegisterForTimer("ShowSummaryTextDisplay", 3, false)
end

function RegisterForMessages(avatar)
  Callbacks.RegisterForMsg(usableMsg, avatar, "PlayerWasUsed")
  Callbacks.RegisterForMsg(objectStateChangeMsg, avatar, "PlayerStateChanged")
end

function UnregisterForMessages(avatar)
  Callbacks.UnregisterForMsg(usableMsg, avatar, "PlayerWasUsed")
  Callbacks.UnregisterForMsg(objectStateChangeMsg, avatar, "PlayerStateChanged")
end

Callbacks.RegisterForMsg(missionEventMsg, myObject, "OnMissionEventMessage")
Callbacks.RegisterForMsg(playerTransferMsg, myObject, "PlayerTransferredControl")
Score.RegisterForDeath("OnDeath")
for index = globalPlayer1, maxPlayers do
  local currentAvatar = Player.GetPlayerControlledObjectByIndex(index)
  if currentAvatar ~= nil then
    local currentName = Game.GetName(currentAvatar)
    playerAvatars[index] = currentAvatar
    playerAvatarNames[index] = currentName
    RegisterForMessages(currentAvatar)
  end
end
