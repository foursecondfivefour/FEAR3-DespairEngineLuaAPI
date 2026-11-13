local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Score = GameScript.FEARScore
local Debug = GameScript.Debug
local MP = Game.MP
local Player = Game.Player
local ObjectTags = Game.ObjectTags
local challenges = GameScript.BoostChallenge
local kNotAPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
local myObject = Game.GetMyObject()

function AwardAssists(killedObject, killerIndex)
  local damageHistory = Game.GetDamageHistory(killedObject)
  for key, dmgEntry in pairs(damageHistory) do
    local assistIndex = dmgEntry.playerIndex
    if assistIndex ~= killerIndex and assistIndex ~= kNotAPlayer then
      Score.AwardBoostRequirement(assistIndex, challenges.Assists, 1)
      Score.AwardBoostRequirement(assistIndex, challenges.MegaAssists, 1)
    end
  end
end

function OnDeath(deathArg)
  if MP.IsClient() then
    return
  end
  local killerIndex = deathArg.killerPlayerIndex
  local victimIndex = Player.GetPlayerIndexByObject(deathArg.killedObject)
  if killerIndex == kNotAPlayer and victimIndex == kNotAPlayer then
    return
  end
  if ObjectTags.DoesObjectHaveTag(deathArg.killedObject, "Creep") then
    return
  end
  local awardPoints = killerIndex ~= kNotAPlayer and killerIndex ~= victimIndex
  AwardAssists(deathArg.killedObject, killerIndex)
  if awardPoints then
    Score.AwardMissionPointOccurences(killerIndex, GameScript.MissionScoreCategory.Kills, 1)
  end
end

Score.RegisterForDeath("OnDeath")
