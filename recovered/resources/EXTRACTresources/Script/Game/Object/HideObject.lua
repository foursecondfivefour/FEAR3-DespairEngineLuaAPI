local Game = GameScript.Game
local Support = GameScript.Support
local bHide = Support.ImportBoolVariable("Hide", "If true, then we hide the object(s). If false, we unhide them.")
local objsToHide = Support.ImportObjectHandleVariable("Object(s) to Hide", "The object(s) to hide or unhide")
for k, obj in pairs(objsToHide) do
  if obj ~= nil then
    Game.HideObject(obj, bHide)
  end
end
