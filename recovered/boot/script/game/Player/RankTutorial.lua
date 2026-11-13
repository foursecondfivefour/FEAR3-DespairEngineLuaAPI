local Support = GameScript.Support
local Score = GameScript.FEARScore
local Game = GameScript.Game
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local Self = Game.GetMyObject()
local PlayerIndex = Player.GetPlayerIndexByObject(Self)
local CurrentRank = Score.GetPlayerRank(PlayerIndex)
local fDisplayTime = Support.ImportFloatVariableWithDefault("Text Display Time", "The time the tutorial text displays on-screen.", 5)
local nTargRank = math.floor(Support.ImportFloatVariable("Target Rank", "The rank that the player has to have in order for the tutorial text to display. Any floating decimal points will be truncated."))
local DisplayInfo_Title1 = {}
DisplayInfo_Title1.textId = Support.ImportStaticTextVariable("Tutorial Title Text 1", "The title tutorial text to display when the appropriate ranked is achieved.")
DisplayInfo_Title1.textAreaName = "kTutorialTitleText"
DisplayInfo_Title1.displayTime = fDisplayTime
local DisplayInfo_Text1 = {}
DisplayInfo_Text1.textId = Support.ImportStaticTextVariable("Tutorial Text 1", "The tutorial text to display when the appropriate ranked is achieved.")
DisplayInfo_Text1.textAreaName = "TutorialText"
DisplayInfo_Text1.displayTime = fDisplayTime
local DisplayInfo_Title2 = {}
DisplayInfo_Title2.textId = Support.ImportStaticTextVariable("Tutorial Title Text 2", "The title tutorial text to display when the appropriate ranked is achieved.")
DisplayInfo_Title2.textAreaName = "kTutorialTitleText"
DisplayInfo_Title2.displayTime = fDisplayTime
local DisplayInfo_Text2 = {}
DisplayInfo_Text2.textId = Support.ImportStaticTextVariable("Tutorial Text 2", "The tutorial text to display when the appropriate ranked is achieved.")
DisplayInfo_Text2.textAreaName = "TutorialText"
DisplayInfo_Text2.displayTime = fDisplayTime

function OnRank()
  if not Player.IsLocalPlayer(PlayerIndex) then
    return
  end
  Debug.PrintInfo("OnRank")
  if Score.GetPlayerRank(PlayerIndex) == nTargRank then
    Game.DisplayText(DisplayInfo_Title1, PlayerIndex, false, Self)
    Game.DisplayText(DisplayInfo_Text1, PlayerIndex, false, Self)
    if DisplayInfo_Title2.textId ~= nil then
      Callbacks.RegisterForTimer("OnTimeDelay", fDisplayTime, false)
    end
  end
  Debug.PrintInfo("NEW !!! Player Index = " .. PlayerIndex .. "; Rank = " .. CurrentRank)
  CurrentRank = Score.GetPlayerRank(PlayerIndex)
end

function OnTimeDelay()
  Game.DisplayText(DisplayInfo_Title2, PlayerIndex, false, Self)
  Game.DisplayText(DisplayInfo_Text2, PlayerIndex, false, Self)
  Callbacks.UnregisterForTimer("OnTimeDelay")
end

function Initialize(thisObject)
  Callbacks.RegisterForMsg(GameScript.MsgCallback.RankAttainedMessage, Self, "OnRank")
end

Initialize(scriptObject)
