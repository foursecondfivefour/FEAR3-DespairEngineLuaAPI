local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Score = GameScript.FEARScore
local MP = Game.MP
local Player = Game.Player
local myObject = Game.GetMyObject()

function OnObjectUsed(msg)
  if MP.IsClient() then
    return
  end
  local index = msg.userPlayerIndex
  if index == GameScript.PlayerIndex.kNotAGlobalPlayer then
    return
  end
  Score.AwardChallengeRequirement(index, GameScript.BoostChallenge.Mommy, 1)
  local avatar = Player.GetPlayerAvatarObjectByIndex(index)
  Game.SendTextMessage(avatar, "AlmaDoll")
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.UsablesStartUsingMessage, myObject, "OnObjectUsed")
