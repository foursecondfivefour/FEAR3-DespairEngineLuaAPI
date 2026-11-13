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
local numPreviousWeapons = 0
local pointMan, fettel, playerIndexPM, playerIndexFettel
local PMtext = true
local FettelText = true
local pointmanAvatar, fettelAvatar
local done = false
local DisplayTextTable = {}
DisplayTextTable.textId = TextID
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayTime = TimeOnScreen
local PointManObject = Player.GetPlayerControlledObjectByIndex(0)
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

function PlayerInventoryChanged()
  if pointmanAvatar == nil then
    return
  end
  if done then
    return
  end
  local inventoryItems = Game.GetInventoryItemsByTypeAndName(pointmanAvatar, 1, "Primary Weapon Inventory")
  local numWeapons = #inventoryItems
  if 2 <= numWeapons and numPreviousWeapons < 2 then
    TextToScreen()
  end
  numPreviousWeapons = numWeapons
end

function TextToScreen()
  if MP.IsNetworkGame() == false then
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
  done = true
end

if pointmanAvatar ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ItemStatusForCarrierMessage, pointmanAvatar, "PlayerInventoryChanged")
end
