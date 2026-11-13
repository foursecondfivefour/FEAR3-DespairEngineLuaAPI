local Game = GameScript.Game
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Util = GameScript.Utilities
local HealthCheck
local EanableBool = Support.ImportBoolVariableWithDefault("Enable?", "True will enable the objects, false will disable them", true)
local EnableTable = Support.ImportObjectHandleVariable("Object(s) to Enable", "These objects will be enabled when the targeted object's hit-points drop below the set percentage.")
local HealthTable = Support.ImportObjectHandleVariable("Target Object", "This is the object that we're watching it's hit point percentage.  Supports Sets")
local HitPointPercentage = Support.ImportFloatVariableWithDefault("Hit Point Percentage", "If the Target Object's hit piont percentage drops below this value, it will set the enable state.  Values are 0 to 1", 1)

function CheckPercentage()
  HealthCheck = false
  for key, Object in pairs(HealthTable) do
    if Game.IsLoaded(Object) and Game.GetHitPointPercent(Object) < HitPointPercentage then
      HealthCheck = true
      break
    end
  end
  if HealthCheck then
    if EnableTable then
      for key, value in pairs(EnableTable) do
        if Game.IsLoaded(value) then
          Game.EnableAllEnableables(value, EanableBool)
        end
      end
    end
    for key, Object in pairs(HealthTable) do
      Callbacks.UnregisterForMsg(GameScript.MsgCallback.DamageTakenMessage, Object, "CheckPercentage")
    end
  end
end

if HealthTable and 0 < #HealthTable then
  CheckPercentage()
  for key, Object in pairs(HealthTable) do
    Callbacks.RegisterForMsg(GameScript.MsgCallback.DamageTakenMessage, Object, "CheckPercentage")
  end
elseif HealthTable == nil then
  Debug.PrintError("\"Target Object\" was unspecified")
else
  Debug.PrintError("\"Target Object\" table is empty. Make sure the object(s) exist at the time that this script executes")
end
