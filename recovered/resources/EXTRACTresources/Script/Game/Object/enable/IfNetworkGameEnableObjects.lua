local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local MP = Game.MP
Support.AddDescription("Enable an object or objects in a set when the script is started and if the game is over the network")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")
if enableObj ~= nil and MP.IsNetworkGame() then
  for key, nextObj in pairs(enableObj) do
    Game.EnableAllEnableables(nextObj, true)
  end
end
