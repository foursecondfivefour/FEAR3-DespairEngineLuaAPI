local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local Player = Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Objectives = Game.Objectives
local Graphics = Game.Graphics
local Regions = Game.Regions
local Sets = Game.Sets
local Utilities = GameScript.Utilities
local MP = Game.MP
local Physics = Game.Physics
local AI = Game.AI
local Door = Game.Door
local myObject = Game.GetMyObject()
local minAIKilled = Support.ImportFloatVariable("Number of AIs Killed", "The number of AIs that must be killed for performing actions")
local setEnable = Support.ImportObjectHandleVariable("Object(s) To Enable", "The object(s) to be enabled or disabled")
local Enable = Support.ImportFloatVariable("Enable?", "0 will disable the object(s); 1 will enable the Object(s).")
local numAIKilled = 0

function OnAIDeath(deathMsg)
  if deathMsg == nil then
    return
  end
  if deathMsg.victimPlayerIndex == GameScript.PlayerIndex.kNotAGlobalPlayer then
    numAIKilled = numAIKilled + 1
    if numAIKilled >= minAIKilled then
      EnableSet()
      Callbacks.UnregisterForMsg(GameScript.MsgCallback.PlayerDeathMessage, myObject, "OnAIDeath")
    end
  end
end

function EnableSet()
  local objs = Support.GetImportObjectTable("Object(s) To Enable")
  for k, v in pairs(objs) do
    if Enable == 0 then
      Game.EnableAllEnableables(v, false)
    elseif Enable == 1 then
      Game.EnableAllEnableables(v, true)
    end
  end
end

if not MP.IsClient() then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.PlayerDeathMessage, myObject, "OnAIDeath")
end
