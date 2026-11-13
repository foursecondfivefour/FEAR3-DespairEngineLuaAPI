local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local Game = GameScript.Game
local Camera = GameScript.Game.Camera
local Player = Game.Player
local paramsMsgIndex = GameScript.MsgCallback.CameraParametersChangeMessage
local playerTransferControlMsgIndex = GameScript.MsgCallback.PlayerTransferControlMessage
local playerRegistrationMsgIndex = GameScript.MsgCallback.PlayerRegistrationMessage
local localObj = Game.GetMyObject()
local fovDirectionLockFactor = Support.ImportFloatVariable("fovDirectionLockFactor", "A value between 0 and 1 that specifies whether to keep horizontal or vertical FOV constant across aspect ratios.  Specify 0 for horizontal FOV, 1 for vertical FOV, and any value in between to blend.")
local splitScreenFOVAdjustment = Support.ImportFloatVariable("splitScreenFOVAdjustment", "A value to scale the FOV in split screen mode.  Should normally be 1.  Use lower values to tighten the FOV in split screen for performance reasons.")
local currentAspectRatio

function AdjustFOV(cameraObj)
  if cameraObj == nil then
    return
  end
  local unadjustedFOV = Camera.GetUnadjustedCameraFOV(cameraObj)
  local requestedFOV = math.rad(unadjustedFOV)
  local defaultAspect = 1.7777777777777777
  local lockedVerticalVFOV = 2 * math.atan(math.tan(requestedFOV * 0.5) / defaultAspect)
  local viewportAspect = Camera.GetCameraViewportAspectRatio(cameraObj)
  if viewportAspect == 0 then
    local player1CamObj = Camera.GetCameraObjectForPlayer(GameScript.PlayerIndexArray[1])
    if player1CamObj ~= nil then
      viewportAspect = Camera.GetCameraViewportAspectRatio(player1CamObj)
    end
    if viewportAspect == 0 then
      return
    end
  end
  local lockedVerticalHFOV = 2 * math.atan(math.tan(lockedVerticalVFOV * 0.5) * viewportAspect)
  local newFOV = requestedFOV
  if requestedFOV > lockedVerticalHFOV then
    newFOV = (1 - fovDirectionLockFactor) * requestedFOV + fovDirectionLockFactor * lockedVerticalHFOV
  end
  if Player.GetNumLocalPlayers() == 2 and newFOV > requestedFOV * splitScreenFOVAdjustment then
    newFOV = requestedFOV * splitScreenFOVAdjustment
  end
  if 0 < newFOV then
    Camera.SetAdjustedCameraFOV(cameraObj, math.deg(newFOV))
  end
end

function OnCameraParamsChanged(cameraParamsMsg)
  AdjustFOV(localObj)
end

function OnPlayerTransferControl(playerTransferControlMsg)
  Callbacks.RegisterForUpdateEveryFrame("Update")
end

function OnPlayerRegistration(playerRegistrationMsg)
  Callbacks.RegisterForUpdateEveryFrame("Update")
end

function Update()
  local newCurrAspectRatio = Camera.GetCameraViewportAspectRatio(localObj)
  local bAspectRatioChanged = newCurrAspectRatio ~= currentAspectRatio
  currentAspectRatio = newCurrAspectRatio
  if bAspectRatioChanged then
    AdjustFOV(localObj)
  end
  Callbacks.UnregisterForUpdateEveryFrame()
end

function Initialize(thisObject)
  currentAspectRatio = Camera.GetCameraViewportAspectRatio(thisObject)
  Callbacks.RegisterForMsg(paramsMsgIndex, thisObject, "OnCameraParamsChanged")
  local globalDataObject = Utilities.GetGlobalDataObject()
  Callbacks.RegisterForMsg(playerTransferControlMsgIndex, globalDataObject, "OnPlayerTransferControl")
  Callbacks.RegisterForMsg(playerRegistrationMsgIndex, globalDataObject, "OnPlayerRegistration")
  AdjustFOV(thisObject)
end

Initialize(localObj)
