local Game = GameScript.Game
local Support = GameScript.Support
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local TitleTextID = Support.ImportStaticTextVariable("Title Text ID", "Pick the text ID that should be shown on screen")
local TextID = Support.ImportStaticTextVariable("Text ID", "Pick the text ID that should be shown on screen")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")
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
DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.HighPriority
DisplayTextTable.clearText = false
local playerIndex, playerobject
local show = true
local hide = false
local hide2 = true
local playerleft = false
local padlock = true
local playerTransferMsg = GameScript.MsgCallback.PlayerTransferControlMessage
local possessionEndMsg = GameScript.MsgCallback.PossessionEndedMessage

function ShowTutorialText(MSG)
  Debug.PrintInfo("ShowTutorialText")
  if MSG.object and show then
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
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(playerIndex) then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    end
    show = false
    hide = true
  end
end

function PlayerTransferredControl(MSG)
  Debug.PrintInfo("Player exited possessed body pt1!")
  PlayerPossessionEnded2()
end

function PlayerPossessionEnded2()
  Debug.PrintInfo("Player exited possessed body pt2!")
  if hide and hide2 and not playerleft then
    Debug.PrintInfo("Player exited possessed body pt3!")
    DisplayTextTable.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable.clearText = true
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(playerIndex) then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    end
    Debug.PrintInfo("Enable Set")
    if enableObj ~= nil then
      Debug.PrintInfoIf(0 < g_debugMode, "Enable Object - Number:" .. table.getn(enableObj))
      for key, nextObj in pairs(enableObj) do
        if nextObj and Game.IsLoaded(nextObj) then
          Game.EnableAllEnableables(nextObj, true)
        end
      end
    end
    hide2 = false
  end
end

function PlayerLeftRegion(MSG)
  if not playerleft then
    Debug.PrintInfo("Player exited region!")
    DisplayTextTable.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable.displayTime = 0
    DisplayTextTable.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable.clearText = true
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(playerIndex) then
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, playerIndex, true, playerobject)
    end
    hide2 = false
    playerleft = true
  end
end

if WhoTriggers == 1 or WhoTriggers == 3 then
  Callbacks.RegisterObjectTagEnterExitRegion(Region, Game.ObjectTags.GetObjectTagUID("Fettel"), "ShowTutorialText", "PlayerLeftRegion")
end
Callbacks.RegisterForMsg(playerTransferMsg, Game.GetMyObject(), "PlayerTransferredControl")
