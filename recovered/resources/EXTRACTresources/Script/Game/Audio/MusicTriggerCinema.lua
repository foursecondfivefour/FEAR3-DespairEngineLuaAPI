local Support = GameScript.Support
local Audio = GameScript.Audio
local stopOtherMusic = Support.ImportBoolVariableWithDefault("Stop Other Music", "Whether to stop playing any other music or allow it to continue to play", true)
local musicName = Support.ImportStringVariableWithDefault("Music Name", "Name of the base music to play", "Combat")
local musicNameB = Support.ImportStringVariableWithDefault("Music Name B", "Name of the second music layer to play", "")
local musicNameC = Support.ImportStringVariableWithDefault("Music Name C", "Name of the third music layer to play", "")
local musicNameD = Support.ImportStringVariableWithDefault("Music Name D", "Name of the fourth music layer to play", "")
local startMutedB = Support.ImportBoolVariableWithDefault("Start Muted B", "Whether to start secnod music layer as muted so it can be unmuted later, in sync with other music", true)
local startMutedC = Support.ImportBoolVariableWithDefault("Start Muted C", "Whether to start third music layer as muted so it can be unmuted later, in sync with other music", true)
local startMutedD = Support.ImportBoolVariableWithDefault("Start Muted D", "Whether to start fourth music layer as muted so it can be unmuted later, in sync with other music", true)
if musicName ~= "" then
  Audio.StartMusic(musicName, false, stopOtherMusic)
elseif stopOtherMusic then
  Audio.StopMusic()
end
if musicNameB ~= "" then
  Audio.StartMusic(musicNameB, startMutedB, false)
end
if musicNameC ~= "" then
  Audio.StartMusic(musicNameC, startMutedC, false)
end
if musicNameD ~= "" then
  Audio.StartMusic(musicNameD, startMutedD, false)
end
