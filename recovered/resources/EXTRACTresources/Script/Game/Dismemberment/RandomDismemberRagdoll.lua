local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Game = GameScript.Game
local Util = GameScript.Utilities
local Utilities = GameScript.Utilities
local Player = Game.Player
local Physics = Game.Physics
local FEAR = GameScript.FEAR
local Self = Game.GetMyObject()
local TF_Dismember_Head = Support.ImportFloatVariable("Chance to Dismember Head?[0.0 - 1.0]", "0.0 = None; 1.0 = Always")
local TF_Dismember_LArm = Support.ImportFloatVariable("Chance to Dismember Left Arm?[0.0 - 1.0]", "0 = None; 1 = Always")
local TF_Dismember_RArm = Support.ImportFloatVariable("Chance to Dismember Right Arm?[0.0 - 1.0]", "0 = None; 1 = Always")
local TF_Dismember_LLeg = Support.ImportFloatVariable("Chance to Dismember Left Leg?[0.0 - 1.0]", "0 = None; 1 = Always")
local TF_Dismember_RLeg = Support.ImportFloatVariable("Chance to Dismember Right Leg?[0.0 - 1.0]", "0 = None; 1 = Always")
local DismembermentBody = Support.ImportFirstObject("Ragdoll To Dismember", "This is the object that will be Dismembered")
local RequiresTXT = Support.ImportFloatVariable("Send TXT to Dismember?", "0 = False; 1 = True.  The txt message must be 'Dismember' ")

function DismemberRagdoll()
  local seed = Util.GenerateRandomSeed()
  if DismembermentBody then
    local chance = Utilities.GetRandomPercent()
    if chance <= TF_Dismember_Head then
      FEAR.DismemberObject(DismembermentBody, "Head")
    end
    chance = Utilities.GetRandomPercent()
    if chance <= TF_Dismember_LArm then
      FEAR.DismemberObject(DismembermentBody, "LArm")
    end
    chance = Utilities.GetRandomPercent()
    if chance <= TF_Dismember_RArm then
      FEAR.DismemberObject(DismembermentBody, "RArm")
    end
    chance = Utilities.GetRandomPercent()
    if chance <= TF_Dismember_LLeg then
      FEAR.DismemberObject(DismembermentBody, "LLeg")
    end
    chance = Utilities.GetRandomPercent()
    if chance <= TF_Dismember_RLeg then
      FEAR.DismemberObject(DismembermentBody, "RLeg")
    end
  end
end

function DismemberOnMessage(TXT_MSG)
  if TXT_MSG.text == "Dismember" then
    DismemberRagdoll()
  end
end

if RequiresTXT == 1 then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, Self, "DismemberOnMessage")
else
  DismemberRagdoll()
end
