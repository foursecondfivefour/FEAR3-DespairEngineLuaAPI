GameScript.Support.AddDescription("Script to control door movement speed along with position/lock properties of a specific door")
local Game = GameScript.Game
local Debug = GameScript.Debug
local Door = GameScript.Game.Door
local Support = GameScript.Support
local Physics = GameScript.Game.Physics
local Callbacks = GameScript.Callbacks
local DoorObject = Support.ImportSingleObject("Door Object", "This doors will be opened or closed")
local LockOptions = Support.ImportFloatVariable("Close and Lock Options", "0 = Door closed and locked.  1 = Door unlocked and opened.  2 = Door closed only.")
local CloseSpeed = Support.ImportFloatVariableWithDefault("Close Speed", "The script will adjust the door speed 20 = Very Slow , 150 = Fast, 0 = Do Nothing.  The new constraint max speed m/sec if prismatic, degrees/sec if hinge", 0)
local WaitTime = Support.ImportFloatVariableWithDefault("Wait Time", "Time we should wait before acting on the door.", 0)
local kFloat = CloseSpeed
local kHandle = DoorObject

function ActionOnDoor()
  if DoorObject then
    if LockOptions == 0 then
      Door.MoveToPercentPositionWithSpeedAndAcceleration(DoorObject, 0, CloseSpeed, 0)
      Door.Lock(DoorObject, true)
    end
    if LockOptions == 1 then
      Door.Lock(DoorObject, false)
      Door.MoveToPercentPositionWithSpeedAndAcceleration(DoorObject, 1, CloseSpeed, 0)
    end
    if LockOptions == 2 then
      Door.MoveToPercentPositionWithSpeedAndAcceleration(DoorObject, 0, CloseSpeed, 0)
    end
  elseif LockOptions == nil then
    Debug.PrintWarning("LockOptions Data is Missing")
  end
end

if WaitTime <= 0 then
  ActionOnDoor()
else
  Callbacks.RegisterForTimer("ActionOnDoor", WaitTime, false)
end
