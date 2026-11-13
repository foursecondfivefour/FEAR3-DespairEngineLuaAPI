local GS = GameScript
local Game = GS.Game
local Support = GS.Support
local Callbacks = GS.Callbacks
local Player = Game.Player
local TextOnEnter = Support.ImportStringVariable("Text on Enter", "The text to send when players enter a region")
local TextOnExit = Support.ImportStringVariable("Text on Exit", "The text to send when players exit a region")
local RegionsToMonitor = Support.ImportObjectList("Regions", "The regions to monitor")
local PlayersInRegionRefCount = {
  0,
  0,
  0,
  0
}

function SendEnterText(player)
  Game.SendTextMessage(player, TextOnEnter)
end

function SendExitText(player)
  Game.SendTextMessage(player, TextOnExit)
end

function PlayerEnteredRegion(playerInfo)
  if playerInfo.object then
    local index = Player.GetPlayerIndexByObject(playerInfo.object) + 1
    if PlayersInRegionRefCount[index] == 0 then
      SendEnterText(playerInfo.object)
    end
    PlayersInRegionRefCount[index] = PlayersInRegionRefCount[index] + 1
  end
end

function PlayerExitedRegion(playerInfo)
  if playerInfo.object then
    local index = Player.GetPlayerIndexByObject(playerInfo.object) + 1
    PlayersInRegionRefCount[index] = PlayersInRegionRefCount[index] - 1
    if PlayersInRegionRefCount[index] == 0 then
      SendExitText(playerInfo.object)
    end
  end
end

local numRegions = #RegionsToMonitor
for index = 1, numRegions do
  Callbacks.RegisterPlayerEnterExitRegion(RegionsToMonitor[index], "PlayerEnteredRegion", "PlayerExitedRegion")
end
