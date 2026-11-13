local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local Regions = Game.Regions
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local RegionTable = Support.ImportObjectHandleVariable("Region(s)", "The region(s) we'll be testing against.")
local AutoKill = Support.ImportBoolVariableWithDefault("Automatically Kill Self?", "Should the script automatically kill itself when both players enter region?", false)
local OwnDesired = Support.ImportBoolVariableWithDefault("Desired Worlds Loaded?", "Do all desired worlds need to be loaded before enabling/disabling the objects? If there are any desired worlds loading, then 'Object(s) to Enable' and 'Object(s) to Disable' will wait until they are loaded.", false)
Support.ImportObjectHandleVariable("Object(s) to Enable", "The object(s) to enable when the region is stopped/killed.")
Support.ImportObjectHandleVariable("Object(s) to Disable", "The object(s) to disable when the region is stopped/killed.")
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
local ShouldDisplay = false
local IsLastStand = false
local LocalPlayer
local BothPlayersLocal = false
local NotAPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
local Player1Index = GameScript.PlayerIndex.kGlobalPlayer1
local Player2Index = GameScript.PlayerIndex.kGlobalPlayer2
local LocalPlayerIndex = NotAPlayer
local LocalPlayerInRegion = false
local AllPlayersInRegion = false
local IsFettel_Player1 = false
local IsFettel_Local = false
local IsInMessageDisplayed = false
local IsOutMessageDisplayed = false
local CurrentlyHandleReload = false
local PlayerObject1, PlayerObject2
local Player1InRegion = false
local Player2InRegion = false
Extern.ScriptClearedFinalTime = false
Extern.RegisteredPlayer1ObjectState = false
Extern.RegisteredPlayer2ObjectState = false
Extern.RegisteredPlayer1Possess = false
Extern.RegisteredPlayer2Possess = false

function DisplayText()
  if Extern.ScriptClearedFinalTime then
    return
  end
  if LocalPlayer == nil or LocalPlayerIndex == NotAPlayer or not Game.IsLoaded(LocalPlayer) then
    return
  end
  local messageShouldBeOnScreen = ShouldDisplay and not IsLastStand
  local shouldDisplayInMessage = messageShouldBeOnScreen and LocalPlayerInRegion
  local shouldDisplayOutMessage = messageShouldBeOnScreen and not LocalPlayerInRegion
  if shouldDisplayInMessage == IsInMessageDisplayed and shouldDisplayOutMessage == IsOutMessageDisplayed then
    if messageShouldBeOnScreen then
    else
    end
    return
  end
  IsOutMessageDisplayed = shouldDisplayOutMessage
  IsInMessageDisplayed = shouldDisplayInMessage
  if messageShouldBeOnScreen then
    DisplayTextTable_In.textId = 144880
    DisplayTextTable_In.displayTime = 0
    DisplayTextTable_In.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable_In.clearText = false
    DisplayTextTable_Out.textId = 144881
    DisplayTextTable_Out.displayTime = 0
    DisplayTextTable_Out.displayPriority = GameScript.TextDisplayPriority.HighPriority
    DisplayTextTable_Out.clearText = false
  else
    DisplayTextTable_In.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable_In.displayTime = 0
    DisplayTextTable_In.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable_In.clearText = true
    DisplayTextTable_Out.textId = GameScript.TextDisplayDataConstants.kClearTextId
    DisplayTextTable_Out.displayTime = 0
    DisplayTextTable_Out.displayPriority = GameScript.TextDisplayPriority.kLowestNeverQueue
    DisplayTextTable_Out.clearText = true
  end
  if BothPlayersLocal then
    if Player1InRegion then
      Debug.PrintInfoIf(0 < g_debugMode, "FirstLocalPlayer In Region:" .. Player1Index)
      Game.DisplayText(DisplayTextTable_In, Player1Index, false, PlayerObject1)
    else
      Debug.PrintInfoIf(0 < g_debugMode, "FirstLocalPlayer Out of Region:" .. Player1Index)
      Game.DisplayText(DisplayTextTable_Out, Player1Index, false, PlayerObject1)
    end
    if Player2InRegion then
      Debug.PrintInfoIf(0 < g_debugMode, "SecondLocalPlayer In Region:" .. Player2Index)
      Game.DisplayText(DisplayTextTable_In, Player2Index, false, PlayerObject2)
    else
      Debug.PrintInfoIf(0 < g_debugMode, "SecondLocalPlayer Out of Region:" .. Player2Index)
      Game.DisplayText(DisplayTextTable_Out, Player2Index, false, PlayerObject2)
    end
  elseif LocalPlayerInRegion then
    Debug.PrintInfoIf(0 < g_debugMode, "LocalPlayer:" .. LocalPlayerIndex .. " In Region")
    Game.DisplayText(DisplayTextTable_In, LocalPlayerIndex, false, LocalPlayer)
  else
    Debug.PrintInfoIf(0 < g_debugMode, "LocalPlayer:" .. LocalPlayerIndex .. " Not In Region")
    Game.DisplayText(DisplayTextTable_Out, LocalPlayerIndex, false, LocalPlayer)
  end
