local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Support = GameScript.Support
local Player = Game.Player
local Debug = GameScript.Debug
local scriptObject
local inNearDeath = false
local reviveUsableIndex = Support.RegisterComponentHandle("Revive Usable")
local thisPlayerIndex = GameScript.PlayerIndex.kNotAGlobalPlayer
local localPlayer = false
local partnerAvatarObject
local partnerPlayerIndex = GameScript.PlayerIndex.kNotAGlobalPlayer
local partnerInNearDeath = false
Extern.partnerRegistered = false
Support.ExportFloatVariable("InNearDeathState", 0, "Has the player enetered the near death state?")
Support.ExportFloatVariable("PartnerInNearDeathState", 0, "Has the coop partner enetered the near death state?")

function Initialize(thisObject)
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, thisObject, "HandleObjectStateChangeMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerRegistrationMessage, thisObject, "HandlePlayerRegistrationMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerTransferControlMessage, thisObject, "HandlePlayerTransferControlMsg")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.LoadChangesCompleteMessage, thisObject, "HandleLoadChangesCompleteMsg")
  if 0 <= reviveUsableIndex then
    Game.EnableComponent(reviveUsableIndex, inNearDeath)
  end
  Extern.InNearDeathState = 0
  Extern.PartnerInNearDeathState = 0
  InitializeThisPlayer()
  InitializeCoopPartner()
end

function InitializeThisPlayer()
  thisPlayerIndex = Player.GetPlayerIndexByObject(scriptObject)
  localPlayer = Player.IsLocalPlayer(thisPlayerIndex)
  if thisPlayerIndex == GameScript.PlayerIndex.kGlobalPlayer1 then
    partnerPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer2
  elseif thisPlayerIndex == GameScript.PlayerIndex.kGlobalPlayer2 then
    partnerPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1
  else
    partnerPlayerIndex = GameScript.PlayerIndex.kNotAGlobalPlayer
  end
end

function InitializeCoopPartner()
  if partnerPlayerIndex ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    partnerAvatarObject = Player.GetPlayerAvatarObjectByIndex(partnerPlayerIndex)
  end
  if partnerAvatarObject ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "partnerRegistered:" .. tostring(Extern.partnerRegistered))
    if Extern.partnerRegistered == true then
      Debug.PrintInfoIf(g_debugMode > 0, "UnregisterForMsg ObjectStateChangeMessage:")
      Callbacks.UnregisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, partnerAvatarObject, "HandlePartnerObjectStateChangeMsg")
      Extern.partnerRegistered = false
    end
    Debug.PrintInfoIf(g_debugMode > 0, "RegisterForMsg ObjectStateChangeMessage:")
    Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, partnerAvatarObject, "HandlePartnerObjectStateChangeMsg")
    Extern.partnerRegistered = true
  end
end

function HandlePlayerRegistrationMsg(regMsg)
  if regMsg.playerIndex == partnerPlayerIndex and not regMsg.isRegistered then
    partnerAvatarObject = nil
    partnerPlayerIndex = GameScript.PlayerIndex.kNotAGlobalPlayer
    partnerInNearDeath = false
    Extern.PartnerInNearDeathState = 0
  end
end

function HandlePlayerTransferControlMsg(msgInfo)
  if thisPlayerIndex == GameScript.PlayerIndex.kNotAGlobalPlayer then
    InitializeThisPlayer()
    InitializeCoopPartner()
  elseif msgInfo.globalPlayerIndex == partnerPlayerIndex then
    InitializeCoopPartner()
  end
end

function HandleObjectStateChangeMsg(msgTable)
  local newInNearDeath = msgTable.newState == GameScript.ObjectState.NearDeath
  if newInNearDeath ~= inNearDeath then
    inNearDeath = newInNearDeath
    if 0 <= reviveUsableIndex then
      Game.EnableComponent(reviveUsableIndex, inNearDeath)
    end
    if thisPlayerIndex == GameScript.PlayerIndex.kNotAGlobalPlayer then
      InitializeThisPlayer()
    end
    if localPlayer then
      if inNearDeath then
        if partnerInNearDeath then
          Game.Kill(scriptObject, GameScript.KillObjectMessageType.DoDying)
        else
          Game.Heal(scriptObject, "NearDeathHealth", 1, true)
        end
      else
        Game.Heal(scriptObject, "Health", 100, false)
      end
    end
    if inNearDeath then
      Extern.InNearDeathState = 1
    else
      Extern.InNearDeathState = 0
    end
  end
end

function HandlePartnerObjectStateChangeMsg(msgTable)
  local newInNearDeath = msgTable.newState == GameScript.ObjectState.NearDeath
  if newInNearDeath ~= partnerInNearDeath then
    partnerInNearDeath = newInNearDeath
    if partnerInNearDeath then
      if inNearDeath and localPlayer then
        Game.Kill(scriptObject, GameScript.KillObjectMessageType.DoDying)
      end
      Extern.PartnerInNearDeathState = 1
    else
      Extern.PartnerInNearDeathState = 0
    end
  end
end

function HandleLoadChangesCompleteMsg()
  Extern.InNearDeathState = 0
  Extern.PartnerInNearDeathState = 0
end

scriptObject = Game.GetMyObject()
Initialize(scriptObject)
