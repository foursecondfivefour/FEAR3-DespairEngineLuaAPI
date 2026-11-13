local Support = GameScript.Support
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Msg = GameScript.MsgCallback
local Util = GameScript.Utilities
local AI = Game.AI
local spawner = Game.GetMyObject()
local mySet = Game.GetMyObject()
local kUpdateTime = 0.1
local AnimGraphName = "Animation Graph Resource"
local AnimLabelInfo = Util.CreateAnimLabelTag("Intro", "Status", GameScript.AnimTagType.kEnd)
Support.RegisterAnimationGraphResourceVariable(AnimGraphName, "The animation graph we want to use'")
local AnimationVar = Support.ImportStringVariable("Animation Variable", "The name of the Animation Variable to set on the spawned object.")
local AnimationValue = Support.ImportFloatVariable("Animation Value", "Value to set 'Animation Variable'.  This is set once '" .. AnimGraphName .. "' is active")
local InterruptOnDamage = Support.ImportBoolVariableWithDefault("Interrupt On Damage", "if true animation graph will be removed when the spawned object takes damage.  This option is meaningless if 'Interrupt On Target' is true.", false)
local InterruptRegion = Support.ImportRegionObject("Interrupt Region", "If a region is specified, the graph will be removed when a player enters the region.  You do not have to specify a region.  If you are getting a red screen simply re-save your level.")
local InterruptOnTarget = GameScript.Support.ImportBoolVariableWithDefault("Interrupt On Target", "if true animation graph will be removed when the spawned AI aquires a target through its sensors or given an order that has a target.", false)

function DebugOutput(msg)
  Debug.PrintInfoIf(g_debugMode > 0, msg)
end

function Done(object)
  if object == nil then
    return
  end
  DebugOutput("Removing graph on " .. Game.GetName(object))
  Game.RemoveAnimationGraphResource(object)
  Game.Sets.RemoveObjectFromSet(mySet, object)
end

function AnimOver(info)
  if Util.IsAnimLabelTag(AnimLabelInfo, info) then
    Done(info.object)
    DebugOutput("Anim Tag Over")
  end
end

function HasTarget(object)
  if ai ~= nil then
    info = AI.GetAITargetInfo(object)
    if info.m_bIsInfoValid then
      return true
    end
  end
  return false
end

function AISpawned(info)
  local object = info.object
  DebugOutput("spawned " .. Game.GetName(object))
  Callbacks.RegisterForMsg(Msg.AnimationGraphPushedMessage, object, "GraphPushed")
  Game.SetAnimationGraphResource(object, "Animation Graph Resource")
  Game.Sets.AddObjectToSet(mySet, object)
end

function GraphPushed(object)
  DebugOutput("Graph Pushed " .. Game.GetName(object))
  if AnimationVar ~= nil then
    Game.SetAnimationVariable(object, AnimationVar, AnimationValue)
  end
  Callbacks.RegisterForMsg(Msg.LabelAnimationTag, object, "AnimTagOver")
  Callbacks.RegisterForMsg(Msg.LabelStateAnimationTag, object, "AnimStateOver")
  Callbacks.RegisterForMsg(Msg.AnimationFinishedMessage, object, "AnimFinished")
  Callbacks.RegisterForMsg(Msg.SuspendMessage, object, "Suspended")
  if InterruptOnDamage then
    DebugOutput("Registering to handle Damage")
    Callbacks.RegisterForMsg(Msg.DamageTakenMessage, object, "DamageOver")
  end
  if InterruptRegion then
    DebugOutput("Registering to handle player enter region.  " .. Game.GetName(InterruptRegion))
    Callbacks.RegisterPlayerEnterExitRegion(InterruptRegion, "PlayerEnterRegion", "")
  end
  if InterruptOnTarget then
    Callbacks.RegisterForTimer("LookForTarget", kUpdateTime, true)
  end
end

function AnimTagOver(info)
  AnimOver(info)
end

function AnimStateOver(info)
  AnimOver(info)
end

function AnimFinished(info)
  Done(info)
end

function DamageOver(object)
  Done(object)
end

function Suspended(msg)
  Done(msg.target)
end

function PlayerEnterRegion()
  local objects = Game.Sets.GetObjectsInSet(mySet)
  for idx, obj in ipairs(objects) do
    Done(obj)
  end
end

function LookForTarget()
  local set = GameScript.Game.Sets.GetObjectsInSet(mySet)
  for idx, ai in ipairs(set) do
    if ai ~= nil then
      info = AI.GetAITargetInfo(ai)
      if info.m_bIsInfoValid then
        Done(ai)
      end
    end
  end
end

if spawner then
  Callbacks.RegisterForMsg(Msg.SpawnerMessage, spawner, "AISpawned")
else
  Support.ExitScript()
end
