local Game = GameScript.Game
local AI = GameScript.Game.AI
local Camera = GameScript.Game.Camera
local Physics = GameScript.Game.Physics
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local RegionList = Support.ImportObjectHandleVariable("Region(s)", "A player entering this region(s), will enable/disable the object(s)")
local EnabledObjectList = Support.ImportObjectHandleVariable("Object(s)", "The object(s) that will be Enabled")
local DisabledObjectList = Support.ImportObjectHandleVariable("Disabled Object(s)", "The object(s) that will be Disabled")
local KillAfterUse = Support.ImportBoolVariableWithDefault("Kill After Use?", "Should this object kill itself after use?", true)
local bDisplayText = Support.ImportBoolVariableWithDefault("Display Text?", "Should the script display the 'Waiting For Other Players' text if multiple players are required?", false)
local Require_All_Inside = Support.NumberToBool(Support.ImportFloatVariable("All Players Inside?", "Is it necessary to have all players inside the region(s) before we enable the object(s)? 0 false; 1 true"))
local PlayerIn = {}
local myObject = Game.GetMyObject()
local DisplayTextTable_In = {}
DisplayTextTable_In.textId = 144880
DisplayTextTable_In.textAreaName = "LocationText"
DisplayTextTable_In.displayTime = 0
DisplayTextTable_In.displayPriority = GameScript.TextDisplayPriority.HighPriority
DisplayTextTable_In.clearText = false
local DisplayTextTable_Out = {}
DisplayTextTable_Out.textId = 144881
DisplayTextTable_Out.textAreaName = "LocationText"
DisplayTextTable_Out.displayTime = 0
DisplayTextTable_Out.displayPriority = GameScript.TextDisplayPriority.HighPriority
DisplayTextTable_Out.clearText = false
local numPlayersInside = 0

function MarkPlayerInRegion(index, bInsideRegion)
  if bInsideRegion and PlayerIn[index] == nil then
    PlayerIn[index] = index
    numPlayersInside = numPlayersInside + 1
  elseif not bInsideRegion and PlayerIn[index] ~= nil then
    PlayerIn[index] = nil
    numPlayersInside = numPlayersInside - 1
  end
end

function DoCleanUp()
  local numPlayers = Player.GetNumPlayers() - 1
  for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    if not Player.IsActivePlayer(curPlayerIndex) or not IsPlayerInRegion(curPlayerIndex) then
      MarkPlayerInRegion(curPlayerIndex, false)
    end
  end
end

function DisplayText(playerIndex)
  DisplayTextTable_In.textId = 144880
  DisplayTextTable_In.displayTime = 0
  DisplayTextTable_In.displayPriority = GameScript.TextDisplayPriority.HighPriority
  DisplayTextTable_In.clearText = false
  Game.DisplayText(DisplayTextTable_In, playerIndex, false, Player.GetPlayerAvatarObjectByIndex(playerIndex))
end

function ClearText(playerIndex)
  DisplayTextTable_In.textId = GameScript.TextDisplayDataConstants.kClearTextId
  DisplayTextTable_In.displayTime = 0
  DisplayTextTable_In.displayPriority = GameScript.TextDisplayPriority.HighPriority
  DisplayTextTable_In.clearText = true
  Game.DisplayText(DisplayTextTable_In, playerIndex, false, Player.GetPlayerAvatarObjectByIndex(playerIndex))
end

function ClearTextForLocalPlayer()
  local numPlayers = Player.GetNumPlayers() - 1
  for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(curPlayerIndex) and Player.IsLocalPlayer(curPlayerIndex) then
      ClearText(curPlayerIndex)
    end
  end
end

function EnableObjectsInTable(set, bEnabled)
  if set ~= nil then
    for key, value in pairs(set) do
      if value ~= myObject and Game.IsLoaded(value) then
        Game.EnableAllEnableables(value, bEnabled)
      else
        Debug.PrintWarning(Game.GetName(Game.GetMyObject()) .. ": Your object is no longer loaded!")
      end
    end
  end
end

function HandleDeleteObject()
  if bDisplayText then
    ClearTextForLocalPlayer()
  end
  Support.ExitScript()
end

function KillSelf()
  if bDisplayText then
    ClearTextForLocalPlayer()
  end
  Support.ExitScript()
end

function PlayerEntersRegion(msgTable)
  local playerIndex = Player.GetPlayerIndexByObject(msgTable.object)
  MarkPlayerInRegion(playerIndex, true)
  if MP.GetNumberOfActivePlayers() > 1 and Require_All_Inside and not AreAllPlayersInside() and bDisplayText and Player.IsActivePlayer(playerIndex) and Player.IsLocalPlayer(playerIndex) then
    DisplayText(playerIndex)
  end
  if Require_All_Inside and AreAllPlayersInside() or not Require_All_Inside then
    if EnabledObjectList ~= nil then
      EnableObjectsInTable(EnabledObjectList, true)
    end
    if DisabledObjectList ~= nil then
      EnableObjectsInTable(DisabledObjectList, false)
    end
    if bDisplayText then
      ClearTextForLocalPlayer()
    end
    Support.ExitScript()
  end
end

function PlayerLeavesRegion(msgTable)
  if msgTable.object ~= nil then
    local playerIndex = Player.GetPlayerIndexByObject(msgTable.object)
    MarkPlayerInRegion(Player.GetPlayerIndexByObject(msgTable.object), false)
    if MP.GetNumberOfActivePlayers() > 1 and bDisplayText and Player.IsActivePlayer(playerIndex) and Player.IsLocalPlayer(playerIndex) then
      ClearText(playerIndex)
    end
  else
    DoCleanUp()
  end
end

function CheckInsideRegion()
  local numPlayers = Player.GetNumPlayers() - 1
  numPlayersInside = 0
  local playersIn = 0
  for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(curPlayerIndex) then
      for key, value in pairs(RegionList) do
        if Game.Regions.IsInRegion(value, Player.GetPlayerObjectByIndex(curPlayerIndex)) then
          MarkPlayerInRegion(curPlayerIndex, true)
          break
        end
      end
    end
  end
end

function NumberOfPlayersInRegion()
  return numPlayersInside
end

function IsPlayerInRegion(index)
  if PlayerIn[index] ~= nil then
    return true
  else
    return false
  end
end

function AreAllPlayersInside()
  local nNumActivePlayers = MP.GetNumberOfActivePlayers()
  if numPlayersInside == nNumActivePlayers then
    return true
  else
    return false
  end
end

if RegionList then
  for key, value in pairs(RegionList) do
    Callbacks.RegisterPlayerEnterExitRegion(value, "PlayerEntersRegion", "PlayerLeavesRegion")
  end
  CheckInsideRegion()
  if Require_All_Inside and AreAllPlayersInside() or not Require_All_Inside and 0 < NumberOfPlayersInRegion() then
    if EnabledObjectList ~= nil then
      EnableObjectsInTable(EnabledObjectList, true)
    end
    if DisabledObjectList ~= nil then
      EnableObjectsInTable(DisabledObjectList, false)
    end
    ClearTextForLocalPlayer()
    Support.ExitScript()
  end
  if myObject ~= nil then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.DeleteObjectMessage, myObject, "HandleDeleteObject")
  end
else
  Debug.PrintError(Game.GetName(Game.GetMyObject()) .. ": One of the required fields contained no data")
end
