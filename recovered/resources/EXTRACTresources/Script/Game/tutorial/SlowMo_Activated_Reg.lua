local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local Sets = Game.Sets
local TitleTextID = Support.ImportStaticTextVariable("Title Text ID", "Pick the text ID that should be shown on screen")
local TextID = Support.ImportStaticTextVariable("Text ID", "Pick the text ID that should be shown on screen")
local Region = Support.ImportRegionObject("Region", "When a player enters this region, the text will show up on only that player's screen")
local EnableObject = Support.ImportSingleObject("Enable Object", "Enable this object")
Extern.WhoTriggersChoice = {
  Both = 1,
  PointMan = 2,
  Fettel = 3
}
local WhoTriggers = Support.ImportEnumVariable("Extern.WhoTriggersChoice", "Who Should Trigger?", "Select which player should trigger this text when they enter the region.")
local pm = true
local pmtext = false
local pmstart = true
local fettel = true
local fetteltext = false
local fettelstart = true
local playerIndexPM, playerobjectPM, playerIndexFet, playerobjectFet
local DisplayTextTable = {}
DisplayTextTable.textId = TextID
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
DisplayTextTable.clearText = false

function ShowTutorialText(MSG)
  if MSG.object and pm and pmstart then
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable.clearText = false
    playerIndexPM = Player.GetPlayerIndexByObject(MSG.object)
    playerobjectPM = Player.GetPlayerObjectByIndex(playerIndexPM)
    if playerobjectPM and Game.IsLoaded(playerobjectPM) and Player.IsLocalPlayer(playerIndexPM) then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndexPM, true, playerobjectPM)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndexPM, true, playerobjectPM)
    end
    pmstart = false
    pmtext = true
  end
end

function HideTutorialText()
  if pm then
    DisplayTextTable.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable.clearText = true
    if playerobjectPM and Game.IsLoaded(playerobjectPM) and Player.IsLocalPlayer(playerIndexPM) then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndexPM, true, playerobjectPM)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndexPM, true, playerobjectPM)
    end
    pm = false
  end
end

function ShowTutorialTextFettel(MSG)
  if MSG.object and fettel and fettelstart then
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable.clearText = false
    playerIndexFet = Player.GetPlayerIndexByObject(MSG.object)
    playerobjectFet = Player.GetPlayerObjectByIndex(playerIndexFet)
    if playerobjectFet and Game.IsLoaded(playerobjectFet) and Player.IsLocalPlayer(playerIndexFet) then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndexFet, true, playerobjectFet)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndexFet, true, playerobjectFet)
    end
    fettelstart = false
    fetteltext = true
  end
end

function HideTutorialTextFettel()
  if fettel then
    DisplayTextTable.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable.clearText = true
    if playerobjectFet and Game.IsLoaded(playerobjectFet) and Player.IsLocalPlayer(playerIndexFet) then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndexFet, true, playerobjectFet)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndexFet, true, playerobjectFet)
    end
    fettel = false
  end
end

function SlowMoActivated()
  Game.EnableAllEnableables(EnableObject, true)
  pmstart = false
  fettelstart = false
  if pmtext then
    HideTutorialText()
  end
  if fetteltext then
    HideTutorialTextFettel()
  end
end

function HideTutorialTextReg()
  if pmtext then
    pmstart = false
    HideTutorialText()
  end
end

function HideTutorialTextFettelReg()
  if fetteltext then
    fettelstart = false
    HideTutorialTextFettel()
  end
end

if WhoTriggers == 1 or WhoTriggers == 2 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Point Man"), "ShowTutorialText", "HideTutorialTextReg")
end
if WhoTriggers == 1 or WhoTriggers == 3 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Fettel"), "ShowTutorialTextFettel", "HideTutorialTextFettelReg")
end
local myObject = Game.GetMyObject()
Callbacks.RegisterForMsg(GameScript.MsgCallback.SlowMoActivatedMessage, myObject, "SlowMoActivated")
