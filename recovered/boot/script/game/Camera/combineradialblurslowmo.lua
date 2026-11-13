local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Game = GameScript.Game
local SlowMoPercent = Support.ImportWatchVariable("SlowMo", "Slow-motion amount")
local RadialBlurAmount = Support.ImportWatchVariable("Radial_Blur", "Radial Blur amount")
Support.ExportFloatVariable("RadialBlurScale", 0, "Combined Radial_Blur and SlowMo")
local _SlowMoPercent = 0
local _RadialBlurAmount = 0
local scriptObject

function UpdateSlowMo(msg)
  _SlowMoPercent = msg.newValue
  UpdateOutput()
end

function UpdateRadial_Blur(msg)
  _RadialBlurAmount = msg.newValue
  UpdateOutput()
end

function UpdateOutput()
  if _SlowMoPercent > _RadialBlurAmount then
    Extern.RadialBlurScale = _SlowMoPercent
  else
    Extern.RadialBlurScale = _RadialBlurAmount
  end
end

function UpdateOutputOnChange()
  _SlowMoPercent = Support.GetImportWatchVariableValue("SlowMo")
  _RadialBlurAmount = Support.GetImportWatchVariableValue("Radial_Blur")
  UpdateOutput()
end

function UpdateOutputEveryFrame()
  _SlowMoPercent = Support.GetImportWatchVariableValue("SlowMo")
  _RadialBlurAmount = Support.GetImportWatchVariableValue("Radial_Blur")
  UpdateOutput()
end

function Initialize()
  Extern.RadialBlurScale = 0
  Callbacks.RegisterForUpdateEveryFrame("UpdateOutputEveryFrame")
end

Initialize()
