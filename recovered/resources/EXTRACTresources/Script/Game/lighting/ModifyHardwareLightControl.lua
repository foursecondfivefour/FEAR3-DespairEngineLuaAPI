local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Graphics = Game.Graphics
Support.RegisterCurveTemplateVariable("Color Control Curve", "Curve for controlling the lights color transitions.")
local lightToModify = Support.ImportSingleObject("Light To Modify", "The hardware light to modify.")
local colorA = Support.ImportColorVariable("Color A", "Color A.")
local colorB = Support.ImportColorVariable("Color B", "Color B.")
local delay = Support.ImportFloatVariable("Delay", "Delay before modifying the light.")
local modifyCurve = Support.ImportBoolVariable("Modify Curve", "Wether this should modify the curve or use the existing one.")
local timedCurveValues = {
  period = 1,
  maxIterations = 0,
  amplitude = 1,
  repeatType = 0,
  resetCurve = false
}
timedCurveValues.period = Support.ImportFloatVariableWithDefault("Period", "Timed curve period.", 1)
timedCurveValues.maxIterations = Support.ImportFloatVariable("Max Iterations", "Timed curve max iterations. 0 = infinite.")
timedCurveValues.amplitude = Support.ImportFloatVariableWithDefault("Amplitude", "Timed curve amplitude.", 1)
timedCurveValues.repeatType = Support.ImportFloatVariable("Repeat Type", "Timed curve repeat type. 0 = Loop. 1 = Ping-Pong")
timedCurveValues.resetCurve = Support.ImportBoolVariable("Reset Curve", "When modifying the curve should it be reset.")

function ApplyLightControls()
  if modifyCurve then
    Graphics.SetLightControlAndCurve(lightToModify, colorA, colorB, "Color Control Curve", timedCurveValues)
  else
    Graphics.SetLightControl(lightToModify, colorA, colorB)
  end
end

Callbacks.RegisterForTimer("ApplyLightControls", delay, false)
