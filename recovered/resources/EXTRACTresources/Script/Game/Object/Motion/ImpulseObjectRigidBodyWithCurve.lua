GameScript.Support.AddDescription([[
impulsobject_cruve
This script is used to apply an impulse to an object's rigid body over time using a curve]])
local Game = GameScript.Game
local AI = GameScript.Game.AI
local Camera = GameScript.Game.Camera
local Physics = GameScript.Game.Physics
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local Math3d = GameScript.LuaMath3d
local FEAR = GameScript.FEAR
local Self = Game.GetMyObject()
local StartTime, CurrentTime, EndTime = 0, 0, 0
local ImpulseObject = Support.ImportObjectHandleVariable("Impulse Object", "This object will recieve an impulse when the event triggers")
local ImpulseStrength = Support.ImportFloatVariable("Impulse Force", "The force in Newtons to apply to the Impulse Object")
Support.RegisterCurveTemplateVariable("Curve Template", "The curve value for determing how much impulse to apply")
local CurveTime = Support.ImportFloatVariable("Curve Time", "The amount of time to apply the curve over.")
local UpdateSeconds = Support.ImportFloatVariableWithDefault("Update every X Seconds", "The script will test the player look-at every X seconds.  The minimum value is 0.0333", 0.12)
local RigidBodyName = Support.ImportStringVariable("Rigid Body Name", "The name of the rigid body you would like to apply the impulse to")
local bRepeated = Support.ImportBoolVariable("Repeat Curve?", "Repeat the curve indefinitely?", false)
local WaitTime = Support.ImportFloatVariableWithDefault("Wait Time", "The time it should wait between applying the curve", 0)

function ImpulseObjectFunc()
  Callbacks.RegisterForTimer("MoveOverTime", UpdateSeconds, true)
  StartTime = Support.GetGameTime()
  EndTime = Support.GetGameTime() + CurveTime
end

function MoveOverTime()
  CurrentTime = Support.GetGameTime()
  local ImpulseTable = Game.GetForward(Self)
  local curveModifiedStrength = ImpulseStrength * Support.GetCurveValue("Curve Template", (CurrentTime - StartTime) / CurveTime)
  ImpulseTable = Math3d.VectorMultiply(ImpulseTable, curveModifiedStrength)
  for key, nextObj in pairs(ImpulseObject) do
    if nextObj and Game.IsLoaded(nextObj) then
      Physics.ApplyImpulseToRigidBody(nextObj, RigidBodyName, ImpulseTable)
    end
  end
  if CurrentTime >= EndTime then
    Callbacks.UnregisterForTimer("MoveOverTime")
    if bRepeated then
      Callbacks.RegisterForTimer("ImpulseObjectFunc", WaitTime, false)
    end
  end
end

if ImpulseObject and 0 <= CurveTime then
  local bValid = true
  if UpdateSeconds < 0.03333 then
    UpdateSeconds = 0.03333
  end
  for key, nextObj in pairs(ImpulseObject) do
    if nextObj and Game.DoesSceneNodeExist(nextObj, RigidBodyName) then
    else
      bValid = false
    end
  end
  if bValid then
    ImpulseObjectFunc()
  else
    Debug.PrintError("The Scene Node '" .. RigidBodyName .. "' does not exist, or the object is not loaded.")
  end
else
  Debug.PrintError("Supplied data is incorrect")
end
