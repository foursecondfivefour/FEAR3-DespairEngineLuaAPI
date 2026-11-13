GameScript.Support.AddDescription("")
local Game = GameScript.Game
local Player = Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Util = GameScript.Utilities
local SetObject = Support.ImportSetObject("Set of AI", "The set of AI that we are watching.")
local ObjectTable = Support.ImportObjectHandleVariable("Object(s) to Enable", "These are the objects we will enable or disable.")
local Enable = Support.ImportBoolVariableWithDefault("Enable the Object?", "False will Disable the Object.", true)
local RequireLOS = Support.ImportBoolVariable("Require LOS?", "Should this enable only if the AI has LOS to the player?", false)
local info
local AIInSet = {}

function CheckTheAI()
  AIInSet = Game.Sets.GetObjectsInSet(SetObject)
  for k, AI_Obj in pairs(AIInSet) do
    if Util.IsAITargetingPlayer(AI_Obj, RequireLOS) then
      for _k, Object in pairs(ObjectTable) do
        Game.EnableAllEnableables(Object, Enable)
      end
      Callbacks.UnregisterForTimer("CheckTheAI")
      return
    end
  end
end

Callbacks.RegisterForTimer("CheckTheAI", 0.12, true)
