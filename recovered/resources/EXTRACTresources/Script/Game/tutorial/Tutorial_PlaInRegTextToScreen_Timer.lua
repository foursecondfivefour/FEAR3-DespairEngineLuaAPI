local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local TimeOnScreen = Support.ImportFloatVariableWithDefault("Time on Screen", "The length of time this should stay on screen.", 5)
local TitleTextID = Support.ImportStaticTextVariable("Title Text ID", "Pick the text ID that should be shown on screen")
local TextID = Support.ImportStaticTextVariable("Text ID", "Pick the text ID that should be shown on screen")
local Region = Support.ImportRegionObject("Region", "When a player enters this region, the text will show up on only that player's screen")
Extern.WhoTriggersChoice = {
  Both = 1,
  PointMan = 2,
  Fettel = 3
}
local WhoTriggers = Support.ImportEnumVariable("Extern.WhoTriggersChoice", "Who Should Trigger?", "Select which player should trigger this text when they enter the region.")
local DisplayTextTable = {}
DisplayTextTable.textId = TextID
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayTime = TimeOnScreen

function TextToScreen(MSG)
  if MSG.object then
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      DisplayTextTable.displayTime = TimeOnScreen
      Game.DisplayText(DisplayTextTable, Player.GetPlayerIndexByObject(MSG.object), false, Game.GetMyObject())
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      DisplayTextTable.displayTime = TimeOnScreen
      Game.DisplayText(DisplayTextTable, Player.GetPlayerIndexByObject(MSG.object), false, Game.GetMyObject())
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(Player.GetPlayerIndexByObject(MSG.object)) then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      DisplayTextTable.displayTime = TimeOnScreen
      Game.DisplayText(DisplayTextTable, Player.GetPlayerIndexByObject(MSG.object), false, Game.GetMyObject())
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      DisplayTextTable.displayTime = TimeOnScreen
      Game.DisplayText(DisplayTextTable, Player.GetPlayerIndexByObject(MSG.object), false, Game.GetMyObject())
    end
  end
end

if WhoTriggers == 1 or WhoTriggers == 2 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Point Man"), "TextToScreen", "")
end
if WhoTriggers == 1 or WhoTriggers == 3 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Fettel"), "TextToScreen", "")
end
