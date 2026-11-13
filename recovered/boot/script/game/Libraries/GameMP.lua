local mainGlobal = _G
local GS = Despair.GameScript
local Game = GS.Game
local Helpers = GS.LuaHelpers
local PlayerIndex = GS.PlayerIndex
local ObjectState = GS.ObjectState
local Player = Game.Player
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
local next = mainGlobal.next
module(...)
local Sets = GS.Game.MP

function AwardNationPoints(playerIndex, awardType, category)
  local teamIndex = GetTeamForPlayer(playerIndex)
  AwardTeamPoints(teamIndex, awardType, category)
end

function AreAllPlayersDown()
  local foundAnActivePlayer = false
  local numPlayers = Player.GetNumPlayers()
  for index = PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) then
      foundAnActivePlayer = true
      local playerObj = Player.GetPlayerAvatarObjectByIndex(index)
      local isDead = playerObj ~= nil and Game.HasHitPoints(playerObj) and Game.GetHitPointPercent(playerObj) <= 0
      if not isDead and not Player.IsPlayerInState(index, ObjectState.NearDeath) then
        return false
      end
    end
  end
  if not foundAnActivePlayer then
    return false
  end
  return true
end

function NumPlayersNotDown()
  local numPlayerNotDown = 0
  local numPlayers = Player.GetNumPlayers()
  for index = PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) then
      local playerObj = Player.GetPlayerAvatarObjectByIndex(index)
      local isDead = playerObj ~= nil and Game.HasHitPoints(playerObj) and 0 >= Game.GetHitPointPercent(playerObj)
      if not isDead and not Player.IsPlayerInState(index, ObjectState.NearDeath) then
        numPlayerNotDown = numPlayerNotDown + 1
      end
    end
  end
  return numPlayerNotDown
end
