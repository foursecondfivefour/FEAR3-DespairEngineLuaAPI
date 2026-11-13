local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
Support.ImportObjectHandleVariable("Objects", "Set of objects to enable or disable")
local objSet = Support.GetImportObjectTable("Objects")
local enable = Support.ImportBoolVariable("Enable", "Whether to enable or disable the set of objects")
if objSet ~= nil then
  local strEnable = "DisableRegion"
  if enable == true then
    strEnable = "EnableRegion"
  end
  for i, v in ipairs(objSet) do
    Game.SendTextMessage(v, strEnable)
  end
end
