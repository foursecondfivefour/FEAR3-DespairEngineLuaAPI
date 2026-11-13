local Game = GameScript.Game
local Camera = GameScript.Game.Camera
local Physics = GameScript.Game.Physics
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local myObj = Game.GetMyObject()
local myObjName = Game.GetName(myObj)
local ObjectList = Support.ImportObjectHandleVariable("Light(s)", "The light(s) that will be Enabled/Disabled")

function PlayerEntersRegion()
  ObjectList = Support.GetImportObjectTable("Light(s)")
  if ObjectList ~= nil then
    for key, value in pairs(ObjectList) do
      if Game.IsLoaded(value) then
        Game.EnableAllEnableables(value, true)
      else
        Debug.PrintWarning(Game.GetName(myObj) .. ": Your object is no longer loaded!")
      end
    end
  elseif myObjName ~= nil then
    Debug.PrintWarning(myObjName .. ": 'Light(s)' is empty.")
  end
  Callbacks.RegisterForStopCondition("PlayerLeavesRegion")
end

function PlayerLeavesRegion()
  ObjectList = Support.GetImportObjectTable("Light(s)")
  if ObjectList ~= nil then
    for key, value in pairs(ObjectList) do
      if Game.IsLoaded(value) then
        if value == myObj and myObjName ~= nil then
          Debug.PrintWarning(Game.GetName(myObj) .. ": Disabling your own object")
        end
        Game.EnableAllEnableables(value, false)
      else
        Debug.PrintWarning(Game.GetName(myObj) .. ": Your object is no longer loaded!")
      end
    end
  elseif myObjName ~= nil then
    Debug.PrintWarning(Game.GetName(myObj) .. ": 'Light(s)' is empty.")
  end
end

function Initialize()
  if ObjectList then
    PlayerEntersRegion()
  elseif myObjName ~= nil then
    Debug.PrintError(Game.GetName(myObj) .. ": The 'Light(s)' list is a required field, but it contained no data. (EnableLightsForLocalPlayerInRegionList.lua)")
  end
end

Initialize()
Callbacks.RegisterForMsg(GameScript.MsgCallback.LoadChangesCompleteMessage, myObj, "Initialize")
Callbacks.RegisterForPostCheckpointActivation("Initialize")
