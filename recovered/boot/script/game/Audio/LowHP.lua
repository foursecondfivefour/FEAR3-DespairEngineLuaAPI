local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Msgs = GameScript.MsgCallback
local Support = GameScript.Support
local Audio = GameScript.Audio
local lowHP = Support.ImportFloatVariable("Low HP", "HP at which to begin applying low HP audio effects")
Support.ImportWatchVariable("HP Value", "Current Hit Points to monitor")
local myObject = Game.GetMyObject()
local isLow = false

function Update()
  local hpValue = Support.GetImportWatchVariableValue("HP Value")
  if hpValue >= lowHP then
    Callbacks.UnregisterForUpdateEveryFrame("Update")
    isLow = false
    Audio.ApplyLowHP(isLow)
  end
end

function UpdateLowHP()
  local hpValue = Support.GetImportWatchVariableValue("HP Value")
  if hpValue < lowHP and isLow == false then
    isLow = true
    Audio.ApplyLowHP(isLow)
    Callbacks.RegisterForUpdateEveryFrame("Update")
  end
end

function OnDamageTaken()
  UpdateLowHP()
end

if myObject ~= nil then
  Callbacks.RegisterForMsg(Msgs.DamageTakenMessage, myObject, "OnDamageTaken")
end
