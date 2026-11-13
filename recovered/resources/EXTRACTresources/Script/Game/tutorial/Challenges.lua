local Game = GameScript.Game
local Player = Game.Player
local Callbacks = GameScript.Callbacks
local Util = GameScript.Utilities
local Support = GameScript.Support
local MP = Game.MP
local Debug = GameScript.Debug
local ObjectTags = Game.ObjectTags
local TimeOnScreen = Support.ImportFloatVariableWithDefault("Time on Screen", "The length of time this should stay on screen.", 5)
local TitleTextID = Support.ImportStaticTextVariable("Title Text ID", "Pick the text ID that should be shown on screen")
local TextID = Support.ImportStaticTextVariable("Text ID", "Pick the text ID that should be shown on screen")
local pointMan, fettel, playerIndexPM, playerIndexFettel
local PMtext = true
local FettelText = true
local pointmanAvatar, fettelAvatar
local DisplayTextTable = {}
DisplayTextTable.textId = TextID
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayTime = TimeOnScreen
local i = 0
Debug.PrintInfo("Init")
while i <= Player.GetNumPlayers() do
  local avatar = Player.GetPlayerAvatarObjectByIndex(i)
  if avatar then
    if ObjectTags.DoesObjectHaveTag(avatar, "Point Man") then
      pointmanAvatar = avatar
      playerIndexPM = i
    end
    if ObjectTags.DoesObjectHaveTag(avatar, "Fettel") then
      fettelAvatar = avatar
      playerIndexFettel = i
    end
  end
  i = i + 1
end

function PMChallenge()
  if playerIndexPM ~= nil and PMtext then
    if MP.IsNetworkGame() == false then
      Debug.PrintInfo("PM Print")
      local playerIndex = playerIndexPM
      local playerobject = Player.GetPlayerObjectByIndex(playerIndex)
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      DisplayTextTable.displayTime = TimeOnScreen
      Game.DisplayText(DisplayTextTable, playerIndex, false, playerobject)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      DisplayTextTable.displayTime = TimeOnScreen
      Game.DisplayText(DisplayTextTable, playerIndex, false, playerobject)
    elseif MP.IsNetworkGame() == true then
      local playerIndex = playerIndexPM
      local playerobject = Player.GetPlayerObjectByIndex(playerIndex)
      if Player.IsLocalPlayer(playerIndex) then
        DisplayTextTable.textId = TitleTextID
        DisplayTextTable.textAreaName = "kTutorialTitleText"
        DisplayTextTable.displayTime = TimeOnScreen
        Game.DisplayText(DisplayTextTable, playerIndex, false, playerobject)
        DisplayTextTable.textId = TextID
        DisplayTextTable.textAreaName = "TutorialText"
        DisplayTextTable.displayTime = TimeOnScreen
        Game.DisplayText(DisplayTextTable, playerIndex, false, playerobject)
      end
    end
    PMtext = false
  end
end

function FettelChallenge()
  if playerIndexFettel ~= nil and FettelText then
    if MP.IsNetworkGame() == false then
      Debug.PrintInfo("Fettel Print")
      local playerIndex = playerIndexFettel
      local playerobject = Player.GetPlayerObjectByIndex(playerIndex)
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      DisplayTextTable.displayTime = TimeOnScreen
      Game.DisplayText(DisplayTextTable, playerIndex, false, playerobject)
      DisplayTextTable.textId = TextID
      DisplayTextTable.textAreaName = "TutorialText"
      DisplayTextTable.displayTime = TimeOnScreen
      Game.DisplayText(DisplayTextTable, playerIndex, false, playerobject)
    elseif MP.IsNetworkGame() == true then
      local playerIndex = playerIndexFettel
      local playerobject = Player.GetPlayerObjectByIndex(playerIndex)
      if Player.IsLocalPlayer(playerIndex) then
        DisplayTextTable.textId = TitleTextID
        DisplayTextTable.textAreaName = "kTutorialTitleText"
        DisplayTextTable.displayTime = TimeOnScreen
        Game.DisplayText(DisplayTextTable, playerIndex, false, playerobject)
        DisplayTextTable.textId = TextID
        DisplayTextTable.textAreaName = "TutorialText"
        DisplayTextTable.displayTime = TimeOnScreen
        Game.DisplayText(DisplayTextTable, playerIndex, false, playerobject)
      end
    end
    FettelText = false
  end
end

if pointmanAvatar ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ChallengeUpdateMessage, pointmanAvatar, "PMChallenge")
  Debug.PrintInfo("PM Callback")
end
if fettelAvatar ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ChallengeUpdateMessage, fettelAvatar, "FettelChallenge")
  Debug.PrintInfo("Fettel Callback")
end
