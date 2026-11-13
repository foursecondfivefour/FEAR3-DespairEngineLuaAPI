local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
Support.ImportObjectHandleVariable("Region", "The region to watch.")
Support.ImportObjectHandleVariable("Object(s)", "The object(s) to enable.")
local Enable = Support.ImportFloatVariable("Enable?", "0 will disable the object(s); 1 will enable the Object(s).")
local regionTable = Support.GetImportObjectTable("Region")
local regionObject, rIdx
if regionTable ~= nil then
  rIdx, regionObject = next(regionTable)
end
if regionObject ~= nil then
  Callbacks.RegisterPlayerEnterExitRegion(regionObject, "PlayerEntersRegion", "")
end

function PlayerEntersRegion(player)
  local set = Support.GetImportObjectTable("Object(s)")
  for name, object in pairs(set) do
    if Enable == 0 then
      Game.EnableAllEnableables(object, false)
    elseif Enable == 1 then
      Game.EnableAllEnableables(object, true)
    end
  end
  Support.ExitScript()
end
