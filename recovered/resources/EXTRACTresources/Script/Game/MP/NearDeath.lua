local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Player = GameScript.Game.Player
local Support = GameScript.Support
local scriptObject
local playingCoop = false
local inNearDeath = false
local nearDeathHitPointIndex = Support.ImportFloatVariable("Near Death HP Priority", "Priority level from the HP Controller Component")
local recoveryInvulnerablePeriod = Support.ImportFloatVariable("Recovery Invulnerability Period", "Priority level from the HP Controller Component")
local recoveryHitPointIndex = Support.ImportFloatVariable("Recovery HP Priority", "Priority level from the HP Controller Component")
local nearDeathStateChangeIndex = Support.RegisterComponentHandle("Near Death State Change")
local reviveStateChangeIndex = Support.RegisterComponentHandle("Revive State Change")
local isInvulnerable = false

function Initialize(thisObject)
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerRegistrationMessage, thisObject, "OnPlayerRegistration")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, thisObject, "HandleObjectStateChangeMsg")
  local numPlayers = Player.GetNumPlayers()
  playingCoop = 1 < numPlayers
  HandleCoopStatusChange()
end

function HandleCoopStatusChange()
  Game.EnableHitPointPriority(scriptObject, nearDeathHitPointIndex, playingCoop)
  if nearDeathStateChangeIndex ~= nil and 0 <= nearDeathStateChangeIndex then
    Game.EnableComponent(nearDeathStateChangeIndex, playingCoop)
  end
  if reviveStateChangeIndex ~= nil and 0 <= reviveStateChangeIndex then
    Game.EnableComponent(reviveStateChangeIndex, playingCoop)
  end
end

function InvulnerableTimout()
  isInvulnerable = false
  Game.SetHitPointPriorityInvulnerable(scriptObject, recoveryHitPointIndex, false)
end

function HandleNearDeathStateChange()
  if not inNearDeath then
    Game.SetHitPointPriorityInvulnerable(scriptObject, recoveryHitPointIndex, true)
    isInvulnerable = true
    Callbacks.RegisterForTimer("InvulnerableTimout", recoveryInvulnerablePeriod, false)
  end
end

function HandleObjectStateChangeMsg(msgTable)
  local newInNearDeath = msgTable.newState == GameScript.ObjectState.NearDeath
  if newInNearDeath ~= inNearDeath then
    inNearDeath = newInNearDeath
    HandleNearDeathStateChange()
  end
end

function OnPlayerRegistration(registrationMsg)
  if registrationMsg == nil then
    return
  end
  Callbacks.RegisterForTimer("OnPlayerRegistrationTimer", 0.5, false)
end

function OnPlayerRegistrationTimer()
  local numPlayers = Player.GetNumPlayers()
  local newPlayingCoop = 1 < numPlayers
  if not newPlayingCoop == playingCoop then
    playingCoop = newPlayingCoop
    HandleCoopStatusChange()
  end
end

scriptObject = Game.GetMyObject()
Initialize(scriptObject)
