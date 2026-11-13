local Audio = GameScript.Audio
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local busName = Support.ImportStringVariableWithDefault("Bus", "Name of bus which reverb effect is on", "World")
local effectName = Support.ImportStringVariableWithDefault("Effect", "Name of reverb effect", "WorldReverb")
local timerMax = Support.ImportFloatVariableWithDefault("Time", "Time over which to fade from previous reverb settings to those specified", 3)
local dryLevel = Support.ImportFloatVariableWithDefault("Dry Level", "", 0)
local room = Support.ImportFloatVariableWithDefault("Room", "", -10000)
local roomHF = Support.ImportFloatVariableWithDefault("Room HF", "", 0)
local roomRolloff = Support.ImportFloatVariableWithDefault("Room Rolloff", "", 0)
local decayTime = Support.ImportFloatVariableWithDefault("Decay Time", "", 1)
local decayHFRatio = Support.ImportFloatVariableWithDefault("Decay HF Ratio", "", 0.5)
local reflections = Support.ImportFloatVariableWithDefault("Reflections", "", -10000)
local reflectDelay = Support.ImportFloatVariableWithDefault("Reflect Delay", "", 0.02)
local reverb = Support.ImportFloatVariableWithDefault("Reverb", "", 0)
local reverbDelay = Support.ImportFloatVariableWithDefault("Reverb Delay", "", 0.04)
local diffusion = Support.ImportFloatVariableWithDefault("Diffusion", "", 100)
local density = Support.ImportFloatVariableWithDefault("Density", "", 100)
local hrReference = Support.ImportFloatVariableWithDefault("HR Reference", "", 5000)
local roomLF = Support.ImportFloatVariableWithDefault("Room LF", "", 0)
local lrReference = Support.ImportFloatVariableWithDefault("LR Reference", "", 250)
local dryLevelStart = Audio.GetEffectParam(busName, effectName, 0)
local roomStart = Audio.GetEffectParam(busName, effectName, 1)
local roomHFStart = Audio.GetEffectParam(busName, effectName, 2)
local roomRolloffStart = Audio.GetEffectParam(busName, effectName, 3)
local decayTimeStart = Audio.GetEffectParam(busName, effectName, 4)
local decayHFRatioStart = Audio.GetEffectParam(busName, effectName, 5)
local reflectionsStart = Audio.GetEffectParam(busName, effectName, 6)
local reflectDelayStart = Audio.GetEffectParam(busName, effectName, 7)
local reverbStart = Audio.GetEffectParam(busName, effectName, 8)
local reverbDelayStart = Audio.GetEffectParam(busName, effectName, 9)
local diffusionStart = Audio.GetEffectParam(busName, effectName, 10)
local densityStart = Audio.GetEffectParam(busName, effectName, 11)
local hrReferenceStart = Audio.GetEffectParam(busName, effectName, 12)
local roomLFStart = Audio.GetEffectParam(busName, effectName, 13)
local lrReferenceStart = Audio.GetEffectParam(busName, effectName, 14)
local myObject = Game.GetMyObject()
local timerCount = 0
local timerPeriod = 0.1
local Fade = function(q, valueStart, valueEnd)
  return valueStart + (valueEnd - valueStart) * q
end

function OnTimer()
  timerCount = timerCount + 1
  local q = timerCount / (timerMax / timerPeriod)
  q = math.max(0, math.min(1, q))
  Audio.SetEffectParam(busName, effectName, 0, Fade(q, dryLevelStart, dryLevel))
  Audio.SetEffectParam(busName, effectName, 1, Fade(q, roomStart, room))
  Audio.SetEffectParam(busName, effectName, 2, Fade(q, roomHFStart, roomHF))
  Audio.SetEffectParam(busName, effectName, 3, Fade(q, roomRolloffStart, roomRolloff))
  Audio.SetEffectParam(busName, effectName, 4, Fade(q, decayTimeStart, decayTime))
  Audio.SetEffectParam(busName, effectName, 5, Fade(q, decayHFRatioStart, decayHFRatio))
  Audio.SetEffectParam(busName, effectName, 6, Fade(q, reflectionsStart, reflections))
  Audio.SetEffectParam(busName, effectName, 7, Fade(q, reflectDelayStart, reflectDelay))
  Audio.SetEffectParam(busName, effectName, 8, Fade(q, reverbStart, reverb))
  Audio.SetEffectParam(busName, effectName, 9, Fade(q, reverbDelayStart, reverbDelay))
  Audio.SetEffectParam(busName, effectName, 10, Fade(q, diffusionStart, diffusion))
  Audio.SetEffectParam(busName, effectName, 11, Fade(q, densityStart, density))
  Audio.SetEffectParam(busName, effectName, 12, Fade(q, hrReferenceStart, hrReference))
  Audio.SetEffectParam(busName, effectName, 13, Fade(q, roomLFStart, roomLF))
  Audio.SetEffectParam(busName, effectName, 14, Fade(q, lrReferenceStart, lrReference))
  if timerCount * timerPeriod > timerMax then
    Callbacks.UnregisterForTimer("OnTimer")
  end
end

Callbacks.RegisterForTimer("OnTimer", timerPeriod, true)
