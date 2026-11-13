local mainGlobal = _G
local GS = Despair.GameScript
local Debug = GS.Debug
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
local next = mainGlobal.next
module(...)
local math3d = GS.LuaMath3d

function Clamp(input, min, max)
  if input < min then
    input = min
  elseif max < input then
    input = max
  end
  return input
end

function VectorAdd(...)
  local newVector = {
    x = 0,
    y = 0,
    z = 0
  }
  for key, vector in pairs({
    ...
  }) do
    newVector.x = newVector.x + vector.x
    newVector.y = newVector.y + vector.y
    newVector.z = newVector.z + vector.z
  end
  return newVector
end

function VectorSubtract(a, b)
  local newVector = {
    x = a.x - b.x,
    y = a.y - b.y,
    z = a.z - b.z
  }
  return newVector
end

function VectorMultiply(vec, scalar)
  local newVector = {
    x = vec.x * scalar,
    y = vec.y * scalar,
    z = vec.z * scalar
  }
  return newVector
end

function VectorDot(a, b)
  return a.x * b.x + a.y * b.y + a.z * b.z
end

function VectorCross(a, b)
  local newX = a.y * b.z - a.z * b.y
  local newY = a.z * b.x - a.x * b.z
  local newZ = a.x * b.y - a.y * b.x
  return {
    x = newX,
    y = newY,
    z = newZ
  }
end

function ToDegrees(radians)
  return radians * 180 / math.pi
end

function ToRadians(degrees)
  return degrees * math.pi / 180
end

function VectorAngle(a, b)
  local lengthA = VectorLength(a)
  local lengthB = VectorLength(b)
  if lengthA < 0.001 or lengthB < 0.001 then
    Debug.PrintError("VectorAngle called with vector of length 0")
    return 0
  end
  if 1.001 < lengthA or 1.001 < lengthB then
    Debug.PrintError("VectorAngle called with a non normalized vector")
    return 0
  end
  local dot = VectorDot(a, b)
  dot = Clamp(dot, -1, 1)
  local angleInRadians = math.acos(dot)
  return ToDegrees(angleInRadians)
end

function VectorSignedAngle(a, b)
  local angleInRadians = VectorAngle(a, b)
  local upInitial = {
    x = 0,
    y = 1,
    z = 0
  }
  local side = VectorCross(upInitial, a)
  local signTest = VectorDot(side, b)
  if signTest < 0 then
    angleInRadians = angleInRadians * -1
  end
  return ToDegrees(angleInRadians)
end

function VectorCopy(a, b)
  a.x = b.x
  a.y = b.y
  a.z = b.z
end

function VectorLength(a)
  local squared = VectorDot(a, a)
  return math.sqrt(squared)
end

function VectorLengthSquared(a)
  return VectorDot(a, a)
end

function VectorNormalize(a)
  local length = VectorLength(a)
  if length < 0.001 then
    Debug.PrintInfo("VectorNormalize called with vector of length 0")
    a = {
      x = 1,
      y = 0,
      z = 0
    }
    return 0
  end
  local scalar = 1 / length
  local b = VectorMultiply(a, scalar)
  VectorCopy(a, b)
  return length
end

function GetRollPitchHeading(side, up, forward)
  local pitch = math.asin(-forward.y)
  local roll = 0
  local heading = 0
  if math.abs(math.abs(pitch) - math.pi * 0.5) < 1.0E-9 then
    heading = math.atan2(-side.z, side.x)
  else
    roll = math.atan2(side.y, up.y)
    heading = math.atan2(forward.x, forward.z)
  end
  local returnRotation = {
    r = ToDegrees(roll),
    p = ToDegrees(pitch),
    h = ToDegrees(heading)
  }
  return returnRotation
end

function GetRotationForForward(forward)
  local forwardNorm = {
    x = forward.x,
    y = forward.y,
    z = forward.z
  }
  VectorNormalize(forwardNorm)
  local upInitial = {
    x = 0,
    y = 1,
    z = 0
  }
  local side = VectorCross(upInitial, forwardNorm)
  VectorNormalize(side)
  local sideNorm = side
  local upNorm = VectorCross(forwardNorm, sideNorm)
  local rollPitchHeading = GetRollPitchHeading(sideNorm, upNorm, forwardNorm)
  return rollPitchHeading
end

function GetForwardSideUp(rotation)
  local sinR = math.sin(ToRadians(rotation.r))
  local cosR = math.cos(ToRadians(rotation.r))
  local sinP = math.sin(ToRadians(rotation.p))
  local cosP = math.cos(ToRadians(rotation.p))
  local sinH = math.sin(ToRadians(rotation.h))
  local cosH = math.cos(ToRadians(rotation.h))
  local side = {
    x = cosH * cosR + sinP * sinH * sinR,
    y = cosP * sinR,
    z = -cosR * sinH + cosH * sinP * sinR
  }
  local up = {
    x = -cosH * sinR + cosR * sinP * sinH,
    y = cosP * cosR,
    z = sinH * sinR + cosH * cosR * sinP
  }
  local forward = {
    x = cosP * sinH,
    y = -sinP,
    z = cosP * cosH
  }
  return forward, side, up
end

function DistanceBetweenPositions(posA, posB)
  return VectorLength(VectorSubtract(posA, posB))
end

function DistanceBetweenPositionsSquared(posA, posB)
  return VectorLengthSquared(VectorSubtract(posA, posB))
end
