local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Player = Game.Player
local Utilities = GameScript.Utilities
Support.AddDescription("Enable an object or objects in a set when the script is started and if the game has Fettel in it.")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")
if enableObj ~= nil then
  local fettelAvatar = Utilities.GetFettelAvatar()
  if fettelAvatar ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      Game.EnableAllEnableables(nextObj, true)
    end
  end
end
