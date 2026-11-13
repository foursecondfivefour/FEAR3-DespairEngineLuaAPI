local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Physics = Game.Physics
local MP = Game.MP
local AnimationVariable = Support.ImportStringVariable("Animation Variable", "The name of the Animation Variable we're going to action on.")
local AnimationValue = Support.ImportFloatVariable("Animation Value", "What value should we set the Animation Variable to?")
local Objects = Support.ImportObjectHandleVariable("Object(s)", "The object(s) that we are setting the Animation Variable of")
local TimeTillSet = Support.ImportFloatVariableWithDefault("Timer", "How long before we set the Animation Variable of the specified object(s)", 0)

function SetAnimationVariable()
  Objects = Support.GetImportObjectTable("Object(s)")
  if Objects then
    for k, value in pairs(Objects) do
      if value and Game.IsLoaded(value) then
        Game.SetAnimationVariable(value, AnimationVariable, AnimationValue)
      end
    end
  end
end

if Objects then
  if 0 < TimeTillSet then
    Callbacks.RegisterForTimer("SetAnimationVariable", TimeTillSet, false)
  else
    SetAnimationVariable()
  end
end
