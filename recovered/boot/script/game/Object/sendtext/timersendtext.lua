local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
Support.ImportObjectHandleVariable("Object(s)", "The object(s) to send text message to.")
local text = Support.ImportStringVariable("Text Message", "Text Message to send to object(s) when entering region")
local timer = Support.ImportFloatVariable("Timer", "Time to wait until sending text message")

function SendText()
  GameScript.Debug.PrintInfoIf(g_debugMode > 0, "SendMessage:" .. text)
  local set = Support.GetImportObjectTable("Object(s)")
  if set then
    for name, object in pairs(set) do
      Game.SendTextMessage(object, text)
    end
  end
end

if timer == 0 then
  SendText()
else
  Callbacks.RegisterForTimer("SendText", timer, false)
end
