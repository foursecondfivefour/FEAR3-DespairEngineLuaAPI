local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Game = GameScript.Game
local Util = GameScript.Utilities
local Player = Game.Player
local Physics = Game.Physics
local FEAR = GameScript.FEAR
local Self = Game.GetMyObject()
local TF_Dismember_Head = Support.ImportFloatVariable("Dismember Head?", "0 = False; 1 = True")
local TF_Dismember_LArm = Support.ImportFloatVariable("Dismember Left Arm?", "0 = False; 1 = True")
local TF_Dismember_RArm = Support.ImportFloatVariable("Dismember Right Arm?", "0 = False; 1 = True")
local TF_Dismember_LLeg = Support.ImportFloatVariable("Dismember Left Leg?", "0 = False; 1 = True")
local TF_Dismember_RLeg = Support.ImportFloatVariable("Dismember Right Leg?", "0 = False; 1 = True")
local DismembermentBody = Support.ImportFirstObject("Ragdoll To Dismember", "This is the object that will be Dismembered")
local RequiresTXT = Support.ImportFloatVariable("Send TXT to Dismember?", "0 = False; 1 = True.  The txt message must be 'Dismember' ")

function DismemberRagdoll()
  if DismembermentBody then
    if TF_Dismember_Head == 1 then
      FEAR.DismemberObject(DismembermentBody, "Head")
    end
    if TF_Dismember_LArm == 1 then
      FEAR.DismemberObject(DismembermentBody, "LArm")
    end
    if TF_Dismember_RArm == 1 then
      FEAR.DismemberObject(DismembermentBody, "RArm")
    end
    if TF_Dismember_LLeg == 1 then
      FEAR.DismemberObject(DismembermentBody, "LLeg")
    end
    if TF_Dismember_RLeg == 1 then
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
