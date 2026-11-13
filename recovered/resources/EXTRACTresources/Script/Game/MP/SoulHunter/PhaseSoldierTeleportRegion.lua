local GS = GameScript
local Game = GS.Game
local Support = GS.Support
local Debug = GS.Debug
local Callbacks = GS.Callbacks
local Player = Game.Player
local BeginTeleportMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Teleport", "")
local TeleportDestination = Support.ImportSingleObject("Teleport Destination Object", "")
local ExitPortal = Support.ImportSingleObject("Exit Portal", "")
Support.RegisterObjectTemplateVariable("Enter Teleport Effect", "Enter Teleport Effect.")
Support.RegisterObjectTemplateVariable("Exit Teleport Effect", "Exit Teleport Effect.")
local myObject = Game.GetMyObject()

function OnAnyUsablesStartedUsing(usedObjectMsg)
  local teleportLocation = Game.GetPosition(TeleportDestination)
  local teleportRotation = Game.GetRotation(TeleportDestination)
  local playerContObject = Player.GetPlayerControlledObjectByIndex(usedObjectMsg.userPlayerIndex)
  local playerLocation = Game.GetPosition(playerContObject)
  Game.Spawn("Enter Teleport Effect", playerLocation)
  Game.Spawn("Exit Teleport Effect", teleportLocation)
  Game.SendTextMessage(myObject, "StartPhaseWallFX")
  Game.SendTextMessage(ExitPortal, "StartPhaseWallFX")
  if Player.IsLocalPlayer(usedObjectMsg.userPlayerIndex) then
    Game.TeleportObjectWithRotation(playerContObject, teleportLocation, teleportRotation)
    Game.SetLookDirection(playerContObject, teleportRotation)
    local playerObject = Player.GetPlayerObjectByIndex(usedObjectMsg.userPlayerIndex)
    Game.SendMissionEventMessage(playerObject, BeginTeleportMsgId)
  end
end

Callbacks.RegisterForMsg(GS.MsgCallback.UsablesStartUsingMessage, myObject, "OnAnyUsablesStartedUsing")
