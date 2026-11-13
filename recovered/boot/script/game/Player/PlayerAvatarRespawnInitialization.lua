local Game = GameScript.Game
local Player = Game.Player
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local kPlayer1 = GameScript.PlayerIndex.kGlobalPlayer1

function OnLoadComplete()
end

local numPlayers = Player.GetNumPlayers()
for i = kPlayer1, numPlayers do
  local playerObj = Player.GetPlayerObjectByIndex(i)
  if playerObj ~= nil then
    Player.SetCheckpointLoad(playerObj, true)
  end
end
local myObject = Game.GetMyObject()
Callbacks.RegisterForMsg(GameScript.MsgCallback.LoadChangesCompleteMessage, myObject, "OnLoadComplete")
