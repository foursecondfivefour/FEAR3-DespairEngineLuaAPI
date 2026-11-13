local Support = GameScript.Support
local Game = GameScript.Game
local AI = Game.AI
local Camera = Game.Camera
local Physics = Game.Physics
local Player = Game.Player
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
Support.ImportWatchVariable("Mech Health", "This needs to be the absolute health, not the percentage")
local Time = Support.ImportFloatVariableWithDefault("Wait Time", "Once the health hits zero, how long before the player is kicked out", 10)
local WatchValue
local Self = Game.GetMyObject()
local CountingDownToDumpOut = false

function TakenDamage()
  WatchValue = Support.GetImportWatchVariableValue("Mech Health")
  if WatchValue <= 1 and not CountingDownToDumpOut then
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

Callbacks.RegisterForMsg(GameScript.MsgCallback.DamageTakenMessage, Self, "TakenDamage")
