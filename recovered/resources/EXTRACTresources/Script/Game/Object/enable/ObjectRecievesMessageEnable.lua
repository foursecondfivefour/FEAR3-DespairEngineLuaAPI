local Game = GameScript.Game
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local MessageObjectTable = Support.ImportObjectHandleVariable("Message Object(s)", "The object(s) that to watch for the message")
local EnableObjectTable = Support.ImportObjectHandleVariable("Enable Object(s)", "The object(s) that will be Enabled/Disabled")
local Message = Support.ImportEnumVariable("GameScript.MsgCallback", "Message Recieved", "The Message that we're waiting for the objects to recieve")
local EnableSetting = Support.ImportBoolVariableWithDefault("Enable?", "True will enable the objects; false will disable.", true)

function EnableObjects()
  for key, value in pairs(EnableObjectTable) do
    if Game.IsLoaded(value) then
      Game.EnableAllEnableables(value, EnableSetting)
    end
  end
end

if MessageObjectTable and EnableObjectTable then
  for key, object in pairs(MessageObjectTable) do
    Callbacks.RegisterForMsg(Message, object, "EnableObjects")
  end
else
  Debug.PrintError(": One of the required fields contained no data")
end
