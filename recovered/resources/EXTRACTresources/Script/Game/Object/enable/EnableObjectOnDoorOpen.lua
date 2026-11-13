local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local MP = Game.MP
local Door = GameScript.Game.Door
local usableObject = Support.ImportSingleObject("Door Object", "The object that can be used")
local enableObjs = Support.ImportObjectList("Object(s) to Enable", "The objects that are enabled")

function UpdateEveryFrame()
  if usableObject ~= nil and Game.IsLoaded(usableObject) then
    if Door.GetPosition(usableObject) > 0 or Door.GetPosition(usableObject) < 0 then
      for k, obj in pairs(enableObjs) do
        if obj ~= nil and Game.IsLoaded(obj) then
          Game.EnableAllEnableables(obj, true)
        end
      end
      Support.ExitScript()
    end
  else
    Support.ExitScript()
  end
end

Callbacks.RegisterForUpdateEveryFrame("UpdateEveryFrame")
