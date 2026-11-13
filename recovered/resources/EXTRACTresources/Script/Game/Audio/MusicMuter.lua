local Support = GameScript.Support
local Audio = GameScript.Audio
local Game = GameScript.Game
local Player = Game.Player
local Regions = Game.Regions
local ObjectTags = Game.ObjectTags
local musicName = Support.ImportStringVariableWithDefault("Music Name", "Name of the music to mute or unmute", "Combat")
local fadeTime = Support.ImportFloatVariableWithDefault("Fade Time", "Time over which to fade music in or out (in seconds)", 0)
local muted = Support.ImportBoolVariableWithDefault("Muted", "Whether to mute or unmute the music", false)
local killAfterActivation = Support.ImportBoolVariableWithDefault("Kill After Activation", "Whether to kill the music muter object after first activation", true)
local myObject = Game.GetMyObject()
local requireTag = "Point Man"

local function MuteMusic()
  Audio.MuteMusicWithFade(musicName, muted, fadeTime)
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
    MuteMusic()
  end
end

Main()
