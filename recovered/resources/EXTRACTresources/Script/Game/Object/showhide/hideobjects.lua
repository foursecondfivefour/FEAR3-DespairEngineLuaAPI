local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local hideObjects = Support.ImportObjectHandleVariable("Hide/Unhide Object(s)", "The objects to hide or unhide")
local bHide = Support.ImportBoolVariable("Hide?", "If true, then we hide the object(s). If false, then we unhide.")
for k, obj in pairs(hideObjects) do
  if obj ~= nil then
    Game.HideObject(obj, bHide)
  end
end
