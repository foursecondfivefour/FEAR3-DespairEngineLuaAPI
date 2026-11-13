local Support = GameScript.Support
local Audio = GameScript.Audio
local Game = GameScript.Game
local Player = Game.Player
local Regions = Game.Regions
local ObjectTags = Game.ObjectTags
local stopOtherMusic = Support.ImportBoolVariableWithDefault("Stop Other Music", "Whether to stop playing any other music or allow it to continue to play", true)
local killAfterActivation = Support.ImportBoolVariableWithDefault("Kill After Activation", "Whether to kill the music trigger object after first activation", true)
local musicName = Support.ImportStringVariableWithDefault("Music Name", "Name of the base music to play", "Off")
local musicNameB = Support.ImportStringVariableWithDefault("Music Name B", "Name of the second music layer to play", "")
local musicNameC = Support.ImportStringVariableWithDefault("Music Name C", "Name of the third music layer to play", "")
local musicNameD = Support.ImportStringVariableWithDefault("Music Name D", "Name of the fourth music layer to play", "")
local musicNameE = Support.ImportStringVariableWithDefault("Music Name E", "Name of the fifth music layer to play", "")
local startMutedB = Support.ImportBoolVariableWithDefault("Start Muted B", "Whether to start secnod music layer as muted so it can be unmuted later, in sync with other music", true)
local startMutedC = Support.ImportBoolVariableWithDefault("Start Muted C", "Whether to start third music layer as muted so it can be unmuted later, in sync with other music", true)
local startMutedD = Support.ImportBoolVariableWithDefault("Start Muted D", "Whether to start fourth music layer as muted so it can be unmuted later, in sync with other music", true)
local startMutedE = Support.ImportBoolVariableWithDefault("Start Muted E", "Whether to start fifth music layer as muted so it can be unmuted later, in sync with other music", true)
local myObject = Game.GetMyObject()
local requireTag = "Point Man"

local function StartMusic()
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
  if musicNameE ~= "" then
    Audio.StartMusic(musicNameE, startMutedE, false)
  end
  if killAfterActivation then
    Game.Kill(myObject, 0)
  end
end

local function ShouldPerformAction()
  local doAction = false
  local globalPlayers = Player.GetNumPlayers()
  if globalPlayers == 1 then
    doAction = true
  elseif globalPlayers ~= nil then
    local tagFound = false
    for globalPlayerIndex = 0, globalPlayers do
      local playerObject = Player.GetPlayerControlledObjectByIndex(globalPlayerIndex)
      if playerObject ~= nil then
        local hasTag = ObjectTags.DoesObjectHaveTag(playerObject, requireTag)
        if hasTag then
          local inRegion = Regions.IsInRegion(myObject, playerObject)
          if inRegion then
            doAction = true
          end
          tagFound = true
          break
        end
      end
    end
    if tagFound == false then
      local globalPlayerIndex = 0
      local playerObject = Player.GetPlayerControlledObjectByIndex(globalPlayerIndex)
      if playerObject ~= nil then
        local inRegion = Regions.IsInRegion(myObject, playerObject)
        if inRegion == true then
          doAction = true
        end
      end
    end
  end
  return doAction
end

local function Main()
  if ShouldPerformAction() then
    StartMusic()
  end
end

Main()
