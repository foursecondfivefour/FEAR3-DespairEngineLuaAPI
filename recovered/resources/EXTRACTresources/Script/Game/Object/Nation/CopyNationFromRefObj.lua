local Game = GameScript.Game
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local nationRefObj = Support.ImportSingleObject("Nation Reference Object", "The object containing the nationality information that will be copied to others objects.")
local myObj = Game.GetMyObject()

function AIEntersRegion(info)
  local aiThatEntered = info.object
  if aiThatEntered ~= nil and nationRefObj ~= nil then
    Debug.PrintInfoIf(g_debugMode > 0, "Object '" .. Game.GetName(aiThatEntered) .. "' entered region, copying nation into it")
    Game.CopyNation(nationRefObj, aiThatEntered)
  end
end

if nationRefObj ~= nil and myObj ~= nil then
  Callbacks.RegisterAIEnterExitRegion(myObj, "AIEntersRegion", "")
end
