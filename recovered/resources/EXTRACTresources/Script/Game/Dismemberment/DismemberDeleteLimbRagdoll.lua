local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Game = GameScript.Game
local Util = GameScript.Utilities
local Player = Game.Player
local Physics = Game.Physics
local FEAR = GameScript.FEAR
local MP = Game.MP
local Self = Game.GetMyObject()
local NumberOfLimbsToDelete, ObjectTagID
local TF_Dismember_Head = Support.ImportBoolVariableWithDefault("Dismember Head?", "true will result in this limb being dismsmebered", false)
local TF_Dismember_LArm = Support.ImportBoolVariableWithDefault("Dismember Left Arm?", "true will result in this limb being dismsmebered", false)
local Delete_LArm = Support.ImportBoolVariableWithDefault("Delete LArm Limb?", "Should the dismembered limb be deleted?", false)
local TF_Dismember_RArm = Support.ImportBoolVariableWithDefault("Dismember Right Arm?", "true will result in this limb being dismsmebered", false)
local Delete_RArm = Support.ImportBoolVariableWithDefault("Delete RArm Limb?", "Should the dismembered limb be deleted?", false)
local TF_Dismember_LLeg = Support.ImportBoolVariableWithDefault("Dismember Left Leg?", "true will result in this limb being dismsmebered", false)
local Delete_LLeg = Support.ImportBoolVariableWithDefault("Delete LLeg Limb?", "Should the dismembered limb be deleted?", false)
local TF_Dismember_RLeg = Support.ImportBoolVariableWithDefault("Dismember Right Leg?", "true will result in this limb being dismsmebered", false)
local Delete_RLeg = Support.ImportBoolVariableWithDefault("Delete RLeg Limb?", "Should the dismembered limb be deleted?", false)
local DismembermentBody = Support.ImportFirstObject("Ragdoll To Dismember", "This is the object that will be Dismembered")
local DeletionRegion = Support.ImportFirstObject("Limb Deletion Region", "This iRegion will be used to delete the limbs.  If no region is supplied then the limbs CANNOT be deleted.")
local RequiresTXT = Support.ImportBoolVariableWithDefault("Send TXT to Dismember?", "If True you will need to send a txt message 'Dismember' to the object to trigger the dismember.", false)

function DismemberRagdoll()
  if DismembermentBody then
    if TF_Dismember_Head then
      FEAR.DismemberObject(DismembermentBody, "Head")
    end
    if TF_Dismember_LArm then
      FEAR.DismemberObject(DismembermentBody, "LArm")
    end
    if TF_Dismember_RArm then
      FEAR.DismemberObject(DismembermentBody, "RArm")
    end
    if TF_Dismember_LLeg then
      FEAR.DismemberObject(DismembermentBody, "LLeg")
    end
    if TF_Dismember_RLeg then
      FEAR.DismemberObject(DismembermentBody, "RLeg")
    end
    GameScript.Support.ExitScript()
  end
end

function DismemberOnMessage(TXT_MSG)
  if TXT_MSG.text == "Dismember" then
    DismemberRagdoll()
  end
end

function DeleteLimb(MessageInfo)
  local Kill = false
  local Limb = MessageInfo.object
  if Limb and 0 < NumberOfLimbsToDelete then
    if Delete_LArm and Game.ObjectTags.DoesObjectHaveTag(Limb, "Limb LeftArm") then
      Kill = true
    end
    if not Kill and Delete_RArm and Game.ObjectTags.DoesObjectHaveTag(Limb, "Limb RightArm") then
      Kill = true
    end
    if not Kill and Delete_LLeg and Game.ObjectTags.DoesObjectHaveTag(Limb, "Limb LeftLeg") then
      Kill = true
    end
    if not Kill and Delete_RLeg and Game.ObjectTags.DoesObjectHaveTag(Limb, "Limb RightLeg") then
      Kill = true
    end
    if Kill and not MP.IsClient() then
      Game.Kill(Limb, 0)
      NumberOfLimbsToDelete = NumberOfLimbsToDelete - 1
    end
    if NumberOfLimbsToDelete <= 0 then
      Callbacks.UnregisterObjectEnterExitRegion(DeletionRegion, ObjectTagID, "DeleteLimb", "DeleteLimb")
    end
  end
end

if DismembermentBody == nil then
  Debug.PrintError("An Object was not submitted for dismemberment! This script will not continue!")
else
  if DeletionRegion and (Delete_LArm or Delete_RArm or Delete_LLeg or Delete_RLeg) then
    ObjectTagID = Game.ObjectTags.GetObjectTagUID("Limb All")
    NumberOfLimbsToDelete = 0
    if Delete_LArm then
      NumberOfLimbsToDelete = NumberOfLimbsToDelete + 1
    end
    if Delete_RArm then
      NumberOfLimbsToDelete = NumberOfLimbsToDelete + 1
    end
    if Delete_LLeg then
      NumberOfLimbsToDelete = NumberOfLimbsToDelete + 1
    end
    if Delete_RLeg then
      NumberOfLimbsToDelete = NumberOfLimbsToDelete + 1
    end
    Callbacks.RegisterObjectTagEnterExitRegion(DeletionRegion, ObjectTagID, "DeleteLimb", "DeleteLimb")
  end
  if RequiresTXT == 1 then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, Self, "DismemberOnMessage")
  else
    DismemberRagdoll()
  end
end
