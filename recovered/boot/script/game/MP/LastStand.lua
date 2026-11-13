local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Support = GameScript.Support
local Player = Game.Player
local Utilities = GameScript.Utilities
local Debug = GameScript.Debug
local MP = GameScript.Game.MP
local FEAR = GameScript.FEAR
local PlayerIndex = GameScript.PlayerIndex
local ObjectState = GameScript.ObjectState
local scriptObject
local isInvulnerable = false
local isReviving = false
local remoteWaitingForReviveSuccess = false
local sentKillSelf = false
local thisPlayerIndex = PlayerIndex.kNotAGlobalPlayer
local localPlayer = false
local playingCoop = false
local InLastStand = false
local CampaignPartnerInLastStand = false
local CampaignPartnerAvatar
local enabledCorruption = false
local disabledCorruption = false
local corruptionAwaitingAnimTag = false
local nearDeathHitPointIndex = Support.ImportFloatVariable("Near Death HP Priority", "Priority level from the HP Controller Component")
local recoveryHitPointIndex = Support.ImportFloatVariable("Recovery HP Priority", "Priority level from the HP Controller Component")
local recoveryInvulnerablePeriod = Support.ImportFloatVariable("Recovery Invulnerability Period", "Priority level from the HP Controller Component")
local isCampaignGame = Support.ImportBoolVariableWithDefault("Is Campaign Game", "Set this to true if this script should campaign-specific stuff.", true)
local RevivePeriod = Support.ImportFloatVariableWithDefault("Revive Period", "How many seconds revive should take", 3)
local resetLastStandAmmo = Support.ImportBoolVariableWithDefault("Reset Last Stand Ammo?", "Should we reset the ammo for our last stand inventory each time we enter Last Stand?", true)
local manageCorruptionUsable = Support.ImportBoolVariableWithDefault("Manage Corruption Usable", "Is this script responsible for enabling and disabling the Corruption Usable in Soul Survivor", false)
local nearDeathStateChangeIndex = Support.RegisterComponentHandle("Near Death State Change")
local reviveUsableIndex = Support.RegisterComponentHandle("Revive Usable")
local corruptionUsableIndex
local playerTable = {}
playerTable[PlayerIndex.kGlobalPlayer1] = nil
playerTable[PlayerIndex.kGlobalPlayer2] = nil
playerTable[PlayerIndex.kGlobalPlayer3] = nil
playerTable[PlayerIndex.kGlobalPlayer4] = nil
if manageCorruptionUsable then
  corruptionUsableIndex = Support.RegisterComponentHandle("Corruption Usable")
end
Support.ExportFloatVariable("InNearDeathState", 0, "Has the player enetered the near death state?")
Support.ExportFloatVariable("PartnerInNearDeathState", 0, "Has the coop partner enetered the near death state?")
Support.ExportFloatVariable("Reviving", 0, "This player is being revived")
Support.ExportFloatVariable("RevivePeriod", 3, "The time needed to revive the player")
Support.ExportFloatVariable("ReviveSuccess", 0, "NET SYNC USE - Local Machine decides that revive succeeded")

function Initialize()
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerTransferControlMessage, scriptObject, "HandlePlayerTransferControlMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, scriptObject, "HandleObjectStateChangeMsg")
  if isCampaignGame then
    Callbacks.RegisterForPostCheckpointActivation("LoadChanges")
    Callbacks.RegisterForMsg(GameScript.MsgCallback.LoadChangesCompleteMessage, scriptObject, "LoadChanges")
  end
  if 0 <= reviveUsableIndex then
    Game.EnableComponent(reviveUsableIndex, false)
  end
  Extern.RevivePeriod = RevivePeriod
  InitializePlayers()
end

function UpdateCoopStatus()
  playingCoop = Player.GetNumPlayers() > 1 or not isCampaignGame
  Game.EnableHitPointPriority(scriptObject, nearDeathHitPointIndex, playingCoop)
  if nearDeathStateChangeIndex ~= nil and 0 <= nearDeathStateChangeIndex then
    Game.EnableComponent(nearDeathStateChangeIndex, playingCoop)
  end
