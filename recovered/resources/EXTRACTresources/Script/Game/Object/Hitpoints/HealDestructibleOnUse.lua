local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Support = GameScript.Support
local Debug = GameScript.Debug
local MP = Game.MP
local HealingPerSecond = Support.ImportFloatVariableWithDefault("Healing Per Second", "The amount of healing per second to apply", 50)
Support.ExportFloatVariable("ShouldEnableUsables", 0, "Hack extern/export variable for the ShouldEnableUsables to be passed to clients.")
local myObject = Game.GetMyObject()
local AttemptToHeal = false

function ApplyHealing(removedObject)
  local delta = Support.GetGameTimeDelta()
  local healAmount = HealingPerSecond * delta
  Game.Heal(myObject, "", healAmount, false)
end

function OnAnyUsablesStartedUsing(removedObject)
  AttemptToHeal = true
end

function OnAnyUsablesStoppedUsing(removedObject)
  AttemptToHeal = false
end

function CheckForHealingDuringPause(removedObject)
  local IsNotDamaged = Game.IsDestructibleInInitialState(myObject)
  if IsNotDamaged then
    Game.EnableAllUsables(myObject, false)
    Extern.ShouldEnableUsables = 0
    AttemptToHeal = false
  else
    Game.EnableAllUsables(myObject, true)
    Extern.ShouldEnableUsables = 1
    if AttemptToHeal then
      ApplyHealing()
    end
  end
end

function CheckToDisable(removedObject)
  if Extern.ShouldEnableUsables == 1 then
    Debug.PrintInfo("Damaged")
    Game.EnableAllUsables(myObject, true)
  else
    Debug.PrintInfo("Not Damaged")
    Game.EnableAllUsables(myObject, false)
  end
end

if not MP.IsClient() then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, myObject, "OnAnyUsablesStartedUsing")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, myObject, "OnAnyUsablesStoppedUsing")
  Callbacks.RegisterForUpdateEveryFrame("CheckForHealingDuringPause")
else
  Callbacks.RegisterForScriptValueUpdated("CheckToDisable")
end
