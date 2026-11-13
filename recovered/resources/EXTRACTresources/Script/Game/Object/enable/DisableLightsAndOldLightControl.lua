local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
Support.AddDescription("Disable an object or objects in a set when the script is started")
local disableLightControlObj = Support.ImportObjectHandleVariable("Light Control Object to Disable", "The obsolete light control script object which needs to be disabled.")
local disableLights = Support.ImportObjectHandleVariable("Lights to Disable Initially", "Object or Objects that are disabled when script started")
local myObj = Game.GetMyObject()

function DisableLightControlAndLights()
  if disableLightControlObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Disable Object - Number:" .. table.getn(disableLightControlObj))
    for key, nextObj in pairs(disableLightControlObj) do
      if nextObj == myObj then
        Debug.PrintWarning(Game.GetName(myObj) .. ": Disabling your own object (as 'Light Control Object to Disable').")
      end
      Game.EnableAllEnableables(nextObj, false)
    end
  end
  if disableLights ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Disable Object - Number:" .. table.getn(disableLights))
    for key, nextObj in pairs(disableLights) do
      if nextObj == myObj then
        Debug.PrintWarning(Game.GetName(myObj) .. ": Disabling your own object (as 'Lights to Disable Initially').")
      end
      Game.EnableAllEnableables(nextObj, false)
    end
  end
end

DisableLightControlAndLights()
Callbacks.RegisterForMsg(GameScript.MsgCallback.LoadChangesCompleteMessage, myObj, "DisableLightControlAndLights")
