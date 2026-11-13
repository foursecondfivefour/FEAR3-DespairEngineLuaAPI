local GS = GameScript
local Callbacks = GS.Callbacks
local Support = GS.Support
local Game = GS.Game
local Player = Game.Player
local Debug = GS.Debug
local Self = Game.GetMyObject()
local PlayerIndex = Player.GetPlayerIndexByObject(Self)
local GlowComponent = Support.RegisterComponentHandle("Glow Rendering Component")
local EnableGlowMsgId = Support.ImportStaticTextVariable("MissionEvent: Enable Glow", "")
local DisableGlowMsgId = Support.ImportStaticTextVariable("MissionEvent: Disable Glow", "")
local spectreStunSlowTime = Support.ImportFloatVariableWithDefault("spectre Stun Slow Duration", "The length of time a player stays slowed when hit with the spectres blast.", 4)
local GlowForcedEnabled = false
local IsSlowed = false

function ProcessMissionEventMessage(missionEventMsg)
  if missionEventMsg.textID == EnableGlowMsgId and not GlowForcedEnabled then
    Game.EnableComponent(GlowComponent, true)
    GlowForcedEnabled = true
  elseif missionEventMsg.textID == DisableGlowMsgId and GlowForcedEnabled then
    Game.EnableComponent(GlowComponent, false)
    GlowForcedEnabled = false
  end
end

Game.EnableComponent(GlowComponent, false)
Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, Self, "ProcessMissionEventMessage")
