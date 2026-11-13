local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local MP = Game.MP
local FEARScore = GameScript.FEARScore
local Utilities = GameScript.Utilities
local Debug = GameScript.Debug
local easyParTime = Support.ImportFloatVariable("Easy Par Time", "The level completion time players need to beat to get the bonus on Easy difficulty")
local parTime = Support.ImportFloatVariable("Par Completion Time", "The level completion time players need to beat to get the bonus on Normal difficulty")
local hardParTime = Support.ImportFloatVariable("Hard Par Time", "The level completion time players need to beat to get the bonus on Hard difficulty")
local insaneParTime = Support.ImportFloatVariable("Insane Par Time", "The level completion time players need to beat to get the bonus on Insane difficulty")

function GetParTime()
  local lowestDifficulty = FEARScore.GetLowestDifficultyUsed()
  if lowestDifficulty == 1 then
    return easyParTime
  elseif lowestDifficulty == 2 then
    return parTime
  elseif lowestDifficulty == 3 then
    return hardParTime
  else
    return insaneParTime
  end
end

if not MP.IsClient() then
  FEARScore.StopMissionTimer()
end
local actualParTime = GetParTime()
FEARScore.SetParTime(actualParTime)
local missionTime = FEARScore.GetMissionTime()
if missionTime == nil then
  Support.ExitScript()
  return
end
local underParTime = actualParTime - missionTime
local difficultyPoints = FEARScore.GetLowestDifficultyUsed() - 1
if not missionTime or parTime then
end
local GDObject = Utilities.GetGlobalDataObject()
if GDObject ~= nil and not MP.IsClient() then
  Game.SendTextMessage(GDObject, "Mission Ended")
end
for key, index in pairs(GameScript.PlayerIndexArray) do
  if Player.IsActivePlayer(index) and (not MP.IsNetworkGame() or not MP.IsClient()) then
    if 0 < underParTime and GameScript.MissionScoreCategory.TimeBonus then
      FEARScore.AwardMissionPointOccurences(index, GameScript.MissionScoreCategory.TimeBonus, underParTime)
    end
    if GameScript.MissionScoreCategory.DifficultyBonus then
      FEARScore.AwardMissionPointOccurences(index, GameScript.MissionScoreCategory.DifficultyBonus, difficultyPoints)
    end
  end
end
FEARScore.CalculateMissionScore()
for key, index in pairs(GameScript.PlayerIndexArray) do
  if Player.IsActivePlayer(index) and Game.HasPlayerStartedLevel(index) then
    Game.CompleteCurrentLevel(index)
  end
end
