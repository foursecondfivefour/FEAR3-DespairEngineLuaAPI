local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
Support.AddDescription("Disable an object or objects in a set when the script is started")
local disableObj = Support.ImportObjectHandleVariable("DisableObj", "Object or Objects that are disabled when script started")
if disableObj ~= nil then
  Debug.PrintInfoIf(g_debugMode > 0, "Disable Object - Number:" .. table.getn(disableObj))
  for key, nextObj in pairs(disableObj) do
    Game.EnableAllEnableables(nextObj, false)
  end
end
