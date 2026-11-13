local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Utilities = GameScript.Utilities
local Player = Game.Player
local LuaHelpers = GameScript.LuaHelpers
local AI = Game.AI
local SpeedVariable = "Speed"
local SpeedValue = 0
local MinSpeed = 0.1
local MaxSpeed = 0.5
local EndSpeed = 0
local MinDistance = Support.ImportFloatVariable("Min Distance", "Min distance for the curve; X axis scaler")
local MaxDistance = Support.ImportFloatVariable("Max Distance", "Max distance for the curve; X axis scaler")
local MinPeriod = Support.ImportFloatVariable("Min Period", "Min period of time for the curve; Y axis scaler")
local MaxPeriod = Support.ImportFloatVariable("Max Period", "Max period of time for the curve; Y axis scaler")
Support.RegisterCurveTemplateVariable("Player Distance Curve", "This curve details the ramping of the Lights/Audio speed based on distance")
Support.RegisterCurveTemplateVariable("Blinking Light Curve", "This curve details the light intensity")
Support.ExportFloatVariable("Period", 1, "The period of time to scale the Light blinking to.")
Support.ExportFloatVariable("LightIntensity", 1, "The intensity of lights 0 - 1")
Support.ExportFloatVariable("BeepOn", 0, "The Beep is allowed to play")
local Self = Game.GetMyObject()
local Value, TextToScreen, CurveFunction_PlayerDistance, CurveFunction_LightIntensity, PlayerObject
local PlayerDistance = "nil"
local CurrentTime = 0
local EndTime = 1

function TestForDistance()
  if Self ~= nil then
    PlayerDistance = AI.GetDistanceToClosestEnemy(Self)
    Extern.Period = CurveFunction_PlayerDistance(PlayerDistance)
    Callbacks.RegisterForTimer("TestForDistance", Extern.Period, false)
    CurrentTime = Support.GetGameTime()
    EndTime = CurrentTime + Extern.Period
    CurveFunction_LightIntensity = Utilities.GetCurveFunction("Blinking Light Curve", 1, 0, EndTime, CurrentTime)
  end
end

local Beeped = false

function RunCurve()
  Extern.LightIntensity = CurveFunction_LightIntensity(Support.GetGameTime())
  if Extern.LightIntensity > 0.95 then
    if not Beeped then
      Extern.BeepOn = 1
      Beeped = true
    else
      Extern.BeepOn = 0
    end
  elseif Extern.LightIntensity < 0.5 then
    Beeped = false
  end
  if 0 < g_debugMode then
    TextToScreen = "PlayerDistance: " .. PlayerDistance
    Debug.PrintToScreen(TextToScreen, 0.04, 0.5)
    TextToScreen = "PeriodValue: " .. Extern.Period
    Debug.PrintToScreen(TextToScreen, 0.04, 0.55)
    TextToScreen = "LightIntensity: " .. Extern.LightIntensity
    Debug.PrintToScreen(TextToScreen, 0.04, 0.6)
    TextToScreen = "BeepOn: " .. Extern.BeepOn
    Debug.PrintToScreen(TextToScreen, 0.04, 0.65)
  end
end

CurveFunction_PlayerDistance = Utilities.GetCurveFunction("Player Distance Curve", MaxPeriod, MinPeriod, MaxDistance, MinDistance)
TestForDistance()
Callbacks.RegisterForUpdateEveryFrame("RunCurve")