end

function InitializePlayers()
  thisPlayerIndex = Player.GetPlayerIndexByObject(scriptObject)
  localPlayer = Player.IsLocalPlayer(thisPlayerIndex)
  local numPlayers = Player.GetNumPlayers()
  for playerIndex = PlayerIndex.kGlobalPlayer1, numPlayers - 1 do
    InitializePartner(playerIndex)
  end
  isReviving = false
  isInvulnerable = false
  remoteWaitingForReviveSuccess = false
  Extern.InNearDeathState = 0
  Extern.PartnerInNearDeathState = 0
  Extern.Reviving = 0
  UpdateCoopStatus()
end

function InitializePartner(playerIndex)
  if playerIndex == thisPlayerIndex then
    return
  end
  Debug.PrintInfo("Initialize Partner - this player == " .. tostring(thisPlayerIndex) .. "   Partner index == " .. tostring(playerIndex))
  local AvatarObj = Player.GetPlayerAvatarObjectByIndex(playerIndex)
  if AvatarObj ~= nil and Game.IsLoaded(AvatarObj) then
    if isCampaignGame then
      CampaignPartnerInLastStand = false
      CampaignPartnerAvatar = AvatarObj
    else
      playerTable[playerIndex] = AvatarObj
    end
    Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, AvatarObj, "HandlePartnerObjectStateChangeMsg")
    if isCampaignGame then
      Callbacks.RegisterForMsg(GameScript.MsgCallback.DoDyingMessage, AvatarObj, "HandlePartnerDoDyingMessage")
      Callbacks.RegisterForMsg(GameScript.MsgCallback.KillObjectMessage, AvatarObj, "HandlePartnerKillObjectMessage")
    end
  end
end

function HandlePlayerTransferControlMsg(msgData)
  if isCampaignGame and CampaignPartnerAvatar ~= nil then
    return
  end
  if not isCampaignGame then
    if msgData.globalPlayerIndex == PlayerIndex.kNotAGlobalPlayer then
      return
    elseif playerTable[msgData.globalPlayerIndex] ~= nil then
      return
    elseif MP.GetTeamForPlayer(thisPlayerIndex) ~= MP.GetTeamForPlayer(msgData.globalPlayerIndex) then
      return
    elseif Game.ObjectTags.DoesObjectHaveTag(msgData.currentPlayerAvatarObject, "Ragdoll") then
      return
    end
  end
  InitializePartner(msgData.globalPlayerIndex)
  UpdateCoopStatus()
end

function LoadChanges()
  Debug.PrintInfo("LastStand - LoadChanges")
  if 0 <= reviveUsableIndex then
    Game.EnableComponent(reviveUsableIndex, false)
  end
  Callbacks.UnregisterAllMsgCallbacks()
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerTransferControlMessage, scriptObject, "HandlePlayerTransferControlMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, scriptObject, "HandleObjectStateChangeMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.LoadChangesCompleteMessage, scriptObject, "LoadChanges")
  CampaignPartnerAvatar = nil
  InitializePlayers()
end

