local GameScript = GameScript
local Support = GameScript.Support
local Game = GameScript.Game
Support.ExportFloatVariable("Display Color", 4294967295, "Color to set the Text To")
Extern["Display Color"] = GameScript.FEAR.GetPlayerColor(Game.Player.GetPlayerIndexByObject(Game.GetMyObject()))
