local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local PwasInCover = false
local FwasInCover = false
local pointMan
local TitleTextID = Support.ImportStaticTextVariable("Title Text ID", "Pick the text ID that should be shown on screen")
local TextID = Support.ImportStaticTextVariable("Text ID", "Pick the text ID that should be shown on screen")
local CoverMovePrompt = Support.ImportStaticTextVariable("Use Move Title Prompt", "The prompt that should appear when explaining how to move along cover")
local CoverMoveTextPrompt = Support.ImportStaticTextVariable("Use Move Text Prompt", "The prompt that should appear when explaining how to move along cover")
local Region = Support.ImportRegionObject("Region", "When a player enters this region, the text will show up on only that player's screen")
Extern.WhoTriggersChoice = {
  Both = 1,
  PointMan = 2,
  Fettel = 3
}
local WhoTriggers = Support.ImportEnumVariable("Extern.WhoTriggersChoice", "Who Should Trigger?", "Select which player should trigger this text when they enter the region.")
local playerIndexPM = GameScript.PlayerIndex.kNotAGlobalPlayer
local playerobjectPM, playerConObjPM
local playerIndexFettel = GameScript.PlayerIndex.kNotAGlobalPlayer
local playerobjectFettel, playerConObjFettel
local PMC = false
local PMM = false
local FC = false
local FM = false
local DisplayTextTable = {}
DisplayTextTable.textId = TextID
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
DisplayTextTable.clearText = false

function ShowTutorialTextPM(MSG)
  if not PMC then
    if MSG.object then
      DisplayTextTable.displayTime = 0
      DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
      DisplayTextTable.clearText = false
      playerIndexPM = Player.GetPlayerIndexByObject(MSG.object)
      playerobjectPM = Player.GetPlayerObjectByIndex(playerIndexPM)
      playerConObjPM = Player.GetPlayerControlledObjectByIndex(playerIndexPM)
      Callbacks.RegisterForUpdateEveryFrame("CheckEveryFramePM")
      if playerobjectPM and Game.IsLoaded(playerobjectPM) and Player.IsLocalPlayer(playerIndexPM) then
        DisplayTextTable.textId = TitleTextID
        DisplayTextTable.textAreaName = "kTutorialTitleText"
        Game.DisplayText(DisplayTextTable, playerIndexPM, true, playerobjectPM)
        DisplayTextTable.textId = TextID
        DisplayTextTable.textAreaName = "TutorialText"
        Game.DisplayText(DisplayTextTable, playerIndexPM, true, playerobjectPM)
      end
    end
    PMC = true
  end
end

function HideCoverTextPM()
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
end

function HideCoverTextPMExit()
  PMM = true
  HideCoverTextPM()
  Callbacks.UnregisterForUpdateEveryFrame("CheckEveryFramePM")
end

function ShowTutorialTextMovePM()
  if not PMM then
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable.clearText = false
    if playerobjectPM and Game.IsLoaded(playerobjectPM) and Player.IsLocalPlayer(playerIndexPM) then
      DisplayTextTable.textId = CoverMovePrompt
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndexPM, true, playerobjectPM)
      DisplayTextTable.textId = CoverMoveTextPrompt
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndexPM, true, playerobjectPM)
    end
    PMM = true
  end
end

function ShowTutorialTextFettel(MSG)
  if not FC then
    if MSG.object then
      DisplayTextTable.displayTime = 0
      DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
      DisplayTextTable.clearText = false
      playerIndexFettel = Player.GetPlayerIndexByObject(MSG.object)
      playerobjectFettel = Player.GetPlayerObjectByIndex(playerIndexFettel)
      playerConObjFettel = Player.GetPlayerControlledObjectByIndex(playerIndexFettel)
      Callbacks.RegisterForUpdateEveryFrame("CheckEveryFrameFettel")
      if playerobjectFettel and Game.IsLoaded(playerobjectFettel) and Player.IsLocalPlayer(playerIndexFettel) then
        DisplayTextTable.textId = TitleTextID
        DisplayTextTable.textAreaName = "kTutorialTitleText"
        Game.DisplayText(DisplayTextTable, playerIndexFettel, true, playerobjectFettel)
        DisplayTextTable.textId = TextID
        DisplayTextTable.textAreaName = "TutorialText"
        Game.DisplayText(DisplayTextTable, playerIndexFettel, true, playerobjectFettel)
      end
    end
    FC = true
  end
end

function HideCoverTextFettel()
  DisplayTextTable.textId = GameScript.TextDisplayDataConstants.kClearTextId
  DisplayTextTable.displayTime = 0
  DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
  DisplayTextTable.clearText = true
  if playerobjectFettel and Game.IsLoaded(playerobjectFettel) and Player.IsLocalPlayer(playerIndexFettel) then
    DisplayTextTable.textAreaName = "kTutorialTitleText"
    Game.DisplayText(DisplayTextTable, playerIndexFettel, true, playerobjectFettel)
    DisplayTextTable.textAreaName = "TutorialText"
    Game.DisplayText(DisplayTextTable, playerIndexFettel, true, playerobjectFettel)
  end
end

function HideCoverTextFettelExit()
  FM = true
  HideCoverTextFettel()
  Callbacks.UnregisterForUpdateEveryFrame("CheckEveryFrameFettel")
end

function ShowTutorialTextMoveFettel()
  if not FM then
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable.clearText = false
    if playerobjectFettel and Game.IsLoaded(playerobjectFettel) and Player.IsLocalPlayer(playerIndexFettel) then
      DisplayTextTable.textId = CoverMovePrompt
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndexFettel, true, playerobjectFettel)
      DisplayTextTable.textId = CoverMoveTextPrompt
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndexFettel, true, playerobjectFettel)
    end
    FM = true
  end
end

function CheckEveryFramePM()
  if playerConObjPM then
    local PinCover = Game.IsActiveCoverOn(playerConObjPM)
    if PinCover and not PwasInCover then
      PointManEnteredCover()
    end
    PwasInCover = PinCover
  end
end

function CheckEveryFrameFettel()
  if playerConObjFettel then
    local FinCover = Game.IsActiveCoverOn(playerConObjFettel)
    if FinCover and not FwasInCover then
      FettelEnteredCover()
    end
    FwasInCover = FinCover
  end
end

function PointManEnteredCover()
  HideCoverTextPM()
  ShowTutorialTextMovePM()
end

function FettelEnteredCover()
  HideCoverTextFettel()
  ShowTutorialTextMoveFettel()
end

if WhoTriggers == 1 or WhoTriggers == 2 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Point Man"), "ShowTutorialTextPM", "HideCoverTextPMExit")
end
if WhoTriggers == 1 or WhoTriggers == 3 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Fettel"), "ShowTutorialTextFettel", "HideCoverTextFettelExit")
end
