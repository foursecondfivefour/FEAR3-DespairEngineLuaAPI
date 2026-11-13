local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Support = GameScript.Support
local Player = Game.Player
local MP = GameScript.Game.MP
local PlayerIndex = GameScript.PlayerIndex
local Debug = GameScript.Debug
local PlayerInfoTable = {}
Support.ExportFloatVariable("NearDeathP1", 0, "Has this player entered the near death state?")
Support.ExportFloatVariable("NearDeathP2", 0, "Has this player entered the near death state?")
Support.ExportFloatVariable("NearDeathP3", 0, "Has this player entered the near death state?")
Support.ExportFloatVariable("NearDeathP4", 0, "Has this player entered the near death state?")
local CheckStatusTimerOn = false

function Initialize()
  local scriptObject = Game.GetMyObject()
  for playerIndex = PlayerIndex.kGlobalPlayer1, PlayerIndex.kGlobalPlayer4 do
    local PlayerInfo = {}
    PlayerInfo.NearDeathStatus = false
    PlayerInfo.AvatarObject = nil
    PlayerInfo.Dead = false
    PlayerInfoTable[playerIndex + 1] = PlayerInfo
  end
  if MP.IsRemoteScript() then
    Debug.PrintInfo("Registering for LastStandStatusChange")
    Callbacks.RegisterForScriptValueUpdated("LastStandStatusChange")
  end
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerRegistrationMessage, scriptObject, "HandlePlayerRegistrationMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerTransferControlMessage, scriptObject, "HandlePlayerTransferControlMsg")
  InitializePlayers()
end

function InitializePlayers()
  for playerIndex = PlayerIndex.kGlobalPlayer1, PlayerIndex.kGlobalPlayer4 do
    InitializePlayer(playerIndex)
  end
end

function InitializePlayer(playerIndex)
  local tableIndex = playerIndex + 1
  local AvatarObject = Player.GetPlayerAvatarObjectByIndex(playerIndex)
  local OldAvatarObject = PlayerInfoTable[tableIndex].AvatarObject
  Debug.PrintInfo("LastStandManager - Initialize Player " .. tostring(tableIndex))
  if AvatarObject ~= OldAvatarObject then
    local newAvatarFound = AvatarObject and Game.IsLoaded(AvatarObject)
    if newAvatarFound and Game.ObjectTags.DoesObjectHaveTag(AvatarObject, "Ragdoll") then
      PlayerInfoTable[tableIndex].Dead = true
      PlayerInfoTable[tableIndex].NearDeathStatus = false
      UpdateExterns(playerIndex)
      Debug.PrintInfo("LastStandManager - Player " .. tostring(tableIndex) .. " is a ragdoll and is now considered dead")
      return
    end
    if not MP.IsRemoteScript() then
      if OldAvatarObject and Game.IsLoaded(OldAvatarObject) then
        Debug.PrintInfo("LastStandManager - Unregistering for HitPointDepletedMessage on player " .. tostring(tableIndex))
        Callbacks.UnregisterForMsg(GameScript.MsgCallback.HitPointDepletedMessage, OldAvatarObject, "HandleHitPointDepletedMsg")
      end
      if newAvatarFound then
        Debug.PrintInfo("LastStandManager - Registering for HitPointDepletedMessage on player " .. tostring(tableIndex))
        Callbacks.RegisterForMsg(GameScript.MsgCallback.HitPointDepletedMessage, AvatarObject, "HandleHitPointDepletedMsg")
      else
        Debug.PrintInfo("LastStandManager - Unable to find avatar for player " .. tostring(tableIndex))
      end
    end
    if newAvatarFound then
      PlayerInfoTable[tableIndex].AvatarObject = AvatarObject
    else
      PlayerInfoTable[tableIndex].AvatarObject = nil
    end
    PlayerInfoTable[tableIndex].NearDeathStatus = false
    PlayerInfoTable[tableIndex].Dead = false
    UpdateExterns(playerIndex)
  end
end

function HandlePlayerRegistrationMsg(msgData)
  InitializePlayer(msgData.playerIndex)
end

