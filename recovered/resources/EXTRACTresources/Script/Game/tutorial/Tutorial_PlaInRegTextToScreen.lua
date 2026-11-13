local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local TitleTextID = Support.ImportStaticTextVariable("Title Text ID", "Pick the text ID that should be shown on screen")
local TextID = Support.ImportStaticTextVariable("Text ID", "Pick the text ID that should be shown on screen")
local Region = Support.ImportRegionObject("Region", "When a player enters this region, the text will show up on only that player's screen")
Extern.WhoTriggersChoice = {
  Both = 1,
  PointMan = 2,
  Fettel = 3
}
local WhoTriggers = Support.ImportEnumVariable("Extern.WhoTriggersChoice", "Who Should Trigger?", "Select which player should trigger this text when they enter the region.")
local pm = true
local fettel = true
local DisplayTextTable = {}
DisplayTextTable.textId = TextID
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
DisplayTextTable.clearText = false

function ShowTutorialText(MSG)
  if MSG.object and pm then
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable.clearText = false
    local playerIndex = Player.GetPlayerIndexByObject(MSG.object)
    local playerobject = Player.GetPlayerObjectByIndex(playerIndex)
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(Player.GetPlayerIndexByObject(MSG.object)) then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    end
  end
end

function HideTutorialText(MSG)
  if MSG.object and pm then
    DisplayTextTable.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable.clearText = true
    local playerIndex = Player.GetPlayerIndexByObject(MSG.object)
    local playerobject = Player.GetPlayerObjectByIndex(playerIndex)
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(Player.GetPlayerIndexByObject(MSG.object)) then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    end
    pm = false
  end
end

function ShowTutorialTextFettel(MSG)
  if MSG.object and fettel then
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable.clearText = false
    local playerIndex = Player.GetPlayerIndexByObject(MSG.object)
    local playerobject = Player.GetPlayerObjectByIndex(playerIndex)
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(Player.GetPlayerIndexByObject(MSG.object)) then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    end
  end
end

function HideTutorialTextFettel(MSG)
  if MSG.object and fettel then
    DisplayTextTable.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable.clearText = true
    local playerIndex = Player.GetPlayerIndexByObject(MSG.object)
    local playerobject = Player.GetPlayerObjectByIndex(playerIndex)
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(Player.GetPlayerIndexByObject(MSG.object)) then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    end
    fettel = false
  end
end

if WhoTriggers == 1 or WhoTriggers == 2 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Point Man"), "ShowTutorialText", "HideTutorialText")
end
if WhoTriggers == 1 or WhoTriggers == 3 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Fettel"), "ShowTutorialTextFettel", "HideTutorialTextFettel")
end
