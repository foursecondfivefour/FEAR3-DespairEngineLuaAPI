local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Player = Game.Player
local Support = GS.Support
local Debug = GS.Debug
local Regions = Game.Regions
local Sets = Game.Sets
local Utilities = GS.Utilities
local MP = Game.MP
local Physics = Game.Physics
local Score = GS.FEARScore
local PointAward = Support.ImportFloatVariable("Soul Point Value", "The number of soul points awarded when this object is picked up.")
local DespawnTimer = Support.ImportFloatVariable("Despawn Timer", "The number of seconds to despawn after.")
local OnePlayerPointScalar = Support.ImportFloatVariableWithDefault("OnePlayerPointScalar", "The scalar to scale point values for only one player.", 1)
local MyObject = Game.GetMyObject()

function GetActualNumPlayers()
  local ActualNumPlayers = 0
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) then
      ActualNumPlayers = ActualNumPlayers + 1
    end
  end
  return ActualNumPlayers
end

function GivePlayerPoints(PlayerIndex, PointAmount)
  Score.AwardMissionPointOccurences(PlayerIndex, GameScript.MissionScoreCategory.Souls, 1)
  Score.AwardMissionPoints(PlayerIndex, GameScript.MissionScoreCategory.Souls, GetModifiedPoints(PointAmount))
end

function GetModifiedPoints(Points)
  local points = Points
  if GetActualNumPlayers() <= 1 then
    points = points * OnePlayerPointScalar
  end
  if points < 10 then
    points = 10
  end
  return math.floor(points)
end

function OnEnterRegion(PlayerHandle)
  local PlayerIndex = Player.GetPlayerIndexByObject(PlayerHandle.object)
  if Game.IsNeutral(PlayerHandle.object) then
    return
  end
  if Game.AreAllies(MyObject, PlayerHandle.object) then
    return
  end
  GivePlayerPoints(PlayerIndex, PointAward)
  DespawnMe()
end

function DespawnMe()
  Game.Kill(MyObject, 1)
end

if not MP.IsClient() then
  Callbacks.RegisterPlayerEnterExitRegion(MyObject, "OnEnterRegion", "")
  if 0 < DespawnTimer then
    Callbacks.RegisterForTimer("DespawnMe", DespawnTimer, true)
  end
end
