GameScript.Support.AddDescription("Kill creep after Melee attack or label tag with group = 'Attacks' and type = 'kEnd' .")
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Msg = GameScript.MsgCallback
local Util = GameScript.Utilities
local me = Game.GetMyObject()
local AttackTag = Util.CreateAnimLabelTag("Kill", "Kill", GameScript.AnimTagType.kStart)

function Kill()
  Game.SendKillMessage(me, GameScript.KillObjectMessageType.DoDying)
end

function MeleeOver()
  Kill()
end

function LabelStateTag(info)
  if Util.IsAnimLabelTag(AttackTag, info) then
    Kill()
  end
end

Callbacks.RegisterForMsg(Msg.LabelAnimationTag, me, "LabelStateTag")