end

function ClearText()
  UpdatePlayerDisplayVariables()
  ShouldDisplay = false
  DisplayText()
end

function LastStandChanged()
  IsLastStand = Player.IsPlayerInState(Player1Index, GameScript.ObjectState.NearDeath) or Player.IsPlayerInState(Player2Index, GameScript.ObjectState.NearDeath)
  UpdatePlayerDisplayVariables()
  DisplayText()
end

function UpdatePlayerDisplayVariables()
  PlayerObject1 = Player.GetPlayerControlledObjectByIndex(Player1Index)
  PlayerObject2 = Player.GetPlayerControlledObjectByIndex(Player2Index)
  Player1InRegion = false
  Player2InRegion = false
  if PlayerObject1 ~= nil and PlayerObject2 ~= nil then
    Player1InRegion = Regions.IsPlayerObjectInRegions(PlayerObject1, RegionTable)
    Player2InRegion = Regions.IsPlayerObjectInRegions(PlayerObject2, RegionTable)
    if Player1InRegion and Player2InRegion then
      ShouldDisplay = false
      AllPlayersInRegion = true
    else
      AllPlayersInRegion = false
      if not Player1InRegion and not Player2InRegion then
        ShouldDisplay = false
      else
        ShouldDisplay = true
      end
    end
  else
    AllPlayersInRegion = true
    ShouldDisplay = false
  end
  if LocalPlayerIndex == Player1Index then
    LocalPlayer = PlayerObject1
    LocalPlayerInRegion = Player1InRegion
    Debug.PrintInfoIf(g_debugMode > 0, "LocalPlayerIndex:Player1Index(" .. Player1Index .. ")")
  elseif LocalPlayerIndex == Player2Index then
    LocalPlayer = PlayerObject2
    LocalPlayerInRegion = Player2InRegion
    Debug.PrintInfoIf(g_debugMode > 0, "LocalPlayerIndex:Player2Index(" .. Player2Index .. ")")
  end
end

function EnterRegion()
  if Player.GetNumPlayers() == 2 then
    UpdatePlayerDisplayVariables()
    if AllPlayersInRegion and AutoKill then
      if RegionTable ~= nil then
        for k, region in pairs(RegionTable) do
          Callbacks.UnregisterPlayerEnterExitRegion(region, "EnterRegion", "ExitRegion")
        end
      end
      OnStop()
    end
    DisplayText()
  elseif AutoKill then
    OnStop()
  end
end

function ExitRegion()
  if Player.GetNumPlayers() == 2 then
    UpdatePlayerDisplayVariables()
    DisplayText()
  end
end

local firstOnTimerCallback = true

function OnTimer()
  if OwnDesired then
    if Game.GetNumDesiredWorldsPending() == 0 then
      Callbacks.UnregisterForTimer("OnTimer")
      Kill()
    elseif firstOnTimerCallback then
      Callbacks.RegisterForTimer("OnTimer", 0.2, true)
      firstOnTimerCallback = false
    end
  else
    Kill()
  end
end

function OnStop()
  Callbacks.RegisterForTimer("OnTimer", 0.8, false)
  ClearText()
  Extern.ScriptClearedFinalTime = true
end

function Kill()
  ClearText()
  Extern.ScriptClearedFinalTime = true
  local Self = Game.GetMyObject()
  local set = Support.GetImportObjectTable("Object(s) to Enable")
  for name, object in pairs(set) do
    if object ~= Self then
      Game.EnableAllEnableables(object, true)
    end
  end
  set = Support.GetImportObjectTable("Object(s) to Disable")
  for name, object in pairs(set) do
    if object ~= Self then
      Game.EnableAllEnableables(object, false)
    end
  end
  Game.Kill(Self, 0)
end

