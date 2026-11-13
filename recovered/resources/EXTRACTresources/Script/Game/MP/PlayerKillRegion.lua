local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Player = Game.Player
local myObject = Game.GetMyObject()

function PlayerEnteredMe(info)
  local avatar = info.object
  if avatar ~= nil and Game.IsLoaded(avatar) then
    Game.Kill(avatar, GameScript.KillObjectMessageType.DoDying)
  end
end

Callbacks.RegisterPlayerEnterExitRegion(myObject, "PlayerEnteredMe", "")
