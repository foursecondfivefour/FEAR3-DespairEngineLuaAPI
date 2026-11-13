local Support = GameScript.Support
local Game = GameScript.Game
local AI = Game.AI
local Camera = Game.Camera
local Physics = Game.Physics
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local Regions = Game.Regions
Support.ImportWatchVariable("Mech Health", "This needs to be the ABSOLUTE health")
Support.ImportWatchVariable("Mech Health Percentage", "This needs to be the health PERCENTAGE")
Support.ImportWatchVariable("Shield Charge", "This is how much of the shield is charged up")
Support.ImportWatchVariable("Is Controlled?", "Is there a EPA driver?")
Support.ImportWatchVariable("Lock Percentage", "The Missiles Lock Percentage")
local Time = Support.ImportFloatVariableWithDefault("Wait Time", "Once the health hits zero, how long before the player is kicked out", 10)
local ShieldPrompt = Support.ImportStaticTextVariable("Use Shield Prompt", "The prompt that should appear when explaining how to enable the shield")
local StompPrompt = Support.ImportStaticTextVariable("Use Stomp Prompt", "The prompt that should appear when explaining how to Stomp")
local TargetLockPrompt = Support.ImportStaticTextVariable("Target Lock Prompt", "The prompt that should appear when explaining what Target Lock does")
local MeleePrompt = Support.ImportStaticTextVariable("Melee Prompt", "The prompt that should appear when we would like them to melee")
local MeleeWallPrompt = Support.ImportStaticTextVariable("Melee Wall Prompt", "The prompt that will show up when we expect the player to Kool-Aid man the wall")
local hpHandle = Support.RegisterComponentHandle("HP - Health - Bucketed HP")
Support.ExportFloatVariable("PlayerEntranceAllowed", 1, "This watch variable tells the doors when they should be open")
Support.ExportFloatVariable("DisableHealthRecharge", 0, "This watch variable tells the health component when it should be allowed to recharge")
Support.ExportFloatVariable("CollisionRequired", 0, "This watch variable specifies situations where collision is required.")
Support.ExportFloatVariable("PlayEPAIntroduction", 0, "This says when we should play the EPA introduction")
local MechHealth_WatchValue, MechHealthPercentage_WatchValue, MechShiedlPercentage_WatchValue, IsControlled_WatchValue, LockPercentage_WathcValue
local Self = Game.GetMyObject()
local CountingDownToDumpOut = false
local PointManDoneIntro, FettelDoneIntro = false, false
local OverAllTimeBetweenSuggestions = 5
local OverAllSuggestionTimerFinished = true
local SheildTimerFinished = true
local StompTimerFinished = true
local MeleeTimerFinished = true
local TrackingTimerFinished = true
local MeleeWallTimerFinished = true
local StompSuggested = false
local TrackingSuggested = false
local MeleeSuggested = false
local MeleeWallSuggested = false
local DisplayTextTable = {}
DisplayTextTable.textId = 0
DisplayTextTable.textAreaName = "kTutorialTitleText"
DisplayTextTable.displayTime = 5
local EPAStompID = Game.ObjectTags.GetObjectTagUID("EPA Stomp")
local EPAMeleeID = Game.ObjectTags.GetObjectTagUID("EPA Melee")
local TrackMeleeRunning = false

function TakenDamage()
  MechHealth_WatchValue = Support.GetImportWatchVariableValue("Mech Health")
  if MechHealth_WatchValue <= 1 and not CountingDownToDumpOut then
    Extern.DisableHealthRecharge = 1
    Callbacks.RegisterForTimer("DumpOutOfMech", Time, false)
    CountingDownToDumpOut = true
  end
end

function DumpOutOfMech()
  local InventoryTable = Game.GetInventoryItems(Self, 4)
  if InventoryTable[1] then
    Game.ForceRiderOutOfVehicle(InventoryTable[1], Self, false)
  end
  CountingDownToDumpOut = false
end

function TrackPlayerGettingOut()
  Extern.PlayEPAIntroduction = 0
  Extern.DisableHealthRecharge = 0
  MechHealth_WatchValue = Support.GetImportWatchVariableValue("Mech Health")
  if MechHealth_WatchValue <= 1 then
    Game.SetRegeneratingHPDelay(hpHandle, 0)
    Extern.PlayerEntranceAllowed = 0
    Extern.CollisionRequired = 1
    Callbacks.RegisterForTimer("TrackPlayerAllowedIn", 0.12, true)
  end
end

