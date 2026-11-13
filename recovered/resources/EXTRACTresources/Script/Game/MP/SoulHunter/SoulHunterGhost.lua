local GS = GameScript
local Callbacks = GS.Callbacks
local Energy = GS.Game.Energy
local Support = GS.Support
local Game = GS.Game
local Player = Game.Player
local Camera = Game.Camera
local Graphics = Game.Graphics
local Debug = GS.Debug
Support.ImportWatchVariable("Possession State", "What possession state we're currently in")
local PossessionTransform = Support.ImportWatchVariable("Possession Transform", "A watch variable controlling the filter blend to the possessed view.")
local PossessionTimeRemaining = Support.ImportWatchVariable("Possession Time Remaining", "How much possession time is left")
Support.ImportWatchVariable("Possessed Riding", "Observes whether we are possessing AND driving a vehicle")
local SpirtMeterAddAmt = Support.ImportFloatVariableWithDefault("Spirit Meter Add Amount", "Amount of Spirit energy to add when player runs out of Possession time", 0.5)
local kPossessionNone = 0
local kPossessionFailAcquiring = 1
local kPossessionAcquiring = 2
local kPossessionAcquired = 3
local kPossessionRiding = 4
local energyIndex = Support.RegisterComponentHandle("Ghost Power Meter")
local CurrentPossessionState = kPossessionNone
local scriptObject = Game.GetMyObject()
local playerIndex = Player.GetPlayerIndexByObject(scriptObject)
local hitPointIndex = Support.ImportFloatVariable("Standard HP Priority", "Priority level from the HP Controller Component")
local isInvulnerable = false
local lowPossessionThreshold = 5
local TriggerCameraFilter = false
local kRidingStateNone = 0
local PossessedRidingState = kRidingStateNone
local CurrentFilterGroup = -1

function PossessionEnded(msgInfo)
  Energy.SetEnergyLevel(energyIndex, SpirtMeterAddAmt)
end

function InvulnerableTimeout()
  if CurrentPossessionState == 0 then
    isInvulnerable = false
    Game.SetHitPointPriorityInvulnerable(scriptObject, hitPointIndex, false)
  end
end

function HandlePossessionChange(NewState)
  if CurrentPossessionState == kPossessionNone then
    Game.SetHitPointPriorityInvulnerable(scriptObject, hitPointIndex, true)
    isInvulnerable = true
  end
  if NewState == kPossessionRiding then
    TriggerCameraFilter = false
  elseif NewState == kPossessionNone then
    Callbacks.RegisterForTimer("InvulnerableTimeout", 0.75, false)
  end
  CurrentPossessionState = NewState
end

function CheckPeriodically()
  if Player.IsLocalPlayer(playerIndex) then
    local NewFiltergroup = Camera.GetFilterGroupForPlayer(playerIndex, 0)
    if NewFiltergroup and NewFiltergroup ~= CurrentFilterGroup then
      Graphics.SetNamedMaterialScalar(NewFiltergroup, "FettelXform", PossessionTransform)
      CurrentFilterGroup = NewFiltergroup
    end
  end
end

function UpdatePossessionState(msg)
  HandlePossessionChange(msg.newValue)
end

function UpdatePossessionTransform(msg)
  PossessionTransform = msg.newValue
  local NewFiltergroup = Camera.GetFilterGroupForPlayer(playerIndex, 0)
  if NewFiltergroup and NewFiltergroup ~= CurrentFilterGroup then
    Graphics.SetNamedMaterialScalar(NewFiltergroup, "FettelXform", PossessionTransform)
    CurrentFilterGroup = NewFiltergroup
  end
end

function UpdatePossessionTimeRemaining(msg)
  PossessionTimeRemaining = msg.newValue
  if CurrentPossessionState == kPossessionRiding and TriggerCameraFilter == false and PossessionTimeRemaining <= lowPossessionThreshold then
    Game.SendTextMessage(scriptObject, "LowPossessionEnergy")
    TriggerCameraFilter = true
  end
end

local PrintXVal, PrintYVal

function MakeBooleanIntoText(Boolean)
  if Boolean == true then
    return "true"
  else
    return "false"
  end
end

function PrintToScreen(Message)
  Debug.PrintToScreen(Message, PrintXVal, PrintYVal)
  PrintYVal = PrintYVal + 0.025
end

function DisplayStats()
  PrintXVal = 0.1
  PrintYVal = 0.1
  PrintToScreen("PossessionTransform: " .. PossessionTransform)
  PrintToScreen("PossessionTimeRemaining: " .. PossessionTimeRemaining)
  PrintToScreen("CurrentPossessionState: " .. CurrentPossessionState)
  PrintToScreen("TriggerCameraFilter: " .. MakeBooleanIntoText(TriggerCameraFilter))
  PrintToScreen("PossessedRidingState: " .. PossessedRidingState)
end

Callbacks.RegisterForWatchVariableChange("Possession State", "UpdatePossessionState")
Callbacks.RegisterForWatchVariableChange("Possession Time Remaining", "UpdatePossessionTimeRemaining")
if Player.IsLocalPlayer(playerIndex) then
  Callbacks.RegisterForWatchVariableChange("Possession Transform", "UpdatePossessionTransform")
end
Callbacks.RegisterForMsg(GS.MsgCallback.PossessionEndedMessage, scriptObject, "PossessionEnded")
