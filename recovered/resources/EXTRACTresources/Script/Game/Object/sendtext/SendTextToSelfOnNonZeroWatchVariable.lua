local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local _WatchValue = Support.ImportWatchVariable("Watch Variable", "The watch variable whose value we are checking")
local zeroText = Support.ImportStringVariable("Zero Text", "Text message to send when the watch variable is has a value of 0")
local nonZeroText = Support.ImportStringVariable("Non-Zero Text", "Text message to send when the watch variable has a value other than 0")
local sendToInventory = Support.ImportBoolVariable("Send To Inventory?", "Should we also send the text message to our inventory items as well?")
local sendDeactivateOnInit = Support.ImportBoolVariableWithDefault("Send Deactivate if Initial Value is Zero?", "Should we send the deactivate text message if the initial value is zero?", true)
local previousValue = _WatchValue
local myObject = Game.GetMyObject()

function CheckWatchVariable()
  local currentValue = _WatchValue
  if currentValue == 0 and previousValue ~= 0 then
    SendText(zeroText)
  elseif currentValue ~= 0 and previousValue == 0 then
    SendText(nonZeroText)
  end
  previousValue = currentValue
end

function SendText(textToSend)
  Game.SendTextMessage(myObject, textToSend)
  if sendToInventory then
    local inventoryItems = Game.GetInventoryItems(myObject, 0)
    for k, item in pairs(inventoryItems) do
      if item ~= nil then
        Game.SendTextMessage(myObject, textToSend)
      end
    end
  end
end

function UpdateWatch(msg)
  _WatchValue = msg.newValue
  CheckWatchVariable()
end

Callbacks.RegisterForWatchVariableChange("Watch Variable", "UpdateWatch")
if previousValue == 0 then
  if sendDeactivateOnInit == true then
    SendText(zeroText)
  end
else
  SendText(nonZeroText)
end
