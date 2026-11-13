local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
Support.AddDescription("Tell an object with a Cutscene component to stop looping")
local ObjTable = Support.ImportObjectHandleVariable("Cutscene Object(s)", "Object or Objects that will stoop looping")
if ObjTable then
  Debug.PrintInfoIf(g_debugMode > 0, "Stop Looping Object - Number:" .. table.getn(ObjTable))
  for key, nextObj in pairs(ObjTable) do
    if Game.IsLoaded(nextObj) then
      Game.SendCutsceneStopLoopMessage(nextObj)
    end
  end
end
