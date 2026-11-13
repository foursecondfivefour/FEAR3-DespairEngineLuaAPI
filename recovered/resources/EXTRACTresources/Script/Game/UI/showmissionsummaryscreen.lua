local GameScript = GameScript
local Support = GameScript.Support
local Debug = GameScript.Debug
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local MsgCallback = GameScript.MsgCallback
local Score = GameScript.FEARScore
local missionSummary = "MissionSummaryPreloader"
Support.RegisterMenuVariable(missionSummary, "Menu to be used for the transition. This should be the Mission Summary menu.  Done this way to preload the menu so the miniloader doesn't show.")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "(Optional) Object or Objects that are enabled when movie ends")
local myObject

function OnMenuExitAnimationStartedMessage()
  Debug.PrintInfo("Menu Exit Animation Start Message" .. GameScript.NonProduction.GetFrameNumber())
  Enable()
  Callbacks.UnregisterForMsg(MsgCallback.MenuExitAnimationStartedMessage, myObject, "OnMenuExitAnimationStartedMessage")
end

function Enable()
  if enableObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      Game.EnableAllEnableables(nextObj, true)
    end
  end
end

myObject = Game.GetMyObject()
Callbacks.RegisterForMsg(MsgCallback.MenuExitAnimationStartedMessage, myObject, "OnMenuExitAnimationStartedMessage")
Game.ShowMissionSummaryScreenNoPause()
