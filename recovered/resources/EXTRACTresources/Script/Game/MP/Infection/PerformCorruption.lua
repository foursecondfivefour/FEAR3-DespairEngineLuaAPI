local Support = GameScript.Support
local CorruptionPeriod = Support.ImportFloatVariableWithDefault("Corruption Period", "How many seconds corruption should take", 2)
Support.ExportFloatVariable("CorruptionPeriod", 1.25, "The time needed to corrupt the player")
