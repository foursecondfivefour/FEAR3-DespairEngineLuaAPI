GameScript.Support.AddDescription("Script to toggle position/lock properties of a set of doors")
local Game = GameScript.Game
local Debug = GameScript.Debug
local Door = GameScript.Game.Door
local Sets = GameScript.Game.Sets
local Support = GameScript.Support
local DoorsTable = Support.ImportObjectHandleVariable("Door Object(s)", "These doors will be opened or closed")
local LockOptions = Support.ImportFloatVariable("Close and Lock Options", "0 = Door closed and locked.  1 = Door unlocked and opened.  2 = Door unlocked only.  3 = Door closed only.")
if DoorsTable then
  if LockOptions == 0 then
    for key, value in pairs(DoorsTable) do
      Door.MoveToPercentPositionSilent(value, 0)
      Door.LockSilent(value, true)
    end
  elseif LockOptions == 1 then
    for key, value in pairs(DoorsTable) do
      Door.LockSilent(value, false)
      Door.MoveToPercentPositionSilent(value, 1)
    end
  elseif LockOptions == 2 then
    for key, value in pairs(DoorsTable) do
      Door.LockSilent(value, false)
    end
  elseif LockOptions == 3 then
    for key, value in pairs(DoorsTable) do
      Door.MoveToPercentPositionSilent(value, 0)
    end
  else
    Debug.PrintWarning("LockOptions Data was invalid")
  end
else
  Debug.PrintWarning("Necessary Data was invalid")
end
