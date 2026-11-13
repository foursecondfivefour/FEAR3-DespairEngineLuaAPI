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
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")
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
local framecount = 0
local PMC = false
local PMM = false
local PMP = false
local PMEC = false
local PMPC = false
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
    local pmExitsStill = Game.IsLoaded(playerConObjPM)
    local PinCover = false
    if pmExitsStill then
      PinCover = Game.IsActiveCoverOn(playerConObjPM)
    end
    if PinCover and not PwasInCover then
      PointManEnteredCover()
    end
    PwasInCover = PinCover
    local PisPeeking = false
    if pmExitsStill then
      PisPeeking = Support.GetObjectVariableFromComponent(playerConObjPM, "popoverMagnitude", "Active Cover Control")
    end
    if PinCover and 0.25 <= PisPeeking then
      if 10 <= framecount then
        PointManIsPeeking()
      end
      framecount = framecount + 1
    end
  end
end

function CheckEveryFrameFettel()
  if playerConObjFettel then
    local FinCover = false
    local fettelExitsStill = Game.IsLoaded(playerConObjFettel)
    if playerConObjFettel then
      FinCover = Game.IsActiveCoverOn(playerConObjFettel)
    end
    if FinCover and not FwasInCover then
      FettelEnteredCover()
    end
    FwasInCover = FinCover
  end
end

function PointManEnteredCover()
  if not PMEC then
    HideCoverTextPM()
    PMEC = true
  end
  ShowTutorialTextMovePM()
end

function PointManIsPeeking()
  if not PMPC then
    HideCoverTextPM()
    PMPC = false
  end
  Callbacks.UnregisterForUpdateEveryFrame("CheckEveryFramePM")
  if enableObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      if nextObj and Game.IsLoaded(nextObj) then
        Game.EnableAllEnableables(nextObj, true)
      end
    end
  end
end

function FettelEnteredCover()
  HideCoverTextFettel()
  ShowTutorialTextMoveFettel()
end

if WhoTriggers == 1 or WhoTriggers == 2 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Point Man"), "ShowTutorialTextPM", "")
end
if WhoTriggers == 1 or WhoTriggers == 3 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Fettel"), "ShowTutorialTextFettel", "HideCoverTextFettelExit")
end
