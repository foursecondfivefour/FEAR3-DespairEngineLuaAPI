local Game = GameScript.Game
local Player = Game.Player
local Support = GameScript.Support
local MP = Game.MP
local titleTextAreaName = "kTutorialTitleText"
local textAreaName = "TutorialText"
local displayTime = 3
Support.ImportWatchVariable("Collecting Player", "The index of the player who has collected this object")
Support.ImportWatchVariable("Already Collected", "Whether the collecting player had already collected this object before")
local titleTextId1 = Support.ImportStaticTextVariableWithDefault("First Title Text", "The first tutorial title text", 0)
local textId1 = Support.ImportStaticTextVariableWithDefault("First Text", "The first line of tutorial text to display", 0)
local titleTextId2 = Support.ImportStaticTextVariableWithDefault("Second Title Text", "The second line of tutorial title text. Leave blank to not display anything", 0)
local textId2 = Support.ImportStaticTextVariableWithDefault("Second Text", "The second line of tutorial text to display. Leave blank to not display anything", 0)
local myObject = Game.GetMyObject()
local playerHasCollected = {}
local titleTextInfo = {}
titleTextInfo.textId = titleTextId1
titleTextInfo.textAreaName = titleTextAreaName
titleTextInfo.displayTime = displayTime
local textInfo = {}
textInfo.textId = textId1
textInfo.textAreaName = textAreaName
textInfo.displayTime = displayTime
local gameMode = MP.GetGameMode()
if gameMode == GameScript.MPGameMode.kCoop or gameMode == -1 then
  local hasAlreadyCollected = Support.GetImportWatchVariableValue("Already Collected")
  local collectingPlayer = Support.GetImportWatchVariableValue("Collecting Player")
  if Player.IsLocalPlayer(collectingPlayer) and hasAlreadyCollected == 0 then
    Game.DisplayText(titleTextInfo, collectingPlayer, true, myObject)
    Game.DisplayText(textInfo, collectingPlayer, true, myObject)
    if 0 < titleTextId2 and 0 < textId2 then
      titleTextInfo.textId = titleTextId2
      textInfo.textId = textId2
      Game.DisplayText(titleTextInfo, collectingPlayer, true, myObject)
      Game.DisplayText(textInfo, collectingPlayer, true, myObject)
    end
  end
else
  Support.ExitScript()
end
