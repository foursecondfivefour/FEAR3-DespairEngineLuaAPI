local Game = GameScript.Game
local Support = GameScript.Support
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")
local playerIndex, playerobject
local playerTransferMsg = GameScript.MsgCallback.PlayerTransferControlMessage
local possessionEndMsg = GameScript.MsgCallback.PossessionEndedMessage

function PlayerTransferredControl(MSG)
  local newAvatar = MSG.currentPlayerAvatarObject
  if newAvatar ~= nil and Game.IsPossessed(newAvatar) then
    Callbacks.RegisterForMsg(possessionEndMsg, newAvatar, "PlayerPossessionEnded")
  end
end

function PlayerPossessionEnded(MSG)
  if (MSG.nType == 1 or MSG.nType == 3) and enableObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Enable Object - Number:" .. table.getn(enableObj))
    for key, nextObj in pairs(enableObj) do
      if nextObj and Game.IsLoaded(nextObj) then
        Game.EnableAllEnableables(nextObj, true)
      end
    end
  end
  Callbacks.UnregisterForMsg(possessionEndMsg, MSG.possessedObject, "PlayerPossessionEnded")
end

Callbacks.RegisterForMsg(playerTransferMsg, Game.GetMyObject(), "PlayerTransferredControl")
