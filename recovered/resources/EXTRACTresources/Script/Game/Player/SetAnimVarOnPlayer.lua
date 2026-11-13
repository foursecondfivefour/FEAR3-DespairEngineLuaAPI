local Game = GameScript.Game
local Debug = GameScript.Debug
local Player = GameScript.Game.Player
local Support = GameScript.Support
local LuaHelpers = GameScript.LuaHelpers
local Util = GameScript.Utilities
local PlayersToWorkOn = Support.ImportFloatVariable("Players To Work On", "0 Just Point Man.  1 Just Fettel. 2 Both.")
local AnimationVariableName = Support.ImportStringVariable("Animation Variable", "The string name of the animation variable")
local AnimVarValue = Support.ImportFloatVariable("Animation Variable Value", "The number value to set the variable to.")
local PointManObject, FettelObject = Util.GetPointManFettelControlledObjects()
if PointManObject and (PlayersToWorkOn == 0 or PlayersToWorkOn == 2) then
  Game.SetAnimationVariable(PointManObject, AnimationVariableName, AnimVarValue)
end
if FettelObject and (PlayersToWorkOn == 1 or PlayersToWorkOn == 2) then
  Game.SetAnimationVariable(FettelObject, AnimationVariableName, AnimVarValue)
end
