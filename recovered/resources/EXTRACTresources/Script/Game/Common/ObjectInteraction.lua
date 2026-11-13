local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local Utilities = GameScript.Utilities
local Debug = GameScript.Debug
local Math3d = GameScript.LuaMath3d
local interactiveObject = Support.ImportFirstObject("Interactive Object", "The object being interacted with")
local textToSend = Support.ImportStringVariable("Text Response", "The text message to be sent when the interactive object is used")
Support.ImportObjectHandleVariable("Text Recipients", "The object(s) that will receive the text message when the interactive object is used")
local XOffset = Support.ImportFloatVariableWithDefault("Local X Offset", "The interaction's x position offset from the object.", 0)
local YOffset = Support.ImportFloatVariableWithDefault("Local Y Offset", "The interaction's y position offset from the object.", 0)
local ZOffset = Support.ImportFloatVariableWithDefault("Local Z Offset", "The interaction's z position offset from the object.", 0)
local headingOffset = Support.ImportFloatVariableWithDefault("Local Heading Offset", "The interaction's heading rotation offset from the object.", 0)
local timeDelay = Support.ImportFloatVariable("Text Delay", "How long after the interaction do we send the text message?")
local singleUse = Support.ImportBoolVariableWithDefault("Single Use", "Should this script exit after one use?", false)
local movePlayer = Support.ImportBoolVariableWithDefault("Move Player", "Should this script move the player into position?", true)
local stopInteraction = Support.ImportBoolVariableWithDefault("Stop Interaction", "Should this script stop the interaction when you stop using?", false)
local blockUse = false
local interactionUser

function OnUse(useMsg)
  if blockUse then
    return
  end
  interactionUser = Player.GetPlayerControlledObjectByIndex(useMsg.userPlayerIndex)
  if interactionUser then
    local interactionSuccessful
    if movePlayer then
      local InteractionRotation = Game.GetRotation(interactiveObject)
      local Forward, Side, Up = Math3d.GetForwardSideUp(InteractionRotation)
      InteractionRotation.h = InteractionRotation.h + headingOffset
      local InteractionPosition = Math3d.VectorAdd(Game.GetPosition(interactiveObject), Math3d.VectorMultiply(Side, XOffset), Math3d.VectorMultiply(Up, YOffset), Math3d.VectorMultiply(Forward, ZOffset))
      interactionSuccessful = GameScript.Game.StartInteraction(interactionUser, interactiveObject, InteractionPosition, InteractionRotation)
    else
      interactionSuccessful = GameScript.Game.StartInteraction(interactionUser, interactiveObject, Game.GetPosition(interactionUser), Game.GetRotation(interactionUser))
    end
    if interactionSuccessful == nil or interactionSuccessful == true then
      GameScript.Callbacks.RegisterForTimer("SendTextMessages", timeDelay, false)
      blockUse = true
    end
  end
end

function OnStopUsing(StopUsingMsg)
  GameScript.Game.StopInteraction(interactionUser, interactiveObject)
  blockUse = false
end

function SendTextMessages()
  local recipientTable = Support.GetImportObjectTable("Text Recipients")
  for k, recipient in pairs(recipientTable) do
    GameScript.Game.SendTextMessage(recipient, textToSend)
  end
  blockUse = false
  if singleUse then
    Support.ExitScript()
  end
end

if interactiveObject ~= nil then
  GameScript.Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, interactiveObject, "OnUse")
  if stopInteraction then
    GameScript.Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStopUsingMessage, interactiveObject, "OnStopUsing")
  end
end
