local GS = GameScript
local Game = GS.Game
local myObject = Game.GetMyObject()
local interactionObjects = Game.GetInteractionObjects(myObject)
if interactionObjects ~= nil then
  for k, obj in pairs(interactionObjects) do
    local healthPercent = Game.GetDestructibleObjectHealthPercent(obj)
    if healthPercent < 0.33 then
      Game.SendTextMessage(myObject, "SFX_RepairHeavy")
    elseif healthPercent < 0.66 then
      Game.SendTextMessage(myObject, "SFX_RepairMedium")
    else
      Game.SendTextMessage(myObject, "SFX_RepairLight")
    end
  end
end
