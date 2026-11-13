GameScript.Support.AddDescription("Script to close and disable a set of doors")
local Game = GameScript.Game
local Debug = GameScript.Debug
local Door = GameScript.Game.Door
local Sets = GameScript.Game.Sets
local Support = GameScript.Support
local DoorsTable = Support.ImportObjectHandleVariable("Door Object(s)", "These doors will be closed and disabled")
if DoorsTable then
  for key, value in pairs(DoorsTable) do
    Door.MoveToPercentPositionSilent(value, 0)
    Door.LockSilent(value, true)
    Door.Enable(value, false)
  end
else
  Debug.PrintWarning("Necessary Data was invalid")
end
