local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Player = Game.Player
local Support = GS.Support
local Graphics = Game.Graphics
local Debug = GS.Debug
local MP = Game.MP
local Camera = GS.Game.Camera
local FEAR = GS.FEAR
local WeaponRackGlowSet = Support.ImportObjectList("Weapon Rack Glow Set", "")

function SetGlowObjectsSortMode(sortMode)
  for k, obj in pairs(WeaponRackGlowSet) do
    Graphics.SetMaterialSortMode(obj, sortMode)
  end
end

function CheckIfPlayerCarryingCrate(msgID)
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsLocalPlayer(index) then
      playerObject = Player.GetPlayerControlledObjectByIndex(index)
      if playerObject ~= nil then
        local augInv = Game.GetInventoryItemsByTypeAndName(playerObject, 3, "Medkit Inventory")
        if 0 < #augInv then
          SetGlowObjectsSortMode(5)
        else
          SetGlowObjectsSortMode(2)
        end
      end
    end
  end
end

Callbacks.RegisterForTimer("CheckIfPlayerCarryingCrate", 0.5, true)
