local Audio = GameScript.Audio
local Callbacks = GameScript.Callbacks
local Msgs = GameScript.MsgCallback
local Utilities = GameScript.Utilities
local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local myObject = Game.GetMyObject()

function OnTakingControl(message)
  Audio.SetEffectParam("World - Soft", "WorldSoftLPF", 0, 2000)
  Audio.SetEffectParam("World - Normal", "WorldNormalLPF", 0, 1590)
  Audio.SetEffectParam("World - Loud", "WorldLoudLPF", 0, 1400)
  Audio.SetEffectParam("World - Extreme", "WorldExtremeLPF", 0, 1100)
  Audio.SetEffectParam("World - Infinite", "WorldInfiniteLPF", 0, 1414)
  Audio.SetEffectParam("World - Effect", "WorldEffectHPF", 0, 1200)
  Audio.SetEffectParam("World - Effect", "WorldEffectHPF", 1, 5)
  Audio.SetEffectParam("World - Effect", "WorldEffectLPF", 0, 950)
  Audio.SetEffectParam("World - Loud - Unpitched", "WorldUnpitchedLPF", 0, 1000)
  Audio.SetEffectParam("Voice", "VoiceHPF", 0, 750)
  Audio.SetEffectParam("Voice", "VoiceHPF", 1, 2.5)
  Audio.SetEffectParam("Voice", "VoiceLPF", 0, 2000)
end

function OnReleasingControl(message)
  Audio.SetEffectParam("World - Soft", "WorldSoftLPF", 0, 22000)
  Audio.SetEffectParam("World - Normal", "WorldNormalLPF", 0, 22000)
  Audio.SetEffectParam("World - Loud", "WorldLoudLPF", 0, 22000)
  Audio.SetEffectParam("World - Extreme", "WorldExtremeLPF", 0, 22000)
  Audio.SetEffectParam("World - Infinite", "WorldInfiniteLPF", 0, 22000)
  Audio.SetEffectParam("World - Effect", "WorldEffectHPF", 0, 1)
  Audio.SetEffectParam("World - Effect", "WorldEffectHPF", 1, 1)
  Audio.SetEffectParam("World - Effect", "WorldEffectLPF", 0, 22000)
  Audio.SetEffectParam("World - Loud - Unpitched", "WorldUnpitchedLPF", 0, 22000)
  Audio.SetEffectParam("Voice", "VoiceHPF", 0, 1)
  Audio.SetEffectParam("Voice", "VoiceHPF", 1, 1)
  Audio.SetEffectParam("Voice", "VoiceLPF", 0, 22000)
end

Callbacks.RegisterForMsg(Msgs.ActorTakingControlMessage, myObject, "OnTakingControl")
Callbacks.RegisterForMsg(Msgs.ActorReleasingControlMessage, myObject, "OnReleasingControl")
