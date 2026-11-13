GameScript.Support.AddDescription([[
impulsobject_cruve
This script is used to apply an impulse to an object over time using a curve]])
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
local registeredForTextMsg = false
local StartTime, CurrentTime, EndTime = 0, 0, 0
local ImpulseObject = Support.ImportFirstObject("Impulse Object", "This object will recieve an impulse when the event triggers")
local ImpulseStrength = Support.ImportFloatVariable("Impulse Force", "The force in Newtons to apply to the Impulse Object")
Support.RegisterCurveTemplateVariable("Curve Template", "The curve value for determing how much impulse to apply")
local CurveTime = Support.ImportFloatVariable("Curve Time", "The amount of time to apply the curve over")
local UpdateSeconds = Support.ImportFloatVariableWithDefault("Update every X Seconds", "The script will test the player look-at every X seconds.  The minimum value is 0.0333", 0.12)

function ImpulseObjectFunc()
  Callbacks.RegisterForTimer("MoveOverTime", UpdateSeconds, true)
  if registeredForTextMsg then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.TextMessage, Self, "ImpulseObject_txt")
    registeredForTextMsg = false
  end
  StartTime = Support.GetGameTime()
  EndTime = Support.GetGameTime() + CurveTime
end

function MoveOverTime()
  if Game.IsLoaded(ImpulseObject) then
    CurrentTime = Support.GetGameTime()
    local ImpulseTable = Game.GetForward(Self)
    local curveModifiedStrength = ImpulseStrength * Support.GetCurveValue("Curve Template", (CurrentTime - StartTime) / CurveTime)
    ImpulseTable = Math3d.VectorMultiply(ImpulseTable, curveModifiedStrength)
    Physics.ApplyImpulse(ImpulseObject, ImpulseTable)
    if CurrentTime >= EndTime then
      Callbacks.UnregisterForTimer("MoveOverTime")
      if not registeredForTextMsg then
        Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, Self, "ImpulseObject_txt")
        registeredForTextMsg = true
      end
    end
  end
end

if ImpulseObject and 0 <= CurveTime then
  if UpdateSeconds < 0.03333 then
    UpdateSeconds = 0.03333
  end
  ImpulseObjectFunc()
end
