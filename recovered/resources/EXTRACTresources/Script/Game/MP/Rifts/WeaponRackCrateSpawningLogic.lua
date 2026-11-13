local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Player = Game.Player
local Support = GS.Support
local Debug = GS.Debug
local Regions = Game.Regions
local Sets = Game.Sets
local Utilities = GS.Utilities
local MP = Game.MP
local Physics = Game.Physics
local ObjectTags = Game.ObjectTags
local CarriedStatus = GS.InventoryItemCarriedStatus
local myObject = Game.GetMyObject()
local ResupplyPickupNames = {}
ResupplyPickupNames[1] = "Standard Weapon Resupply Pickup"
ResupplyPickupNames[2] = "Special Weapon Resupply Pickup"
Support.RegisterObjectTemplateVariable(ResupplyPickupNames[1], "The object template for the Standard Weapon resupply pickup")
Support.RegisterObjectTemplateVariable(ResupplyPickupNames[2], "The object template for the Special Weapon resupply pickup")
local ResupplySpawnLocations = {}
local ResupplyMaxNumber = {}
local ResupplyCurrentNumber = {}
ResupplySpawnLocations[1] = Support.ImportSetObject("Standard Weapon spawn locations", "A set of spawn locations to spawn the Standard Weapon rack pickup")
ResupplyMaxNumber[1] = Support.ImportFloatVariableWithDefault("Max num Standard Weapon resupply pickups", "The maximum number of Standard Weapon rack pick ups at one time", 4)
ResupplyCurrentNumber[1] = 0
ResupplySpawnLocations[2] = Support.ImportSetObject("------Special Weapon spawn locations", "A set of spawn locations to spawn the Special Weapon rack pickup")
ResupplyMaxNumber[2] = Support.ImportFloatVariableWithDefault("Max num Special Weapon resupply pickups", "The maximum number of Special Weapon rack pick ups at one time", 2)
ResupplyCurrentNumber[2] = 0
local ResupplySpawnLocationsInUse = {}
local ResupplyPickupObjectsArray = {}
local BeginRestPeriodMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Rest Period", "")

function OnAnyResupplyPickupPickedUp(itemStatusMsg)
  if itemStatusMsg.carriedStatus == CarriedStatus.Selected or itemStatusMsg.carriedStatus == CarriedStatus.Unselected then
    for i = 1, #ResupplySpawnLocationsInUse do
      for j = 1, #ResupplySpawnLocationsInUse[i] do
        if ResupplySpawnLocationsInUse[i][j] and ResupplyPickupObjectsArray[i][j] == itemStatusMsg.item then
          Callbacks.UnregisterForMsg(GS.MsgCallback.ItemStatusForItemMessage, ResupplyPickupObjectsArray[i][j], "OnAnyResupplyPickupPickedUp")
          ResupplySpawnLocationsInUse[i][j] = false
          ResupplyCurrentNumber[i] = ResupplyCurrentNumber[i] - 1
        end
      end
    end
  end
end

function SpawnResupplyPickups()
  for i = 1, #ResupplySpawnLocations do
    local numSpawnLocations = Sets.GetNumObjectsInSet(ResupplySpawnLocations[i])
    local spawnLocations = Sets.GetObjectsInSet(ResupplySpawnLocations[i])
    while ResupplyCurrentNumber[i] < ResupplyMaxNumber[i] and numSpawnLocations > ResupplyCurrentNumber[i] do
      local randomSpawnLocation = Utilities.GetRandomInteger(1, numSpawnLocations)
      if ResupplySpawnLocationsInUse[i][randomSpawnLocation] == false then
        local spawnPosition = Game.GetPosition(spawnLocations[randomSpawnLocation])
        local spawnRotation = Game.GetRotation(spawnLocations[randomSpawnLocation])
        ResupplyPickupObjectsArray[i][randomSpawnLocation] = Game.SpawnWithRotation(ResupplyPickupNames[i], spawnPosition, spawnRotation)
        ResupplySpawnLocationsInUse[i][randomSpawnLocation] = true
        Callbacks.RegisterForMsg(GS.MsgCallback.ItemStatusForItemMessage, ResupplyPickupObjectsArray[i][randomSpawnLocation], "OnAnyResupplyPickupPickedUp")
        ResupplyCurrentNumber[i] = ResupplyCurrentNumber[i] + 1
      end
    end
  end
end

function InitializeResupplySpawning()
  for i = 1, #ResupplySpawnLocations do
    ResupplySpawnLocationsInUse[i] = {}
    ResupplyPickupObjectsArray[i] = {}
    local spawnerObjs = Sets.GetObjectsInSet(ResupplySpawnLocations[i])
    local spawnerIndex = 1
    for k, spawner in pairs(spawnerObjs) do
      ResupplySpawnLocationsInUse[i][spawnerIndex] = false
      ResupplyPickupObjectsArray[i][spawnerIndex] = spawner
      spawnerIndex = spawnerIndex + 1
    end
  end
end

function ProcessMissionEventMessage(missionEventMessage)
  if missionEventMessage.textID == BeginRestPeriodMsgId then
    SpawnResupplyPickups()
  end
end

InitializeResupplySpawning()
SpawnResupplyPickups()
Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, myObject, "ProcessMissionEventMessage")
