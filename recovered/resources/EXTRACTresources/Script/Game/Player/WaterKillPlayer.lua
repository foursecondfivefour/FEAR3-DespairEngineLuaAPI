local GS = GameScript
local Game = GS.Game
local Support = GS.Support
local Debug = GS.Debug
local Callbacks = GS.Callbacks
local ObjectTags = Game.ObjectTags
local Player = Game.Player
local Camera = Game.Camera
local testObj = Support.ImportFirstObject("testRegion", "Regions we check for the player to enter/exit")
local playerIndex
local RagdollDelay = Support.ImportFloatVariableWithDefault("Ragdoll Delay", "", 1)

function KillPlayer(playerHandle)
  playerIndex = Player.GetPlayerIndexByObject(playerHandle.object)
  local firstAvatar = Player.GetPlayerAvatarObjectByIndex(playerIndex)
  Game.SendTextMessage(firstAvatar, "Drowned")
  Game.Kill(firstAvatar, GameScript.KillObjectMessageType.DoDying)
  Callbacks.RegisterForTimer("StopRagdoll", RagdollDelay, false)
end

function KillEPA(epa)
  GameScript.Game.Kill(epa.object, 0)
end

function StopRagdoll()
  local currentAvatar = Player.GetPlayerAvatarObjectByIndex(playerIndex)
  if currentAvatar ~= nil and ObjectTags.DoesObjectHaveTag(currentAvatar, "Ragdoll") then
    GameScript.Game.Physics.SetToStatic(currentAvatar)
    return
  end
end

Callbacks.RegisterPlayerEnterExitRegion(testObj, "KillPlayer", "")
Callbacks.RegisterObjectTagEnterExitRegion(testObj, 3, "KillEPA", "")
