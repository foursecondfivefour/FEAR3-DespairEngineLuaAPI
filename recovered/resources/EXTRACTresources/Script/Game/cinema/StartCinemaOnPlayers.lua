local Game = GameScript.Game
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local LuaHelpers = GameScript.LuaHelpers
local EnablesLeft
local IsPointManOutsideRegion = true
local IsFettelOutsideRegion = true
local CinemaObject = Support.ImportFirstObject("Cinema Object", "The object containing the Cutscene Component")
local SecondaryCinemaObject = Support.ImportFirstObject("Secondary Cinema Object", "If Players In Cinema is 2 and second cinema object is added then it will be used on Fettel")
local PlayersInCinema = Support.ImportFloatVariable("Players In Cinema", "0: Just PointMan. 1:  Just Fettel.  2: PointMan and Fettel.")
local timeTillPlay = Support.ImportFloatVariableWithDefault("Delay", "How long before we activate the cinema?", 0)

function Play()
  if CinemaObject then
    if PlayersInCinema == 0 then
      LuaHelpers.StartCinema(CinemaObject, false, true)
    elseif PlayersInCinema == 1 then
      LuaHelpers.StartCinema(CinemaObject, true, true)
    elseif PlayersInCinema == 2 then
      if SecondaryCinemaObject then
        LuaHelpers.StartCinema(CinemaObject, false, true)
        LuaHelpers.StartCinema(SecondaryCinemaObject, true, true)
      else
        LuaHelpers.StartCinema(CinemaObject, false, false)
      end
    end
  end
end

if PlayersInCinema == 0 or PlayersInCinema == 1 or PlayersInCinema == 2 then
  Callbacks.RegisterForTimer("Play", timeTillPlay, false)
end
