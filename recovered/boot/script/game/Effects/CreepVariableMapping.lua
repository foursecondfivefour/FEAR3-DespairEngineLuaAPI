local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local INPUT_HP_NAME = "InputHP"
Support.ImportWatchVariable(INPUT_HP_NAME, "The Watch Variable input to the curve")
Support.RegisterCurveTemplateVariable("TendrilCurve", "The curve used to adjust the input variable")
Support.RegisterCurveTemplateVariable("VisibilityCurve", "The curve used to adjust the input variable")
Support.ExportFloatVariable("TendrilOutput", 1, "Watch Variable output through the curve")
Support.ExportFloatVariable("VisibilityOutput", 0, "Watch Variable output through the curve")

function GetBlurCurveValue(inValue)
  return math.min(Support.GetCurveValue("VisibilityCurve", inValue), 1)
end

function GetTendrilCurveValue(inValue)
  return math.min(Support.GetCurveValue("TendrilCurve", inValue), 1)
end

function UpdateEveryFrame()
  local inValue = Support.GetImportWatchVariableValue(INPUT_HP_NAME)
  Extern.TendrilOutput = GetTendrilCurveValue(inValue)
  Extern.VisibilityOutput = GetBlurCurveValue(inValue)
end

function DebugValues()
  GameScript.Debug.PrintInfo("Tendril: " .. Extern.TendrilOutput)
  GameScript.Debug.PrintInfo("Blur: " .. Extern.VisibilityOutput)
end

Callbacks.RegisterForUpdateEveryFrame("UpdateEveryFrame")
