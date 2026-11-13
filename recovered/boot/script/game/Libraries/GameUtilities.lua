local mainGlobal = _G
local GS = Despair.GameScript
local Helpers = GS.LuaHelpers
local Debug = GS.Debug
local Support = GS.Support
local Game = GS.Game
local Math3d = GS.LuaMath3d
local Camera = Game.Camera
local Player = Game.Player
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
module(...)
local Utilities = GS.Utilities
Utilities.kRed = {
  r = 255,
  g = 0,
  b = 0,
  a = 255
}
Utilities.kGreen = {
  r = 0,
  g = 255,
  b = 0,
  a = 255
}
Utilities.kBlue = {
  r = 0,
  g = 0,
  b = 255,
  a = 255
}
Utilities.kYellow = {
  r = 255,
  g = 255,
  b = 0,
  a = 255
}
Utilities.kOrange = {
  r = 255,
  g = 128,
  b = 0,
  a = 255
}
Utilities.kBlack = {
  r = 0,
  g = 0,
  b = 0,
  a = 255
}
Utilities.kWhite = {
  r = 255,
  g = 255,
  b = 255,
  a = 255
}
Utilities.kGrey = {
  r = 128,
  g = 128,
  b = 128,
  a = 255
}
Utilities.kFogType = {
  none = 0,
  depth = 1,
  height = 2
}
Utilities.kFogSource = {color = 0, cube_map = 1}
local LineOfSightCollisionGroup = GS.CollisionGroups.PlayerLineOfSight

function GetClosestPlayer(position)
  local closestPlayer
  local closestDistance = math.pow(10, 9)
  for index, playerObj in Utilities.AllPlayers(Player.GetPlayerControlledObjectByIndex) do
    if playerObj ~= nil then
      local playerPos = Game.GetPosition(playerObj)
      local distVector = Math3d.VectorSubtract(playerPos, position)
      local length = Math3d.VectorLength(distVector)
      if closestDistance > length then
        closestPlayer = playerObj
        closestDistance = length
      end
    end
  end
  return closestPlayer, closestDistance
end

function ShouldSpawn(spawner, checkLOS)
  if spawner == nil or Player.GetNumPlayers == 0 then
    return false
  end
  local isVisible = IsObjectVisible(spawner, checkLOS)
  return not isVisible
end

function IsObjectVisible(spawner, checkLOS)
  if spawner == nil then
    return false
  end
  local minDistance = 5
  local numPlayers = Player.GetNumPlayers()
  for playerIndex = 1, numPlayers do
    local player = Player.GetPlayerControlledObjectByIndex(playerIndex - 1)
    if player then
      local playerPos = Game.GetPosition(player)
      local spawnerPos = Game.GetPosition(spawner)
      local distVector = Math3d.VectorSubtract(spawnerPos, playerPos)
      distVector.y = 0
      local dist = Math3d.VectorLength(distVector)
      if minDistance > dist then
        return true
      end
      local playerForward = Game.GetForward(player)
      local distNorm = Math3d.VectorMultiply(distVector, 1 / dist)
      local dotResult = Math3d.VectorDot(playerForward, distNorm)
      local dotThreshold = -0.01
      if dotResult > dotThreshold then
        if checkLOS ~= nil and checkLOS then
          local heightAdjust = 1.3
          local position1 = {
            x = playerPos.x,
            y = playerPos.y + heightAdjust,
            z = playerPos.z
          }
          local position2 = {
            x = spawnerPos.x,
            y = spawnerPos.y + heightAdjust,
            z = spawnerPos.z
          }
          local hasLOS = LineOfSightWithPositions(position1, position2)
          if hasLOS then
            return true
          end
        else
          return true
        end
      end
    end
  end
  return false
end

function IsPlayerARider(PlayerIndex)
  return Player.GetPlayerAvatarObjectByIndex(PlayerIndex) ~= Player.GetPlayerControlledObjectByIndex(PlayerIndex)
end

function GetPointManFettelIndecies()
  return GetPointManFettelIndices()
end

