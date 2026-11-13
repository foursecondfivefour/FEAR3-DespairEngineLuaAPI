local Game = GameScript.Game
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Player = GameScript.Game.Player
local AI = Game.AI
local MP = Game.MP
local myObject = Game.GetMyObject()
if myObject == nil then
  return
end

function OnKill(msg)
  if myObject == nil then
    return
  end
  local objectAttachedTo = Game.GetObjectAttachedTo(myObject)
  if objectAttachedTo == nil then
    return
  end
  Game.SendTextMessage(objectAttachedTo, "Create_DroneExplode")
  Game.Kill(objectAttachedTo, 1)
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.KillObjectMessage, myObject, "OnKill")
