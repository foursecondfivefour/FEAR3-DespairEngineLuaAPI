GameScript.Support.AddDescription("Script that will print to screen for a given amount of time")
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local TextToScreen = Support.ImportStringVariableWithDefault("Text On Screen", "The text you enter here will show up on screen", "Text To Screen")
local TimeOnScreen = Support.ImportFloatVariableWithDefault("Time On Screen", "The ammount of time the text will be on screen", 5)
local COLOR = Support.ImportColorVariable("Text Color", "The color setting for the Text on screen")
local IsCentered = Support.ImportBoolVariableWithDefault("Centered", "Should the text be centered on screen?", true)

function PrintToScreenWithTimer()
  Debug.PrintToScreenWithTimer(TextToScreen, TimeOnScreen, COLOR, IsCentered)
end

Callbacks.RegisterForTimer("PrintToScreenWithTimer", 0, false)
