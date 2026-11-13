local Game = GameScript.Game
local Physics = GameScript.Game.Physics
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Math3d = GameScript.LuaMath3d
local FEAR = GameScript.FEAR
local Self = Game.GetMyObject()
local startMsg = GameScript.MsgCallback.AmbientEventStartMessage
local Region = Support.ImportFirstObject("Region", "If the object leaves the region then we deregister the event")
local ImpulseObject = Support.ImportFirstObject("Impulse Object", "This object will recieve an impulse when the event triggers")
local ImpulseStrength = Support.ImportFloatVariable("Impulse Force", "The force in Newtons to apply to the Impulse Object")

function MoveObject()
  local ImpulseTable = Game.GetForward(Self)
  ImpulseTable = Math3d.VectorMultiply(ImpulseTable, ImpulseStrength)
  if ImpulseObject and Game.IsLoaded(ImpulseObject) then
    Physics.ApplyImpulse(ImpulseObject, ImpulseTable)
  end
end

function DeregisterAmbientEvent()
  FEAR.RegisterAmbientEvent(Self, false)
  Callbacks.UnregisterForMsg(startMsg, Self, "MoveObject")
  if Region and Game.IsLoaded(Region) and ImpulseObject and Game.IsLoaded(ImpulseObject) then
    Callbacks.UnregisterSpecificObjectEnterExitRegion(Region, ImpulseObject, "", "DeregisterAmbientEvent")
  end
end

if Region and ImpulseObject then
  Callbacks.RegisterForMsg(startMsg, Self, "MoveObject")
  Callbacks.RegisterSpecificObjectEnterExitRegion(Region, ImpulseObject, "", "DeregisterAmbientEvent")
end
