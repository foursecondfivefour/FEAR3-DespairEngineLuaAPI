local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local Game = GameScript.Game
local Graphics = GameScript.Game.Graphics
local Camera = GameScript.Game.Camera
local ObjectTags = Game.ObjectTags
local Player = Game.Player
local playerIndexArray = GameScript.PlayerIndexArray
local msgCBList = GameScript.MsgCallback
local regMsgIndex = GameScript.MsgCallback.PlayerRegistrationMessage
local spawnMsgIndex = GameScript.MsgCallback.PlayerSpawnedMessage
local playerIndexArray = GameScript.PlayerIndexArray
local RunningHP = 0
local RampingOffDamageFilters = false
local CurrentTime = 0
local RampingFunction_layer1, RampingFunction_layer2, RampingFunction_layer3, Layer_1_DisplayAmount, Layer_2_DisplayAmount, Layer_3_DisplayAmount
Support.RegisterCurveTemplateVariable("DamageDisplayCurve_Layer_1", "The damage display mapping curve for First layer(percentage HP -> displayed effect amount)")
Support.RegisterCurveTemplateVariable("DamageDisplayCurve_Layer_2", "The damage display mapping curve for Second layer(percentage HP -> displayed effect amount)")
Support.RegisterCurveTemplateVariable("DamageDisplayCurve_Layer_3", "The damage display mapping curve for tThird layer(percentage HP -> displayed effect amount)")
local _HitPoints = Support.ImportWatchVariable("CurrHitPoints", "Damage Value variable")
local _HitPointsPercent = Support.ImportWatchVariable("CurrHitPointPercent", "Damage Percentage variable")
local _PossessedHitPoints = Support.ImportWatchVariable("PossessedCurrHitPoints", "Possessed Soldier Damage Value variable")
local _PossessedHitPointsPercent = Support.ImportWatchVariable("PossessedCurrHitPointPercent", "Possessed Soldier Damage Percentage variable")
local _LastStand = Support.ImportWatchVariable("LastStand", "Is this character in Last Stand?")
local _IsRiding = Support.ImportWatchVariable("IsRiding", "Is the Fettel currently 'riding' a vehicle?")
local _CreepNear = Support.ImportWatchVariable("IsCreepNear", "Is the Creep in the general area?")
local Self = Game.GetMyObject()
local _PrevDamagePercent = 1
local _PrevLastStandValue = -1
local _DamageValueToFix = 20
local _IsFettel = false
local _UseLastStand = false
local _RidingTransition = false
local _CreepRegenFrames = 64
local _CreepRegenDeltaFrames = 0
local playerIndex = -1

function GetCurrDamagePercent()
  local DamageValue = _HitPoints
  local DamagePercent = _HitPointsPercent
  if _IsFettel and _IsRiding == 1 then
    DamageValue = _PossessedHitPoints
    DamagePercent = _PossessedHitPointsPercent
  end
  if DamagePercent ~= 0 then
    DamagePercent = (DamageValue - _DamageValueToFix) / (DamageValue / DamagePercent - _DamageValueToFix)
    DamagePercent = math.max(0, math.min(1, DamagePercent))
  end
  return DamagePercent
end

function GetBuddyPlayer()
  local partnerAvatarObject
  local partnerPlayerIndex = GameScript.PlayerIndex.kNotAGlobalPlayer
  local thisPlayerIndex = Player.GetPlayerIndexByObject(Self)
  if thisPlayerIndex == GameScript.PlayerIndex.kGlobalPlayer1 then
    partnerPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer2
  else
    partnerPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1
  end
  return Player.GetPlayerAvatarObjectByIndex(partnerPlayerIndex)
end

function UpdateDamage()
  local DamagePercent = GetCurrDamagePercent()
  if not _RidingTransition and _CreepNear == 1 and DamagePercent > _PrevDamagePercent then
    Callbacks.RegisterForUpdateEveryFrame("UpdateEveryFrame_CreepDisplay")
  else
    _PrevDamagePercent = DamagePercent
    UpdateDamageDisplay(DamagePercent)
  end
end

