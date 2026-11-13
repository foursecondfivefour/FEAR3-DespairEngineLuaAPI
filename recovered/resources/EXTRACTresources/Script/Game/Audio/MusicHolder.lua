local Support = GameScript.Support
local Game = GameScript.Game
local Audio = GameScript.Audio
local musicName = Support.ImportStringVariableWithDefault("Music Name", "Name of music which can be referenced for playback", "Combat")
local myObject = Game.GetMyObject()
Audio.RegisterMusic(musicName, myObject)