function TrackPlayerAllowedIn()
  MechHealthPercentage_WatchValue = Support.GetImportWatchVariableValue("Mech Health Percentage")
  if 0.99 <= MechHealthPercentage_WatchValue then
    Extern.PlayerEntranceAllowed = 1
    Extern.CollisionRequired = 0
    Callbacks.UnregisterForTimer("TrackPlayerAllowedIn")
  end
end

function WaitForText(MSG)
  if MSG.text == "Close" then
    Extern.PlayerEntranceAllowed = 0
  elseif MSG.text == "Open" then
    Extern.PlayerEntranceAllowed = 1
  elseif MSG.text == "MeleeWall_Enter" then
    MeleeWallSuggested = true
  elseif MSG.text == "MeleeWall_Exit" then
    MeleeWallSuggested = false
  elseif MSG.text == "TrackingRegion_Enter" then
    TrackingSuggested = true
  end
end

function PlayerGetsInEPA()
  Debug.PrintInfoIf(g_debugMode > 0, "PlayerGetsInEPA")
  local PointManInd, FettelInd = Util.GetPointManFettelIndecies()
  local InventoryTable = Game.GetInventoryItems(Self, 4)
  if InventoryTable[1] and Game.IsLoaded(InventoryTable[1]) then
    local PlayerInd = Player.GetPlayerIndexByObject(InventoryTable[1])
    if PlayerInd == PointManInd and not PointManDoneIntro then
      PointManDoneIntro = true
      DisplayTextTable.textId = ShieldPrompt
      local InventoryTable = Game.GetInventoryItems(Self, 4)
      local PlayerIndex = Player.GetPlayerIndexByObject(InventoryTable[1])
      if PlayerIndex and Player.IsLocalPlayer(PlayerIndex) then
        Game.DisplayText(DisplayTextTable, PlayerIndex, true, Self)
      end
      Extern.PlayEPAIntroduction = 1
    elseif PlayerInd == FettelInd and not FettelDoneIntro then
      FettelDoneIntro = true
      Extern.PlayEPAIntroduction = 1
    end
  end
end

function Suggestion()
  IsControlled_WatchValue = Support.GetImportWatchVariableValue("Is Controlled?")
  if OverAllSuggestionTimerFinished and IsControlled_WatchValue == 1 then
    if MeleeWallSuggested and MeleeWallTimerFinished then
      MeleeWallTimerFinished = false
      OverAllSuggestionTimerFinished = false
      DisplayTextTable.textId = MeleeWallPrompt
      local InventoryTable = Game.GetInventoryItems(Self, 4)
      local PlayerIndex
      if InventoryTable[1] then
        PlayerIndex = Player.GetPlayerIndexByObject(InventoryTable[1])
        if PlayerIndex and Player.IsLocalPlayer(PlayerIndex) then
          Game.DisplayText(DisplayTextTable, PlayerIndex, true, Self)
        end
      end
      Callbacks.RegisterForTimer("MeleeWallTimer", 10, false)
      Callbacks.RegisterForTimer("OverAllSuggestionTimer", OverAllTimeBetweenSuggestions, false)
    end
    if SheildTimerFinished then
      MechHealthPercentage_WatchValue = Support.GetImportWatchVariableValue("Mech Health Percentage")
      MechShiedlPercentage_WatchValue = Support.GetImportWatchVariableValue("Shield Charge")
      IsControlled_WatchValue = Support.GetImportWatchVariableValue("Is Controlled?")
      if MechHealthPercentage_WatchValue < 0.3 and MechShiedlPercentage_WatchValue == 1 then
        DisplayTextTable.textId = ShieldPrompt
        local InventoryTable = Game.GetInventoryItems(Self, 4)
        if InventoryTable[1] then
          local PlayerIndex = Player.GetPlayerIndexByObject(InventoryTable[1])
          if PlayerIndex and Player.IsLocalPlayer(PlayerIndex) then
            Game.DisplayText(DisplayTextTable, PlayerIndex, true, Self)
          end
        end
        SheildTimerFinished = false
        OverAllSuggestionTimerFinished = false
        Callbacks.RegisterForTimer("SheildTimer", 20, false)
        Callbacks.RegisterForTimer("OverAllSuggestionTimer", OverAllTimeBetweenSuggestions, false)
      end
    end
    if StompSuggested and StompTimerFinished then
      StompTimerFinished = false
      OverAllSuggestionTimerFinished = false
      DisplayTextTable.textId = StompPrompt
      local InventoryTable = Game.GetInventoryItems(Self, 4)
      if InventoryTable[1] then
        local PlayerIndex = Player.GetPlayerIndexByObject(InventoryTable[1])
        if PlayerIndex and Player.IsLocalPlayer(PlayerIndex) then
          Game.DisplayText(DisplayTextTable, PlayerIndex, true, Self)
        end
      end
      Callbacks.RegisterForTimer("StompTimer", 15, false)
      Callbacks.RegisterForTimer("OverAllSuggestionTimer", OverAllTimeBetweenSuggestions, false)
    end
    if MeleeSuggested and MeleeTimerFinished then
      MeleeTimerFinished = false
      OverAllSuggestionTimerFinished = false
      DisplayTextTable.textId = MeleePrompt
      local InventoryTable = Game.GetInventoryItems(Self, 4)
      if InventoryTable[1] then
        local PlayerIndex = Player.GetPlayerIndexByObject(InventoryTable[1])
        if PlayerIndex and Player.IsLocalPlayer(PlayerIndex) then
          Game.DisplayText(DisplayTextTable, PlayerIndex, true, Self)
        end
      end
      Callbacks.RegisterForTimer("MeleeTimer", 10, false)
      Callbacks.RegisterForTimer("OverAllSuggestionTimer", OverAllTimeBetweenSuggestions, false)
    end
    if TrackingSuggested and TrackingTimerFinished then
      LockPercentage_WathcValue = Support.GetImportWatchVariableValue("Lock Percentage")
      if 0.5 <= LockPercentage_WathcValue then
        TrackingTimerFinished = false
        OverAllSuggestionTimerFinished = false
        DisplayTextTable.textId = TargetLockPrompt
        local InventoryTable = Game.GetInventoryItems(Self, 4)
        if InventoryTable[1] then
          local PlayerIndex = Player.GetPlayerIndexByObject(InventoryTable[1])
          if PlayerIndex and Player.IsLocalPlayer(PlayerIndex) then
            Game.DisplayText(DisplayTextTable, PlayerIndex, true, Self)
            TrackingSuggested = false
          end
        end
        Callbacks.RegisterForTimer("TrackingTimer", 15, false)
        Callbacks.RegisterForTimer("OverAllSuggestionTimer", OverAllTimeBetweenSuggestions, false)
      end
    end
  end