function UpdateDamageDisplay(DisplayValue)
  if playerIndex == -1 then
    playerIndex = Player.GetPlayerIndexByObject(Self)
  end
  Layer_1_DisplayAmount = Support.GetCurveValue("DamageDisplayCurve_Layer_1", DisplayValue)
  Camera.SetCameraFilterScalar(playerIndex, "DamageDisplay_Layer_1", Layer_1_DisplayAmount)
  Layer_2_DisplayAmount = Support.GetCurveValue("DamageDisplayCurve_Layer_2", DisplayValue)
  Camera.SetCameraFilterScalar(playerIndex, "DamageDisplay_Layer_2", Layer_2_DisplayAmount)
  Layer_3_DisplayAmount = Support.GetCurveValue("DamageDisplayCurve_Layer_3", DisplayValue)
  Camera.SetCameraFilterScalar(playerIndex, "DamageDisplay_Layer_3", Layer_3_DisplayAmount)
  if _UseLastStand then
    local buddy = GetBuddyPlayer()
    if buddy and Game.IsLoaded(buddy) then
      local buddyIndex = Player.GetPlayerIndexByObject(buddy)
      local LastStand = _LastStand
      if _PrevLastStandValue ~= LastStand then
        _PrevLastStandValue = LastStand
        Camera.SetCameraFilterScalar(buddyIndex, "LastStandDisplay", LastStand)
      end
    end
  end
end

function UpdateEveryFrame_CreepDisplay()
  local DamagePercent = _PrevDamagePercent * (1 - _CreepRegenDeltaFrames / _CreepRegenFrames) + GetCurrDamagePercent() * (_CreepRegenDeltaFrames / _CreepRegenFrames)
  _CreepRegenDeltaFrames = _CreepRegenDeltaFrames + 1
  if DamagePercent == 1 then
    _CreepRegenDeltaFrames = 0
    _PrevDamagePercent = DamagePercent
    Callbacks.UnregisterForUpdateEveryFrame("UpdateEveryFrame_CreepDisplay")
  end
  UpdateDamageDisplay(DamagePercent)
end

function UpdateHitPoints(msg)
  _HitPoints = msg.newValue
  UpdateDamage()
end

function UpdateHitPointsPercent(msg)
  _HitPointsPercent = msg.newValue
  UpdateDamage()
end

function UpdatePossessedHitPoints(msg)
  _PossessedHitPoints = msg.newValue
  UpdateDamage()
end

function UpdatePossessedHitPointsPercent(msg)
  _PossessedHitPointsPercent = msg.newValue
  UpdateDamage()
end

function UpdateLastStand(msg)
  _LastStand = msg.newValue
  UpdateDamage()
end

function UpdateIsRiding(msg)
  _IsRiding = msg.newValue
  _RidingTransition = true
  UpdateDamage()
  _RidingTransition = false
end

function UpdateCreepNear(msg)
  _CreepNear = msg.newValue
  UpdateDamage()
  if _CreepNear ~= 1 then
    Callbacks.UnregisterForUpdateEveryFrame("UpdateEveryFrame_CreepDisplay")
  end
end

function Initialize(thisObject)
  playerIndex = Player.GetPlayerIndexByObject(Self)
  if nil ~= ObjectTags then
    _IsFettel = ObjectTags.DoesObjectHaveTag(Self, "Fettel")
    _UseLastStand = _IsFettel or ObjectTags.DoesObjectHaveTag(Self, "Point Man")
  end
  Callbacks.RegisterForWatchVariableChange("CurrHitPoints", "UpdateHitPoints")
  Callbacks.RegisterForWatchVariableChange("CurrHitPointPercent", "UpdateHitPointsPercent")
  Callbacks.RegisterForWatchVariableChange("PossessedCurrHitPoints", "UpdatePossessedHitPoints")
  Callbacks.RegisterForWatchVariableChange("PossessedCurrHitPointPercent", "UpdatePossessedHitPointsPercent")
  Callbacks.RegisterForWatchVariableChange("LastStand", "UpdateLastStand")
  Callbacks.RegisterForWatchVariableChange("IsRiding", "UpdateIsRiding")
  Callbacks.RegisterForWatchVariableChange("IsCreepNear", "UpdateCreepNear")
end

Initialize(scriptObject)
