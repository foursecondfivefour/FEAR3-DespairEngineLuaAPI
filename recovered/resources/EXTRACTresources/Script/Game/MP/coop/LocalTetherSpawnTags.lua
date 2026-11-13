local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local SpawnTagSet = Support.ImportSetObject("Spawn Tag Set", "Object containing a set of spawn tag objects")
local PlayerRegion = Support.ImportRegionObject("Region", "Region that will activate the set when Player 1 is inside")
local anchorPlayerID = GameScript.PlayerIndex.kGlobalPlayer1

function Initialize()
  Callbacks.RegisterPlayerEnterExitRegion(PlayerRegion, "PlayerEnterRegion", "PlayerExitRegion")
end

function PlayerEnterRegion(msgData)
  if msgData.object == nil then
    return
  end
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    Player.EnableTetherSpawnTagSet(SpawnTagSet)
  end
end

function PlayerExitRegion(msgData)
  if msgData.object == nil then
    return
  end
  local playerIndex = Player.GetPlayerIndexByObject(msgData.object)
  if playerIndex == anchorPlayerID then
    Player.DisableTetherSpawnTagSet(SpawnTagSet)
  end
end

Initialize()
