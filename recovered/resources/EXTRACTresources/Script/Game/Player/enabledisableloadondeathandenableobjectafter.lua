local Game = GameScript.Game
local Player = Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local bEnable = Support.ImportBoolVariable("Enable Load on Death", "Are we enabling load on death or disabling it?")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "(Optional) Object or Objects that are enabled after script runs")
local kPlayer1 = GameScript.PlayerIndex.kGlobalPlayer1

function Enable()
  if enableObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      Game.EnableAllEnableables(nextObj, true)
    end
  end
end

local numPlayers = Player.GetNumPlayers()
for i = kPlayer1, numPlayers do
  local playerObj = Player.GetPlayerObjectByIndex(i)
  if playerObj ~= nil then
    Player.SetCheckpointLoad(playerObj, bEnable)
  end
end
Enable()
