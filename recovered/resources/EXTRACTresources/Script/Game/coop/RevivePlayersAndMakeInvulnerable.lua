local Game = GameScript.Game
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Utilities = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local LuaHelpers = GameScript.LuaHelpers
local MP = Game.MP
local ObjectTags = Game.ObjectTags
local makeInvulnerable = Support.ImportBoolVariableWithDefault("Make Players Invulnerable?", "TRUE makes the players invulnerable when in region. FALSE makes the players vulnerable", true)
local revivePlayers = Support.ImportBoolVariableWithDefault("Revive Players?", "Should we revive players in last stand", true)

function ReviveAndMakePlayersInvulnerable(avatarObject)
  if avatarObject then
    local PlayerIndex = Player.GetPlayerIndexByObject(avatarObject)
    if revivePlayers then
      Player.RevivePlayerInstant(PlayerIndex)
    end
    local playerControlledObject = Player.GetPlayerControlledObjectByIndex(PlayerIndex)
    if playerControlledObject ~= nil and not ObjectTags.DoesObjectHaveTag(playerControlledObject, "Power Armor") then
      Player.SetPlayerIndestructible(PlayerIndex, makeInvulnerable)
    else
    end
  end
end

if not MP.IsClient() then
  local avatar1, avatar2 = Utilities.GetPointManFettelAvatarObjects()
  if avatar1 and Game.IsLoaded(avatar1) then
    ReviveAndMakePlayersInvulnerable(avatar1)
  end
  if avatar2 and Game.IsLoaded(avatar2) then
    ReviveAndMakePlayersInvulnerable(avatar2)
  end
end
