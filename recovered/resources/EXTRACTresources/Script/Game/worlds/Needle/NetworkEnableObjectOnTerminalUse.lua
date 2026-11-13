local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local kTrue = 1
local kFalse = 0
Support.ExportFloatVariable("Enabled", kFalse, "A dummy net-sync'd variable to determine when we should enable objects over the network")
local usableObject = Game.GetMyObject()
local enableObjs = Support.ImportObjectHandleVariable("Object(s) to Enable", "The objects that are enabled")
local messageObjs = Support.ImportObjectHandleVariable("Object(s) to Message", "The objects that are sent an 'OnUseCompleted' message")

function UpdateEveryFrame()
  if Extern.Enabled == kTrue and enableObjs then
    if messageObjs ~= nil then
      for name, object in pairs(messageObjs) do
        if object ~= nil then
          Game.SendTextMessage(object, "OnUseCompleted")
        end
      end
    end
    for k, obj in pairs(enableObjs) do
      if obj ~= nil then
        Game.EnableAllEnableables(obj, true)
      end
    end
  end
end

function ObjectIsUsed()
  Extern.Enabled = kTrue
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, usableObject, "ObjectIsUsed")
end

if not MP.IsClient() and usableObject ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, usableObject, "ObjectIsUsed")
end
Callbacks.RegisterForUpdateEveryFrame("UpdateEveryFrame")
