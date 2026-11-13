local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Graphics = Game.Graphics
local Debug = GameScript.Debug
local TimedCurveValue, PreviousTimedCurveValue = 1, 10000
Support.ImportWatchVariable("Watch Variable A", "WatchVariable option #1")
Support.ImportWatchVariable("Watch Variable B", "WatchVariable option #2")
Support.ImportWatchVariable("Watch Variable C", "WatchVariable option #3")
local LightProbe = Support.ImportSingleObject("Light Proble", "The light probe I'm driving")

function PassValuesThrough_A()
  TimedCurveValue = Support.GetImportWatchVariableValue("Watch Variable A")
  if TimedCurveValue ~= PreviousTimedCurveValue then
    PreviousTimedCurveValue = TimedCurveValue
    Graphics.SetLightIntensity(LightProbe, TimedCurveValue)
  else
    Callbacks.UnregisterForUpdateEveryFrame()
  end
end

function PassValuesThrough_B()
  TimedCurveValue = Support.GetImportWatchVariableValue("Watch Variable B")
  if TimedCurveValue ~= PreviousTimedCurveValue then
    PreviousTimedCurveValue = TimedCurveValue
    Graphics.SetLightIntensity(LightProbe, TimedCurveValue)
  else
    Callbacks.UnregisterForUpdateEveryFrame()
  end
end

function PassValuesThrough_C()
  TimedCurveValue = Support.GetImportWatchVariableValue("Watch Variable C")
  if TimedCurveValue ~= PreviousTimedCurveValue then
    PreviousTimedCurveValue = TimedCurveValue
    Graphics.SetLightIntensity(LightProbe, TimedCurveValue)
  else
    Callbacks.UnregisterForUpdateEveryFrame()
  end
end

function WaitForTxtMssg(TXT_MSG)
  if TXT_MSG.text == "Dark" then
    Callbacks.RegisterForUpdateEveryFrame("PassValuesThrough_A")
  elseif TXT_MSG.text == "Black" then
    Callbacks.RegisterForUpdateEveryFrame("PassValuesThrough_B")
  elseif TXT_MSG.text == "SlowDark" then
    Callbacks.RegisterForUpdateEveryFrame("PassValuesThrough_C")
  end
end

if LightProbe ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, Game.GetMyObject(), "WaitForTxtMssg")
else
  Debug.PrintError("Light Probe not defined")
end
