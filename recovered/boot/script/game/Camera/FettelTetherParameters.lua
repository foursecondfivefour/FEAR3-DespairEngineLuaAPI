local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local Game = GameScript.Game
local Graphics = Game.Graphics
local Camera = Game.Camera
local ObjectTags = Game.ObjectTags
local Player = Game.Player
local msgCBList = GameScript.MsgCallback
local regMsgIndex = GameScript.MsgCallback.PlayerRegistrationMessage
local spawnMsgIndex = GameScript.MsgCallback.PlayerSpawnedMessage
local showWhiteOutFX = false
local whiteOutTimer = 0
local _TimeOutZoneTime = Support.ImportWatchVariable("Timeout Zone Time Remaining", "How much time (as a percentage) before tethering")
local _WarningZonePct = Support.ImportWatchVariable("Warning Zone Pct", "How far into the Warning Zone you are, as a percent")
local _TetherZone = Support.ImportWatchVariable("Tether Zone", "Are you in the Tether Zone?")
local _PrevDesaturation = -1
local _PrevPosterization = -1
Support.RegisterCurveTemplateVariable("Desaturation Warning Intensity Curve", "The curve used to scale the progressive warning Desaturation effect for tethering")
Support.RegisterCurveTemplateVariable("Posterization Warning Intensity Curve", "The curve used to scale the progressive warning Posterization effect for tethering")
Support.RegisterCurveTemplateVariable("White-out Intensity Curve", "The curve used to scale the White-out effect for tethering")
local whiteOutPeriod = Support.ImportFloatVariableWithDefault("White-out Timer Period", "The duration to ramp the white-out effect when tethered", 1)
local Self = Game.GetMyObject()
local PlayerIndex = GameScript.PlayerIndex.kNotAGlobalPlayer

function UpdateFilter(cameraChange)
  local player = Self
  local playerIndex = Player.GetPlayerIndexByObject(player)
  local WarningZonePercent = _WarningZonePct
  local TimeoutTimeRemaining = _TimeOutZoneTime
  local TetherZone = _TetherZone
  local DesaturationWarningDisplayAmount = Support.GetCurveValue("Desaturation Warning Intensity Curve", WarningZonePercent)
  local PosterizationWarningDisplayAmount = Support.GetCurveValue("Posterization Warning Intensity Curve", WarningZonePercent)
  if cameraChange or _PrevDesaturation ~= DesaturationWarningDisplayAmount then
    Camera.SetCameraFilterScalar(playerIndex, "TetherMask", DesaturationWarningDisplayAmount)
    _PrevDesaturation = DesaturationWarningDisplayAmount
  end
  if cameraChange or _PrevPosterization ~= PosterizationWarningDisplayAmount then
    Camera.SetCameraFilterScalar(playerIndex, "TetherPosterize", PosterizationWarningDisplayAmount)
    _PrevPosterization = PosterizationWarningDisplayAmount
  end
  if showWhiteOutFX then
    whiteOutTimer = whiteOutTimer + Support.GetGameTimeDelta()
    if whiteOutTimer >= whiteOutPeriod then
      whiteOutTimer = whiteOutPeriod
      showWhiteOutFX = false
    end
    local WhiteOutDisplayAmount = Support.GetCurveValue("White-out Intensity Curve", whiteOutTimer / whiteOutPeriod)
    Camera.SetCameraFilterScalar(playerIndex, "TetherWhiteout", WhiteOutDisplayAmount)
    Camera.SetCameraFilterScalar(playerIndex, "TetherMask", WhiteOutDisplayAmount)
    Camera.SetCameraFilterScalar(playerIndex, "TetherPosterize", WhiteOutDisplayAmount)
    Callbacks.RegisterForUpdateEveryFrame("UpdateFilter")
  else
    Camera.SetCameraFilterScalar(playerIndex, "TetherWhiteout", 0)
    Callbacks.UnregisterForUpdateEveryFrame("UpdateFilter")
  end
end

function TetherMessageReceived()
  showWhiteOutFX = true
  whiteOutTimer = 0
end

function CameraFilterChangeReceived(msgData)
  if PlayerIndex == GameScript.PlayerIndex.kNotAGlobalPlayer then
    PlayerIndex = Player.GetPlayerIndexByObject(Self)
  end
  local CameraPlayerIndex = Camera.GetPlayerIndexFromCameraId(msgData.camID)
  if PlayerIndex == CameraPlayerIndex then
    UpdateFilter(true)
  end
end

function UpdateTimeout(msg)
  _TimeOutZoneTime = msg.newValue
  UpdateFilter(false)
end

function UpdateZonePct(msg)
  _WarningZonePct = msg.newValue
  UpdateFilter(false)
end

function UpdateTetherZone(msg)
  _TetherZone = msg.newValue
  UpdateFilter(false)
end

function Initialize()
  Callbacks.RegisterForWatchVariableChange("Timeout Zone Time Remaining", "UpdateTimeout")
  Callbacks.RegisterForWatchVariableChange("Warning Zone Pct", "UpdateZonePct")
  Callbacks.RegisterForWatchVariableChange("Tether Zone", "UpdateTetherZone")
  Callbacks.RegisterForMsg(msgCBList.TetherMessage, Self, "TetherMessageReceived")
  Callbacks.RegisterForMsg(msgCBList.CameraFilterGroupChangeMessage, Self, "CameraFilterChangeReceived")
end

Initialize()
