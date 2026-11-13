local GS = GameScript
local Callbacks = GS.Callbacks
local Support = GS.Support
local Game = GS.Game
local Debug = GS.Debug
local Player = Game.Player
local Physics = Game.Physics
local MP = Game.MP
local Utilities = GS.Utilities
local mpAward = GS.MPAwardType
local Msg = GS.MsgCallback
local ObjectTags = Game.ObjectTags
local FEAR = GS.FEAR
local FEARScore = GS.FEARScore
local Energy = Game.Energy
local MyObject = Game.GetMyObject()
local MyPlayerIndex = Player.GetPlayerIndexByObject(MyObject)
local Souls = GS.MissionScoreCategory.Souls
local NonKingPeriodicPointAccrualAmount = Support.ImportFloatVariableWithDefault("Periodic Point Accrual Ammount", "The number of soul points awarded at every interval while possessing.", 1)
local NonKingPointAccrualTimerInterval = Support.ImportFloatVariableWithDefault("Point Accrual Timer Interval", "The time interval (in seconds) at which to accrue points while possessing.", 1)
local PointDeductionTimerInterval = Support.ImportFloatVariableWithDefault("Point Deduction Timer Interval", "The time interval (in seconds) at which to deduct points while NOT possessing.", 1)
local PeriodicPointDeductionAmount = Support.ImportFloatVariableWithDefault("Periodic Point Deduction Ammount", "The number of soul points removed at every interval while NOT possessing.", 1)
local KingPeriodicPointAccrualAmount = Support.ImportFloatVariableWithDefault("King Periodic Point Accrual Ammount", "The number of soul points awarded at every interval while possessing for the king.", 1)
local KingPointAccrualTimerInterval = Support.ImportFloatVariableWithDefault("King Point Accrual Timer Interval", "The time interval (in seconds) at which to accrue points while possessing for the king.", 1)
local KingEnergyFillRate = Support.ImportFloatVariableWithDefault("King Energy Fill Rate", "The energy fill rate for the king", 0.75)
local PowerMeter = Support.RegisterComponentHandle("Ghost Power Meter")
PeriodicPointDeductionAmount = PeriodicPointDeductionAmount * -1
local PeriodicPointAmount = NonKingPeriodicPointAccrualAmount
local PeriodicPointInterval = NonKingPointAccrualTimerInterval
local GracePeriod = Support.ImportFloatVariableWithDefault("Grace Period Length", "The time (in seconds) the player is invulnerable after respawning.", 3)
local bUsingGracePeriodInvulnerability = false
Support.ExportFloatVariable("CanTeleport", 0, "Hack extern/export variable for the telporters to check if this player can teleport.")
local bIsPossessing = false
local bIsKing = false
local bIsKingClient = false
local KingCount = 0
local NumTimesKingPointsAdded = 0
local StartRoundMessageText = Support.ImportStaticTextVariable("MissionEvent: Start Round", "")
local EndRoundMessageText = Support.ImportStaticTextVariable("MissionEvent: End Round", "")
local BecomeKingText = Support.ImportStaticTextVariable("MissionEvent: Become King", "The text event for becoming king.")
local LoseKingText = Support.ImportStaticTextVariable("MissionEvent: Lose King", "The text event for losing king.")
local bShouldDoPeriodicPoints = true
local kPointMessageRoundOff = 50
local kPointMessageDisplayTime = 0.5
local TeleportTimer = 0
local BeginTeleportMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Teleport", "")
local TimeBetweenTeleports = Support.ImportFloatVariableWithDefault("Time Between Teleports", "The amount of time between teleports allowed.", 10)
local YScreenPosDelta = -0.05
local YInitialScreenPos = 0.9
local XInitialScreenPos = 0.025

function GetMyScore()
  return GetPlayerScore(MyPlayerIndex)
end

function GetPlayerScore(PlayerIndex)
  return FEARScore.GetCurrentRoundPoints(PlayerIndex, Souls)
end

