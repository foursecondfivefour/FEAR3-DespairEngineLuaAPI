local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Support = GS.Support
local Player = Game.Player
local MP = Game.MP
local Debug = GS.Debug
local FEAR = GS.FEAR
local math3d = GS.LuaMath3d
local FEARScore = GameScript.FEARScore
local HealingPerSecond = Support.ImportFloatVariableWithDefault("Healing Per Second", "The amount of healing per second to apply", 50)
local BeginRestPeriodMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Rest Period", "")
local NewWaveMsgId = Support.ImportStaticTextVariable("MissionEvent: New Wave Message", "")
local BarrierRepairedMsgId = Support.ImportStaticTextVariableWithDefault("MissionEvent: Barrier Repaired Message", "", 153154)
local ContractionsBarricadeRepair = GameScript.MissionScoreCategory.ContractionsBarricadeRepair
Support.ExportFloatVariable("ShouldEnableUsables", 0, "")
Support.ExportFloatVariable("SendRepairAnnounce", GS.PlayerIndex.kNotAGlobalPlayer, "")
Support.ExportFloatVariable("SendBrokenAnnounce", 0, "")
local MyObject = Game.GetMyObject()
local kBarrierDestroyedAnnounceDistSqrd = 25
local nRepairingPlayerIndex = GS.PlayerIndex.kNotAGlobalPlayer
local nRepairStartTime = 0
local AttemptToHeal = false
local IsEnabled = false
local SavedSendRepairAnnounce = false
local LocalSendBrokenAnnounce = 0
local SinglePlayerModifier = 0.1

function ModifyScoreSinglePlayer(value)
  value = value * SinglePlayerModifier
  if value < 10 then
    value = 10
  end
  return math.floor(value)
end

function ApplyHealing(removedObject)
  local delta = Support.GetGameTimeDelta()
  local healAmount = HealingPerSecond * 0.25
  Game.Heal(MyObject, "", healAmount, false)
end

function OnAnyUsablesStartedUsing(removedObject)
  AttemptToHeal = true
  local interactionUser = Game.GetInteractionUser(MyObject)
  if interactionUser ~= nil then
    nRepairingPlayerIndex = Player.GetPlayerIndexByObject(interactionUser)
    nRepairStartTime = MP.GetMultiplayerTime()
  end
end

function OnAnyUsablesStoppedUsing(removedObject)
  AttemptToHeal = false
  if nRepairingPlayerIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
    local nRepairStopTime = MP.GetMultiplayerTime()
    local timeRepaired = nRepairStopTime - nRepairStartTime
    if not MP.IsClient() then
      timeRepaired = math.floor(timeRepaired)
      if 0 < timeRepaired then
        local repairBonus = timeRepaired * 50
        if MP.GetNumberOfActivePlayers() == 1 then
          repairBonus = ModifyScoreSinglePlayer(repairBonus)
        end
        FEARScore.AwardMissionPoints(nRepairingPlayerIndex, ContractionsBarricadeRepair, repairBonus)
        FEARScore.AwardMissionPointOccurences(nRepairingPlayerIndex, ContractionsBarricadeRepair, timeRepaired)
      end
    end
    nRepairingPlayerIndex = GS.PlayerIndex.kNotAGlobalPlayer
    nRepairStartTime = 0
    nRepairStopTime = 0
  end
end

function EnableBarrier(enable)
  destObjects = Game.GetAllDestructibleObjects(MyObject)
  for k, currentObject in pairs(destObjects) do
    if enable then
      Game.SendMissionEventMessage(currentObject, BeginRestPeriodMsgId)
    else
      Game.SendMissionEventMessage(currentObject, NewWaveMsgId)
    end
  end
  Game.EnableAllUsables(MyObject, enable)
  IsEnabled = enable
  if enable then
    Extern.ShouldEnableUsables = 1
  else
    Extern.ShouldEnableUsables = 0
  end
end

function FullyHealed()
  if IsEnabled then
    local interactionUser = Game.GetInteractionUser(MyObject)
    if interactionUser then
      Game.SendTextMessage(interactionUser, "SFX_BarrierRepaired")
      Game.SendMissionEventMessage(interactionUser, BarrierRepairedMsgId)
      Extern.SendRepairAnnounce = Player.GetPlayerIndexByObject(interactionUser)
    else
      Extern.SendRepairAnnounce = GS.PlayerIndex.kNotAGlobalPlayer
    end
    EnableBarrier(false)
  end
  AttemptToHeal = false
