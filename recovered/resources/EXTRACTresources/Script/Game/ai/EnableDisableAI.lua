local AI = GameScript.Game.AI
local Support = GameScript.Support
local bEnable = Support.ImportBoolVariable("Enable", "Do we enable the AI (true), or disable it (false)")
local AIsToEnable = Support.ImportObjectHandleVariable("AI(s)", "The AI to enable/disable")
for k, aiObj in pairs(AIsToEnable) do
  if aiObj ~= nil then
    AI.EnableAIObject(aiObj, bEnable)
  end
end
