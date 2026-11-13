local Game = GameScript.Game
local Support = GameScript.Support
local killType = Support.ImportFloatVariable("Kill Type", "The type of kill message that should be sent to the target objects. " .. "0 = Instant Delete, 1 = Kill, 2 = Kill Intro (recommended)")
Support.ImportObjectHandleVariable("Kill These", "The objects to be killed")
local killObjects = Support.GetImportObjectTable("Kill These")
if killObjects ~= nil then
  for k, v in pairs(killObjects) do
    if v ~= nil then
      Game.Kill(v, killType)
    end
  end
end
