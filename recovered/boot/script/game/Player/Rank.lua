local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local Game = GameScript.Game
local Energy = GameScript.Game.Energy
local Graphics = GameScript.Game.Graphics
local MP = Game.MP
local Camera = GameScript.Game.Camera
local ObjectTags = Game.ObjectTags
local Player = Game.Player
local Self, Parent, PlayerIndex, m_IsPointMan, m_IsFettel
local m_bSlowMo = Support.ImportBoolVariableWithDefault("Slow-Mo on Rank?", "Force slow motion when he ranks?", true)
local m_bInvulnerable = Support.ImportBoolVariableWithDefault("Invulnerablity on Rank?", "Makes the player temporarily invulnerable when he ranks.", true)
local m_fInvulnerableTime = Support.ImportFloatVariableWithDefault("Invulnerability Time", "If 'Invulnerablity on Rank?' is TRUE, then time the player is invulnerable.", 3)
local m_bResetHealth = Support.ImportBoolVariableWithDefault("Reset Health on Rank?", "Reset the player's health when he ranks.", true)
local m_bResetEnergy = Support.ImportBoolVariableWithDefault("Reset Energy on Rank?", "Reset the player's energy when he ranks.", true)
local m_bReviveSelf = Support.ImportBoolVariableWithDefault("Revive Self on Rank?", "Revives the player if he ranks during last stand.", true)

function OnRank()
  Debug.PrintInfo("OnRank")
  PlayerIndex = Player.GetPlayerIndexByObject(Self)
  if m_bSlowMo then
    Game.SendTextMessage(Self, "SlowItDown")
  end
  if m_bInvulnerable then
    Game.SetHitPointPriorityInvulnerable(Self, 1, true)
    Callbacks.RegisterForTimer("OnTimeDelay", m_fInvulnerableTime, false)
  end
  if m_bResetHealth then
    Game.SetHitPointPercent(Self, 1)
  end
  if m_bResetEnergy then
    if m_IsPointMan then
      GameScript.FEAR.RefillSlowMo(Self)
    elseif m_IsFettel then
      Energy.SetEnergyLevelOnObject(Self, "Ghost Power Meter", 2)
    end
  end
  if m_bReviveSelf and (m_IsPointMan or m_IsFettel) and not MP.IsClient() and Player.IsPlayerControlled(Self) then
    Debug.PrintInfo("Point Man: " .. tostring(m_IsPointMan) .. "; Fettel: " .. tostring(m_IsFettel) .. "; Player Index: " .. tostring(PlayerIndex))
    Player.RevivePlayerInstant(PlayerIndex)
  end
end

function OnTimeDelay()
  Game.SetHitPointPriorityInvulnerable(Self, 1, false)
  Callbacks.UnregisterForTimer("OnTimeDelay")
end

function Initialize(thisObject)
  Self = Game.GetMyObject()
  Parent = Self
  PlayerIndex = Player.GetPlayerIndexByObject(Self)
  m_IsPointMan = ObjectTags.DoesObjectHaveTag(Self, "Point Man")
  m_IsFettel = ObjectTags.DoesObjectHaveTag(Self, "Fettel")
  if Player.GetNumPlayers() == 1 or MP.GetGameMode() == GameScript.MPGameMode.kCoop then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.RankAttainedMessage, Self, "OnRank")
  end
end

Initialize(scriptObject)
