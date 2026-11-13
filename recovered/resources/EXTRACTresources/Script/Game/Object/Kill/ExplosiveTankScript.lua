local Game = GameScript.Game
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Player = GameScript.Game.Player
local AI = Game.AI
local MP = Game.MP
local myObject = Game.GetMyObject()
if myObject == nil then
  return
end
local bTookDamage = false
local bDied = false
local weaponType = -1
local dmgInfo = {}
dmgInfo.damage = 10000
dmgInfo.weaponType = -1
dmgInfo.sourceObject = myObject
dmgInfo.type = "Suicide Mine"
dmgInfo.impactX = 0
dmgInfo.impactY = 0
dmgInfo.impactZ = 0
dmgInfo.sourceX = 0
dmgInfo.sourceY = 0
dmgInfo.sourceZ = 0
dmgInfo.hitReactionProbability = 0
local attachedObject

function OnKill(msg)
  if myObject == nil then
    return
  end
  local objectAttachedTo = Game.GetObjectAttachedTo(myObject)
  if objectAttachedTo == nil then
    return
  end
  if Player.IsPlayerControlled(objectAttachedTo) then
    return
  end
  if AI.IsAIControlled(objectAttachedTo) and not MP.IsClient() then
    local killerIndex = msg.killerPlayerIndex
    if killerIndex ~= GameScript.PlayerIndex.kNotAGlobalPlayer and Game.GetHitPointPercent(myObject) == 0 then
      local killerPlayerAvatar = Player.GetPlayerAvatarObjectByIndex(killerIndex)
      if killerPlayerAvatar ~= nil then
        dmgInfo.sourceObject = killerPlayerAvatar
      end
      bDied = true
      attachedObject = objectAttachedTo
      if bTookDamage then
        DoExplosion(objectAttachedTo)
      end
    else
      DoEffects(objectAttachedTo)
    end
  else
    DoEffects(objectAttachedTo)
  end
end

function OnDamage(msg)
  bTookDamage = true
  dmgInfo.weaponType = msg.nWeaponType
  if bDied then
    DoExplosion(attachedObject)
  end
end

function DoExplosion(objectAttachedTo)
  Game.DamageWithInfo(objectAttachedTo, dmgInfo)
  DoEffects(objectAttachedTo)
end

function DoEffects(objectAttachedTo)
  Game.SendTextMessage(objectAttachedTo, "Create_DroneExplode")
  Game.Kill(objectAttachedTo, 0)
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.KillObjectMessage, myObject, "OnKill")
Callbacks.RegisterForMsg(GameScript.MsgCallback.DamageMessage, myObject, "OnDamage")
