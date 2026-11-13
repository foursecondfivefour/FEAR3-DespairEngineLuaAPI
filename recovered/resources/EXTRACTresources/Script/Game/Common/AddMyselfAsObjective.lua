local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Objectives = Game.Objectives
local objTextID = Support.ImportStaticTextVariable("Objective Text ID", "Text ID identifier for the objective (use blank for an anonymous objective)")
local objType = Support.ImportEnumVariable("GameScript.ObjectiveType", "Objective Type", "The Objective Type identifier for the objective")
local myObject = Game.GetMyObject()
Objectives.Add(objType, objTextID)
Objectives.AddObject(myObject, objType, objTextID)
