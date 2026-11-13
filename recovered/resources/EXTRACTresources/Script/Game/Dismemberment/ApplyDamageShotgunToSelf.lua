local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Utilities = GameScript.Utilities
local Player = GameScript.Game.Player
local Math3d = GameScript.LuaMath3d
local Self = Game.GetMyObject()
local FrameCount = 0
local SourcePositon = {}
local DamagePosition
local DamagePositionTable = {}
local BoneNameTable = {}
local bInitialized = false
local ReloadWait = 0
local TargetObject = Support.ImportFirstObject("Target Object", "The object that will have damage done to it.  MUST be a body with bones.")
local SourceObject = Support.ImportFirstObject("Source Object", "The object position from which the damage is coming from.")
local TotalDamageAmount = Support.ImportFloatVariable("Total Damage Amount", "The total amount of damage done to the body from all the damage messages combined")
local Spread = Support.ImportFloatVariableWithDefault("Spread", "The distance away from the original Target point", 0.2)
local Offset = Support.ImportFloatVariable("Offset", "Offset in X, Y, and Z to fire shotgun from(uses same value for offset in each direction + random value [0.0 - 1.0] )")
local BoneName00 = Support.ImportStringVariable("Bone Name00", "The name of the bone to target in String form")
local BoneName01 = Support.ImportStringVariable("Bone Name01", "The name of the bone to target in String form")
local BoneName02 = Support.ImportStringVariable("Bone Name02", "The name of the bone to target in String form")
local BoneName03 = Support.ImportStringVariable("Bone Name03", "The name of the bone to target in String form")
local BoneName04 = Support.ImportStringVariable("Bone Name04", "The name of the bone to target in String form")
local seed = Util.GenerateRandomSeed()

function ProcessDamage()
  if not bInitialized then
    TargetObject = Support.ImportFirstObject("Target Object", "")
    if TargetObject and Game.IsLoaded(TargetObject) then
      BoneAddition(BoneName00, BoneName01, BoneName02, BoneName03, BoneName04)
      InitializeDamageVals()
      bInitialized = true
    end
  end
end

function InitializeDamageVals()
  if 0 < #BoneNameTable then
    Debug.PrintInfoIf(0 < g_debugMode, "#BoneNameTable: " .. #BoneNameTable)
    if TargetObject and SourceObject then
      for key, value in pairs(BoneNameTable) do
        DamagePosition = Game.GetSceneNodePosition(TargetObject, value)
        SourcePosition = Game.GetPosition(TargetObject)
        local offsetTable = {
          x = Offset + Utilities.GetRandomPercent(),
          y = Offset + Utilities.GetRandomPercent(),
          z = Offset + Utilities.GetRandomPercent()
        }
        SourcePosition = Math3d.VectorAdd(SourcePosition, offsetTable)
        local Forward, Side, Up = Math3d.GetForwardSideUp(Math3d.GetRotationForForward(Math3d.VectorSubtract(SourcePosition, DamagePosition)))
        local Side_Spread = Math3d.VectorMultiply(Side, Spread)
        local Up_Spread = Math3d.VectorMultiply(Up, Spread)
        local Position_1 = Math3d.VectorAdd(DamagePosition, Side_Spread)
        local Position_2 = Math3d.VectorSubtract(DamagePosition, Side_Spread)
        local Position_3 = Math3d.VectorAdd(DamagePosition, Up_Spread)
        local Position_4 = Math3d.VectorSubtract(DamagePosition, Up_Spread)
        DamagePositionTable[#DamagePositionTable + 1] = {
          x = DamagePosition.x,
          y = DamagePosition.y,
          z = DamagePosition.z
        }
        DamagePositionTable[#DamagePositionTable + 1] = {
          x = Position_1.x,
          y = Position_1.y,
          z = Position_1.z
        }
        DamagePositionTable[#DamagePositionTable + 1] = {
          x = Position_2.x,
          y = Position_2.y,
          z = Position_2.z
        }
        DamagePositionTable[#DamagePositionTable + 1] = {
          x = Position_3.x,
          y = Position_3.y,
          z = Position_3.z
        }
        DamagePositionTable[#DamagePositionTable + 1] = {
          x = Position_4.x,
          y = Position_4.y,
          z = Position_4.z
        }
      end
      FrameCount = 1
      Callbacks.RegisterForUpdateEveryFrame("DoDamage")
    else
      Debug.PrintError(Game.GetName(Self) .. ": One of the necessary Import objects was NIL ")
    end
  elseif Self then
    Debug.PrintError(Game.GetName(Self) .. ": No bones Imported! ")
  end
end

function DoDamage()
  if 0 < FrameCount then
    local DamageTable = {
      damage = TotalDamageAmount,
      impactX = DamagePositionTable[FrameCount].x,
      impactY = DamagePositionTable[FrameCount].y,
      impactZ = DamagePositionTable[FrameCount].z,
      sourceX = SourcePositon.x,
      sourceY = SourcePositon.y,
      sourceZ = SourcePositon.z
    }
    if Game.IsLoaded(TargetObject) then
      Game.DamageWithInfo(TargetObject, DamageTable)
    end
    if FrameCount >= #DamagePositionTable then
      Debug.PrintInfoIf(0 < g_debugMode, "#DamagePositionTable: " .. #DamagePositionTable)
      Callbacks.UnregisterForUpdateEveryFrame("DoDamage")
    end
    FrameCount = FrameCount + 1
  end
end

function BoneAddition(...)
  for i, v in ipairs({
    ...
  }) do
    if v then
      BoneNameTable[#BoneNameTable + 1] = Game.DoesSceneNodeExist(TargetObject, v) and v or nil
    end
  end
end

function Reload()
  Callbacks.RegisterForTimer("ProcessDamage", 0, false)
end

function DummyFunc()
end

if TargetObject then
  Callbacks.RegisterForTimer("ProcessDamage", 1, false)
  Callbacks.RegisterForPostCheckpointActivation("Reload")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.KillObjectMessage, GameScript.Game.GetMyObject(), "DummyFunc")
end
