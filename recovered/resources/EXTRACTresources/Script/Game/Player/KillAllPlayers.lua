local Game = GameScript.Game
local Player = Game.Player
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local killTimer = Support.ImportFloatVariable("Kill Timer", "Time to wait before killing all players")
local killType = Support.ImportEnumVariable("GameScript.KillObjectMessageType", "Kill Type", "How do we kill the players?")

function KillPlayers()
  local numPlayers = Player.GetNumPlayers()
  for i = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    local playerObjects = Player.GetAllPlayerControlledObjectsByIndex(i)
    if playerObjects ~= nil then
      for i = table.maxn(playerObjects), 1, -1 do
        if playerObjects[i] ~= nil and Game.IsLoaded(playerObjects[i]) then
          Game.Kill(playerObjects[i], killType)
        end
      end
    end
  end
end

Callbacks.RegisterForTimer("KillPlayers", killTimer, false)
