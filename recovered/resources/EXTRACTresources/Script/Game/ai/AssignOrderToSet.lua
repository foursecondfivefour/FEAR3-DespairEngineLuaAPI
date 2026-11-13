GameScript.Support.AddDescription("Script to assign an AIOrder to an enemy")
local Game = GameScript.Game
local AI = Game.AI
local Sets = Game.Sets
local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local AssigneeSet = Support.ImportSetObject("Set of Assignees", "The set containing the AIs that will receive the new order")
local Order = Support.ImportSingleObject("AI Order", "External order that enemy AI is assigned")

function AssignOrder()
  if AssigneeSet ~= nil then
    local AssigneeTable = Sets.GetObjectsInSet(AssigneeSet)
    for k, Assignee in pairs(AssigneeTable) do
      AI.AssignExternalAIOrder(Order, Assignee)
    end
  end
end

AssignOrder()
