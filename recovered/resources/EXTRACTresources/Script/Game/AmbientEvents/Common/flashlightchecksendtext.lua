local Debug = GameScript.Debug
local Support = GameScript.Support
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Sets = GameScript.Game.Sets
local reqFlashlight = GameScript.Support.ImportBoolVariableWithDefault("Flashlight On?", "The message will send when the flashlight is on (true) or off (false).", true)
local text = GameScript.Support.ImportStringVariableWithDefault("Text message", "The text message that will be sent to the target object.", "")
local targetObj = GameScript.Support.ImportSingleObject("Target object", "The object that the text message is being sent to.")

function SendText()
  GameScript.Game.SendTextMessage(targetObj, text)
end

if reqFlashlight == true then
  if GameScript.FEAR.IsPlayerFlashlightOn(0) == true then
    SendText()
  end
elseif GameScript.FEAR.IsPlayerFlashlightOn(0) == false then
  SendText()
end
