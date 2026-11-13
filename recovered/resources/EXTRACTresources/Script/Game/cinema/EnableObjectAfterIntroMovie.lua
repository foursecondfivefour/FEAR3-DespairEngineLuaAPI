local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local scriptObject = Game.GetMyObject()
Support.AddDescription("Enable an object or objects in a set when the script is started")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")

function enable()
  if enableObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      if nextObj and Game.IsLoaded(nextObj) then
        Game.EnableAllEnableables(nextObj, true)
      end
    end
  end
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.EnterPlayableState, scriptObject, "enable")
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.EnterPlayableState, scriptObject, "enable")
