local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Support = GameScript.Support
local Player = Game.Player
local Utilities = GameScript.Utilities
local Debug = GameScript.Debug
local MP = GameScript.Game.MP
local FEAR = GameScript.FEAR
local scriptObject
local sentMessageStart = false
local sentMessageFailure = false
local inNearDeath = false
local thisPlayerIndex = GameScript.PlayerIndex.kNotAGlobalPlayer
local localPlayer = false
local timeStampCorruption = 0
local corruptorObject
local corruptionUsableIndex = Support.RegisterComponentHandle("Corruption Usable")
local reviveUsableIndex = Support.RegisterComponentHandle("Revive Usable")
local CorruptionPeriod = Support.ImportFloatVariableWithDefault("Corruption Period", "How many seconds revive should take", 1.25)
Support.ExportFloatVariable("BeingCorrupted", 0, "This player is being corrupted")
Support.ExportFloatVariable("CorruptionPeriod", 1.25, "The time needed to corrupt the player")
Support.ExportFloatVariable("CorruptionSuccess", 0, "NET SYNC USE - Local Machine decides that corruption succeeded")

function Initialize(thisObject)
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, thisObject, "HandleObjectStateChangeMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerRegistrationMessage, thisObject, "HandlePlayerRegistrationMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerTransferControlMessage, thisObject, "HandlePlayerTransferControlMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.MissionEventMessage, thisObject, "ProcessMissionEventMessage")
  Extern.CorruptionPeriod = CorruptionPeriod
  InitializeThisPlayer()
end

function InitializeThisPlayer()
  thisPlayerIndex = Player.GetPlayerIndexByObject(scriptObject)
  localPlayer = Player.IsLocalPlayer(thisPlayerIndex)
  inNearDeath = false
end

function HandlePlayerTransferControlMsg()
  if thisPlayerIndex == GameScript.PlayerIndex.kNotAGlobalPlayer then
    InitializeThisPlayer()
  end
end

function HandleObjectStateChangeMsg(msgTable)
  local newInNearDeath = msgTable.newState == GameScript.ObjectState.NearDeath
  if newInNearDeath ~= inNearDeath then
    if thisPlayerIndex == GameScript.PlayerIndex.kNotAGlobalPlayer then
      InitializeThisPlayer()
    end
    inNearDeath = newInNearDeath
    if reviveUsableIndex ~= nil then
      Game.EnableComponent(reviveUsableIndex, inNearDeath)
    end
    if inNearDeath then
      Extern.CorruptionSuccess = 0
      if localPlayer then
        Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, scriptObject, "HandleUsablesStartUsingMsg")
      else
        Callbacks.RegisterForTimer("RemoteCorruptionCheck", 0.3, true)
      end
    else
      CleanUpCorruptionAttempt()
    end
  elseif inNearDeath and msgTable.newState == GameScript.ObjectState.Default then
    CleanUpCorruptionAttempt()
  end
end

function CleanUpCorruptionAttempt()
  inNearDeath = false
  Extern.CorruptionSuccess = 0
  if localPlayer then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, scriptObject, "HandleUsablesStartUsingMsg")
  else
    Callbacks.UnregisterForTimer("RemoteCorruptionCheck")
  end
  if corruptorObject ~= nil then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.DoDyingMessage, corruptorObject, "HandleCorruptorDoDyingMsg")
    corruptorObject = nil
  end
  if bKillObjectMessageRegistered then
    bKillObjectMessageRegistered = false
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.DeleteObjectMessage, scriptObject, "HandleDeleteObjectMessage")
  end
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
  Callbacks.UnregisterForTimer("CorruptionTimeout")
  Extern.BeingCorrupted = 0
  local playerObj = Player.GetPlayerControlledObjectByIndex(thisPlayerIndex)
  Game.SendTextMessage(playerObj, "FX_CorruptionEnd")
end

function HandleCorruptorDoDyingMsg(msgObj)
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.DoDyingMessage, msgObj, "HandleCorruptorDoDyingMsg")
  corruptorObject = nil
  if reviveUsableIndex ~= nil then
    Game.EnableComponent(reviveUsableIndex, inNearDeath)
  end
  local playerObj = Player.GetPlayerControlledObjectByIndex(thisPlayerIndex)
  if Extern.BeingCorrupted == 1 then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
    Callbacks.UnregisterForTimer("CorruptionTimeout")
    Extern.BeingCorrupted = 0
    Game.SendTextMessage(playerObj, "FX_CorruptionEnd")
  end
end

function HandleUsablesStartUsingMsg(message)
  local userObject = Player.GetPlayerControlledObjectByIndex(message.userPlayerIndex)
  local playerObj = Player.GetPlayerControlledObjectByIndex(thisPlayerIndex)
  if Extern.BeingCorrupted ~= 1 and not Game.AreAllies(scriptObject, userObject) then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
    if reviveUsableIndex ~= nil then
      Game.EnableComponent(reviveUsableIndex, false)
    end
    Callbacks.RegisterForMsg(GameScript.MsgCallback.DoDyingMessage, userObject, "HandleCorruptorDoDyingMsg")
    corruptorObject = userObject
    Callbacks.RegisterForTimer("CorruptionTimeout", Extern.CorruptionPeriod, false)
    timeStampCorruption = Support.GetGameTime()
    Extern.BeingCorrupted = 1
    Game.SendTextMessage(playerObj, "FX_Corruption")
  else
  end
end

