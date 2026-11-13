GameScript.Support.AddDescription([[
GlobalLightingAdjust
This Script is for creating a Lighting flash]])
local Game = GameScript.Game
local AI = GameScript.Game.AI
local Camera = GameScript.Game.Camera
local Physics = GameScript.Game.Physics
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local Math3d = GameScript.LuaMath3d
local FEAR = GameScript.FEAR
local Graphics = Game.Graphics
local LightObject, CurveScale
local LightObject = Support.ImportFirstObject("Global Light", "The global light object that we'll be modifying")
Support.RegisterCurveTemplateVariable("Flat Curve", "This should be the 100% flat value 1 curve")
Support.RegisterCurveTemplateVariable("Return Curve", "This is the curve to get to the Return Lighting Color")
local CurveTime = Support.ImportFloatVariableWithDefault("Curve Time", "The amount of time in seconds to get to the return value", 1)
local FlashLightColor = Support.ImportColorVariable("Flash Lighting Color", "The color setting for the lightning flash.")
local ReturnLightColor = Support.ImportColorVariable("Return Lighting Color", "The color setting for after the lightning flash")
local FlashLightDirrection = Support.ImportFloatVariable("Flash Light Dirrection", "direction, in degrees")
local FlashLightInclination = Support.ImportFloatVariable("Flash Light Angle from Horizon", "angle from the horizon, in degrees")
local ReturnLightDirrection = Support.ImportFloatVariable("Return Light Dirrection", "direction, in degrees")
local ReturnLightInclination = Support.ImportFloatVariable("Return Light Angle from Horizon", "angle from the horizon, in degrees")

function LightingStart()
  local FlashLightValues = {
    red = FlashLightColor.r,
    green = FlashLightColor.g,
    blue = FlashLightColor.b,
    alpha = FlashLightColor.a,
    theta = FlashLightDirrection,
    phi = FlashLightInclination
  }
  Graphics.SetEnvironmentLight(LightObject, "Flat Curve", 0.03, FlashLightValues)
  Callbacks.RegisterForTimer("Return", 0.03, false)
end

function Return()
  local ReturnLightValues = {
    red = ReturnLightColor.r,
    green = ReturnLightColor.g,
    blue = ReturnLightColor.b,
    alpha = ReturnLightColor.a,
    theta = ReturnLightDirrection,
    phi = ReturnLightInclination
  }
  Graphics.SetEnvironmentLight(LightObject, "Return Curve", CurveTime, ReturnLightValues)
end

LightingStart()
