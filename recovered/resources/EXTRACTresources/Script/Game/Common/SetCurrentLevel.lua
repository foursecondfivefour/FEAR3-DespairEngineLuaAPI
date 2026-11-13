local Support = GameScript.Support
local Game = GameScript.Game
local MP = Game.MP
local FEARScore = GameScript.FEARScore
local Utilities = GameScript.Utilities
local Debug = GameScript.Debug
Support.AddDescription("Record mission being started in player profile")
local MissionNumber = Support.ImportFloatVariable("Mission Number", "Integer indicating what mission this is")
if MissionNumber then
  Game.SetCurrentLevel(MissionNumber)
end
Game.SetPlayersStartedLevel()
if not MP.IsNetworkGame() or not MP.IsClient() then
  FEARScore.ResetMissionPoints()
  FEARScore.ResetMissionTimer()
  FEARScore.StartMissionTimer()
end
local GDObject = Utilities.GetGlobalDataObject()
if GDObject ~= nil and not MP.IsClient() then
  Game.SendTextMessage(GDObject, "Mission Started")
end
