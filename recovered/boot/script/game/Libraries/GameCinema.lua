local mainGlobal = _G
local GS = Despair.GameScript
local Helpers = GS.LuaHelpers
local Debug = GS.Debug
local Game = GS.Game
local Math3d = GS.LuaMath3d
local Callbacks = GS.Callbacks
local Util = GS.Utilities
local Player = GS.Game.Player
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
local next = mainGlobal.next
module(...)
local FromBlack = "HUDFadeFromBlack"
local ToBlack = "HUDFadeToBlack"

local function SendTextMessageToLocalPlayers(textMsg)
  for globalIndex, avatar in Util.AllPlayers(Player.GetPlayerAvatarObjectByIndex, Player.IsLocalPlayer) do
    if avatar ~= nil and Util.IsPointMan(avatar) then
      Game.SendTextMessage(avatar, FromBlack)
    end
  end
end

PlayerTriggerTypes = {
  kNoCheck = 0,
  kOnlyPointMan = 1,
  kOnlyFettel = 2
}
TriggerTypes = {kAnyPlayer = 0, kAllPlayers = 1}
CinemaTypes = {
  kBothPlayers = 0,
  kPointMan = 1,
  kFettel = 2
}

function ShowHUD()
  SendTextMessageToLocalPlayers(FromBlack)
end

function HideHUD()
  SendTextMessageToLocalPlayers(ToBlack)
end

function Over(hidePostCutsceneObjects, unhidePostCutsceneObjects)
  for k, obj in pairs(hidePostCutsceneObjects) do
    if obj ~= nil then
      Game.HideObject(obj, true)
    end
  end
  for k, obj in pairs(unhidePostCutsceneObjects) do
    if obj ~= nil then
      Game.HideObject(obj, false)
    end
  end
end

function Prepare(hidePreCutsceneObjects, unhidePreCutsceneObjects)
  for k, obj in pairs(hidePreCutsceneObjects) do
    if obj ~= nil then
      Game.HideObject(obj, true)
    end
  end
  for k, obj in pairs(unhidePreCutsceneObjects) do
    if obj ~= nil then
      Game.HideObject(obj, false)
    end
  end
end

function ShouldStart(RegionTable, TriggerType, PlayerTriggerType)
  if TriggerType == TriggerTypes.kAllPlayers then
    return Game.Regions.AllPlayersInTableOfRegions(RegionTable)
  elseif TriggerType == TriggerTypes.kAnyPlayer then
    for globalIndex, avatar in Util.AllPlayers(Player.GetPlayerAvatarObjectByIndex) do
      local checkPlayer = true
      if PlayerTriggerType == PlayerTriggerTypes.kOnlyPointMan then
        checkPlayer = Util.IsPointMan(avatar)
      elseif PlayerTriggerType == PlayerTriggerTypes.kOnlyFettel then
        checkPlayer = Util.IsFettel(avatar)
      end
      if checkPlayer then
        Game.Regions.IsPlayerInRegions(globalIndex, RegionTable)
      end
    end
  end
  return false
end

function Start(CinemaObject, CinemaType)
  if Game.IsLoaded(CinemaObject) == false then
    Debug.PrintWarning(Game.GetName(Game.GetMyObject()) .. ": Cinema Object is no longer loaded when attempting to start it.")
    return false
  end
  local pointManIdx, fettelIdx = GetPointManAndFettel()
  local primaryIdx, secondaryIdx = GS.PlayerIndex.kNotAGlobalPlayer
  if CinemaType == CinemaTypes.kBothPlayers then
    return Game.RunCutscene(CinemaObject, pointManIdx, fettelIdx)
  elseif CinemaType == CinemaTypes.kPointMan then
    return Game.RunCutscene(CinemaObject, pointManIdx, GS.PlayerIndex.kNotAGlobalPlayer)
  elseif CinemaType == CinemaTypes.kPointMan then
    return Game.RunCutscene(CinemaObject, fettelIdx, GS.PlayerIndex.kNotAGlobalPlayer)
  end
  Debug.PrintWarning("invalid CinemaType passed to Cinema.Start: CinemaType = " .. CinemaType)
  return false
end

function PlayerEnterRegion(playerInfo)
  if Cinema.ShouldStart(RegionTable, triggerType, playerTrigger) then
    Cinema.Prepare(hidePreCutsceneObjects, unhidePreCutsceneObjects)
    Cinema.Start(CinemaObject, playerTrigger)
    Callbacks.RegisterForMsg(GameScript.MsgCallback.CutsceneEndMessage, CinemaObject, "OnCutsceneEnd")
  end
end

function OnCutsceneEnd()
  Cinema.Over(hidePostCutsceneObjects, unhidePostCutsceneObjects)
  Callbacks.UnregisterForMsg(GameScript.MsgCallback.CutsceneEndMessage, CinemaObject, "OnCutsceneEnd")
end

function Movie_CanStart()
  for globalIndex, avatar in Util.AllPlayers(Player.GetPlayerAvatarObjectByIndex, Player.IsLocalPlayer) do
    if avatar ~= nil then
      return true
    end
  end
  return false
end
