local Game = GameScript.Game
local FEARScore = GameScript.FEARScore
local Player = Game.Player
local MP = Game.MP
local Utilities = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local challenges = GameScript.BoostChallenge

function OnTextMessage(msg)
  if MP.IsClient() then
    return
  end
  local pointManIndex, fettelIndex = Utilities.GetPointManAndFettel()
  if msg.text == "Psychic Link Shared" then
    FEARScore.AwardChallengeRequirement(pointManIndex, challenges.ShareLink, 1)
    FEARScore.AwardChallengeRequirement(fettelIndex, challenges.ShareLink, 1)
    Game.AwardAchievementOccurrence(pointManIndex, GameScript.Achievements.Make_Psychic_Links)
    Game.AwardAchievementOccurrence(fettelIndex, GameScript.Achievements.Make_Psychic_Links)
  elseif msg.text == "Psychic Link Point Man" then
    FEARScore.AwardChallengeRequirement(pointManIndex, challenges.HarvestLink, 1)
    Game.AwardAchievementOccurrence(pointManIndex, GameScript.Achievements.Make_Psychic_Links)
  elseif msg.text == "Psychic Link Fettel" then
    FEARScore.AwardChallengeRequirement(fettelIndex, challenges.HarvestLink, 1)
    Game.AwardAchievementOccurrence(fettelIndex, GameScript.Achievements.Make_Psychic_Links)
  end
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, Game.GetMyObject(), "OnTextMessage")
