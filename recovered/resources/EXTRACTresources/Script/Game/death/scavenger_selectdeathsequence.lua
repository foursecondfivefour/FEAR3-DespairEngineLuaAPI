local Death = GameScript.Game.Death
local Callbacks = GameScript.Callbacks
local Print = GameScript.Debug.PrintInfo
local Support = GameScript.Support
local Math3d = GameScript.LuaMath3d
local chosenDeathSequence = "Ragdoll Death"
Callbacks.RegisterForDeathSequenceSelectCallback("ChooseDeathSequence")

function ChooseDeathSequence()
  local damageInfo = Death.GetLastDamageInfo()
  local damageType = damageInfo.type
  local myObject = GameScript.Game.GetMyObject()
  if GameScript.FEAR.IsPhasing(myObject) then
    chosenDeathSequence = "Ragdoll Death"
  elseif damageType == "Flechette" then
    HandleFlechetteDamage()
  end
  Death.SetDeathChoreographerSequence(chosenDeathSequence)
end

function HandleFlechetteDamage()
  chosenDeathSequence = "Pinning Death"
end
