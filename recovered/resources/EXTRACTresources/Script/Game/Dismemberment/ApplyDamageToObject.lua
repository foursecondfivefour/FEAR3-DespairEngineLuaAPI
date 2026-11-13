local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Util = GameScript.Utilities
local Player = GameScript.Game.Player
local Self = Game.GetMyObject()
local TargetTable = Support.ImportObjectHandleVariable("Target Object(s)", "The object(s) that will have damage done to it.")
local DamageAmount = Support.ImportFloatVariable("Damage Amount", "The amount of damage done to the object(s).")
local DamageType = Support.ImportStringVariableWithDefault("Damage Type", "Do what type of damage? See Damage Global Data in the GlobalData object for types. Leave this blank if the type doesnt matter.", "")
local ReactionProb = GameScript.Support.ImportFloatVariableWithDefault("Full Reaction Probability", "What is the percent chance that the full hit reaction will play. 0 = No chance, 1 = Full hit reaction will always play.", 0)
if TargetTable then
  local DamageTable = {
    damage = DamageAmount,
    type = DamageType,
    hitReactionProbability = ReactionProb
  }
  for key, object in pairs(TargetTable) do
    if Game.IsLoaded(object) then
      Game.DamageWithInfo(object, DamageTable)
    end
  end
end
