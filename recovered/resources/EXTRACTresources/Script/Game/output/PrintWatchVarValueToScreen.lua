local Support = GameScript.Support
local Game = GameScript.Game
local AI = Game.AI
local Camera = Game.Camera
local Physics = Game.Physics
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local COLOR = Support.ImportColorVariable("Text Color", "The color setting for the Text on screen")
local xScreenPos = Support.ImportFloatVariableWithDefault("ScreenPosition: X", "Position to start the text on the screen (0.0 to 1.0) where 0 is the left side of screen.", 0.1)
local yScreenPos = Support.ImportFloatVariableWithDefault("ScreenPosition: Y", "Position to start the text on the screen (0.0 to 1.0) where 0 is the top side of screen", 0.5)
Support.ImportWatchVariable("Watch Variable", "The Variable Value we'll be printing every frame.")
local WatchValue, TextToScreen

function PrintEveryFrame()
  WatchValue = Support.GetImportWatchVariableValue("Watch Variable")
  TextToScreen = "Watch Variable: " .. WatchValue
  Debug.PrintToScreen(TextToScreen, xScreenPos, yScreenPos)
end

Debug.SetOnScreenTextColor(COLOR.r, COLOR.g, COLOR.b)
Callbacks.RegisterForUpdateEveryFrame("PrintEveryFrame")
