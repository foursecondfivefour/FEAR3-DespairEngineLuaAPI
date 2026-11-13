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
local AISquad = Support.ImportSetObject("AI Squad to Monitor", "The squad we will monitor for suspension")
local Region = Support.ImportRegionObject("Region", "When a player enters this region, the text will show up on only that player's screen")
Extern.WhoTriggersChoice = {
  Both = 1,
  PointMan = 2,
  Fettel = 3
}
local WhoTriggers = Support.ImportEnumVariable("Extern.WhoTriggersChoice", "Who Should Trigger?", "Select which player should trigger this text when they enter the region.")
local playerIndex, playerobject
local textOn = false
local textOff = false
local DisplayTextTable = {}
DisplayTextTable.textId = TextID
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
DisplayTextTable.clearText = false

function ShowTutorialText(MSG)
  if not textOn and MSG.object then
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable.clearText = false
    playerIndex = Player.GetPlayerIndexByObject(MSG.object)
    playerobject = Player.GetPlayerObjectByIndex(playerIndex)
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
    textOn = true
  end
end

function AIAddedToSquad(AddedAI)
  if AddedAI ~= nil then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.SuspendMessage, AddedAI, "AIWasSuspended")
  end
end

function AIWasSuspended(MSG)
  if not textOff and MSG.type == 0 then
    textOff = true
    DisplayTextTable.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable.clearText = true
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
  end
end

if WhoTriggers == 1 or WhoTriggers == 2 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Point Man"), "ShowTutorialText", "")
end
if WhoTriggers == 1 or WhoTriggers == 3 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Fettel"), "ShowTutorialText", "")
end
if AISquad ~= nil then
  local AIsInSquad = Sets.GetObjectsInSet(AISquad)
  for key, AI in pairs(AIsInSquad) do
    Callbacks.RegisterForMsg(GameScript.MsgCallback.SuspendMessage, AI, "AIWasSuspended")
  end
  Callbacks.RegisterSetTracker(AISquad, "AIAddedToSquad", "")
end