local LastUpdateScore = GetMyScore()
local spectreStunSlowTime = Support.ImportFloatVariableWithDefault("spectre Stun Slow Duration", "The length of time a player stays slowed when hit with the spectres blast.", 4)
local IsSlowed = false
local AwardingPeriodicPoints = false

function GivePlayerPoints(PointAmount)
  FEARScore.AwardMissionPoints(MyPlayerIndex, Souls, PointAmount)
end

function RoundPoints(Points)
  local Scalar = 5
  Points = Points / Scalar
  Points = math.floor(Points)
  Points = Points * Scalar
  return Points
end

function ProcessPlayerScore()
  if Player.IsLocalPlayer(MyPlayerIndex) then
    local Score = GetMyScore()
    if Score ~= LastUpdateScore then
      local Delta = Score - LastUpdateScore
      if MP.GetNumberOfActivePlayers() > 1 then
        local scoreMultiplier = FEARScore.GetScoreMultiplier()
        if Delta > KingPeriodicPointAccrualAmount * scoreMultiplier then
          local modifiedRoundOff = kPointMessageRoundOff * scoreMultiplier
          local DeltaMinusKingPoints = math.floor(Delta / modifiedRoundOff) * modifiedRoundOff
          local announcementID = FEAR.CreateAnnoucementPacket(MyPlayerIndex, GS.AnnouncementDisplayDestination.kDisplayDestinationMarquee, "KOS Aquired Points")
          FEAR.AddNumberValueToAnnouncementPacket(announcementID, RoundPoints(DeltaMinusKingPoints))
          FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
          FEAR.SetAnnoucementPacketTime(announcementID, kPointMessageDisplayTime)
          FEAR.SendAnnoucementPacket(announcementID)
          if DeltaMinusKingPoints > 250 * scoreMultiplier then
            Game.SendTextMessage(MyObject, "SFX_GainedLotsOfPoints")
          end
        end
      elseif 0 < Delta then
        local announcementID = FEAR.CreateAnnoucementPacket(MyPlayerIndex, GS.AnnouncementDisplayDestination.kDisplayDestinationMarquee, "KOS Aquired Points")
        FEAR.AddNumberValueToAnnouncementPacket(announcementID, RoundPoints(Delta))
        FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
        FEAR.SetAnnoucementPacketTime(announcementID, kPointMessageDisplayTime)
        FEAR.SendAnnoucementPacket(announcementID)
        if 250 < Delta then
          Game.SendTextMessage(MyObject, "SFX_GainedLotsOfPoints")
        end
      end
    end
    LastUpdateScore = Score
  end
end

function SoulHunterPlayerUpdate()
  if bIsPossessing and TeleportTimer <= 0 then
    local playerObject = Player.GetPlayerControlledObjectByIndex(MyPlayerIndex)
    local doesHaveTeleportTag = ObjectTags.DoesObjectHaveTag(playerObject, "MPTeleportUser")
    if doesHaveTeleportTag then
      Extern.CanTeleport = 1
    end
  else
    Extern.CanTeleport = 0
    if 0 < TeleportTimer then
      local delta = Support.GetGameTimeDelta()
      TeleportTimer = TeleportTimer - delta
    end
  end
  if AmITheKing() == true then
    if bIsKingClient == false then
      Energy.SetEnergyFillRate(PowerMeter, KingEnergyFillRate)
      bIsKingClient = true
    end
  elseif bIsKingClient == true then
    Energy.ResetEnergyFillRate(PowerMeter)
    bIsKingClient = false
  end
end

function SetInvulnerable(bInvulnerable)
  Game.SetHitPointPriorityInvulnerable(MyObject, 1, bInvulnerable)
end

function OnStartRound()
  bShouldDoPeriodicPoints = true
  EndGracePeriod()
  SetInvulnerable(false)
end

function OnEndRound()
  bShouldDoPeriodicPoints = false
  EndGracePeriod()
  SetInvulnerable(true)
end