end

function SheildTimer()
  SheildTimerFinished = true
end

function StompTimer()
  StompTimerFinished = true
end

function MeleeTimer()
  MeleeTimerFinished = true
end

function TrackingTimer()
  TrackingTimerFinished = true
end

function MeleeWallTimer()
  MeleeWallTimerFinished = true
end

function OverAllSuggestionTimer()
  OverAllSuggestionTimerFinished = true
end

function Track_EPA_STOMP_Enter()
  StompSuggested = true
end

function Track_EPA_STOMP_Exit()
  StompSuggested = false
end

function Track_EPA_MELEE_Enter()
  MeleeSuggested = true
end

function Track_EPA_MELEE_Exit()
  MeleeSuggested = false
end

function EPA_MELEE_LookAt()
  local InventoryTable = Game.GetInventoryItems(Self, 4)
  if 0 < #InventoryTable then
    local PlaIndex = Player.GetPlayerIndexByObject(InventoryTable[1])
    local ObjectsWithTagInReg = Regions.GetObjectsInRegionWithTag(Self, EPAMeleeID)
    local AtLeastOneTrue = false
    for _k, obj in pairs(ObjectsWithTagInReg) do
      if Game.IsPlayerLookRotFacingObject(PlaIndex, Game.GetPosition(obj), 30) then
        AtLeastOneTrue = true
      end
    end
    if AtLeastOneTrue then
      MeleeSuggested = true
    else
      MeleeSuggested = false
    end
  end
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.DamageTakenMessage, Self, "TakenDamage")
Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, Self, "WaitForText")
Callbacks.RegisterForMsg(GameScript.MsgCallback.ActorTakingControlMessage, Self, "PlayerGetsInEPA")
Callbacks.RegisterForMsg(GameScript.MsgCallback.ActorReleasingControlMessage, Self, "TrackPlayerGettingOut")
Callbacks.RegisterObjectTagEnterExitRegion(Self, EPAStompID, "Track_EPA_STOMP_Enter", "Track_EPA_STOMP_Exit")
Callbacks.RegisterObjectTagEnterExitRegion(Self, EPAMeleeID, "Track_EPA_MELEE_Enter", "Track_EPA_MELEE_Exit")
Callbacks.RegisterForTimer("Suggestion", 0.5, true)
