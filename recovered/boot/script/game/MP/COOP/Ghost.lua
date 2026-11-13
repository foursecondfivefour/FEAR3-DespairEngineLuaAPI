local Callbacks = GameScript.Callbacks
local Energy = GameScript.Game.Energy
local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local Camera = Game.Camera
local Graphics = Game.Graphics
local Debug = GameScript.Debug
local _PossessionState = Support.ImportWatchVariable("Possession State", "What possession state we're currently in")
local _PossessionTransform = Support.ImportWatchVariable("Possession Transform", "A watch variable controlling the filter blend to the possessed view.")
local _PossessionTimeRemaining = Support.ImportWatchVariable("Possession Time Remaining", "How much possession time is left")
local _PossessedRiding = Support.ImportWatchVariable("Possessed Riding", "Observes whether we are possessing AND driving a vehicle")
local _GhostEnergy = Support.ImportWatchVariable("Ghost Energy", "Current ghost energy ammount")
local _SuspendEnergy = Support.ImportWatchVariable("Suspend Energy", "Current suspend energy ammount")
local energyAddAmt = Support.ImportFloatVariable("Energy Add Amount", "Amount to add to energy when enemies are hit with vampire attack")
local meleeEnergyAddAmt = Support.ImportFloatVariableWithDefault("Melee Energy Add Amount", "Amount to add to energy when enemies are hit with vampire melee", 0.5)
local _PrevFilterGroup = -1
local energyIndex = Support.RegisterComponentHandle("Ghost Power Meter")
local suspendEnergyIndex = Support.RegisterComponentHandle("Suspend Energy")
local prevPossessionState = 0
local scriptObject = Game.GetMyObject()
local playerIndex = Player.GetPlayerIndexByObject(scriptObject)
local lowPossessionThreshold = 0.1666667
local triggerCameraFilter = false
local possessedRiding = 0
local glowIndex = Support.RegisterComponentHandle("Glow Rendering Component")
local bDisableGlowRendering = Support.ImportBoolVariable("DisableGlowRendering", "if true this script will not mess with glow rendering.")

function EnergyChange(text)
  if text.text == "GiveEnergy" then
    Energy.AdjustEnergyLevel(energyIndex, energyAddAmt)
  elseif text.text == "GiveMeleeEnergy" then
    Energy.AdjustEnergyLevel(energyIndex, meleeEnergyAddAmt)
  elseif text.text == "CancelSuspend" then
    Debug.PrintInfo("Got Cancel Suspend Message")
    Energy.SetEnergyLevel(suspendEnergyIndex, 0)
  end
end

function GlowDisableTimeout()
  if bDisableGlowRendering == false then
    Game.EnableComponent(glowIndex, true)
  end
end

function HandlePossessionChange(newPossessionState)
  if prevPossessionState == 0 and bDisableGlowRendering == false then
    Game.EnableComponent(glowIndex, false)
  end
  if newPossessionState == 4 then
    triggerCameraFilter = false
  elseif newPossessionState == 0 then
    Callbacks.RegisterForTimer("GlowDisableTimeout", 1, false)
  end
  prevPossessionState = newPossessionState
end

function PossessionEnded(msgInfo)
  if msgInfo.nType == 2 then
    Energy.SetEnergyLevel(energyIndex, 0)
  elseif msgInfo.nType == 3 then
    Energy.AdjustEnergyLevel(energyIndex, -0.5)
  elseif msgInfo.nType == 4 then
    Energy.AdjustEnergyLevel(energyIndex, -0.5)
  end
end

function CheckEveryFrame()
  local newPossessionState = _PossessionState
  if newPossessionState ~= prevPossessionState then
    HandlePossessionChange(newPossessionState)
  end
  if Player.IsLocalPlayer(playerIndex) then
    local FettelXform = _PossessionTransform
    local filtergroup = Camera.GetFilterGroupForPlayer(playerIndex, 0)
    if filtergroup and filtergroup ~= _PrevFilterGroup then
      Graphics.SetNamedMaterialScalar(filtergroup, "FettelXform", FettelXform)
      _PrevFilterGroup = filtergroup
    end
  end
  local newPossessedRiding = _PossessedRiding
  if newPossessedRiding ~= possessedRiding then
    possessedRiding = newPossessedRiding
    if newPossessionState == 4 and possessedRiding == 0 then
      triggerCameraFilter = false
    end
  end
  local energyRemaining = _SuspendEnergy
  if newPossessionState == 4 and triggerCameraFilter == false and energyRemaining <= lowPossessionThreshold then
    Game.SendTextMessage(scriptObject, "LowPossessionEnergy")
    triggerCameraFilter = true
  end
end

function UpdatePossessionState(msg)
  _PossessionState = msg.newValue
  CheckEveryFrame()
end

function UpdatePossessionTransform(msg)
  _PossessionTransform = msg.newValue
  CheckEveryFrame()
end

function UpdatePossessedRiding(msg)
  _PossessedRiding = msg.newValue
  CheckEveryFrame()
end

function UpdateSuspendEnergy(msg)
  _SuspendEnergy = msg.newValue
  CheckEveryFrame()
end

function Initialize()
  Callbacks.RegisterForWatchVariableChange("Possession State", "UpdatePossessionState")
  Callbacks.RegisterForWatchVariableChange("Possession Transform", "UpdatePossessionTransform")
  Callbacks.RegisterForWatchVariableChange("Possessed Riding", "UpdatePossessedRiding")
  Callbacks.RegisterForWatchVariableChange("Suspend Energy", "UpdateSuspendEnergy")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, scriptObject, "EnergyChange")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PossessionEndedMessage, scriptObject, "PossessionEnded")
end

Initialize()