function HandlePlayerTransferControlMsg(msgData)
  InitializePlayer(msgData.globalPlayerIndex)
end

function HandleCheckpointActivation()
  Callbacks.UnregisterAllMsgCallbacks()
  Extern.NearDeathP1 = 0
  Extern.NearDeathP2 = 0
  Extern.NearDeathP3 = 0
  Extern.NearDeathP4 = 0
  Initialize()
end

function HandleHitPointDepletedMsg(msgData)
  if msgData.strComponentName ~= "Primary Hit Points" then
    return
  end
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex >= PlayerIndex.kGlobalPlayer1 and playerIndex <= PlayerIndex.kGlobalPlayer4 then
    local tableIndex = playerIndex + 1
    Debug.PrintInfo("LastStandManager - Received HitPointDepletedMsg for player " .. tostring(tableIndex))
    if PlayerInfoTable[tableIndex].NearDeathStatus then
      Debug.PrintInfo("LastStandManager - Player " .. tostring(tableIndex) .. " was already in Last Stand")
      return
    end
    PlayerInfoTable[tableIndex].NearDeathStatus = true
    Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, PlayerInfoTable[tableIndex].AvatarObject, "HandleTextMessage")
    SendLastStandTransitionMessage(playerIndex)
    UpdateExterns(playerIndex)
  end
end

function HandleTextMessage(msgData)
  if msgData.text ~= "ReviveSuccess" then
    return
  end
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex >= PlayerIndex.kGlobalPlayer1 and playerIndex <= PlayerIndex.kGlobalPlayer4 then
    local tableIndex = playerIndex + 1
    Debug.PrintInfo("LastStandManager - Received ReviveSuccess for player " .. tostring(tableIndex))
    if not PlayerInfoTable[tableIndex].NearDeathStatus then
      Debug.PrintInfo("LastStandManager - Player " .. tostring(tableIndex) .. " was not in Last Stand")
      return
    end
    PlayerInfoTable[tableIndex].NearDeathStatus = false
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.TextMessage, PlayerInfoTable[tableIndex].AvatarObject, "HandleTextMessage")
    SendLastStandTransitionMessage(playerIndex)
    UpdateExterns(playerIndex)
  end
end

function UpdateExterns(playerIndex)
  local NewValue = 0
  local tableIndex = playerIndex + 1
  if PlayerInfoTable[tableIndex].NearDeathStatus then
    NewValue = 1
  end
  Debug.PrintInfo("Updating Externs for player " .. tostring(tableIndex))
  if playerIndex == PlayerIndex.kGlobalPlayer1 then
    Debug.PrintInfo("Was: " .. tostring(Extern.NearDeathP1) .. "  Changing to: " .. tostring(NewValue))
    Extern.NearDeathP1 = NewValue
  elseif playerIndex == PlayerIndex.kGlobalPlayer2 then
    Debug.PrintInfo("Was: " .. tostring(Extern.NearDeathP2) .. "  Changing to: " .. tostring(NewValue))
    Extern.NearDeathP2 = NewValue
  elseif playerIndex == PlayerIndex.kGlobalPlayer3 then
    Debug.PrintInfo("Was: " .. tostring(Extern.NearDeathP3) .. "  Changing to: " .. tostring(NewValue))
    Extern.NearDeathP3 = NewValue
  elseif playerIndex == PlayerIndex.kGlobalPlayer4 then
    Debug.PrintInfo("Was: " .. tostring(Extern.NearDeathP4) .. "  Changing to: " .. tostring(NewValue))
    Extern.NearDeathP4 = NewValue
  end
end