function HandleUsablesStopUsingMsg(msg)
  local playerObj = Player.GetPlayerControlledObjectByIndex(thisPlayerIndex)
  if Extern.BeingCorrupted == 1 then
    local bInLastStand = Player.IsPlayerInState(thisPlayerIndex, GameScript.ObjectState.NearDeath)
    if reviveUsableIndex ~= nil then
      Game.EnableComponent(reviveUsableIndex, bInLastStand)
    end
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
    local userObject = Player.GetPlayerControlledObjectByIndex(msg.userPlayerIndex)
    if userObject ~= nil then
      Callbacks.UnregisterForMsg(GameScript.MsgCallback.DoDyingMessage, userObject, "HandleCorruptorDoDyingMsg")
      corruptorObject = nil
    end
    Callbacks.UnregisterForTimer("CorruptionTimeout")
    Extern.BeingCorrupted = 0
  end
  Game.SendTextMessage(playerObj, "FX_CorruptionEnd")
end

function ProcessMissionEventMessage(EventMessage)
  if EventMessage.textID == 143121 then
    local playerObj = Player.GetPlayerControlledObjectByIndex(thisPlayerIndex)
    if Extern.BeingCorrupted == 1 then
      if reviveUsableIndex ~= nil then
        Game.EnableComponent(reviveUsableIndex, false)
      end
      if corruptionUsableIndex ~= nil then
        Game.EnableComponent(corruptionUsableIndex, false)
      end
      Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
      Callbacks.UnregisterForTimer("CorruptionTimeout")
      Extern.BeingCorrupted = 0
    end
    Game.SendTextMessage(playerObj, "FX_CorruptionEnd")
  end
end

function CorruptionTimeout()
  if Extern.BeingCorrupted == 1 then
    Game.SendTextMessage(scriptObject, "CorruptionSuccess")
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
    Extern.BeingCorrupted = 0
    Extern.CorruptionSuccess = 1
    Debug.PrintInfo("LOCAL: Corruption took " .. Support.GetGameTime() - timeStampCorruption .. " seconds")
    if reviveUsableIndex ~= nil then
      Game.EnableComponent(reviveUsableIndex, true)
    end
    if not bKillObjectMessageRegistered then
      bKillObjectMessageRegistered = true
      Callbacks.RegisterForMsg(GameScript.MsgCallback.DeleteObjectMessage, scriptObject, "HandleDeleteObjectMessage")
    end
    if not MP.IsClient() then
      MP.SetTeamForPlayer(thisPlayerIndex, 1)
      Game.Kill(scriptObject, GameScript.KillObjectMessageType.Instant)
    end
  end
  Game.SendTextMessage(Player.GetPlayerObjectByIndex(thisPlayerIndex), "FX_CorruptionEnd")
end

function HandleDeleteObjectMessage()
  bKillObjectMessageRegistered = false
  local announcementID = FEAR.CreateAnnoucementPacket(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Soul Survivor Corruption")
  FEAR.AddStringValueToAnnouncementPacket(announcementID, MP.GetPlayerName(thisPlayerIndex))
  FEAR.SetAnnoucementPacketPriority(announcementID, GameScript.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
  FEAR.BroadcastAnnoucementPacket(announcementID)
end

function RemoteCorruptionCheck()
  if Extern.CorruptionSuccess == 1 then
    Game.SendTextMessage(scriptObject, "CorruptionSuccess")
    Callbacks.UnregisterForTimer("RemoteCorruptionCheck")
    Game.SendTextMessage(Player.GetPlayerControlledObjectByIndex(thisPlayerIndex), "FX_CorruptionEnd")
    sentMessageStart = false
    sentMessageFailure = false
    Debug.PrintInfo("REMOTE: Corruption took " .. Support.GetGameTime() - timeStampCorruption .. " seconds")
    if not MP.IsClient() then
      MP.SetTeamForPlayer(thisPlayerIndex, 1)
      Game.Kill(scriptObject, GameScript.KillObjectMessageType.Instant)
    end
  else
    if sentMessageStart == false and Extern.BeingCorrupted == 1 then
      sentMessageStart = true
      sentMessageFailure = false
      if reviveUsableIndex ~= nil then
        Game.EnableComponent(reviveUsableIndex, false)
      end
      if not bKillObjectMessageRegistered then
        bKillObjectMessageRegistered = true
        Callbacks.RegisterForMsg(GameScript.MsgCallback.DeleteObjectMessage, scriptObject, "HandleDeleteObjectMessage")
      end
      local playerObj = Player.GetPlayerControlledObjectByIndex(thisPlayerIndex)
      timeStampCorruption = Support.GetGameTime()
      Game.SendTextMessage(playerObj, "FX_Corruption")
    end
    if sentMessageFailure == false and Extern.BeingCorrupted == 0 then
      sentMessageFailure = true
      sentMessageStart = false
      if reviveUsableIndex ~= nil then
        Game.EnableComponent(reviveUsableIndex, true)
      end
      if bKillObjectMessageRegistered then
        bKillObjectMessageRegistered = false
        Callbacks.UnregisterForMsg(GameScript.MsgCallback.DeleteObjectMessage, scriptObject, "HandleDeleteObjectMessage")
      end
      local playerObj = Player.GetPlayerControlledObjectByIndex(thisPlayerIndex)
      Game.SendTextMessage(playerObj, "FX_CorruptionEnd")
    end
  end
end

scriptObject = Game.GetMyObject()
Initialize(scriptObject)
