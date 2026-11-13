GameScript.Support.AddDescription("Script to enable an object upon a member of a set dying")
local Game = GameScript.Game
local Sets = Game.Sets
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local killObjMsg = GameScript.MsgCallback.KillObjectMessage
local Set = Support.ImportSetObject("Set", "Set to use for checking contents")
local EnableObject = Support.ImportSingleObject("Enable Object", "Enable this object")
local enableInSet = Support.ImportBoolVariable("Enable Objects In Set", "If the 'EnableObject' has a set, enable all of the objects in that set as well")

function RegisterForDeath(msgObj)
  Callbacks.RegisterForMsg(killObjMsg, msgObj, "OnDeath")
end

function OnDeath()
  Game.EnableAllEnableables(EnableObject, true)
  if enableInSet and Sets.HasSetComponent(EnableObject) then
    local enableObjList = Sets.GetObjectsInSet(EnableObject)
    if enableObjList then
      for key, objInEnableSet in pairs(enableObjList) do
        Game.EnableAllEnableables(objInEnableSet, true)
      end
    end
  end
  Support.ExitScript()
end

function OnAddToSet(addedObj)
  RegisterForDeath(addedObj)
end

if Set and EnableObject then
  local objList = Sets.GetObjectsInSet(Set)
  if objList then
    for key, objInSet in pairs(objList) do
      RegisterForDeath(objInSet)
    end
  end
  Callbacks.RegisterSetTracker(Set, "OnAddToSet", "")
else
  Debug.PrintWarning("Missing necessary objects")
end
