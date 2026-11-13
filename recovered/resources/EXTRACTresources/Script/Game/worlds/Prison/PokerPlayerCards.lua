local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Msg = GameScript.MsgCallback
local AnimLabelTag = Util.CreateAnimLabelTag("SwitchInventory", "SwitchInventory", GameScript.AnimTagType.kEnd)
local me = GameScript.Game.GetMyObject()

function OnAnimLabel(info)
  if Util.IsAnimLabelTag(AnimLabelTag, info) then
    local setObjects = GameScript.Game.Sets.GetObjectsInSet(me)
    for i, object in pairs(setObjects) do
      Game.Detach(object)
    end
    GameScript.Support.ExitScript()
  end
end

function OnKilled()
  local setObjects = GameScript.Game.Sets.GetObjectsInSet(me)
  for i, object in pairs(setObjects) do
    GameScript.Game.Kill(object, GameScript.KillObjectMessageType.DoDying)
  end
end

Callbacks.RegisterForMsg(Msg.LabelAnimationTag, me, "OnAnimLabel")
