local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Player = Game.Player
local Support = GS.Support
local Debug = GS.Debug
local MP = Game.MP
local Camera = GS.Game.Camera
local FEAR = GS.FEAR
local Utilities = GS.Utilities
local myObject = Game.GetMyObject()
local glowComponent = Support.RegisterComponentHandle("Glow Rendering")
local carryingCrateMsgId = Support.ImportStaticTextVariable("MissionEvent: Carrying Crate", "")
local weaponCrateRetrievedMsgId = Support.ImportStaticTextVariable("MissionEvent: Crate Retrieved", "")
local DeleteCrateOnNearDeath = Support.ImportBoolVariable("Delete Crate on Near Death", "The amount of time the text will be on screen")
local BarrierRepairedMsgId = Support.ImportStaticTextVariableWithDefault("MissionEvent: Barrier Repaired Message", "", 153154)
local TextID = Support.ImportStaticTextVariable("Text ID", "Pick the text ID that should be shown on screen")
local AreaName = Support.ImportStringVariable("Text Area Name", "The area this text will be placed in to.")
local TimeOnScreen = Support.ImportFloatVariableWithDefault("Time On Screen", "The ammount of time the text will be on screen", 0.5)
local StartFogFilterMsgId = Support.ImportStaticTextVariableWithDefault("MissionEvent: Start Fog Filter", "", 145236)
local StopFogFilterMsgId = Support.ImportStaticTextVariableWithDefault("MissionEvent: Stop Fog Filter", "", 145237)
local currentObjectState = -1
local myPlayerIndex = Player.GetPlayerIndexByObject(myObject)
local localPlayer = Player.IsLocalPlayer(myPlayerIndex)
local DisplayTextTable = {}
DisplayTextTable.textId = TextID
DisplayTextTable.textAreaName = AreaName
DisplayTextTable.displayTime = TimeOnScreen
local PlayerInFog = false

function WeaponCrateRemoved()
end

function HandleObjectStateChangeMsg(msgTable)
  currentObjectState = msgTable.newState
  CheckIfItemsInInventory()
end

function PrintBuddyWarningToScreen()
  local partnerInNearDeathState = Support.GetScriptExportVariable(myObject, "PartnerInNearDeathState")
  if partnerInNearDeathState == 1 then
    Game.DisplayText(DisplayTextTable, myPlayerIndex, true, Game.GetMyObject())
  end
end