function AdjustPointsPeriodically()
  if bShouldDoPeriodicPoints == true then
    if PeriodicPointAmount < 0 then
      local Score = GetMyScore()
      if Score <= 0 then
        return
      end
    end
    GivePlayerPoints(PeriodicPointAmount)
  end
end

function SetPointAdjustmentInfo(PointAmount, TimerInterval)
  PeriodicPointAmount = PointAmount
  PeriodicPointInterval = TimerInterval
end

function StartPeriodicPointAdjustment()
  if not AwardingPeriodicPoints then
    AwardingPeriodicPoints = true
    Callbacks.RegisterForTimer("AdjustPointsPeriodically", PeriodicPointInterval, true)
  end
end

function StopPeriodicPointAdjustment()
  if AwardingPeriodicPoints then
    AwardingPeriodicPoints = false
    Callbacks.UnregisterForTimer("AdjustPointsPeriodically")
  end
end

function RestartPeriodicPointAdjustment()
  StopPeriodicPointAdjustment()
  StartPeriodicPointAdjustment()
end

function ProcessPossessionStartedMessage(possessionMessage)
  EndGracePeriod()
  bIsPossessing = true
  if MP.GetNumberOfActivePlayers() > 1 then
    if bIsKing then
      SetPointAdjustmentInfo(KingPeriodicPointAccrualAmount, KingPointAccrualTimerInterval)
    else
      SetPointAdjustmentInfo(NonKingPeriodicPointAccrualAmount, NonKingPointAccrualTimerInterval)
    end
    RestartPeriodicPointAdjustment()
  end
end

function ProcessPossessionEndedMessage(possessionMessage)
  bIsPossessing = false
  if MP.GetNumberOfActivePlayers() > 1 then
    if bIsKing then
      StopPeriodicPointAdjustment()
    else
      SetPointAdjustmentInfo(NonKingPeriodicPointAccrualAmount, NonKingPointAccrualTimerInterval)
      RestartPeriodicPointAdjustment()
    end
  end
end

function OnBecomeSoulLeader()
  KingCount = KingCount + 1
  bIsKing = true
  if 1 < MP.GetNumberOfActivePlayers() then
    if bIsPossessing == true then
      SetPointAdjustmentInfo(KingPeriodicPointAccrualAmount, KingPointAccrualTimerInterval)
      RestartPeriodicPointAdjustment()
    else
      StopPeriodicPointAdjustment()
    end
  end
end

function OnLoseSoulLeader()
  KingCount = KingCount - 1
  bIsKing = false
  if 1 < MP.GetNumberOfActivePlayers() then
    if bIsPossessing == true then
      SetPointAdjustmentInfo(NonKingPeriodicPointAccrualAmount, NonKingPointAccrualTimerInterval)
    else
      SetPointAdjustmentInfo(PeriodicPointDeductionAmount, PointDeductionTimerInterval)
    end
    RestartPeriodicPointAdjustment()
  end
end

function ProcessDamageMessage(damageMessage)
  if damageMessage.nDamageType == 23 then
    if IsSlowed then
      Callbacks.UnregisterForTimer("EndOfSlowDown")
    end
    Player.SetVelocityScale(MyObject, 0.2)
    Game.SendTextMessage(MyObject, "slowed down by spectre")
    Callbacks.RegisterForTimer("EndOfSlowDown", spectreStunSlowTime, false)
    IsSlowed = true
  end
end

function EndOfSlowDown(damageMessage)
  Player.SetVelocityScale(MyObject, 1)
  IsSlowed = false
end

function EndGracePeriod()
  if bUsingGracePeriodInvulnerability == true then
    Callbacks.UnregisterForTimer("EndGracePeriod")
    bUsingGracePeriodInvulnerability = false
    SetInvulnerable(false)
  end
end

function StartGracePeriod()
  bUsingGracePeriodInvulnerability = true
  SetInvulnerable(true)
  Callbacks.RegisterForTimer("EndGracePeriod", GracePeriod, false)
end

