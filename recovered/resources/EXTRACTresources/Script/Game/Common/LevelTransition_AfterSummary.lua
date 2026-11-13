local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Player = GameScript.Game.Player
local Debug = GameScript.Debug
local MsgCallback = GameScript.MsgCallback
local DelayMovieTime = 0
local outroMissionNameStringVar = Support.ImportStringVariable("First Mission Name Hint", "The string name of the previous mission (Development hack option)")
local wardMovieType = 2
local scriptObject = Game.GetMyObject()
local transitionMenu = "TransitionMenuPreloader"
Support.RegisterMenuVariable(transitionMenu, "Menu to be used for the transition. This should be the Campaign Loading Screen as it handles the transitions.  Done this way to preload the menu so the miniloader doesn't show.")
local nextLevelIndex = Support.ImportFloatVariableWithDefault("Next Level Index", "Integer indicating what the next level is.", 0)
local isThisWade = Support.ImportBoolVariableWithDefault("Is this a transition to Wade?", "Wade has no ward movie and so is handled differently", false)

function Enable(enableObj)
  if enableObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      if nextObj and Game.IsLoaded(nextObj) then
        Game.EnableAllEnableables(nextObj, true)
      end
    end
  end
end

function PlayWardMovie()
  Debug.PrintInfo("PlayWardMovie!" .. GameScript.NonProduction.GetFrameNumber())
  Game.ShowLoadingScreenMovie(wardMovieType, outroMissionNameStringVar)
  Callbacks.RegisterForMsg(GameScript.MsgCallback.MovieEndMessage, scriptObject, "PlayAndStreamIntroMovie")
end

function PlayAndStreamIntroMovie()
  Debug.PrintInfo("PlayAndStreamIntroMovie!" .. GameScript.NonProduction.GetFrameNumber())
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.MovieEndMessage, scriptObject, "PlayAndStreamIntroMovie")
  GameScript.Game.ShowIntroLoadingMovieAndStreamWithMenu(nextLevelIndex, transitionMenu)
end

GameScript.Audio.StopMusic()
if isThisWade then
  PlayAndStreamIntroMovie()
else
  PlayWardMovie()
end
