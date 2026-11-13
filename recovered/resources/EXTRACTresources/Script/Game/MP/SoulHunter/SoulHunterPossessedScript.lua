local GS = GameScript
local Callbacks = GS.Callbacks
local Support = GS.Support
local Game = GS.Game
local Player = Game.Player
local MP = Game.MP
local Debug = GS.Debug
local FEARScore = GS.FEARScore
local Souls = GS.MissionScoreCategory.Souls
local GlowComponent = Support.RegisterComponentHandle("Glow Rendering Component")
local EnableGlowMsgId = Support.ImportStaticTextVariable("MissionEvent: Enable Glow", "")
local DisableGlowMsgId = Support.ImportStaticTextVariable("MissionEvent: Disable Glow", "")
local spectreStunSlowTime = Support.ImportFloatVariableWithDefault("spectre Stun Slow Duration", "The length of time a player stays slowed when hit with the spectres blast.", 4)
local KingBodyToBodyDelay = Support.ImportFloatVariableWithDefault("Body To Body Delay", "The body to body delay for the king", 1)
local KingMaxPossessionTime = Support.ImportFloatVariableWithDefault("King Max Possession Time", "The king's max possession time.", 120)
local NormalMaxPossessionTime = Support.ImportFloatVariableWithDefault("Normal Max Possession Time", "The king's max possession time", 60)
local Self = Game.GetMyObject()
local bActorControlChanged = false
local myPlayerIndex = Player.GetPlayerIndexByObject(Self)
local bGlowForcedEnabled = false
local bIsSlowed = false
local bLeaderParticlesEnabled = false

function GetPlayerScore(PlayerIndex)
  return FEARScore.GetCurrentRoundPoints(PlayerIndex, Souls)
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
  if LeaderIndex == myPlayerIndex then
    return true
  end
  return false
end

function PossessedScriptUpdate()
  if bActorControlChanged == true then
    myPlayerIndex = Player.GetPlayerIndexByObject(Self)
    bActorControlChanged = false
  end
  if myPlayerIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
    if AmITheKing() == true then
      if not bLeaderParticlesEnabled then
        Player.SetPossessionDelay(myPlayerIndex, KingBodyToBodyDelay)
        Player.SetMaxPossessionTime(myPlayerIndex, KingMaxPossessionTime)
        Game.EnableComponent(GlowComponent, true)
        Game.SendTextMessage(Self, "EnableLeaderParticles")
        bLeaderParticlesEnabled = true
      end
    elseif bLeaderParticlesEnabled then
      if not bGlowForcedEnabled then
        Game.EnableComponent(GlowComponent, false)
      end
      Player.SetMaxPossessionTime(myPlayerIndex, NormalMaxPossessionTime)
      Game.SendTextMessage(Self, "DisableLeaderParticles")
      bLeaderParticlesEnabled = false
    end
  end
end

function ProcessMissionEventMessage(missionEventMsg)
  if missionEventMsg.textID == EnableGlowMsgId and not bGlowForcedEnabled then
    Game.EnableComponent(GlowComponent, true)
    bGlowForcedEnabled = true
  elseif missionEventMsg.textID == DisableGlowMsgId and bGlowForcedEnabled then
    bGlowForcedEnabled = false
    if myPlayerIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
      if bLeaderParticlesEnabled ~= true then
        Game.EnableComponent(GlowComponent, false)
      end
    else
      Game.EnableComponent(GlowComponent, false)
    end
  end
end

function ProcessPossessionEndedMessage(msg)
  Support.ExitScript()
end

function ProcessDamageMessage(damageMessage)
  if damageMessage.nDamageType == 23 then
    if bIsSlowed then
      Callbacks.UnregisterForTimer("EndOfSlowDown")
    end
    Player.SetVelocityScale(Self, 0.2)
    Game.SendTextMessage(Self, "slowed down by spectre")
    Callbacks.RegisterForTimer("EndOfSlowDown", spectreStunSlowTime, false)
    bIsSlowed = true
  end
end

function EndOfSlowDown(damageMessage)
  Player.SetVelocityScale(Self, 1)
  bIsSlowed = false
end

function ProcessActorTakingControl(msg)
  ProcessActorControlChanged()
end

function ProcessActorReleasingControl(msg)
  ProcessActorControlChanged()
end

function ProcessActorControlChanged()
  myPlayerIndex = Player.GetPlayerIndexByObject(Self)
  PossessedScriptUpdate()
  bActorControlChanged = true
end

Game.EnableComponent(GlowComponent, false)
Game.SendTextMessage(Self, "DisableLeaderParticles")
if Player.IsLocalPlayer(myPlayerIndex) then
  Callbacks.RegisterForMsg(GS.MsgCallback.DamageMessage, Self, "ProcessDamageMessage")
end
Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, Self, "ProcessMissionEventMessage")
Callbacks.RegisterForMsg(GS.MsgCallback.PossessionEndedMessage, Self, "ProcessPossessionEndedMessage")
Callbacks.RegisterForMsg(GS.MsgCallback.ActorTakingControlMessage, Self, "ProcessActorTakingControl")
Callbacks.RegisterForMsg(GS.MsgCallback.ActorReleasingControlMessage, Self, "ProcessActorReleasingChanged")
Callbacks.RegisterForTimer("PossessedScriptUpdate", 0.5, true)
PossessedScriptUpdate()