function GetFettelAvatar()
  local pointManIndex, fettelIndex, pointManAvatar, fettelAvatar
  pointManIndex, fettelIndex, pointManAvatar, fettelAvatar = GetPointManAndFettel()
  return fettelAvatar
end

function GetPointManFettelIndices()
  local pointManIndex, fettelIndex, pointManAvatar, fettelAvatar
  pointManIndex, fettelIndex, pointManAvatar, fettelAvatar = GetPointManAndFettel()
  return pointManIndex, fettelIndex
end

function GetPointManFettelAvatarObjects(Avatars)
  local pointManIndex, fettelIndex, pointManAvatar, fettelAvatar
  pointManIndex, fettelIndex, pointManAvatar, fettelAvatar = GetPointManAndFettel()
  return pointManAvatar, fettelAvatar
end

function GetPointManFettelControlledObjects()
  local pointManIndex, fettelIndex, pointManAvatar, fettelAvatar, pointManControlledObject, fettelControlledObject
  pointManIndex, fettelIndex, pointManControlledObject, fettelControlledObject = GetPointManAndFettel(GS.Game.Player.GetPlayerControlledObjectByIndex)
  return pointManControlledObject, fettelControlledObject
end

function LineOfSight(PlayerIndex, PositionObject, DebugDraw)
  local cameraObject = Camera.GetCameraObjectForPlayer(PlayerIndex)
  if cameraObject == nil then
    return false
  end
  local PlayerCameraPosition = Game.GetPosition(cameraObject)
  local ObjectPosition = Game.GetPosition(PositionObject)
  return LineOfSightWithPositions(PlayerCameraPosition, ObjectPosition, DebugDraw)
end

function GetHorzDistanceBetweenObjects(obj1, obj2)
  local posObj1 = Game.GetPosition(obj1)
  local posObj2 = Game.GetPosition(obj2)
  local distVector = Math3d.VectorSubtract(posObj2, posObj1)
  distVector.y = 0
  return Math3d.VectorLength(distVector)
end

function LineOfSightWithPositions(position1, position2, DebugDraw)
  local RayCastVector = Math3d.VectorSubtract(position2, position1)
  local vectorLength = Math3d.VectorNormalize(RayCastVector)
  local Options = {
    dist = vectorLength,
    collisGroup = LineOfSightCollisionGroup,
    checkProxies = false
  }
  local hasHit = Utilities.DoesRayCollide(position1, RayCastVector, Options)
  return not hasHit
end

function AllPlayers(GetObjectFunction, ValidateFunction)
  local playerIterator = 0
  local numPlayers = Player.GetNumPlayers()
  
  local function BasicPlayerIterator()
    playerIterator = playerIterator + 1
    if playerIterator > numPlayers then
      return nil
    end
    local idx = GS.PlayerIndexArray[playerIterator]
    if GetObjectFunction then
      return idx, GetObjectFunction(idx)
    end
    return idx
  end
  
  local function ValidPlayerIterator()
    playerIterator = playerIterator + 1
    if playerIterator > numPlayers then
      return nil
    end
    local idx = GS.PlayerIndexArray[playerIterator]
    while not ValidateFunction(idx) do
      playerIterator = playerIterator + 1
      if playerIterator > numPlayers then
        return nil
      end
      idx = GS.PlayerIndexArray[playerIterator]
    end
    if GetObjectFunction then
      return idx, GetObjectFunction(idx)
    end
    return idx
  end
  
  if ValidateFunction then
    return ValidPlayerIterator
  end
  return BasicPlayerIterator
end

function PlayerHasTag(globalPlayerIndex, tag)
  local avatar = Player.GetPlayerAvatarObjectByIndex(globalPlayerIndex)
  return avatar ~= nil and Game.ObjectTags.DoesObjectHaveTag(avatar, tag)
end

function LerpRealNumber(numA, numB, alpha)
  return numA * (1 - alpha) + numB * alpha
end

function LerpColor(colorA, colorB, alpha)
  local result = {}
  result.r = Utilities.LerpRealNumber(colorA.r, colorB.r, alpha)
  result.g = Utilities.LerpRealNumber(colorA.g, colorB.g, alpha)
  result.b = Utilities.LerpRealNumber(colorA.b, colorB.b, alpha)
  return result
