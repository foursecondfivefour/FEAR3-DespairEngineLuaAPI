local Death = GameScript.Game.Death
local Callbacks = GameScript.Callbacks
local Print = GameScript.Debug.PrintInfo
local Support = GameScript.Support
local Math3d = GameScript.LuaMath3d
local chosenDeathSequence = "Ragdoll Death"
local maxDistance = Support.ImportFloatVariableWithDefault("maxGibDistance", "The max distance for distance probablity curve.  All values greater than this values will be treated as the max value.", 10)
Support.RegisterCurveTemplateVariable("distanceCurve", "Curved used to control distance based gib deaths.  This curve changes the probablity of a full chance of gib death")
local leftLegDismember = GameScript.Support.ImportWatchVariable("LeftLeg", "Has the left leg been removed via dismemberment?")
local rightLegDismember = GameScript.Support.ImportWatchVariable("RightLeg", "Has the right leg been removed via dismemberment?")
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
    HandleBulletDamage(damageInfo)
  elseif damageType == "Shotgun" then
    HandleShotgunDamage(damageInfo)
  elseif damageType == "Stun" then
    HandleShotgunDamage(damageInfo)
  elseif damageType == "Rocket Launcher" then
    HandleRocketLauncherDamage(damageInfo)
  elseif damageType == "Bullet Stream" then
    HandleBulletStreamDamage(damageInfo)
  elseif damageType == "Rock Fall" then
    HandleRockFallDamage()
  elseif damageType == "Suicide Mine" then
    HandleSuicideMineDamage()
  elseif damageType == "Frag Grenade" then
    HandleExplosionDamage()
  elseif damageType == "Bullet Mech" then
    HandleMechExplosionDamage()
  elseif damageType == "White Phosphor" or damageType == "Fire" or damageType == "Beam" then
    HandleBurningDamage()
  elseif damageType == "MeleeFinisher" then
    HandleMeleeFinisherDamage()
  elseif damageType == "Melee" then
    HandleMeleeDamage()
  elseif damageType == "MeleeKnife" then
    HandleMeleeKnifeDamage()
  elseif damageType == "FettelMelee" then
    HandleFettelMeleeDamage()
  elseif damageType == "FettelMeleeFinisher" then
    HandleFettelMeleeFinisherDamage()
  elseif damageType == "FettelSuspendMelee" then
    HandleFettelSuspendMeleeDamage()
  elseif damageType == "Flechette" then
    HandleFlechetteDamage()
  elseif damageType == "Sniper Bullet" then
    HandleSniperBulletDamage()
  elseif damageType == "MeleeSlide" then
    HandleMeleeSlideDamage()
  elseif damageType == "MeleeJumpKick" then
    HandleMeleeJumpKickDamage()
  elseif damageType == "Explosive Tank" then
    HandleExplosiveTankDamage()
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
  chosenDeathSequence = "Generic Animated Death + Shoot weapon"
end

function HandleSniperBulletDamage()
  chosenDeathSequence = "Animated Dismember Death - 3 Dismemberments Max"
end

function HandleBulletStreamDamage(damageInfo)
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
  selectionTable.Dismember = curveValue
  selectionTable.Animated = otherValues
  ChooseRandomDeathSequenceFromTable(selectionTable)
  if strSelection == "Dismember" then
    chosenDeathSequence = "Animated Dismember Death - 3 Dismemberments Max"
  elseif strSelection == "Animated" then
    chosenDeathSequence = "Generic Animated Death + Shoot weapon"
  end
end

function HandleSuicideMineDamage()
  chosenDeathSequence = "Explode into Gibs"
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

function HandleRocketLauncherDamage(damageInfo)
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
  selectionTable.Explode = otherValues
  selectionTable.Dismember = otherValues
  selectionTable.Gib = curveValue
  ChooseRandomDeathSequenceFromTable(selectionTable)
  if strSelection == "Dismember" then
    chosenDeathSequence = "Animated Dismember Death - 3 Dismemberments Max"
  elseif strSelection == "Explode" then
    chosenDeathSequence = "Explode Animated Death"
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

function HandleRockFallDamage(damageInfo)
  local selectionTable = {}
  selectionTable.Dismember = 0.75
  selectionTable.Gib = 0.25
  ChooseRandomDeathSequenceFromTable(selectionTable)
  if strSelection == "Dismember" then
    chosenDeathSequence = "Animated Dismember Death - 3 Dismemberments Max"
    local dismemberTable = {}
    dismemberTable.LArm = 0.25
    dismemberTable.RArm = 0.25
    dismemberTable.LLeg = 0.25
    dismemberTable.RLeg = 0.25
    ChooseRandomDeathSequenceFromTable(dismemberTable)
    GameScript.FEAR.DismemberObject(GameScript.Game.GetMyObject(), strSelection)
  elseif strSelection == "Gib" then
    chosenDeathSequence = "Explode into Gibs"
  end
end

function HandleMechExplosionDamage()
  local selectionTable = {}
  selectionTable.Dismember = 0.3
  selectionTable.Explode = 0.1
  selectionTable.Gib = 0.6
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
  local leftLegDismember = GameScript.Support.GetImportWatchVariableValue("LeftLeg")
  local rightLegDismember = GameScript.Support.GetImportWatchVariableValue("RightLeg")
  if leftLegDismember == 1 or rightLegDismember == 1 then
    chosenDeathSequence = "Ragdoll Death"
  else
    chosenDeathSequence = "On Fire Death"
  end
end

function HandleMeleeFinisherDamage()
  chosenDeathSequence = "Generic Animated Death + Shoot weapon"
end

function HandleMeleeDamage()
  chosenDeathSequence = "Generic Animated Death + Shoot weapon"
end

function HandleMeleeSlideDamage()
  chosenDeathSequence = "Generic Animated Death + Shoot weapon"
end

function HandleMeleeJumpKickDamage()
  chosenDeathSequence = "Generic Animated Death + Shoot weapon"
end

function HandleMeleeKnifeDamage()
  chosenDeathSequence = "Generic Animated Death + Shoot weapon"
end

function HandleFettelMeleeDamage()
  chosenDeathSequence = "Generic Animated Death + Shoot weapon"
end

function HandleFettelMeleeFinisherDamage()
  chosenDeathSequence = "Fettel Melee Finisher"
end

function HandleFettelSuspendMeleeDamage()
  chosenDeathSequence = "Explode into Gibs"
end

function HandleFlechetteDamage()
  chosenDeathSequence = "Pinning Death"
end

function HandleExplosiveTankDamage()
  chosenDeathSequence = "Explode into Gibs"
end

function LeftLegChange(msg)
  leftLegDismember = msg.newValue
end

function RightLegChange(msg)
  rightLegDismember = msg.newValue
end

function AdjustForLowGoreOption()
  if chosenDeathSequence == "Explode into Gibs" then
    chosenDeathSequence = "Ragdoll Death"
  end
end