function LastStandStatusChange()
  Debug.PrintInfo("LastStandManager - LastStandStatusChange")
  Debug.PrintInfo("Player 1 status: " .. tostring(PlayerInfoTable[1].NearDeathStatus) .. "   Extern: " .. tostring(Extern.NearDeathP1))
  if PlayerInfoTable[1].NearDeathStatus ~= (Extern.NearDeathP1 == 1) then
    if PlayerInfoTable[1].Dead then
      Debug.PrintInfo("Player 1 status change rejected due to death")
    else
      PlayerInfoTable[1].NearDeathStatus = not PlayerInfoTable[1].NearDeathStatus
      SendLastStandTransitionMessage(PlayerIndex.kGlobalPlayer1)
    end
  end
  Debug.PrintInfo("Player 2 status: " .. tostring(PlayerInfoTable[2].NearDeathStatus) .. "   Extern: " .. tostring(Extern.NearDeathP2))
  if PlayerInfoTable[2].NearDeathStatus ~= (Extern.NearDeathP2 == 1) then
    if PlayerInfoTable[2].Dead then
      Debug.PrintInfo("Player 2 status change rejected due to death")
    else
      PlayerInfoTable[2].NearDeathStatus = not PlayerInfoTable[2].NearDeathStatus
      SendLastStandTransitionMessage(PlayerIndex.kGlobalPlayer2)
    end
  end
  Debug.PrintInfo("Player 3 status: " .. tostring(PlayerInfoTable[3].NearDeathStatus) .. "   Extern: " .. tostring(Extern.NearDeathP3))
  if PlayerInfoTable[3].NearDeathStatus ~= (Extern.NearDeathP3 == 1) then
    if PlayerInfoTable[3].Dead then
      Debug.PrintInfo("Player 3 status change rejected due to death")
    else
      PlayerInfoTable[3].NearDeathStatus = not PlayerInfoTable[3].NearDeathStatus
      SendLastStandTransitionMessage(PlayerIndex.kGlobalPlayer3)
    end
  end
  Debug.PrintInfo("Player 4 status: " .. tostring(PlayerInfoTable[4].NearDeathStatus) .. "   Extern: " .. tostring(Extern.NearDeathP4))
  if PlayerInfoTable[4].NearDeathStatus ~= (Extern.NearDeathP4 == 1) then
    if PlayerInfoTable[4].Dead then
      Debug.PrintInfo("Player 4 status change rejected due to death")
    else
      PlayerInfoTable[4].NearDeathStatus = not PlayerInfoTable[4].NearDeathStatus
      SendLastStandTransitionMessage(PlayerIndex.kGlobalPlayer4)
    end
  end
end

function SendLastStandTransitionMessage(playerIndex)
  local tableIndex = playerIndex + 1
  Debug.PrintInfo("LastStandManager - SendLastStandTransitionMessage for player " .. tostring(tableIndex))
  if PlayerInfoTable[tableIndex].AvatarObject and Game.IsLoaded(PlayerInfoTable[tableIndex].AvatarObject) then
    local textValue = ""
    if PlayerInfoTable[tableIndex].NearDeathStatus then
      textValue = "LastStandBegin"
    else
      textValue = "LastStandEnd"
    end
    Debug.PrintInfo("LastStandManager - sending " .. textValue .. " for player " .. tostring(tableIndex))
    Game.SendTextMessage(PlayerInfoTable[tableIndex].AvatarObject, textValue)
    if CheckStatusTimerOn then
      Callbacks.UnregisterForTimer("CheckObjectStatuses")
    end
    Callbacks.RegisterForTimer("CheckObjectStatuses", 2, false)
    CheckStatusTimerOn = true
  end
end

function CheckObjectStatuses()
  for playerIndex = PlayerIndex.kGlobalPlayer1, PlayerIndex.kGlobalPlayer4 do
    local avatarObj = Player.GetPlayerAvatarObjectByIndex(playerIndex)
    if avatarObj and Game.IsLoaded(avatarObj) then
      local tableIndex = playerIndex + 1
      local expectedStatus = PlayerInfoTable[tableIndex].NearDeathStatus
      if Player.IsPlayerInState(playerIndex, GameScript.ObjectState.NearDeath) ~= expectedStatus then
        Debug.VerifyOnce("@jcriz: Player " .. tostring(tableIndex) .. " failed to be in the correct last stand state.  Expected " .. tostring(expectedStatus))
      end
    end
  end
  CheckStatusTimerOn = false
end

Callbacks.RegisterForPostCheckpointActivation("HandleCheckpointActivation")
Initialize()
