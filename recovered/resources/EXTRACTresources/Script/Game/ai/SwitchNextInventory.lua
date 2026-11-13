local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local Msg = GameScript.MsgCallback
local me = GameScript.Game.GetMyObject()
local AnimLabelTag = Util.CreateAnimLabelTag("SwitchInventory", "SwitchInventory", GameScript.AnimTagType.kEnd)
local InventoryType = GameScript.InventoryType.kPrimaryWeaponInventory
local InvGroup = 1

function AnimOver(info)
  if Util.IsAnimLabelTag(AnimLabelTag, info) then
    GameScript.Game.SelectInventory(me, InventoryType, InvGroup)
    GameScript.Support.ExitScript()
  end
end

function OnAnimLabel(label)
  AnimOver(label)
end

function OnAnimStateLabel(label)
  AnimOver(label)
end

Callbacks.RegisterForMsg(Msg.LabelAnimationTag, me, "OnAnimLabel")
Callbacks.RegisterForMsg(Msg.LabelStateAnimationTag, me, "OnAnimStateLabel")
