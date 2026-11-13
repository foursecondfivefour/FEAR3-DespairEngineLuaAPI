local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
Support.AddDescription("Enable a list of objects when script is started, and disable a separate list of objects at the same time")
local disableObjList = Support.ImportObjectList("DisableObjs", "Objects that are disabled when triggered")
local enableObjList = Support.ImportObjectList("EnableObjs", "Objects that are enabled when triggered")
if disableObjList ~= nil then
  Debug.PrintInfoIf(g_debugMode > 0, "Disable List of Objects - Number:" .. table.getn(disableObjList))
  for key, value in pairs(disableObjList) do
    Game.EnableAllEnableables(value, false)
  end
end
if enableObjList ~= nil then
  Debug.PrintInfoIf(g_debugMode > 0, "Enable List of Objects - Number:" .. table.getn(enableObjList))
  for key, value in pairs(enableObjList) do
    Game.EnableAllEnableables(value, true)
  end
end
