local Audio = GameScript.Audio
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local myObject = Game.GetMyObject()
local fadeStart = Support.ImportFloatVariable("Fade Start", "Volume at which to begin fading from (as power from 0 to 1)")
local fadeEnd = Support.ImportFloatVariable("Fade End", "Volume at which to stop fading (as power from 0 to 1)")
local timerMax = Support.ImportFloatVariable("Time", "Time over which to fade bus volume from Fade Start to Fade End (in seconds)")
local timerCount = 0
local timerPeriod = 0.1
local timerActivated = false

function OnTimer()
  timerCount = timerCount + 1
  local volume = timerCount / (timerMax / timerPeriod)
  volume = fadeStart + (fadeEnd - fadeStart) * volume
  volume = volume * volume
  Audio.SetBusVolume("World - Soft", volume)
  Audio.SetBusVolume("World - Normal", volume)
  Audio.SetBusVolume("World - Loud", volume)
  Audio.SetBusVolume("Player", volume)
  Audio.SetBusVolume("Voice", volume)
  if timerCount * timerPeriod > timerMax then
    Game.SendKillMessage(myObject, 0)
  end
end

Callbacks.RegisterForTimer("OnTimer", timerPeriod, true)
