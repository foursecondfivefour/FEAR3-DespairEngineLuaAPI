local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Player = GameScript.Game.Player
local Sets = GameScript.Game.Sets
local Support = GameScript.Support
local SetToCheck = Support.ImportSetObject("SetToCheck", "Set to check to see if it's empty.  Make sure you select ''Specific Object'' and chose a set or squad. ")
local SetToEnable = Support.ImportObjectHandleVariable("SetToEnable", "Enable or disable this object or set of objects when the above set is empty.  Choose either ''Specific Object'' or ''Set of Objects'' as appropriate.")
local EnableOrDisableSet = Support.ImportFloatVariableWithDefault("EnableOrDisableSet", "Enter 1 to enable objects in this set or 0 to disable them.", 1)
local SecondsToWaitBeforeCheck = Support.ImportFloatVariableWithDefault("SecondsToWaitBeforeCheck", "Wait this many seconds before checking if the set is empty.  Don't set this to a negative number unless you're dumb, in which case it's okay.", 0)
local StartCheckingNumber = Support.ImportFloatVariableWithDefault("StartCheckingNumber", "When there are at least this many objects in the set, start check to see if the set is empty.", 1)
local EnableAtNumber = Support.ImportFloatVariableWithDefault("EnableAtNumber", "When the set check has started, enable the next set when there are this many or less objects in the set.", 0)
local WaitTime = Support.ImportFloatVariableWithDefault("Wait Time", "Once we've determined that we want to enable our object(s) wait this long before we do it", 0)
Extern.ScriptState = 0

function LookForRemoval()
  if Extern.ScriptState == 1 and Sets.GetNumObjectsInSet(SetToCheck) >= StartCheckingNumber then
    Debug.PrintInfoIf(g_debugMode > 0, "StartCheckingNumber (" .. StartCheckingNumber .. ") reached.   ScriptObject: " .. Game.GetName(Game.GetMyObject()))
    Extern.ScriptState = 2
  end
end

function LookToEnable()
  if Extern.ScriptState == 2 and Sets.GetNumObjectsInSet(SetToCheck) <= EnableAtNumber then
    Debug.PrintInfoIf(g_debugMode > 0, "Set below 'EnableAtNumber'(" .. EnableAtNumber .. ").  Stop watching 'SetToCheck'   ScriptObject: " .. Game.GetName(Game.GetMyObject()))
    if 0 < WaitTime then
      Callbacks.RegisterForTimer("EnableSet", WaitTime, false)
    else
      EnableSet()
    end
    Callbacks.UnregisterSetTracker(SetToCheck)
    Extern.ScriptState = 3
  end
end

function Empty()
end

function OnAddToSet(info)
  Debug.PrintInfoIf(g_debugMode > 0, "Object added to set (" .. Game.GetName(SetToCheck) .. ")  ScriptObject: " .. Game.GetName(Game.GetMyObject()))
  LookForRemoval()
end

function OnRemoveFromSet(info)
  Debug.PrintInfoIf(g_debugMode > 0, "Object Removed from set (" .. Game.GetName(SetToCheck) .. ")  ScriptObject: " .. Game.GetName(Game.GetMyObject()))
  LookToEnable()
end

function OnStart()
  if SetToCheck and Game.IsLoaded(SetToCheck) then
    Debug.PrintInfoIf(g_debugMode > 0, "Wait Over.  Starting to track " .. Game.GetName(SetToCheck))
    Extern.ScriptState = 1
    Callbacks.RegisterSetTracker(SetToCheck, "OnAddToSet", "OnRemoveFromSet")
    LookForRemoval()
    if Extern.ScriptState == 2 then
      LookToEnable()
    end
  else
    Debug.PrintInfo("ERROR: SetToCheck is empty.")
  end
end

function OnCheckpointLoad()
  Debug.PrintInfoIf(g_debugMode > 0, "Script State: " .. Extern.ScriptState)
  if 0 < Extern.ScriptState then
    Callbacks.UnregisterForTimer("OnStart")
    if Extern.ScriptState == 1 then
      OnStart()
    elseif Extern.ScriptState == 2 then
      LookToEnable()
    end
  end
end

function EnableSet()
  local SetKey, SetObject, SetObjectTable
  SetObjectTable = Support.GetImportObjectTable("SetToEnable")
  local boolEnable = false
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
      Debug.PrintInfoIf(0 < g_debugMode, "Enable object " .. Game.GetName(SetObject))
      Game.EnableAllEnableables(SetObject, boolEnable)
      SetKey, SetObject = next(SetObjectTable, SetKey)
    end
  else
    Debug.PrintInfoIf(0 < g_debugMode, "ERROR: OnEmptySetEnableObjects: SetObjectTable is empty.  Aborting script . . . mmmnow")
  end
  Game.Kill(Game.GetMyObject(), 0)
end

if StartCheckingNumber < 0 then
  StartCheckingNumber = 0
end
if EnableAtNumber < 0 then
  EnableAtNumber = 0
end
if SecondsToWaitBeforeCheck < 0 then
  SecondsToWaitBeforeCheck = 0
end
Callbacks.RegisterForTimer("OnStart", SecondsToWaitBeforeCheck, false)
Callbacks.RegisterForPostCheckpointActivation("OnCheckpointLoad")
Callbacks.RegisterForTimer("Empty", 1000000, true)
