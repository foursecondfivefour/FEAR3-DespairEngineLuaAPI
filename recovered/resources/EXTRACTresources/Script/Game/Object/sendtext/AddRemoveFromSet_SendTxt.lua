local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local AddMssg = Support.ImportStringVariable("Object Added Variable", "Variable modified when an object is added to the set. Will be ignored if empty.")
local AddValue = Support.ImportFloatVariableWithDefault("Object Added Value", "The value to set the variable to", 0)
local RemoveMssg = Support.ImportStringVariable("Object Removed Variable", "Message sent to the object Removed to the set. Will be ignored if empty.")
local RemoveValue = Support.ImportFloatVariableWithDefault("Object Removed Value", "The value to set the variable to", 0)
local ObjectSet = Support.ImportSetObject("Object Set", "Objects spawned into this set will be sent the text mssg.")

function ObjectAdded(Object)
  Game.SetAnimationVariable(Object, AddMssg, AddValue)
end

function ObjectRemoved(Object)
  Game.SetAnimationVariable(Object, RemoveMssg, RemoveValue)
end

if ObjectSet then
  if 0 < #AddMssg and 0 < #RemoveMssg then
    Callbacks.RegisterSetTracker(ObjectSet, "ObjectAdded", "ObjectRemoved")
  elseif 0 < #AddMssg then
    Callbacks.RegisterSetTracker(ObjectSet, "ObjectAdded", "")
  elseif 0 < #RemoveMssg then
    Callbacks.RegisterSetTracker(ObjectSet, "", "ObjectRemoved")
  else
    Debug.PrintError("You need to set at least one Varaible to be controlled")
  end
else
  Debug.PrintError("You need a set for this script to work on.")
end
