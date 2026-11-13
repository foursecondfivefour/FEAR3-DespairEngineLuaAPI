local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Player = GameScript.Game.Player
local Debug = GameScript.Debug
local MsgCallback = GameScript.MsgCallback
local Utilities = GameScript.Utilities
local ObjectTags = GameScript.Game.ObjectTags
local movePlayersScript = Support.ImportObjectHandleVariable("movePlayersScript", "Scripts to enable that move the players behind the movie playing")
local showMissionSummaryScreenScript = Support.ImportObjectHandleVariable("showMissionSummaryScreenScript", "Script that displays the mission summary screen")
local outroMissionNameStringVar = Support.ImportStringVariable("First Mission Name Hint", "The string name of the previous mission (Development hack option)")
local outroMovieType = 1
local scriptObject = Game.GetMyObject()
local transitionMenu = "TransitionMenuPreloader"
Support.RegisterMenuVariable(transitionMenu, "Menu to be used for the transition. This should be the Campaign Loading Screen as it handles the transitions.  Done this way to preload the menu so the miniloader doesn't show.")

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

function PlayOutroMovie()
  Debug.PrintInfo("PlayOutroMovie!" .. GameScript.NonProduction.GetFrameNumber())
  Game.ShowLoadingScreenMovieWithMenu(outroMovieType, outroMissionNameStringVar, transitionMenu)
  Callbacks.RegisterForMsg(GameScript.MsgCallback["Game::MovieStartMessage"], scriptObject, "MovePlayers")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.MovieEndMessage, scriptObject, "ShowMissionSummaryScreen")
  Debug.PrintInfo("Leaving PlayOutroMovie!" .. GameScript.NonProduction.GetFrameNumber())
end

function MovePlayers()
  Debug.PrintInfo("MovePlayers!" .. GameScript.NonProduction.GetFrameNumber())
  Debug.PrintInfo("Hiding Player View")
  Game.HidePlayerView()
  Enable(movePlayersScript)
end

function ShowMissionSummaryScreen()
  Debug.PrintInfo("ShowMissionSummaryScreen!" .. GameScript.NonProduction.GetFrameNumber())
  Callbacks.UnregisterForMsg(GameScript.MsgCallback["Game::MovieStartMessage"], scriptObject, "MovePlayers")
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.MovieEndMessage, scriptObject, "ShowMissionSummaryScreen")
  Enable(showMissionSummaryScreenScript)
end

function PlayersAreAlive()
  local pointManIndex, fettelIndex, pmAvatar, fettelAvatar
  pointManIndex, fettelIndex, pmAvatar, fettelAvatar = Utilities.GetPointManAndFettel()
  local pmControlled, fettelControlled = Utilities.GetPointManFettelControlledObjects()
  local pmAlive = false
  local fettelAlive = false
  local pmRagdoll = false
  local fettelRagdoll = false
  if CheckObjectTag(pmAvatar, "Point Man") and pmControlled and Game.IsLoaded(pmControlled) then
    if CheckObjectTag(pmControlled, "Ragdoll") then
      pmRagdoll = true
      Debug.PrintInfo("PM Alive but is ragdoll")
    end
    pmAlive = true
  end
  if CheckObjectTag(fettelAvatar, "Fettel") and fettelControlled and Game.IsLoaded(fettelControlled) then
    if CheckObjectTag(fettelControlled, "Ragdoll") then
      fettelRagdoll = true
      Debug.PrintInfo("Fettel Alive but is ragdoll")
    end
    fettelAlive = true
  end
  Debug.PrintInfo("pmAlive is: " .. tostring(pmAlive))
  Debug.PrintInfo("pmRagdoll is: " .. tostring(pmRagdoll))
  Debug.PrintInfo("fettelAlive is: " .. tostring(fettelAlive))
  Debug.PrintInfo("fettelRagdoll is: " .. tostring(fettelRagdoll))
  return (pmAlive or fettelAlive) and (not pmAlive or not pmRagdoll) and (not fettelAlive or not fettelRagdoll)
end

function CheckObjectTag(objectToCheck, tagToCheck)
  if objectToCheck and Game.IsLoaded(objectToCheck) then
    if ObjectTags.DoesObjectHaveTag(objectToCheck, tagToCheck) then
      return true
    end
  else
    Debug.PrintInfo("CheckObjectTag: objectToCheck is nil or isn't loaded ")
  end
  return false
end

if PlayersAreAlive() then
  GameScript.Audio.StopMusic()
  PlayOutroMovie()
else
  Debug.PrintInfo("Missing either a Pointman or Fettel object tag.  One or both players is dead/in a state where we don't want to start the transition.")
end
