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
local Util = GameScript.Utilities
local globalPlayer1 = GameScript.PlayerIndex.kGlobalPlayer1
local maxPlayers = GameScript.PlayerIndex.kMaxGlobalPlayers
local playerTransferMsg = GameScript.MsgCallback.PlayerTransferControlMessage
local usableMsg = GameScript.MsgCallback.UsablesStartUsingMessage
local objectStateChangeMsg = GameScript.MsgCallback.ObjectStateChangeMessage
local nearDeathState = GameScript.ObjectState.NearDeath
local playerAvatars = {}
local playerAvatarNames = {}
local revivingPlayer = {}
local nearDeathPlayers = {}
local numNearDeaths = 0

function PlayerTransferredControl(info)
  local index = info.globalPlayerIndex
  local newAvatar = info.currentPlayerAvatarObject
  local oldAvatar = info.previousPlayerAvatarObject
  local newAvatarName, oldAvatarName
  if oldAvatar ~= nil and Game.IsLoaded(oldAvatar) then
    oldAvatarName = Game.GetName(oldAvatar)
  end
  if oldAvatar ~= nil and Game.IsLoaded(oldAvatar) then
    if oldAvatar == playerAvatars[index] or oldAvatarName == playerAvatarNames[index] then
      UnregisterForMessages(oldAvatar)
    elseif playerAvatars[index] ~= nil then
      Debug.PrintWarning("PlayerTransferredControl avatar mismatch: script thinks the player was " .. tostring(playerAvatarNames[index]) .. " but the message says it was " .. tostring(oldAvatarName))
      UnregisterForMessages(playerAvatars[index])
    end
    playerAvatars[index] = nil
    playerAvatarNames[index] = nil
  end
  if newAvatar ~= nil and Game.IsLoaded(newAvatar) then
    newAvatarName = Game.GetName(newAvatar)
  end
  if newAvatar ~= nil and Game.IsLoaded(newAvatar) then
    if playerAvatars[index] == nil and playerAvatarNames[index] == nil then
      RegisterForMessages(newAvatar)
    elseif playerAvatars[index] ~= newAvatar then
      if playerAvatarNames[index] ~= newAvatarName then
        Debug.PrintWarning("PlayerTransferredControl avatar mismatch: script thinks the player is " .. tostring(playerAvatarNames[index]) .. " but the message says it is " .. tostring(newAvatarName))
      else
        Debug.PrintWarning("PlayerTransferredControl avatar mismatch: message refers to a different object, but they have the same name (" .. tostring(playerAvatarNames[index]) .. ")")
      end
      if playerAvatars[index] ~= nil and Game.IsLoaded(playerAvatars[index]) then
        UnregisterForMessages(playerAvatars[index])
      end
      UnregisterForMessages(newAvatar)
      RegisterForMessages(newAvatar)
    end
    playerAvatars[index] = newAvatar
    playerAvatarNames[index] = newAvatarName
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
    nearDeathPlayers[index] = true
    numNearDeaths = numNearDeaths + 1
  elseif oldState == nearDeathState and newState ~= nearDeathState then
    local reviverIndex = revivingPlayer[index]
    if reviverIndex == nil then
      Debug.PrintWarning("There was no reviving player for player " .. index .. "!")
    else
      Game.AwardAchievementOccurrence(reviverIndex, GameScript.Achievements.Perform_Revives)
    end
    revivingPlayer[index] = nil
    nearDeathPlayers[index] = nil
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
  if MP.GetGameMode() == GameScript.MPGameMode.kGameType12 and Util.PlayerHasTag(userPlayerIndex, "Fettel") then
    return
  end
  revivingPlayer[usedPlayerIndex] = userPlayerIndex
end

function RegisterForMessages(avatar)
  Callbacks.RegisterForMsg(usableMsg, avatar, "PlayerWasUsed")
  Callbacks.RegisterForMsg(objectStateChangeMsg, avatar, "PlayerStateChanged")
end

function UnregisterForMessages(avatar)
  Callbacks.UnregisterForMsg(usableMsg, avatar, "PlayerWasUsed")
  Callbacks.UnregisterForMsg(objectStateChangeMsg, avatar, "PlayerStateChanged")
end

function OnTextMessage(msg)
  if msg.text == "Mission Ended" then
    if numNearDeaths == 0 and not Score.GetGameLoadedSinceMissionStarted() and Score.GetLowestDifficultyUsed() == 4 then
      for index = globalPlayer1, maxPlayers do
        if Player.IsActivePlayer(index) then
          Game.AwardAchievementOccurrence(index, GameScript.Achievements.Extreme_Campaign_Level_Clean_Run)
        end
      end
    end
  elseif msg.text == "Mission Started" then
    numNearDeaths = 0
  end
end

function RegisterForGameMessages()
  Callbacks.RegisterForMsg(playerTransferMsg, Game.GetMyObject(), "PlayerTransferredControl")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, Game.GetMyObject(), "OnTextMessage")
end

function GetInitialPlayerData()
  for index = globalPlayer1, maxPlayers do
    local currentAvatar = Player.GetPlayerControlledObjectByIndex(index)
    if currentAvatar ~= nil then
      local currentName = Game.GetName(currentAvatar)
      playerAvatars[index] = currentAvatar
      playerAvatarNames[index] = currentName
      RegisterForMessages(currentAvatar)
    end
  end
end

function OnCheckpointReload()
  Callbacks.RegisterForTimer("DummyFunc", 0, false)
  Callbacks.UnregisterAllMsgCallbacks()
  RegisterForGameMessages()
  GetInitialPlayerData()
  Callbacks.UnregisterForTimer("DummyFunc")
end

RegisterForGameMessages()
Callbacks.RegisterForPostCheckpointActivation("OnCheckpointReload")
GetInitialPlayerData()
