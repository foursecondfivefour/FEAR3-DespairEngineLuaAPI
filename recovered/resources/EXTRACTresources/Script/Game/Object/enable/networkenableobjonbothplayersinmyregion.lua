local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local ObjectTags = Game.ObjectTags
local Player = Game.Player
local Debug = GameScript.Debug
local Regions = Game.Regions
local kTrue = 1
local kFalse = 0
local Player1Index = GameScript.PlayerIndex.kGlobalPlayer1
local Player2Index = GameScript.PlayerIndex.kGlobalPlayer2
Support.ExportFloatVariable("pointmanInRegion", kFalse, "A dummy net-sync'd variable to determine when pointman is in the region over the network")
Support.ExportFloatVariable("fettelInRegion", kFalse, "A dummy net-sync'd variable to determine when fettel is in the region over the network")
local enableObjs = Support.ImportObjectList("Object(s) to Enable", "The objects that are enabled")
local BothPlaPresent = Support.ImportBoolVariableWithDefault("Both Players Present?", "True : Will keep track if the players leave the region and won't run until both players are present in the region. False : Will run after both players have touched the region, allows for players to enter, then exit, and the script may still run.", false)
local myObj = Game.GetMyObject()
local PointManObjectTagUID = ObjectTags.GetObjectTagUID("Point Man")
local FettelObjectTagUID = ObjectTags.GetObjectTagUID("Fettel")
Extern.EnabledTriggered = false

function DummyCallback()
  Debug.PrintInfoIf(g_debugMode > 0, "DummyCallback()")
end

function EnableNow()
  if not Extern.EnabledTriggered then
    Debug.PrintInfoIf(g_debugMode > 0, "EnableNow()")
    for k, obj in pairs(enableObjs) do
      if obj ~= nil and Game.IsLoaded(obj) then
        Debug.PrintInfoIf(g_debugMode > 0, "Enable:" .. Game.GetName(obj))
        Game.EnableAllEnableables(obj, true)
      end
    end
    if not MP.IsClient() then
      Callbacks.UnregisterObjectEnterExitRegion(myObj, PointManObjectTagUID, "PointManInRegion", "")
      Callbacks.UnregisterObjectEnterExitRegion(myObj, FettelObjectTagUID, "FettelInRegion", "")
    end
    Callbacks.RegisterForMsg(GameScript.MsgCallback.AnimationAnnotation, myObj, "DummyCallback")
    Extern.EnabledTriggered = true
  end
end

function EnableIfAllPlayersCurrentlyInRegion()
  Debug.PrintInfoIf(g_debugMode > 0, "EnableIfAllPlayersCurrentlyInRegion")
  local PlayerObject1 = Player.GetPlayerControlledObjectByIndex(Player1Index)
  local PlayerObject2 = Player.GetPlayerControlledObjectByIndex(Player2Index)
  local TriggerEnable = false
  if PlayerObject1 ~= nil and PlayerObject2 ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "TwoPlayersToCheck")
    if Regions.IsInRegion(myObj, PlayerObject1) then
      TriggerEnable = Regions.IsInRegion(myObj, PlayerObject2)
    end
  elseif PlayerObject1 ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "OnePlayerToCheck")
    TriggerEnable = Regions.IsInRegion(myObj, PlayerObject1)
  end
  if TriggerEnable then
    EnableNow()
  end
end

function PointManInRegion()
  Debug.PrintInfoIf(g_debugMode > 0, "PointManInRegion")
  Extern.pointmanInRegion = kTrue
  if BothPlaPresent == kFalse and Extern.fettelInRegion then
    EnableNow()
    return
  end
  EnableIfAllPlayersCurrentlyInRegion()
end

function FettelInRegion()
  Debug.PrintInfoIf(g_debugMode > 0, "FettelInRegion")
  Extern.fettelInRegion = kTrue
  if BothPlaPresent == kFalse and Extern.pointmanInRegion then
    EnableNow()
    return
  end
  EnableIfAllPlayersCurrentlyInRegion()
end

function OnReload()
  Debug.PrintInfoIf(g_debugMode > 0, "OnReload")
  if Extern.EnabledTriggered then
    EnableNow()
  else
    EnableIfAllPlayersCurrentlyInRegion()
  end
end

function OnValueUpdated()
  Debug.PrintInfoIf(g_debugMode > 0, "OnValueUpdated")
  if Extern.EnabledTriggered then
    EnableNow()
  end
end

if not MP.IsClient() and myObj ~= nil then
  Callbacks.RegisterObjectTagEnterExitRegion(myObj, PointManObjectTagUID, "PointManInRegion", "")
  Callbacks.RegisterObjectTagEnterExitRegion(myObj, FettelObjectTagUID, "FettelInRegion", "")
end
Callbacks.RegisterForPostCheckpointActivation("OnReload")
Callbacks.RegisterForScriptValueUpdated("OnValueUpdated")
