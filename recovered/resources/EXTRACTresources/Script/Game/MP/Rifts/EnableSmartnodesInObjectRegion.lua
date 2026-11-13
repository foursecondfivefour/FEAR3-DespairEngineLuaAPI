local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Sets = GameScript.Game.Sets
local AI = Game.AI
local myObject = Game.GetMyObject()
if myObject ~= nil then
  AI.EnableSmartMapsInRegion(myObject, true)
end
