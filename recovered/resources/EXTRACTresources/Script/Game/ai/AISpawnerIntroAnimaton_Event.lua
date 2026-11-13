local Support = GameScript.Support
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Msg = GameScript.MsgCallback
local Util = GameScript.Utilities
local AI = GameScript.Game.AI
local spawner = Game.GetMyObject()
local mySet = Game.GetMyObject()
local kUpdateTime = 0.1
local AnimGraphName = "Animation Graph Resource"
local AnimLabelInfo = Util.CreateAnimLabelTag("Intro", "Status", GameScript.AnimTagType.kEnd)
Support.RegisterAnimationGraphResourceVariable(AnimGraphName, "The animation graph we want to use'")
local AnimationVar = Support.ImportStringVariable("Animation Variable", "The name of the Animation Variable to set on the spawned object.")
local AnimationValue = Support.ImportFloatVariable("Animation Value", "Value to set 'Animation Variable'.  This is set once '" .. AnimGraphName .. "' is active")
local InterruptOnDamage = Support.ImportBoolVariable("Interrupt On Damage", "if true animation graph will be removed when the spawned object takes damage.")
local TriggerOnDamage = Support.ImportBoolVariableWithDefault("Trigger On Damage", "if true the event will be triggered on damage(only will function if Interrupt On Damage is false.", false)
local InterruptOnTarget = GameScript.Support.ImportBoolVariableWithDefault("Interrupt On Target", "if true animation graph will be removed when the spawned AI aquires a target through its sensors or given an order that has a target.", false)
local StartEventRegion = Support.ImportRegionObject("Event Region!", "When a player enters this region the Spawned AI will have it's Event Variable set with the Event Value")
local StartEventMessage = Support.ImportBoolVariableWithDefault("Text Message to Start?", "When this object recieves a text message of 'Event' the Spawned AI will have it's Event Variable set with the Event Value", false)
local EventAnimationVar = Support.ImportStringVariable("Event Variable", "The name of the Animation Variable to set on the spawned object when ")
local EventAnimationValue = Support.ImportFloatVariable("Event Value", "Value to set 'Animation Variable'.  This is set once '" .. AnimGraphName .. "' is active")
local ObjectTable = {}
local bRegisteredPlayerInRegion = false
local bRegisteredTextMessage = false

function DebugOutput(msg)
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

function AISpawned(info)
  local object = info.object
  DebugOutput("spawned " .. Game.GetName(object))
  Callbacks.RegisterForMsg(Msg.AnimationGraphPushedMessage, object, "GraphPushed")
  Game.SetAnimationGraphResource(object, "Animation Graph Resource")
  Game.Sets.AddObjectToSet(mySet, object)
end

function GraphPushed(object)
  ObjectTable[#ObjectTable + 1] = object
  DebugOutput("Graph Pushed " .. Game.GetName(object))
  if AnimationVar ~= nil then
    Game.SetAnimationVariable(object, AnimationVar, AnimationValue)
  end
  Callbacks.RegisterForMsg(Msg.LabelAnimationTag, object, "AnimTagOver")
  Callbacks.RegisterForMsg(Msg.LabelStateAnimationTag, object, "AnimStateOver")
  Callbacks.RegisterForMsg(Msg.SuspendMessage, object, "Suspended")
  if InterruptOnDamage then
    DebugOutput("Registering to handle Damage")
    Callbacks.RegisterForMsg(Msg.DamageTakenMessage, object, "DamageOver")
  end
  if TriggerOnDamage and not InterruptOnDamage then
    DebugOutput("Registering to handle Damage")
    Callbacks.RegisterForMsg(Msg.DamageTakenMessage, object, "Force_StartEvent")
  end
  if InterruptOnTarget then
    Callbacks.RegisterForTimer("LookForTarget", kUpdateTime, true)
  end
  if StartEventRegion and not bRegisteredPlayerInRegion then
    DebugOutput("Registering to handle player enter region.  " .. Game.GetName(StartEventRegion))
    Callbacks.RegisterPlayerEnterExitRegion(StartEventRegion, "Force_StartEvent", "")
    bRegisteredPlayerInRegion = true
  end
  if StartEventMessage and not bRegisteredTextMessage then
    DebugOutput("Registering to handle receive text msg.  " .. Game.GetName(StartEventRegion))
    Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, Game.GetMyObject(), "Force_StartEvent", "")
    bRegisteredTextMessage = true
  end
end

function Force_StartEvent()
  if EventAnimationVar ~= nil and ObjectTable[1] and Game.IsLoaded(ObjectTable[1]) then
    Game.SetAnimationVariable(ObjectTable[1], EventAnimationVar, EventAnimationValue)
  end
end

function AquireTarget_StartEvent(ai)
  if AquireTarget_AnimVar ~= nil and AquireTarget_AnimValue > 0 then
    if ai and Game.IsLoaded(ai) then
      Game.SetAnimationVariable(ai, EventAnimationVar, EventAnimationValue)
    end
  else
    Done(ai)
  end
end

function AnimTagOver(info)
  AnimOver(info)
end

function AnimStateOver(info)
  AnimOver(info)
end

function Suspended(msg)
  Done(msg.target)
end

function DamageOver(object)
  Done(object)
end

function PlayerEnterRegion()
  for idx, val in ipairs(objects) do
    Done(val)
  end
end

function LookForTarget()
  local set = GameScript.Game.Sets.GetObjectsInSet(mySet)
  for idx, ai in ipairs(set) do
    if ai ~= nil then
      info = AI.GetAITargetInfo(ai)
      if info.m_bIsInfoValid then
        AquireTarget_StartEvent(ai)
      end
    end
  end
end

if spawner then
  Callbacks.RegisterForMsg(Msg.SpawnerMessage, spawner, "AISpawned")
else
  Support.ExitScript()
end
