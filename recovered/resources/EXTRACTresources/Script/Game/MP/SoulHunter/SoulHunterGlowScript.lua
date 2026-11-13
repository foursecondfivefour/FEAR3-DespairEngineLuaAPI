local GS = GameScript
local Callbacks = GS.Callbacks
local Support = GS.Support
local Game = GS.Game
local Player = Game.Player
local MP = Game.MP
local FEARScore = GS.FEARScore
local Self = Game.GetMyObject()
local MyPlayerIndex = Player.GetPlayerIndexByObject(Self)
local Souls = GS.MissionScoreCategory.Souls
local GlowComponent = Support.RegisterComponentHandle("Glow Rendering Component")
local EnableGlowMsgId = Support.ImportStaticTextVariable("MissionEvent: Enable Glow", "")
local DisableGlowMsgId = Support.ImportStaticTextVariable("MissionEvent: Disable Glow", "")
local GlowForcedEnabled = false
local LeaderParticlesEnabled = false

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
  if LeaderIndex == MyPlayerIndex then
    return true
  end
  return false
end

function GlowUpdate()
  if MyPlayerIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
    if AmITheKing() == true then
      if not LeaderParticlesEnabled then
        Game.EnableComponent(GlowComponent, true)
        Game.SendTextMessage(Self, "EnableLeaderParticles")
        LeaderParticlesEnabled = true
      end
    elseif LeaderParticlesEnabled then
      if not GlowForcedEnabled then
        Game.EnableComponent(GlowComponent, false)
      end
      Game.SendTextMessage(Self, "DisableLeaderParticles")
      LeaderParticlesEnabled = false
    end
  end
end

function ProcessMissionEventMessage(missionEventMsg)
  if missionEventMsg.textID == EnableGlowMsgId and not GlowForcedEnabled then
    Game.EnableComponent(GlowComponent, true)
    GlowForcedEnabled = true
  elseif missionEventMsg.textID == DisableGlowMsgId and GlowForcedEnabled then
    GlowForcedEnabled = false
    if MyPlayerIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
      if LeaderParticlesEnabled ~= true then
        Game.EnableComponent(GlowComponent, false)
      end
    else
      Game.EnableComponent(GlowComponent, false)
    end
  end
end

Game.EnableComponent(GlowComponent, false)
if MyPlayerIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
  Callbacks.RegisterForTimer("GlowUpdate", 0.5, true)
end
Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, Self, "ProcessMissionEventMessage")
Game.SendTextMessage(Self, "DisableLeaderParticles")