function HandleObjectStateChangeMsg(msgTable)
  if not playingCoop or thisPlayerIndex == PlayerIndex.kNotAGlobalPlayer then
    return
  end
  local newInNearDeath = msgTable.newState == ObjectState.NearDeath
  if newInNearDeath ~= InLastStand then
    Debug.PrintInfo("LastStand - HandleObjectStateChangeMsg with NearDeath state == " .. tostring(newInNearDeath))
    InLastStand = newInNearDeath
    if 0 <= reviveUsableIndex then
      Game.EnableComponent(reviveUsableIndex, newInNearDeath)
    end
    if corruptionUsableIndex ~= nil then
      if newInNearDeath then
        Callbacks.RegisterForMsg(GameScript.MsgCallback.LabelStateAnimationTag, scriptObject, "OnDownedAnimationComplete")
        corruptionAwaitingAnimTag = true
      else
        Game.EnableComponent(corruptionUsableIndex, false)
      end
    end
    if localPlayer then
      if newInNearDeath then
        if isCampaignGame and CampaignPartnerInLastStand then
          KillSelf()
        else
          if resetLastStandAmmo then
            ResetLastStandWeaponAmmo()
          end
          Game.Heal(scriptObject, "NearDeathHealth", 1, true)
          Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, scriptObject, "HandleUsablesStartUsingMsg")
        end
      else
        Game.Heal(scriptObject, "Health", 1, true)
        Game.Heal(scriptObject, "NearDeathHealth", 1, true)
        Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, scriptObject, "HandleUsablesStartUsingMsg")
      end
      Extern.ReviveSuccess = 0
      local fwdVec = MP.GetNetworkLookRotForward(scriptObject)
      local horizLen = math.sqrt(fwdVec.x * fwdVec.x + fwdVec.z * fwdVec.z)
      if 0 < horizLen then
        fwdVec.x = fwdVec.x / horizLen
        fwdVec.y = 0
        fwdVec.z = fwdVec.z / horizLen
        local heading = math.acos(fwdVec.x)
        local newEuler = {
          r = 0,
          p = 0,
          h = heading
        }
        Game.SetLookDirection(scriptObject, newEuler)
      end
    elseif newInNearDeath then
      remoteWaitingForReviveSuccess = true
      Callbacks.RegisterForScriptValueUpdated("RemoteReviveCheck")
    else
      remoteWaitingForReviveSuccess = false
      Callbacks.UnregisterForScriptValueUpdated()
    end
    if newInNearDeath then
      if not isCampaignGame and MP.NumPlayersNotDown() ~= 0 then
        local announcementID = FEAR.CreateAnnoucementPacket(thisPlayerIndex, GameScript.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Player Is Down")
        FEAR.AddStringValueToAnnouncementPacket(announcementID, MP.GetPlayerName(thisPlayerIndex))
        FEAR.SetAnnoucementPacketPriority(announcementID, GameScript.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
        FEAR.BroadcastAnnoucementPacket(announcementID)
      end
      Extern.InNearDeathState = 1
      Game.SetAnimationVariable(scriptObject, "State_Revive", 0)
    else
      if not isCampaignGame then
        local announcementID = FEAR.CreateAnnoucementPacket(thisPlayerIndex, GameScript.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Player Revived")
        FEAR.AddStringValueToAnnouncementPacket(announcementID, MP.GetPlayerName(thisPlayerIndex))
        FEAR.SetAnnoucementPacketPriority(announcementID, GameScript.AnnouncementDisplayPriority.kDisplayPriorityHigh)
        FEAR.BroadcastAnnoucementPacket(announcementID)
        Game.SendTextMessage(scriptObject, "SFX_Revived")
      end
      Extern.InNearDeathState = 0
      if not MP.IsClient() then
        Game.SetHitPointPriorityInvulnerable(scriptObject, recoveryHitPointIndex, true)
        isInvulnerable = true
        Callbacks.RegisterForTimer("InvulnerableTimeout", recoveryInvulnerablePeriod, false)
      end
    end
  end
end

function OnDownedAnimationComplete(TagInfo)
  if TagInfo.label == "Show Last Stand Pistol" then
    corruptionAwaitingAnimTag = false
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.LabelStateAnimationTag, TagInfo.object, "OnDownedAnimationComplete")
    Game.EnableComponent(corruptionUsableIndex, true)
  end
end

function HandlePartnerObjectStateChangeMsg(msgTable)
  local newInNearDeath = msgTable.newState == ObjectState.NearDeath
  if isCampaignGame then
    if newInNearDeath ~= CampaignPartnerInLastStand then
      Debug.PrintInfo("Partner LastStand - HandlePartnerObjectStateChangeMsg with NearDeath state == " .. tostring(newInNearDeath))
      CampaignPartnerInLastStand = newInNearDeath
      if newInNearDeath then
        if InLastStand and localPlayer then
          KillSelf()
        end
        Extern.PartnerInNearDeathState = 1
      else
        Extern.PartnerInNearDeathState = 0
      end
    end
  elseif newInNearDeath then
    Extern.PartnerInNearDeathState = 1
  else
    Extern.PartnerInNearDeathState = 0
    local numPlayers = Player.GetNumPlayers()
    for index = PlayerIndex.kGlobalPlayer1, numPlayers - 1 do
      if index ~= thisPlayerIndex and Player.IsPlayerInState(index, ObjectState.NearDeath) then
        Extern.PartnerInNearDeathState = 1
        break
      end
    end
  end
end

function HandlePartnerDoDyingMessage()
  if localPlayer then
    KillSelf()
  end
end

function HandlePartnerKillObjectMessage()
  if localPlayer then
    KillSelf()
  end
end

function InvulnerableTimeout()
  isInvulnerable = false
  Game.SetHitPointPriorityInvulnerable(scriptObject, recoveryHitPointIndex, false)
end

function KillSelf()
  if not sentKillSelf then
    sentKillSelf = true
    Game.Kill(scriptObject, GameScript.KillObjectMessageType.DoDying)
    Debug.PrintInfo("Killing Player " .. tostring(thisPlayerIndex))
  end
end

function HandleUsablesStartUsingMsg(message)
  local userObject = Player.GetPlayerObjectByIndex(message.userPlayerIndex)
  if (isCampaignGame or not Game.AreEnemies(scriptObject, userObject)) and isReviving == false then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
    Debug.PrintInfo("Reviving with revive period: " .. tostring(Extern.RevivePeriod))
    Callbacks.RegisterForGlobalTimer("ReviveTimeout", Extern.RevivePeriod, false)
    if corruptionUsableIndex ~= nil then
      Game.EnableComponent(corruptionUsableIndex, false)
    end
    isReviving = true
    Extern.Reviving = 1
  else
  end
end

function HandleUsablesStopUsingMsg()
  if isReviving then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
    Callbacks.UnregisterForTimer("ReviveTimeout")
    isReviving = false
    Extern.Reviving = 0
    if corruptionUsableIndex ~= nil then
      Game.EnableComponent(corruptionUsableIndex, true)
    end
  end
end

function ReviveTimeout()
  if isReviving then
    Debug.PrintInfo("LastStand - Sending ReviveSuccess")
    Game.SendTextMessage(scriptObject, "ReviveSuccess")
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, scriptObject, "HandleUsablesStopUsingMsg")
    isReviving = false
    if corruptionUsableIndex ~= nil then
      Game.EnableComponent(corruptionUsableIndex, false)
    end
    Extern.Reviving = 0
    Extern.ReviveSuccess = 1
  end
end

function RemoteReviveCheck()
  if remoteWaitingForReviveSuccess and Extern.ReviveSuccess == 1 then
    remoteWaitingForReviveSuccess = false
    Debug.PrintInfo("LastStand - Sending ReviveSuccess from remote sync")
    Game.SendTextMessage(scriptObject, "ReviveSuccess")
  end
  if manageCorruptionUsable == true then
    if disabledCorruption == false and Extern.Reviving == 1 then
      disabledCorruption = true
      enabledCorruption = false
      if corruptionUsableIndex ~= nil then
        Game.EnableComponent(corruptionUsableIndex, false)
      end
    end
    if enabledCorruption == false and Extern.Reviving == 0 and not corruptionAwaitingAnimTag then
      enabledCorruption = true
      disabledCorruption = false
      if corruptionUsableIndex ~= nil then
        Game.EnableComponent(corruptionUsableIndex, true)
      end
    end
  end
end

function ResetLastStandWeaponAmmo()
  local nearDeathInv = Game.GetInventoryItemsByTypeAndName(scriptObject, 1, "Near Death Inventory List")
  for k, weapon in pairs(nearDeathInv) do
    Game.SetCurrentTotalAmmoPercent(weapon, 1)
  end
end

scriptObject = Game.GetMyObject()
Initialize()
