local Game = GameScript.Game
local AI = GameScript.Game.AI
local Camera = GameScript.Game.Camera
local Physics = GameScript.Game.Physics
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Callbacks = GameScript.Callbacks
local LuaHelpers = GameScript.LuaHelpers
local PlayerDamageTable = {}
local RegionList = Support.ImportObjectHandleVariable("Region(s)", "A player entering this region(s), will be damaged")
local AffectRiders = Support.NumberToBool(Support.ImportFloatVariable("Affect Vehicle Riders?", "Should players that are riders in vehicles be damaged? 0 false; 1 true"))
local DamageTime = Support.ImportFloatVariable("Damage Time", "This is the amount of time between damage messages in seconds")
local AmountOfDamage = Support.ImportFloatVariable("Amount Of Damage", "The ammount of damage done to the player each interval of time")
local AmountOfDamageMech = Support.ImportFloatVariableWithDefault("Amount of Damage Mech", "The amount of damage done to the player if they are riding in a mech per interval of time", 10)
local DamageOverTime = GameScript.Support.ImportBoolVariableWithDefault("Damage Over Time?", "Should this continuously do damage at the specified interval?", true)

function PlayerEntersRegion(PlayerInfo)
  if PlayerInfo.object then
    if LuaHelpers.GetNumTableKeys(PlayerDamageTable) == 0 then
      Callbacks.RegisterForTimer("DamageToPlayers", DamageTime, true)
    end
    PlayerDamageTable[Player.GetPlayerIndexByObject(PlayerInfo.object)] = PlayerInfo.object
  end
end

function PlayerLeavesRegion(PlayerInfo)
  if PlayerInfo.object then
    local PlayerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object)
    if not Game.Regions.IsPlayerInRegions(PlayerIndex, RegionList) then
      PlayerDamageTable[PlayerIndex] = nil
      if LuaHelpers.GetNumTableKeys(PlayerDamageTable) == 0 then
        Callbacks.UnregisterForTimer("DamageToPlayers")
      end
    end
  end
end

function DamageToPlayers()
  for key, value in pairs(PlayerDamageTable) do
    if value and Game.IsLoaded(value) then
      if not Util.IsPlayerARider(key) then
        Debug.PrintInfo("Dealing damage to a non-mech Player")
        Game.Damage(value, AmountOfDamage)
      elseif Util.IsPlayerARider(key) and AffectRiders == true then
        Debug.PrintInfo("Dealing damage to a MECH Player")
        Game.Damage(value, AmountOfDamageMech)
      end
      if DamageOverTime == false then
        Callbacks.UnregisterForTimer("DamageToPlayers")
      end
    end
  end
end

if RegionList then
  for key, value in pairs(RegionList) do
    Callbacks.RegisterPlayerEnterExitRegion(value, "PlayerEntersRegion", "PlayerLeavesRegion")
  end
else
  Debug.PrintError(Game.GetName(Game.GetMyObject()) .. ": One of the required fields contained no data")
end
