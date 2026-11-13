local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Player = Game.Player
local Debug = GameScript.Debug
local MP = Game.MP
local ObjectTags = Game.ObjectTags
local Utilities = GameScript.Utilities
local kTrue = 1
local kFalse = 0
Support.ImportWatchVariable("Started", "Is the \"Started\" Usable being used?")
Support.ImportWatchVariable("Shared", "Is the \"Shared\" Usable being used?")
Support.ImportWatchVariable("Stolen", "Is the \"Stolen\" Usable being used?")
Support.ExportFloatVariable("Link Active", kFalse, "Is a player currently linked to this object? 1 for yes, 0 for no")
Support.ExportFloatVariable("HasTriggeredKill", kFalse, "0 Not yet, 1 it is coming")
local linkedPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
local linkedPlayerControlledObj, linkedPlayerAvatar
local myObject = Game.GetMyObject()
local registeredForMsgs = false
local linkActive = kFalse

function OnObjectUsed(useMsg)
  local index = useMsg.userPlayerIndex
  if index == GameScript.PlayerIndex.kNotAGlobalPlayer then
    return
  end
  local controlledObj = Player.GetPlayerControlledObjectByIndex(index)
  if controlledObj == nil then
    return
  end
  local avatar = Player.GetPlayerAvatarObjectByIndex(index)
  if avatar == nil then
    return
  end
  if not IsLinkActive() then
    local isStarted = Support.GetImportWatchVariableValue("Started")
    if isStarted ~= kFalse then
      SetLinkerInfo(index, avatar, controlledObj)
      if Player.GetNumPlayers() == 1 then
        SendGlobalDataMessage(false)
        Game.SendTextMessage(linkedPlayerAvatar, "PsychicLinkFeedback")
        Game.SendTextMessage(linkedPlayerControlledObj, "PsychicLinkSteal")
        Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, myObject, "OnObjectUsed")
        KillSelf()
      else
        StartLink()
      end
    else
      PrintError("Unknown usage trying to start psychic link, usable component index = " .. useMsg.usableComponentIndex)
    end
  else
    if index ~= linkedPlayer then
      if linkedPlayer ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
        PrintError("Player " .. linkedPlayer .. " started the link, but Player " .. index .. " is the one using it.")
        return
      elseif MP.IsClient() then
        SetLinkerInfo(index, avatar, controlledObj)
        StartLink()
      end
    end
    local isShared = Support.GetImportWatchVariableValue("Shared")
    local isStolen = Support.GetImportWatchVariableValue("Stolen")
    if isShared ~= kFalse then
      SendGlobalDataMessage(true)
      local pointMan, fettel = Utilities.GetPointManFettelAvatarObjects()
      if pointMan ~= nil then
        Game.SendTextMessage(pointMan, "PsychicLinkFeedback")
      end
      if fettel ~= nil then
        Game.SendTextMessage(fettel, "PsychicLinkFeedback")
      end
      Game.SendTextMessage(linkedPlayerControlledObj, "PsychicLinkShare")
    elseif isStolen ~= kFalse then
      SendGlobalDataMessage(false)
      Game.SendTextMessage(linkedPlayerAvatar, "PsychicLinkFeedback")
      Game.SendTextMessage(linkedPlayerControlledObj, "PsychicLinkSteal")
    else
      PrintError("Unknown usage while psychic link started, usable component index = " .. useMsg.usableComponentIndex)
      EndLink(false)
      return
    end
    EndLink(true)
    KillSelf()
  end
end

function SetLinkActive(linkState)
  if not MP.IsRemoteScript() then
    Extern["Link Active"] = linkState
  end
  linkActive = linkState
end

function IsLinkActive()
  return linkActive == kTrue
end

function OnLinkerStateChanged(msg)
  if msg.object == linkedPlayerControlledObj and msg.newState ~= GameScript.ObjectState.PsychicLink then
    EndLink(false)
  end
end

function OnLinkerDied()
  EndLink(false)
end

function OnStopUsingObject(msg)
  if msg.userPlayerIndex ~= linkedPlayer then
    PrintError("Link being used by player " .. linkedPlayer .. ", but received Stop Using message from player " .. msg.userPlayerIndex)
    return
  end
  EndLink(false)
end

function SetLinkerInfo(index, avatar, controlledObj)
  SetLinkActive(kTrue)
  linkedPlayer = index
  linkedPlayerAvatar = avatar
  linkedPlayerControlledObj = controlledObj
end

function StartLink()
  Game.SendTextMessage(linkedPlayerControlledObj, "Psychic Link Start")
  if not registeredForMsgs then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, linkedPlayerControlledObj, "OnLinkerStateChanged")
    Callbacks.RegisterForMsg(GameScript.MsgCallback.DoDyingMessage, linkedPlayerControlledObj, "OnLinkerDied")
    Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, myObject, "OnStopUsingObject")
    registeredForMsgs = true
  end
end

function EndLink(wasUsed)
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, linkedPlayerControlledObj, "OnLinkerStateChanged")
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.DoDyingMessage, linkedPlayerControlledObj, "OnLinkerDied")
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, myObject, "OnStopUsingObject")
  registeredForMsgs = false
  Game.SendTextMessage(linkedPlayerControlledObj, "Psychic Link End")
  linkedPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
  linkedPlayerControlledObj = nil
  linkedPlayeravatar = nil
  SetLinkActive(kFalse)
  if wasUsed then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, myObject, "OnObjectUsed")
  end
end

function PrintError(err)
  Debug.PrintWarning("Psychic Link object \"" .. Game.GetName(myObject) .. "\" was used in a way we did not expect! " .. err)
end

function KillSelf()
  if not MP.IsRemoteScript() then
    Extern.HasTriggeredKill = kTrue
    Game.SendTextMessage(Game.GetMyObject(), "PsychicLinkKill")
  end
end

function SendGlobalDataMessage(shared)
  local globalDataObj = GameScript.Utilities.GetGlobalDataObject()
  if globalDataObj == nil then
    Debug.PrintError("Could not find global data object!")
  end
  if shared then
    Game.SendTextMessage(globalDataObj, "Psychic Link Shared")
  elseif ObjectTags.DoesObjectHaveTag(linkedPlayerAvatar, "Point Man") then
    Game.SendTextMessage(globalDataObj, "Psychic Link Point Man")
  elseif ObjectTags.DoesObjectHaveTag(linkedPlayerAvatar, "Fettel") then
    Game.SendTextMessage(globalDataObj, "Psychic Link Fettel")
  else
    PrintError("Player avatar has neither \"Point Man\" nor \"Fettel\" object tags!")
  end
end

function OnCheckpointLoad()
  Extern["Link Active"] = kFalse
  Extern.HasTriggeredKill = kFalse
  Callbacks.RegisterForTimer("", 0, false)
  Callbacks.UnregisterAllMsgCallbacks()
  Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, myObject, "OnObjectUsed")
  Callbacks.UnregisterForTimer("", 0, false)
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, myObject, "OnObjectUsed")
Callbacks.RegisterForPostCheckpointActivation("OnCheckpointLoad")
