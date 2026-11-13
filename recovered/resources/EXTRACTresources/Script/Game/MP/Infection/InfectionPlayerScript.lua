local GS = GameScript
local Callbacks = GS.Callbacks
local Support = GS.Support
local Game = GS.Game
local Debug = GS.Debug
local Player = Game.Player
local Physics = Game.Physics
local MP = Game.MP
local Utilities = GS.Utilities
local stats = GS.PlayerStatistic
local Camera = GS.Game.Camera
local mpAward = GS.MPAwardType
local Msg = GS.MsgCallback
local ObjectTags = Game.ObjectTags
local FEAR = GameScript.FEAR
local Self = Game.GetMyObject()
local PlayerIndex = Player.GetPlayerIndexByObject(Self)
local bIsPossessing = false
Support.ExportFloatVariable("CanTeleport", 0, "Hack extern/export variable for the telporters to check if this player can teleport.")
local glowComponent, CorruptionUsable
if MP.GetTeamForPlayer(PlayerIndex) == 0 then
  glowComponent = Support.RegisterComponentHandle("Glow Rendering")
  CorruptionUsable = Support.RegisterComponentHandle("Corruption Usable")
end
local StartRoundMessageText = Support.ImportStaticTextVariable("MissionEvent: Start Round", "")
local EndRoundMessageText = Support.ImportStaticTextVariable("MissionEvent: End Round", "")
local TeleportTimer = 0
local BeginTeleportMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Teleport", "")
local TimeBetweenTeleports = Support.ImportFloatVariableWithDefault("Time Between Teleports", "The amount of time between teleports allowed.", 10)
local spectreStunSlowTime = Support.ImportFloatVariableWithDefault("spectre Stun Slow Duration", "The length of time a player stays slowed when hit with the spectres blast.", 2)
local YScreenPosDelta = -0.05
local YInitialScreenPos = 0.9
local XInitialScreenPos = 0.025
local IsSlowed = false

function UpdateTeleportTimer()
  Extern.CanTeleport = 0
  if 0 < TeleportTimer then
    local delta = Support.GetGameTimeDelta()
    TeleportTimer = TeleportTimer - delta
  else
    Callbacks.UnregisterForUpdateEveryFrame("UpdateTeleportTimer")
  end
end

function OnEndRound()
  SetInvulnerable(true)
  if MP.GetTeamForPlayer(PlayerIndex) == 0 then
    Game.EnableComponent(CorruptionUsable, false)
  end
end

function OnStartRound()
  SetInvulnerable(false)
end

function SetInvulnerable(bInvulnerable)
  Game.SetHitPointPriorityInvulnerable(Self, 1, bInvulnerable)
end

function ProcessPossessionStartedMessage(possessionMessage)
end

function ProcessPossessionEndedMessage(possessionMessage)
end

function EnableMovement(bMovementOn)
  local object = Player.GetPlayerObjectByIndex(PlayerIndex)
  if object ~= nil then
    Game.EnableObjectInput(object, true, true, bMovementOn, true)
  end
end

function ProcessMissionEventMessage(EventMessage)
  if EventMessage.textID == BeginTeleportMsgId then
    if 0 < TeleportTimer then
      Callbacks.RegisterForUpdateEveryFrame("UpdateTeleportTimer")
    end
    TeleportTimer = TimeBetweenTeleports
  elseif EventMessage.textID == StartRoundMessageText then
    OnStartRound()
  elseif EventMessage.textID == EndRoundMessageText then
    OnEndRound()
  end
end

function EndOfSlowDown()
  Player.SetVelocityScale(Self, 1)
  IsSlowed = false
end

function TextSpew(msgTable)
  Debug.PrintToScreenWithTimer("Message: " .. msgTable.text, 5, GameScript.Utilities.kRed, false)
end

function ProcessDamageMessage(damageMessage)
  if damageMessage.nDamageType == 23 then
    if IsSlowed then
      Callbacks.UnregisterForTimer("EndOfSlowDown")
    end
    Player.SetVelocityScale(Self, 0.2)
    Game.SendTextMessage(Self, "slowed down by spectre")
    Callbacks.RegisterForTimer("EndOfSlowDown", spectreStunSlowTime, false)
    IsSlowed = true
  end
end

if Self ~= nil then
  if not MP.IsClient() then
    Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, Self, "ProcessMissionEventMessage")
    Callbacks.RegisterForMsg(GS.MsgCallback.PossessionStartedMessage, Self, "ProcessPossessionStartedMessage")
    Callbacks.RegisterForMsg(GS.MsgCallback.PossessionEndedMessage, Self, "ProcessPossessionEndedMessage")
  end
  if MP.GetTeamForPlayer(PlayerIndex) == 0 then
    SetInvulnerable(true)
    Game.EnableComponent(glowComponent, true)
  end
  if Player.IsLocalPlayer(PlayerIndex) then
    Callbacks.RegisterForMsg(GS.MsgCallback.DamageMessage, Self, "ProcessDamageMessage")
  end
end
