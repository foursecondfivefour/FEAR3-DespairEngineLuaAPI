local Game = GameScript.Game
local Death = Game.Death
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Sets = Game.Sets
local PokerAISet = Support.ImportSetObject("Poker AI Set", "The set containing poker AIs to be killed")
local notAPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
local numRemainingAIs = 3
local killingPlayer = notAPlayer
local bSuccess = true

function OnAIKilled(info)
  local killedObject = info.killedObject
  if killedObject == nil then
    return
  end
  local killerIndex = Death.GetLastDamagePlayerIndexFromObject(killedObject)
  if killerIndex == notAPlayer then
    Debug.PrintWarning("Achievement failed: AI killed by non-player")
    bSuccess = false
    Support.ExitScript()
  end
  if killingPlayer == notAPlayer then
    killingPlayer = killerIndex
  elseif killerIndex ~= killingPlayer then
    Debug.PrintWarning("Achievement failed: AI killed by different player")
    bSuccess = false
    Support.ExitScript()
  end
  local lastDamageInfo = Death.GetLastDamageInfoFromObject(killedObject)
  if lastDamageInfo == nil or not lastDamageInfo.headshot then
    Debug.PrintWarning("Achievement failed: AI not killed by headshot")
    bSuccess = false
    Support.ExitScript()
  end
  numRemainingAIs = numRemainingAIs - 1
  if numRemainingAIs == 0 and bSuccess then
    Game.AwardAchievementOccurrence(killingPlayer, GameScript.Achievements.Poker_Room_Headshots)
    Debug.PrintWarning("Good shootin', Tex. Tex = " .. killingPlayer)
    Support.ExitScript()
  end
end

function OnSlowMoDeactivated()
  Debug.PrintWarning("Achievement failed: Slow-mo ended")
  bSuccess = false
  Support.ExitScript()
end

function OnAIEnterSet(AI)
  if AI ~= nil then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.KillObjectMessage, AI, "OnAIKilled")
  end
end

if PokerAISet == nil then
  GameScript.Debug.PrintError("\"Poker AI Set\" was not defined")
else
  local PokerAIs = Sets.GetObjectsInSet(PokerAISet)
  for key, AI in pairs(PokerAIs) do
    if AI ~= nil then
      Callbacks.RegisterForMsg(GameScript.MsgCallback.KillObjectMessage, AI, "OnAIKilled")
    end
  end
  Callbacks.RegisterSetTracker(PokerAISet, "OnAIEnterSet", "")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.SlowMoDeactivatedMessage, Game.GetMyObject(), "OnSlowMoDeactivated")
end
