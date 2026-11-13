local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
Support.ImportObjectHandleVariable("Object(s)", "The object(s) to send text message to.")
local text = Support.ImportStringVariable("Text Message", "Text Message to send to object(s) when entering region")
local timer = Support.ImportFloatVariable("Interval", "Time inbetween sending messages")
local initialWait = Support.ImportFloatVariable("Initial Delay", "Time before sending any messages", 0)

function SendText()
  GameScript.Debug.PrintInfoIf(g_debugMode > 0, "SendMessage:" .. text)
  local set = Support.GetImportObjectTable("Object(s)")
  if set and 0 < #set then
    local key, value
    key, value = next(set)
    Game.SendTextMessage(value, text)
  end
end

function InitialDelay()
  Callbacks.RegisterForTimer("SendText", timer, true)
end

if timer == 0 then
  SendText()
else
  Callbacks.RegisterForTimer("InitialDelay", initialWait, false)
end
