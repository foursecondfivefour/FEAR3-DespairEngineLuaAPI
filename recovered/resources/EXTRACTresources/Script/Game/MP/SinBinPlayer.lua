local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local GameAI = GameScript.Game.AI
local GameMP = GameScript.Game.MP
local Player = Game.Player
local ObjectTags = Game.ObjectTags
local Support = GameScript.Support
local Debug = GameScript.Debug
local Objectives = GameScript.Game.Objectives
local Graphics = GameScript.Game.Graphics
local Sets = GameScript.Game.Sets
local Utilities = GameScript.Utilities
local FEAR = GameScript.FEAR
local myObject = Game.GetMyObject()
local kInvalidPlayerIndex = GameScript.PlayerIndex.kMaxGlobalPlayers
local kCleanUpIndestructibilityTime = 5
local kDamageMultiplier = 4
Support.ExportFloatVariable("isInSinBin", 0, "Is this object in the sin bin")
local myObjectPlayerIndex = kInvalidPlayerIndex
local damageModifierActive = false

function CleanUpPlayerIndestructiblity()
  if myObjectPlayerIndex == kInvalidPlayerIndex then
    return
  end
  Player.SetPlayerIndestructible(myObjectPlayerIndex, false)
end

function HandleTextMessage(msg)
  if msg.text == "ObjectEnteringSinBin" then
    Extern.isInSinBin = 1
  elseif msg.text == "ObjectExitingSinBin" then
    Extern.isInSinBin = 0
    local numPlayers = Player.GetNumPlayers() - 1
    for currentPlayer = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
      local avatar = Player.GetPlayerAvatarObjectByIndex(currentPlayer)
      if avatar == myObject then
        myObjectPlayerIndex = currentPlayer
        break
      end
    end
    if myObjectPlayerIndex == kInvalidPlayerIndex then
      return
    end
    Player.SetPlayerIndestructible(myObjectPlayerIndex, true)
    Callbacks.RegisterForTimer("CleanUpPlayerIndestructiblity", kCleanUpIndestructibilityTime, false)
  elseif msg.text == "ObjectGrantedQuadDamage" then
    Game.SetPrimaryWeaponsDamageModifier(myObject, kDamageMultiplier)
    damageModifierActive = true
  end
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, myObject, "HandleTextMessage")