function RemoveCrateFromInventory()
  local augInv = Game.GetInventoryItemsByTypeAndName(myObject, 3, "Medkit Inventory")
  if 0 < #augInv then
    for k, obj in pairs(augInv) do
      local announcementID = FEAR.CreateAnnoucementPacket(myPlayerIndex, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Player Lost Crate")
      FEAR.AddStringValueToAnnouncementPacket(announcementID, MP.GetPlayerName(myPlayerIndex))
      FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
      FEAR.BroadcastAnnoucementPacket(announcementID)
      Game.SendMissionEventMessage(obj, weaponCrateRetrievedMsgId)
    end
  end
end

function CheckIfItemsInInventory()
  if currentObjectState ~= GS.ObjectState.NearDeath then
    Game.EnableComponent(glowComponent, false)
    local augInv = Game.GetInventoryItemsByTypeAndName(myObject, 3, "Medkit Inventory")
    if 0 < #augInv then
      if currentObjectState ~= GS.ObjectState.ShieldsActivated then
        Game.SendMissionEventMessage(myObject, carryingCrateMsgId)
      end
      Game.SetAnimationVariable(myObject, "Weapon Type", 29)
      Game.SetAnimationVariable(myObject, "Dual Wield", 0)
    elseif currentObjectState == GS.ObjectState.ShieldsActivated then
      Game.SendMissionEventMessage(myObject, weaponCrateRetrievedMsgId)
    end
  else
    Game.EnableComponent(glowComponent, true)
    if DeleteCrateOnNearDeath then
      RemoveCrateFromInventory()
    end
  end
end

function OnMissionEventMessageHost(msg)
  if msg.textID == BarrierRepairedMsgId then
    Game.SendMissionEventMessage(Utilities.GetGlobalDataObject(), BarrierRepairedMsgId)
  elseif msg.textID == StartFogFilterMsgId then
    PlayerInFog = true
    local playerContObject = Player.GetPlayerControlledObjectByIndex(myPlayerIndex)
    Game.SendTextMessage(playerContObject, "start heavy fog filter")
  elseif msg.textID == StopFogFilterMsgId then
    PlayerInFog = false
    local playerContObject = Player.GetPlayerControlledObjectByIndex(myPlayerIndex)
    Game.SendTextMessage(playerContObject, "stop heavy fog filter")
  end
end

function OnMissionEventMessageClient(msg)
  if msg.textID == StartFogFilterMsgId then
    PlayerInFog = true
    local playerContObject = Player.GetPlayerControlledObjectByIndex(myPlayerIndex)
    if playerContObject ~= myObject then
      Game.SendTextMessage(playerContObject, "start heavy fog filter")
    end
  elseif msg.textID == StopFogFilterMsgId then
    PlayerInFog = false
    local playerContObject = Player.GetPlayerControlledObjectByIndex(myPlayerIndex)
    if playerContObject ~= myObject then
      Game.SendTextMessage(playerContObject, "stop heavy fog filter")
    end
  end
end

function OnRiderStateMessage(msg)
  if PlayerInFog then
    local playerContObject = Player.GetPlayerControlledObjectByIndex(myPlayerIndex)
    Game.SendTextMessage(playerContObject, "start heavy fog filter")
  else
    local playerContObject = Player.GetPlayerControlledObjectByIndex(myPlayerIndex)
    Game.SendTextMessage(playerContObject, "stop heavy fog filter")
  end
end

function HandleItemStatusForCarrierMessage(msg)
  if currentObjectState ~= GS.ObjectState.NearDeath and msg.wasItemPickedUp and msg.invListType == 3 then
    local augInv = Game.GetInventoryItemsByTypeAndName(myObject, 3, "Medkit Inventory")
    if 0 < #augInv then
      if currentObjectState ~= GS.ObjectState.ShieldsActivated then
        Game.SendMissionEventMessage(myObject, carryingCrateMsgId)
        local announcementID = FEAR.CreateAnnoucementPacket(myPlayerIndex, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Weapon Crate Picked Up")
        FEAR.AddStringValueToAnnouncementPacket(announcementID, MP.GetPlayerName(myPlayerIndex))
        FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
        FEAR.BroadcastAnnoucementPacket(announcementID)
      end
      Game.SetAnimationVariable(myObject, "Weapon Type", 29)
      Game.SetAnimationVariable(myObject, "Dual Wield", 0)
    end
  end
end

function SetInvulnerable(bInvulnerable)
  Game.SetHitPointPriorityInvulnerable(myObject, 1, bInvulnerable)
end

function OnTextMessage(msg)
  if msg.text == "WeaponCrateRemoved" then
    Callbacks.RegisterForTimer("CheckIfItemsInInventory", 0.1, false)
  elseif msg.text == "InvulnerableOn" then
    SetInvulnerable(true)
  end
end

Game.EnableComponent(glowComponent, false)
Callbacks.RegisterForMsg(GS.MsgCallback.ObjectStateChangeMessage, myObject, "HandleObjectStateChangeMsg")
Callbacks.RegisterForMsg(GS.MsgCallback.ItemStatusForCarrierMessage, myObject, "HandleItemStatusForCarrierMessage")
Callbacks.RegisterForMsg(GS.MsgCallback.TextMessage, myObject, "OnTextMessage")
if localPlayer then
  Callbacks.RegisterForWatchVariableChange("PartnerInNearDeathState", "PrintBuddyWarningToScreen")
  Callbacks.RegisterForMsg(GS.MsgCallback.RiderStateMessage, myObject, "OnRiderStateMessage")
end
if MP.IsClient() then
  Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, myObject, "OnMissionEventMessageClient")
else
  Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, myObject, "OnMissionEventMessageHost")
end
