local Death = GameScript.Game.Death
local Callbacks = GameScript.Callbacks
local Print = GameScript.Debug.PrintInfo
local Support = GameScript.Support
local Math3d = GameScript.LuaMath3d
local chosenDeathSequence = "Ragdoll Death"
local maxDistance = Support.ImportFloatVariableWithDefault("maxGibDistance", "The max distance for distance probablity curve.  All values greater than this values will be treated as the max value.", 10)
Support.RegisterCurveTemplateVariable("distanceCurve", "Curved used to control distance based gib deaths.  This curve changes the probablity of a full chance of gib death")
Callbacks.RegisterForDeathSequenceSelectCallback("ChooseDeathSequence")
Callbacks.RegisterForDeathSequenceNetFixupCallback("FixupDeathSequence")

function FixupDeathSequence()
  if not Death.IsGoreEnabled() or not Death.IsBloodEnabled() then
    chosenDeathSequence = Death.GetDeathChoreographerSequence(GameScript.Game.GetMyObject())
    GameScript.Debug.PrintInfo("Original Death Sequence " .. chosenDeathSequence)
    AdjustForLowGoreOption()
    GameScript.Debug.PrintInfo("Final Death Sequence " .. chosenDeathSequence)
    Death.SetDeathChoreographerSequence(chosenDeathSequence)
  end
end

function ChooseDeathSequence()
  local damageInfo = Death.GetLastDamageInfo()
  local damageType = damageInfo.type
  local myObject = GameScript.Game.GetMyObject()
  if GameScript.FEAR.IsPhasing(myObject) then
    chosenDeathSequence = "Explode into Gibs"
  elseif damageType == "Bullet" then
    HandleBulletDamage()
  elseif damageType == "Shotgun" then
    HandleShotgunDamage(damageInfo)
  elseif damageType == "Frag Grenade" or damageType == "Bullet Mech" then
    HandleExplosionDamage()
  elseif damageType == "White Phosphor" or damageType == "Fire" or damageType == "Beam" then
    HandleBurningDamage()
  elseif damageType == "MeleeFinisher" then
    HandleMeleeFinisherDamage()
  elseif damageType == "Melee" then
    HandleMeleeDamage()
  elseif damageType == "MeleeKnife" then
    HandleMeleeKnifeDamage()
  elseif damageType == "Flechette" then
    HandleFlechetteDamage()
  elseif damageType == "Sniper Bullet" then
    HandleSniperBulletDamage()
  elseif damageType == "Mech MeleeStomp" then
    HandleExplosionDamage()
  end
  if not Death.IsGoreEnabled() or not Death.IsBloodEnabled() then
    AdjustForLowGoreOption()
  end
  Death.SetDeathChoreographerSequence(chosenDeathSequence)
end

function ChooseRandomDeathSequenceFromTable(selectionTable)
  strSelection = ""
  local total = 0
  for key, value in pairs(selectionTable) do
    total = total + value
    selectionTable[key] = total
  end
  randomPick = math.random() * total
  for key, value in pairs(selectionTable) do
    if value > randomPick then
      strSelection = key
      break
    end
  end
end

function HandleBulletDamage()
  chosenDeathSequence = "Generic Animated Death"
end

function HandleSniperBulletDamage()
  chosenDeathSequence = "Animated Dismember Death - 3 Dismemberments Max"
end

function HandleShotgunDamage(damageInfo)
  local source = {
    x = damageInfo.sourceX,
    y = damageInfo.sourceY,
    z = damageInfo.sourceZ
  }
  local dest = {
    x = damageInfo.impactX,
    y = damageInfo.impactY,
    z = damageInfo.impactZ
  }
  local diff = Math3d.VectorSubtract(source, dest)
  local distance = Math3d.VectorLength(diff)
  if distance > maxDistance then
    distance = maxDistance
  end
  local curveInput = distance / maxDistance
  local curveValue = Support.GetCurveValue("distanceCurve", curveInput)
  local otherValues = (1 - curveValue) / 2
  local selectionTable = {}
  selectionTable.Dismember = otherValues
  selectionTable.Animated = otherValues
  selectionTable.Gib = curveValue
  ChooseRandomDeathSequenceFromTable(selectionTable)
  if strSelection == "Dismember" then
    chosenDeathSequence = "Animated Dismember Death - 3 Dismemberments Max"
  elseif strSelection == "Animated" then
    chosenDeathSequence = "Generic Animated Death + Shoot weapon"
  elseif strSelection == "Gib" then
    chosenDeathSequence = "Explode into Gibs"
  end
end

function HandleExplosionDamage()
  local selectionTable = {}
  selectionTable.Dismember = 0.5
  selectionTable.Explode = 0.25
  selectionTable.Gib = 0.25
  ChooseRandomDeathSequenceFromTable(selectionTable)
  if strSelection == "Dismember" then
    chosenDeathSequence = "Animated Dismember Death - 3 Dismemberments Max"
  elseif strSelection == "Explode" then
    chosenDeathSequence = "Explode Animated Death"
  elseif strSelection == "Gib" then
    chosenDeathSequence = "Explode into Gibs"
  end
end

function HandleBurningDamage()
  chosenDeathSequence = "On Fire Death"
end

function HandleMeleeFinisherDamage()
  chosenDeathSequence = "Generic Animated Death"
end

function HandleMeleeDamage()
  chosenDeathSequence = "Generic Animated Death"
end

function HandleMeleeKnifeDamage()
  chosenDeathSequence = "Generic Animated Death"
end

function HandleFlechetteDamage()
  chosenDeathSequence = "Pinning Death"
end

function AdjustForLowGoreOption()
  if chosenDeathSequence == "Explode into Gibs" then
    chosenDeathSequence = "Generic Animated Death"
  end
end
