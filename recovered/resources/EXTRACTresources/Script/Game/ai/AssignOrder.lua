GameScript.Support.AddDescription("Script to assign an AIOrder to an enemy")
local Game = GameScript.Game
local AI = Game.AI
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Assignee = Support.ImportSingleObject("Assignee", "Enemy AI that is assigned an external order")
local Order = Support.ImportSingleObject("AI Order", "External order that enemy AI is assigned")
local WaitTime = Support.ImportFloatVariableWithDefault("Wait Time", "Once created/enabled how long should the script wait before assigning the AI Order?", 0)

function AssignOrder()
  AI.AssignExternalAIOrder(Order, Assignee)
end

if 0 < WaitTime then
  Callbacks.RegisterForTimer("AssignOrder", WaitTime, false)
else
  AssignOrder()
end
