local Game = GameScript.Game
local Support = GameScript.Support
local bEnable = Support.ImportBoolVariable("Enable", "Do we make the AI Neutral (true), or non-Neutral (false)")
local AIsToNeutral = Support.ImportObjectHandleVariable("AI(s)", "The AI to make Neutral/non-Neutral")
for k, aiObj in pairs(AIsToNeutral) do
  if aiObj ~= nil then
    Game.SetNeutral(aiObj, bEnable)
  end
end
