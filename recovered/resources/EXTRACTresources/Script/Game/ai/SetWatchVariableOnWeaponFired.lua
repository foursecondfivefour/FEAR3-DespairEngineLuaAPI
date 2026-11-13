local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local myObject = Game.GetMyObject()
local WeaponFiredMessage = GameScript.MsgCallback.WeaponStartingFireMessage
Support.ExportFloatVariable("Weapon Fired", 0, "Has the weapon been fired? 0 = false, 1 = true")
local weapon

function OnWeaponFired()
  Extern["Weapon Fired"] = 1
  if weapon ~= nil then
    Callbacks.UnregisterForMsg(WeaponFiredMessage, weapon, "OnWeaponFired")
  end
end

local weaponTable = Game.GetInventoryItems(myObject, 1)
if weaponTable ~= nil then
  weapon = weaponTable[1]
  if weapon ~= nil then
    Callbacks.RegisterForMsg(WeaponFiredMessage, weapon, "OnWeaponFired")
  end
end
