GameScript.Support.AddDescription("Script to toggle position/lock properties of a set of doors")
local Game = GameScript.Game
local Debug = GameScript.Debug
local Door = GameScript.Game.Door
local Sets = GameScript.Game.Sets
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local DoorsTable = Support.ImportObjectHandleVariable("Door Object(s)", "These doors will be opened or closed")
local LockOptions = Support.ImportFloatVariable("Close and Lock Options", "0 = Door closed and locked.  1 = Door unlocked and opened.  2 = Door unlocked only.  3 = Door closed only.")
local DoorOpenPosition = Support.ImportFloatVariableWithDefault("Door Open Position", "0.0 = closed, 1.0 = fully open, -1.0 = fully open back.", 1)
local DelayTime = Support.ImportFloatVariableWithDefault("Delay Time", "Time in seconds to wait before door action.", 0)
local Silent = Support.ImportBoolVariableWithDefault("Silent?", "Should the door do its action silently?", false)
local DisableDoor = Support.ImportBoolVariableWithDefault("Disable?", "Should the door be disabled after this script runs? Shows the Red Hand", false)

function DoorAction()
  if DoorsTable then
    if LockOptions == 0 then
      for key, value in pairs(DoorsTable) do
        if Silent then
          Door.MoveToPercentPositionSilent(value, 0)
          Door.LockSilent(value, true)
        else
          Door.MoveToPresetPosition(value, 0)
          Door.Lock(value, true)
        end
      end
    elseif LockOptions == 1 then
      for key, value in pairs(DoorsTable) do
        if Silent then
          Door.LockSilent(value, false)
          Door.MoveToPercentPositionSilent(value, DoorOpenPosition)
        else
          Door.Lock(value, false)
          Door.MoveToPresetPosition(value, DoorOpenPosition)
        end
      end
    elseif LockOptions == 2 then
      for key, value in pairs(DoorsTable) do
        if Silent then
          Door.LockSilent(value, false)
        else
          Door.Lock(value, false)
        end
        if not DisableDoor then
          for key, value in pairs(DoorsTable) do
            Door.Enable(value, true)
          end
        end
      end
    elseif LockOptions == 3 then
      for key, value in pairs(DoorsTable) do
        if Silent then
          Door.MoveToPercentPositionSilent(value, 0)
        else
          Door.MoveToPresetPosition(value, 0)
        end
      end
    else
      Debug.PrintWarning("LockOptions Data was invalid")
    end
    if DisableDoor then
      for key, value in pairs(DoorsTable) do
        Door.Enable(value, false)
      end
    end
  else
    Debug.PrintWarning("Necessary Data was invalid")
  end
end

if 0 < DelayTime then
  Callbacks.RegisterForTimer("DoorAction", DelayTime, false)
else
  DoorAction()
end