end

function CheckForHealingDuringPause(removedObject)
  local IsNotDamaged = Game.IsDestructibleInInitialState(MyObject)
  if IsNotDamaged then
    FullyHealed()
  else
    if not IsEnabled then
      EnableBarrier(true)
      Extern.SendRepairAnnounce = GS.PlayerIndex.kNotAGlobalPlayer
    end
    if AttemptToHeal then
      ApplyHealing()
      IsNotDamaged = Game.IsDestructibleInInitialState(MyObject)
      if IsNotDamaged then
        FullyHealed()
      end
    end
  end
end

function ProcessMissionEventMessage(missionEventMessage)
  if missionEventMessage.textID == BeginRestPeriodMsgId then
    Callbacks.RegisterForTimer("CheckForHealingDuringPause", 0.25, true)
  elseif missionEventMessage.textID == NewWaveMsgId then
    EnableBarrier(false)
    Extern.SendRepairAnnounce = GS.PlayerIndex.kNotAGlobalPlayer
    AttemptToHeal = false
    Callbacks.UnregisterForTimer("CheckForHealingDuringPause", 0.25, true)
  end
end

function SendBrokenAnnouncment()
  local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Barricade Broken")
  FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
  FEAR.BroadcastAnnoucementPacket(announcementID)
  local myPos = Game.GetPosition(MyObject)
  local bestPlayerObject
  local bestPlayerDist = kBarrierDestroyedAnnounceDistSqrd
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    playerObject = Player.GetPlayerControlledObjectByIndex(index)
    if playerObject ~= nil then
      local playerPos = Game.GetPosition(playerObject)
      if math.abs(playerPos.y - myPos.y) < 2 then
        playerPos.y = 0
        myPos.y = 0
        local distanceSqrd = math3d.DistanceBetweenPositionsSquared(playerPos, myPos)
        if distanceSqrd < kBarrierDestroyedAnnounceDistSqrd and bestPlayerDist > distanceSqrd then
          bestPlayerDist = distanceSqrd
          bestPlayerObject = playerObject
        end
      end
    end
  end
  if bestPlayerObject ~= nil then
    Game.SendTextMessage(bestPlayerObject, "SFX_BarrierDestroyed")
  end
end

function CheckToDisable(removedObject)
  if Extern.ShouldEnableUsables == 1 then
    if not IsEnabled then
      Game.EnableAllUsables(MyObject, true)
      IsEnabled = true
    end
  elseif IsEnabled then
    Game.EnableAllUsables(MyObject, false)
    IsEnabled = false
  end
  if Extern.SendRepairAnnounce ~= GS.PlayerIndex.kNotAGlobalPlayer then
    if not SentRepairAnnounce then
      local playerObject = Player.GetPlayerAvatarObjectByIndex(Extern.SendRepairAnnounce)
      if playerObject then
        Game.SendTextMessage(playerObject, "SFX_BarrierRepaired")
        SentRepairAnnounce = true
      end
    end
  else
    SentRepairAnnounce = false
  end
  if Extern.SendBrokenAnnounce ~= LocalSendBrokenAnnounce then
    SendBrokenAnnouncment()
    LocalSendBrokenAnnounce = Extern.SendBrokenAnnounce
  end
end

function ProcessDegradeMessage(missionEventMessage)
  if Game.IsDestructibleInFinalState(MyObject) then
    if Extern.SendBrokenAnnounce == 1 then
      Extern.SendBrokenAnnounce = 0
    else
      Extern.SendBrokenAnnounce = 1
    end
    SendBrokenAnnouncment()
  end
end

if not MP.IsClient() then
  Callbacks.RegisterForMsg(GS.MsgCallback.UsablesStartUsingMessage, MyObject, "OnAnyUsablesStartedUsing")
  Callbacks.RegisterForMsg(GS.MsgCallback.UsablesStopUsingMessage, MyObject, "OnAnyUsablesStoppedUsing")
  Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, MyObject, "ProcessMissionEventMessage")
  Callbacks.RegisterForMsg(GS.MsgCallback.DestructibleDegradedMessage, MyObject, "ProcessDegradeMessage")
  Callbacks.RegisterForTimer("CheckForHealingDuringPause", 0.25, true)
else
  Callbacks.RegisterForScriptValueUpdated("CheckToDisable")
end