function AmITheKing()
  local numPlayers = Player.GetNumPlayers()
  local LeaderPoints = 0
  local LeaderIndex = GS.PlayerIndex.kNotAGlobalPlayer
  for CurPlayer = GS.PlayerIndex.kGlobalPlayer1, numPlayers - 1 do
    if Player.IsActivePlayer(CurPlayer) then
      local Score = GetPlayerScore(CurPlayer)
      if LeaderPoints < Score then
        LeaderPoints = Score
        LeaderIndex = CurPlayer
      end
    end
  end
  if LeaderIndex == MyPlayerIndex then
    return true
  end
  return false
end

function ProcessMissionEventMessage(EventMessage)
  if EventMessage.textID == BeginTeleportMsgId then
    TeleportTimer = TimeBetweenTeleports
  elseif EventMessage.textID == StartRoundMessageText then
    OnStartRound()
  elseif EventMessage.textID == EndRoundMessageText then
    OnEndRound()
  elseif EventMessage.textID == BecomeKingText then
    OnBecomeSoulLeader()
  elseif EventMessage.textID == LoseKingText then
    OnLoseSoulLeader()
  end
end

local YStart = 0.1
local YIncrement = 0.025
local SmallIncrementVal = YIncrement / 2
local XStart = 0.05
local XScreenWidth = 0.2
local XScreenPos, YScreenPos
local Spacer = "..."

function MakeBooleanIntoText(Boolean)
  if Boolean == true then
    return "true"
  else
    return "false"
  end
end

function Print(Message)
  Debug.PrintToScreen(Message, XScreenPos, YScreenPos)
end

function Increment()
  YScreenPos = YScreenPos + YIncrement
end

function SmallIncrement()
  YScreenPos = YScreenPos + SmallIncrementVal
end

function PrintAndIncrement(Message)
  Print(Message)
  Increment()
end

function PlayerDisplay()
  XScreenPos = XStart + XScreenWidth * MyPlayerIndex
  YScreenPos = YStart
  PrintAndIncrement("Player " .. MyPlayerIndex)
  PrintAndIncrement("Do Periodic Points? " .. MakeBooleanIntoText(bShouldDoPeriodicPoints))
  PrintAndIncrement("IsKing = " .. MakeBooleanIntoText(bIsKing))
  PrintAndIncrement("King Count: " .. KingCount)
  PrintAndIncrement("Possessing?" .. MakeBooleanIntoText(bIsPossessing))
  PrintAndIncrement("Point Adjust Amount: " .. PeriodicPointAmount)
  PrintAndIncrement("Point Adjust Timer: " .. PeriodicPointInterval)
  PrintAndIncrement("Energy Fill Rate: " .. Energy.GetEnergyFillRate(PowerMeter))
  PrintAndIncrement("Possession Delay: " .. Player.GetPossessionDelay(MyPlayerIndex))
  PrintAndIncrement("Max Possession Time: " .. Player.GetMaxPossessionTime(MyPlayerIndex))
end

if MyObject ~= nil then
  if not MP.IsClient() then
    Callbacks.RegisterForMsg(GS.MsgCallback.PossessionStartedMessage, MyObject, "ProcessPossessionStartedMessage")
    Callbacks.RegisterForMsg(GS.MsgCallback.PossessionEndedMessage, MyObject, "ProcessPossessionEndedMessage")
    if AmITheKing() == true then
      OnBecomeSoulLeader()
    else
      OnLoseSoulLeader()
      KingCount = 0
    end
  end
  Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, MyObject, "ProcessMissionEventMessage")
  if Player.IsLocalPlayer(MyPlayerIndex) then
    Callbacks.RegisterForMsg(GS.MsgCallback.DamageMessage, MyObject, "ProcessDamageMessage")
    Callbacks.RegisterForTimer("ProcessPlayerScore", 0.5, true)
  end
  StartGracePeriod()
  Callbacks.RegisterForTimer("SoulHunterPlayerUpdate", 0.25, true)
end