end

function ClampRealNumber(value, boundA, boundB)
  if boundB < boundA then
    boundA, boundB = boundB, boundA
  end
  if value < boundA then
    return boundA
  elseif value > boundB then
    return boundB
  end
  return value
end

function GetRandomRealNumber(minValue, maxValue)
  return Utilities.LerpRealNumber(minValue, maxValue, Utilities.GetRandomPercent())
end

function GetCurveFunction(Curve, MaxAmplitude, MinAmplitude, MaxRange, MinRange)
  if MaxRange then
    MinRange = MinRange or 0
    local DeltaRange = MaxRange - MinRange
    local DeltaAmplitude = MaxAmplitude - MinAmplitude
    return function(X)
      return Support.GetCurveValue(Curve, (X - MinRange) / DeltaRange) * DeltaAmplitude + MinAmplitude
    end
  end
  if MaxAmplitude then
    MinAmplitude = MinAmplitude or 0
    local DeltaAmplitude = MaxAmplitude - MinAmplitude
    return function(X)
      return Support.GetCurveValue(Curve, X) * DeltaAmplitude + MinAmplitude
    end
  end
  return function(X)
    return Support.GetCurveValue(Curve, X)
  end
end

function IsAITargetingPlayer(AI_Object, RequireLOS)
  if AI_Object then
    local info = Game.AI.GetAITargetInfo(AI_Object)
    if RequireLOS then
      return info and info.m_bIsInfoValid and info.m_bIsPlayerControlled and info.m_bHasLOS
    else
      return info and info.m_bIsInfoValid and info.m_bIsPlayerControlled
    end
  else
    return false
  end
end

function IsAnimLabelTag(ImportTable, CallbackInfo)
  return ImportTable.type == CallbackInfo.type and ImportTable.group == CallbackInfo.group and ImportTable.label == CallbackInfo.label
end

function IsAnimLabelGroupTag(ImportTable, CallbackInfo)
  return ImportTable.type == CallbackInfo.type and ImportTable.group == CallbackInfo.group
end

function CreateAnimLabelTag(group, label, type)
  local t = {}
  t.group = group
  t.label = label
  t.type = type
  return t
end

local PointManTag = "Point Man"
local FettelTag = "Fettel"

function IsPointMan(object)
  return object ~= nil and Game.ObjectTags.DoesObjectHaveTag(object, PointManTag)
end

function IsFettel(object)
  return object ~= nil and Game.ObjectTags.DoesObjectHaveTag(object, FettelTag)
end

function IsPointManIndex(globalIndex)
  return PlayerHasTag(globalIndex, PointManTag)
end

function IsFettelIndex(globalIndex)
  return PlayerHasTag(globalIndex, FettelTag)
end

function GetPointManAndFettel(GetObjectFunction)
  local pointManIndex = GS.PlayerIndex.kNotAGlobalPlayer
  local pointManObject
  local fettelIndex = GS.PlayerIndex.kNotAGlobalPlayer
  local fettelObject
  for i, o in AllPlayers(Player.GetPlayerAvatarObjectByIndex) do
    if pointManIndex == GS.PlayerIndex.kNotAGlobalPlayer and IsPointMan(o) then
      pointManIndex = i
      pointManObject = o
    elseif fettelIndex == GS.PlayerIndex.kNotAGlobalPlayer and IsFettel(o) then
      fettelIndex = i
      fettelObject = o
    end
  end
  if GetObjectFunction then
    if pointManIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
      pointManObject = GetObjectFunction(pointManIndex)
    end
    if fettelIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
      fettelObject = GetObjectFunction(fettelIndex)
    end
  end
  return pointManIndex, fettelIndex, pointManObject, fettelObject
end

function IsSoloFettel()
  if Player.GetNumPlayers() > 1 then
    return false
  end
  local pointManIdx, fettelIdx, pointManAvatar, fettelAvatar = GetPointManAndFettel()
  local soloFettel = pointManIdx == GS.PlayerIndex.kNotAGlobalPlayer and fettelIdx ~= GS.PlayerIndex.kNotAGlobalPlayer
  return soloFettel, fettelAvatar
end
