local Game = GameScript.Game
local AI = GameScript.Game.AI
local Callbacks = GameScript.Callbacks
local Camera = GameScript.Game.Camera
local Debug = GameScript.Debug
local Door = GameScript.Game.Door
local Energy = GameScript.Game.Energy
local Graphics = GameScript.Game.Graphics
local Physics = GameScript.Game.Physics
local Player = GameScript.Game.Player
local Sets = GameScript.Game.Sets
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local SetToCheck = Support.ImportSetObject("SetToCheck", "Set to check to see if it's empty.  Make sure you select ''Specific Object'' and chose a set or squad. ")
local SetToEnable = Support.ImportObjectHandleVariable("SetToEnable", "Enable or disable this object or set of objects when the above set is empty.  Choose either ''Specific Object'' or ''Set of Objects'' as appropriate.")
local EnableOrDisableSet = Support.ImportFloatVariableWithDefault("EnableOrDisableSet", "Enter 1 to enable objects in this set or 0 to disable them.", 1)
local SecondsToWaitBeforeCheck = Support.ImportFloatVariableWithDefault("SecondsToWaitBeforeCheck", "Wait this many seconds before checking if the set is empty.  Don't set this to a negative number unless you're dumb, in which case it's okay.", 0)
local StartCheckingNumber = Support.ImportFloatVariableWithDefault("StartCheckingNumber", "When there are at least this many objects in the set, start check to see if the set is empty.", 0)
local EnableAtNumber = Support.ImportFloatVariableWithDefault("EnableAtNumber", "When the set check has started, enable the next set when there are this many or less objects in the set.", 0)
local StartCheckingSet = false
local SetKey, SetObject, SetObjectTable, boolEnable

function StartChecking()
  if SecondsToWaitBeforeCheck < 0 then
    SecondsToWaitBeforeCheck = 0
  end
  if StartCheckingNumber < 0 then
    StartCheckingNumber = 0
  end
  if EnableAtNumber < 0 then
    EnableAtNumber = 0
  end
  Callbacks.RegisterForTimer("CheckSet", 0.25, true)
  Debug.PrintInfoIf(0 < g_debugMode, "Registered CheckSet()")
end

function CheckSet()
  if Sets.GetNumObjectsInSet(SetToCheck) >= StartCheckingNumber then
    if StartCheckingSet == false then
      Debug.PrintInfoIf(g_debugMode > 0, "StartCheckingNumber reached.")
    end
    StartCheckingSet = true
  end
  if Sets.GetNumObjectsInSet(SetToCheck) <= EnableAtNumber and StartCheckingSet == true then
    Debug.PrintInfoIf(g_debugMode > 0, "Set Empty.  Calling EnableSet() and unregistering CheckSet()")
    EnableSet()
    Game.Kill(Game.GetMyObject(), 0)
    Support.ExitScript()
  end
end

function EnableSet()
  SetObjectTable = Support.GetImportObjectTable("SetToEnable")
  if SetObjectTable then
    if EnableOrDisableSet == 0 then
      boolEnable = false
      Debug.PrintInfoIf(0 < g_debugMode, "Disabling Set")
    else
      boolEnable = true
      Debug.PrintInfoIf(0 < g_debugMode, "Enabling Set")
    end
    SetKey, SetObject = next(SetObjectTable, SetKey)
    while SetKey do
      Game.EnableAllEnableables(SetObject, boolEnable)
      SetKey, SetObject = next(SetObjectTable, SetKey)
    end
  else
    Debug.PrintInfoIf(0 < g_debugMode, "ERROR: OnEmptySetEnableObjects: SetObjectTable is empty.  Aborting script . . . mmmnow")
  end
end

Callbacks.RegisterForTimer("StartChecking", SecondsToWaitBeforeCheck, false)
