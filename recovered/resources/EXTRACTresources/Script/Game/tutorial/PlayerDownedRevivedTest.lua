local Game = GameScript.Game
local Player = Game.Player
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local MP = Game.MP
local TitleTextID = Support.ImportStaticTextVariable("Title Text ID", "Pick the text ID that should be shown on screen")
local PointManDownPrompt = Support.ImportStaticTextVariable("Point Man Down Prompt", "The prompt that should appear when explaining that Point Man is down and to revive him")
local FettelDownPrompt = Support.ImportStaticTextVariable("Fettel Down Prompt", "The prompt that should appear when explaining that Fettel is down and to revive him")
local bIsDowned = false
local DisplayTextTable = {}
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayTime = 5

function Player1ObjectStateChanged(msg)
  if msg.oldState ~= GameScript.ObjectState.NearDeath and msg.newState == GameScript.ObjectState.NearDeath then
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, 1, true, Game.GetMyObject())
      DisplayTextTable.textId = PointManDownPrompt
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, 1, true, Game.GetMyObject())
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(1) then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, 1, true, Game.GetMyObject())
      DisplayTextTable.textId = PointManDownPrompt
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, 1, true, Game.GetMyObject())
    end
  elseif msg.oldState ~= GameScript.ObjectState.NearDeath or msg.newState ~= GameScript.ObjectState.NearDeath then
  end
end

function Player2ObjectStateChanged(msg)
  if msg.oldState ~= GameScript.ObjectState.NearDeath and msg.newState == GameScript.ObjectState.NearDeath then
    if MP.IsNetworkGame() == false then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, 0, true, Game.GetMyObject())
      DisplayTextTable.textId = FettelDownPrompt
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, 0, true, Game.GetMyObject())
    elseif MP.IsNetworkGame() == true and Player.IsLocalPlayer(0) then
      DisplayTextTable.textId = TitleTextID
      DisplayTextTable.textAreaName = "kTutorialTitleText"
      Game.DisplayText(DisplayTextTable, 0, true, Game.GetMyObject())
      DisplayTextTable.textId = FettelDownPrompt
      DisplayTextTable.textAreaName = "TutorialText"
      Game.DisplayText(DisplayTextTable, 0, true, Game.GetMyObject())
    end
  elseif msg.oldState ~= GameScript.ObjectState.NearDeath or msg.newState ~= GameScript.ObjectState.NearDeath then
  end
end

local avatar1, avatar2 = Utilities.GetPointManFettelAvatarObjects()
if avatar1 ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, avatar1, "Player1ObjectStateChanged")
end
if avatar2 ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, avatar2, "Player2ObjectStateChanged")
end