function WaitForPlayers()
  local Player1 = Player.GetPlayerAvatarObjectByIndex(Player1Index)
  local Player2 = Player.GetPlayerAvatarObjectByIndex(Player2Index)
  BothPlayersLocal = false
  if Player.IsLocalPlayer(Player1Index) then
    Debug.PrintInfoIf(g_debugMode > 0, "Player1Index:" .. Player1Index .. " is local")
    LocalPlayerIndex = Player1Index
    if Player.IsLocalPlayer(Player2Index) then
      BothPlayersLocal = true
    end
  elseif Player.IsLocalPlayer(Player2Index) then
    Debug.PrintInfoIf(g_debugMode > 0, "Player2Index:" .. Player2Index .. " is local")
    LocalPlayerIndex = Player2Index
  else
    Debug.PrintInfo("In WaitForPlayers neither player appeared to be local")
  end
  if Player1 ~= nil and Player2 ~= nil then
    Callbacks.UnregisterForTimer("WaitForPlayers")
    IsLastStand = IsLastStand or Player.IsPlayerInState(Player1Index, GameScript.ObjectState.NearDeath)
    IsLastStand = IsLastStand or Player.IsPlayerInState(Player2Index, GameScript.ObjectState.NearDeath)
    if not Extern.RegisteredPlayer1ObjectState then
      Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, Player1, "LastStandChanged")
      Extern.RegisteredPlayer1ObjectState = true
    end
    if not Extern.RegisteredPlayer2ObjectState then
      Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, Player2, "LastStandChanged")
      Extern.RegisteredPlayer2ObjectState = true
    end
    IsFettel_Player1 = Game.ObjectTags.DoesObjectHaveTag(Player1, "Fettel")
    if IsFettel_Player1 then
      if not Extern.RegisteredPlayer1Possess then
        Callbacks.RegisterForMsg(GameScript.MsgCallback.PossessionEndedMessage, Player1, "RegisterWaitForEndPossession")
        Extern.RegisteredPlayer1Possess = true
      end
      if LocalPlayerIndex == Player1Index then
        IsFettel_Local = true
      end
    else
      if not Extern.RegisteredPlayer2Possess then
        Callbacks.RegisterForMsg(GameScript.MsgCallback.PossessionEndedMessage, Player2, "RegisterWaitForEndPossession")
        Extern.RegisteredPlayer2Possess = true
      end
      if LocalPlayerIndex == Player2Index then
        IsFettel_Local = true
      end
    end
  end
  RegisterForRegions()
  if CurrentlyHandleReload then
    CurrentlyHandleReload = false
    UpdatePlayerDisplayVariables()
    DisplayText()
  end
end

function RegisterWaitForEndPossession()
  Callbacks.RegisterForTimer("WaitForEndPossession", 0.2, true)
end

function WaitForEndPossession()
  local avatar, controlled
  if IsFettel_Player1 then
    avatar = Player.GetPlayerAvatarObjectByIndex(Player1Index)
    controlled = Player.GetPlayerControlledObjectByIndex(Player1Index)
  else
    avatar = Player.GetPlayerAvatarObjectByIndex(Player2Index)
    controlled = Player.GetPlayerControlledObjectByIndex(Player2Index)
  end
  if avatar == controlled then
    Callbacks.UnregisterForTimer("WaitForEndPossession")
    if IsFettel_Local then
      IsInMessageDisplayed = false
      IsOutMessageDisplayed = false
    end
    UpdatePlayerDisplayVariables()
    DisplayText()
  end
end

function HandleReload()
  CurrentlyHandleReload = true
  BothPlayersLocal = false
  if Player.GetNumPlayers() == 2 then
    Callbacks.RegisterForTimer("WaitForPlayers", 0.5, true)
  else
    Debug.PrintInfoIf(g_debugMode > 0, "Single player - LocalPlayerIndex:Player1Index(" .. Player1Index .. ")")
    LocalPlayerIndex = Player1Index
  end
end

function OnReload()
  Callbacks.RegisterForTimer("HandleReload", 0.01, false)
end

function RegisterForRegions()
  if RegionTable ~= nil then
    for k, region in pairs(RegionTable) do
      Callbacks.RegisterPlayerEnterExitRegion(region, "EnterRegion", "ExitRegion")
    end
  end
end

function Initialize()
  Callbacks.RegisterForStopCondition("OnStop")
  Callbacks.RegisterForDisable("OnStop")
  BothPlayersLocal = false
  if Player.GetNumPlayers() == 2 then
    Callbacks.RegisterForTimer("WaitForPlayers", 0.5, true)
  else
    LocalPlayerIndex = Player1Index
    RegisterForRegions()
  end
end

Initialize()
Callbacks.RegisterForPostCheckpointActivation("OnReload")
