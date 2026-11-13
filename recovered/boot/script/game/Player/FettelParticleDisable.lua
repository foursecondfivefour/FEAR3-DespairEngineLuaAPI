local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Support = GameScript.Support
local Debug = GameScript.Debug
local scriptObject = Game.GetMyObject()
local MovementInput = Support.ImportWatchVariable("Movement Input", "Input value that drives whether certain particles should turn off at high speeds")
local DisableThreshold = Support.ImportFloatVariableWithDefault("Disable Threshold", "How high of a Movement Input will trigger a disable", 0.7)
local ReenableThreshold = Support.ImportFloatVariableWithDefault("Re-enable Threshold", "How low of a Movement Input will trigger the re-enable ", 0.6)
local TetherDelay = Support.ImportFloatVariableWithDefault("Tether Re-enable Delay", "How long getting tethered should shut off particles", 0.1)
local MovementDisabled = false
local TetherDisabled = false
local OverallDisabled = false

function UpdateMovementInput(msg)
  MovementInput = msg.newValue
  if MovementDisabled then
    if MovementInput <= ReenableThreshold then
      Debug.PrintInfo("Setting MovementDisabled to false with MovementInput == " .. tostring(MovementInput) .. " and ReenableThreshold == " .. tostring(ReenableThreshold))
      MovementDisabled = false
      CheckDisableStatus()
    end
  elseif MovementInput >= DisableThreshold then
    Debug.PrintInfo("Setting MovementDisabled to true with MovementInput == " .. tostring(MovementInput) .. " and ReenableThreshold == " .. tostring(DisableThreshold))
    MovementDisabled = true
    CheckDisableStatus()
  end
end

function OnTetherMessage()
  TetherDisabled = true
  CheckDisableStatus()
  Callbacks.RegisterForTimer("TetherTimeout", TetherDelay, false)
end

function TetherTimeout()
  TetherDisabled = false
  CheckDisableStatus()
end

function CheckDisableStatus()
  local newOverallDisabled = TetherDisabled or MovementDisabled
  Debug.PrintInfo("CheckDisableStatus: TetherDisabled == " .. tostring(TetherDisabled) .. " and MovementDisabled == " .. tostring(MovementDisabled))
  if OverallDisabled ~= newOverallDisabled then
    Debug.PrintInfo("CheckDisableStatus: OverallDisabled change from " .. tostring(OverallDisabled) .. " to " .. tostring(newOverallDisabled))
    if newOverallDisabled then
      Game.SendTextMessage(scriptObject, "DisableTrailParticles")
    else
      Game.SendTextMessage(scriptObject, "EnableTrailParticles")
    end
    OverallDisabled = newOverallDisabled
  end
end

Callbacks.RegisterForWatchVariableChange("Movement Input", "UpdateMovementInput")
Callbacks.RegisterForMsg(GameScript.MsgCallback.TetherMessage, scriptObject, "OnTetherMessage")
