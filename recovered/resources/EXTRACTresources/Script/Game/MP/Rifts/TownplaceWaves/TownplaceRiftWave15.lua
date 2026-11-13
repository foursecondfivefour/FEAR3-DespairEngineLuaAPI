local Game = GameScript.Game
local Support = GameScript.Support
local Debug = GameScript.Debug
local Utilities = GameScript.Utilities
local MP = Game.MP
local Sets = Game.Sets
local AI = Game.AI
local Graphics = Game.Graphics
local Callbacks = GameScript.Callbacks
local myObject = Game.GetMyObject()
local spawnLimit = {}
local AIDirector = {}
if myObject ~= nil then
  AIDirector = MP.AIDirectorBase.MakeChild(myObject)
end

function RegisterEnemyTemplates(templateTable, variableName, squadName, orderName, numberAllowed)
  local SetObject
  if numberAllowed ~= nil then
    SetObject = Support.ImportSetObject(variableName .. " set", "The set to limit spawning of template " .. variableName)
    spawnLimit[variableName] = {set = SetObject, maxAllowed = numberAllowed}
  end
  templateTable[variableName] = {squad = squadName, order = orderName}
  local MakeSpacer = function(num)
    local result = ""
    for i = 1, num do
      result = result .. " "
    end
    return result
  end
  for v = 1, AIDirector.kAITypes_NumVarieties do
    local spacer = "    "
    local varietyName
    if v == 1 then
      varietyName = variableName .. spacer .. " (variety " .. v .. ")"
    else
      varietyName = spacer .. variableName .. " (variety " .. v .. ")"
    end
    local found = Support.RegisterObjectTemplateVariable(varietyName, "")
    if found then
      table.insert(templateTable[variableName], varietyName)
    end
  end
end

function RegisterTemplatesForAllEnemyTypes()
  AIDirector.enemyTemplates = {}
  RegisterEnemyTemplates(AIDirector.enemyTemplates, "phase_soldier", "phase_squad", "phase_orders", 1)
  RegisterEnemyTemplates(AIDirector.enemyTemplates, "atc_shotgun", "standard_squad", "soldier_orders")
  ImportSquadAndOrderVariables(AIDirector.enemyTemplates)
end

function ImportSquadAndOrderVariables(templateTable)
  AIDirector.aiSquads = {}
  for t, enemyTemplate in pairs(templateTable) do
    if enemyTemplate.squad ~= nil and enemyTemplate.squad ~= "" and AIDirector.aiSquads[enemyTemplate.squad] == nil then
      AIDirector.aiSquads[enemyTemplate.squad] = Support.ImportSingleObject("Squad: " .. enemyTemplate.squad, "A squad.")
    end
  end
  AIDirector.aiOrders = {}
  for t, enemyTemplate in pairs(templateTable) do
    if enemyTemplate.order ~= nil and enemyTemplate.order ~= "" and AIDirector.aiOrders[enemyTemplate.order] == nil then
      AIDirector.aiOrders[enemyTemplate.order] = Support.ImportSingleObject("Order: " .. enemyTemplate.order, "An order.")
    end
  end
end

AIDirector.kMinDistThreshold = Support.ImportFloatVariableWithDefault("Minimum Spawn Distance", "", 5)
AIDirector.kMaxDistThreshold = Support.ImportFloatVariableWithDefault("Maximum Spawn Distance", "", 30)
AIDirector.masterRegionSet = Support.ImportSingleObject("Active Region Set", "The set to dummy objects marking where AIs can spawn")
Support.RegisterObjectTemplateVariable("Harvester Object Template", "Used to spawn a Harvester.")
AIDirector.harvesterSpawnPoints = Support.ImportObjectHandleVariable("Harvester Spawn Points", "Valid points where Harvesters may randomly spawn.")
AIDirector.kAITypes_NumVarieties = 3
RegisterTemplatesForAllEnemyTypes()
Support.ImportObjectHandleVariable("Status Message Registry", "Make sure the master director script object is in this list.")
AIDirector.newWaveMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin New Wave", "")
AIDirector.beginRestPeriodMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Rest Period", "")
Support.ImportObjectHandleVariable("Heavy Fog Camera Filter Regions", "Region -- or set of regions -- where players will get a full-fog camera filter if they step inside.")
local waveSounds = {
  none = 0,
  newWaveAlert = 1,
  startOfWave = 2,
  endOfWave = 3
}
Support.ExportFloatVariable("HostWaveSound", 0, "Hack extern/export variable for wave soundplay edges to be sent from local to remote machines.")
local localWaveSound = 0
local EnemyWeightAdjustment = 0
local fogInfo = {}
fogInfo.transitionTime = 10
fogInfo.clearSkyObj = Support.ImportSingleObject("Clear Sky Object", "Normal clear sky, to be faded out as the foggy sky is faded in.")
fogInfo.foggySkyObj = Support.ImportSingleObject("Foggy Sky Object", "Foggy sky, to be faded in as the clear sky fades out.")
fogInfo.fogEffectObject = Support.ImportSingleObject("Fog Effect Object", "Fog object, faded in as the height fog blends in.")
fogInfo.levelFogObject = Support.ImportSingleObject("Level Fog Object", "Object that has the ambient fog that we are going to control.")
Support.RegisterTextureVariable("Fog Diffuse Cube Map", "Texture to switch the fog diffuse ambient cube map to.")
Support.RegisterCurveTemplateVariable("Fog Transition Curve", "")
fogInfo.fogValues = {
  depthNear = 1,
  depthFar = 40,
  depthMax = 1,
  heightNear = 0,
  heightFar = 14.6,
  heightMax = 1,
  heightBottom = -25,
  heightTop = 0
}
fogInfo.fogValuesBetweenWave = {
  depthNear = 50,
  depthFar = 100,
  depthMax = 0.5,
  heightNear = 30,
  heightFar = 100,
  heightMax = 1,
  heightBottom = 8,
  heightTop = 20
}
fogInfo.fogValues.heightBottom = 9.05
fogInfo.fogValues.heightTop = 9.45
fogInfo.fogInWaveColor = {
  r = 99,
  g = 102,
  b = 103,
  a = 255
}
fogInfo.fogBetweenWaveColor = {
  r = 37,
  g = 45,
  b = 46,
  a = 255
}
fogInfo.fogInWaveParticleColor = {
  r = 99,
  g = 102,
  b = 103,
  a = 45
}
fogInfo.fogBetweenWaveParticleColor = {
  r = 37,
  g = 45,
  b = 46,
  a = 0
}
Support.ExportFloatVariable("FogFadedIn", 0, "Hack extern/export variable fog fading edges to be sent from local to remote machines.")
fogInfo.FogFadedIn = 0

function ClientUpdateLoop()
  if fogInfo.FogFadedIn ~= Extern.FogFadedIn then
    if Extern.FogFadedIn == 1 then
      FadeFogIn()
    else
      FadeFogOut()
    end
  end
  if localWaveSound ~= Extern.HostWaveSound then
    if Extern.HostWaveSound == waveSounds.newWaveAlert then
      AIDirector.PlaySoundNewWave()
    elseif Extern.HostWaveSound == waveSounds.startOfWave then
      AIDirector.PlaySoundWaveAmbient()
    elseif Extern.HostWaveSound == waveSounds.endOfWave then
      AIDirector.PlaySoundWaveOver()
      AIDirector.StopSoundWaveAmbient()
    end
    localWaveSound = Extern.HostWaveSound
  end
end

function DoHardwareFogFadeIn()
  Graphics.SetContractionsFogColors(fogInfo.levelFogObject, "Fog Transition Curve", fogInfo.transitionTime, fogInfo.fogInWaveColor, fogInfo.fogInWaveColor)
  Graphics.SetContractionsFogValues(fogInfo.levelFogObject, "Fog Transition Curve", fogInfo.transitionTime, fogInfo.fogValues)
end

function FadeFogIn()
  AIDirector.SetHeavyFogCameraFilterColorForLocalPlayers(fogInfo.fogInWaveColor)
  AIDirector.SetFogEffectValues(fogInfo.fogEffectObject, fogInfo.fogValues.heightTop - 2, fogInfo.fogValues.heightTop, fogInfo.fogBetweenWaveParticleColor, fogInfo.fogInWaveParticleColor, fogInfo.transitionTime)
  if fogInfo.fogEffectObject then
    Game.SendTextMessage(fogInfo.fogEffectObject, "fade in")
  end
  if fogInfo.foggySkyObj then
    Game.SendTextMessage(fogInfo.foggySkyObj, "fade in")
  end
  Callbacks.RegisterForTimer("DoHardwareFogFadeIn", 0, false)
  Callbacks.RegisterForTimer("RegisterHeavyFogCameraFilterRegions", 0, false)
  fogInfo.FogFadedIn = 1
  if not MP.IsClient() then
    Extern.FogFadedIn = 1
  end
end

function FadeFogOut()
  if fogInfo.fogEffectObject then
    Game.SendTextMessage(fogInfo.fogEffectObject, "fade out")
  end
  if fogInfo.foggySkyObj then
    Game.SendTextMessage(fogInfo.foggySkyObj, "fade out")
  end
  AIDirector.SetFogEffectValues(fogInfo.fogEffectObject, fogInfo.fogValues.heightTop, fogInfo.fogValues.heightTop + 2, fogInfo.fogInWaveParticleColor, fogInfo.fogBetweenWaveParticleColor, fogInfo.transitionTime)
  Graphics.SetContractionsFogColors(fogInfo.levelFogObject, "Fog Transition Curve", fogInfo.transitionTime, fogInfo.fogBetweenWaveColor, fogInfo.fogBetweenWaveColor)
  Graphics.SetContractionsFogValues(fogInfo.levelFogObject, "Fog Transition Curve", fogInfo.transitionTime, fogInfo.fogValuesBetweenWave)
  Callbacks.RegisterForTimer("UnregisterHeavyFogCameraFilterRegions", 10, false)
  fogInfo.FogFadedIn = 0
  if not MP.IsClient() then
    Extern.FogFadedIn = 0
  end
end

function AIDirector.PopulateWaveTable()
  Utilities.GenerateRandomSeed()
  AIDirector.ClearWaveTable()
  local wave = AIDirector.NewWave(1)
  wave:RestTime(15)
  wave:RampUpTime(3)
  wave:SustainEnemyCount(40)
  wave:AddEnemy("phase_soldier", 0.2)
  wave:AddEnemy("atc_shotgun", 0.8)
  wave:MaxEnemies1P(3)
  wave:MaxEnemies2P(5)
  wave:MaxEnemies3P(7)
  wave:MaxEnemies4P(8)
  AIDirector.NormalizeWaveTableWeights(AIDirector.waveInfoTable)
end

function AIDirector.NewWave(waveNum)
  Debug.PrintErrorIf(1 < waveNum, "This script only supports ONE wave.")
  return AIDirector.Super.NewWave(waveNum)
end

function AIDirector.GetRandomTemplateToSpawn(optionalEnemyInfo)
  local enemyInfoTable = AIDirector.waveInfo.enemyInfo
  if optionalEnemyInfo ~= nil then
    Debug.PrintInfo("Setting enemy table to optional table")
    enemyInfoTable = optionalEnemyInfo
  end
  local templateName
  local randomNum = Utilities.GetRandomPercent() - EnemyWeightAdjustment
  for e, enemyInfo in ipairs(enemyInfoTable) do
    templateName = enemyInfo.type
    if randomNum > enemyInfo.weight then
      randomNum = randomNum - enemyInfo.weight
    else
      local enemyType = AIDirector.enemyTemplates[enemyInfo.type]
      local numVariations = #enemyType
      Debug.PrintErrorIf(numVariations == 0, "Enemy type " .. enemyInfo.type .. " has no templates set")
      local varIndex = Utilities.GetRandomInteger(1, numVariations)
      return enemyType[varIndex], enemyType.squad, enemyType.order, GetSetForTemplate(enemyInfo.type)
    end
  end
  if GetSetForTemplate(templateName) ~= nil then
    Debug.PrintError("GetRandomTemplateToSpawn() failed to find a good template")
  end
  return nil, nil, nil, nil
end

function UpdateTemplateList()
  local enemyInfoTable = {}
  EnemyWeightAdjustment = 0
  for e, enemyInfo in ipairs(AIDirector.waveInfo.enemyInfo) do
    local enemyType = AIDirector.enemyTemplates[enemyInfo.type]
    local spawnSet = GetSetForTemplate(enemyInfo.type)
    if spawnSet ~= nil then
      Debug.PrintInfo("Max allowed spawns for type " .. enemyInfo.type .. " is " .. GetMaxSpawnsForTemplate(enemyInfo.type))
      Debug.PrintInfo("Current number of enemies in the set: " .. GetAmountOfTemplateAlive(enemyInfo.type))
      if GetAmountOfTemplateAlive(enemyInfo.type) >= GetMaxSpawnsForTemplate(enemyInfo.type) then
        Debug.PrintInfo("We should totally kill this AI type now")
      end
    else
      Debug.PrintInfo("No spawn limiting for type " .. enemyInfo.type)
    end
    if spawnSet ~= nil and GetAmountOfTemplateAlive(enemyInfo.type) >= GetMaxSpawnsForTemplate(enemyInfo.type) then
      Debug.PrintInfo("Killing index for type " .. enemyInfo.type)
      EnemyWeightAdjustment = EnemyWeightAdjustment + enemyInfo.weight
    else
      table.insert(enemyInfoTable, enemyInfo)
    end
  end
  for e, enemyInfo in ipairs(enemyInfoTable) do
    Debug.PrintInfo("Found type " .. enemyInfo.type)
  end
  return enemyInfoTable
end

function GetSetForTemplate(templateName)
  local enemyIndex = spawnLimit[templateName]
  if enemyIndex ~= nil then
    return enemyIndex.set
  else
    return nil
  end
end

function GetAmountOfTemplateAlive(templateName)
  local set = GetSetForTemplate(templateName)
  if set ~= nil then
    return Sets.GetNumObjectsInSet(set)
  else
    return nil
  end
end

function GetMaxSpawnsForTemplate(templateName)
  local enemyIndex = spawnLimit[templateName]
  if enemyIndex ~= nil then
    return enemyIndex.maxAllowed
  else
    return nil
  end
end

function AIDirector.SpawnAI()
  local newSpawnTable = UpdateTemplateList()
  local templateName, squadName, orderName, set = AIDirector.GetRandomTemplateToSpawn(newSpawnTable)
  if templateName == nil then
    Debug.PrintError("@summary SpawnAI() could not spawn AI in a wave script, no valid template was found!")
    return nil
  end
  local newAI = AIDirector.Super.SpawnAI(templateName)
  if newAI == nil then
    Debug.PrintError("@summary SpawnAI() could not spawn AI in a wave script, the super class's SpawnAI function failed")
    return nil
  end
  if set ~= nil then
    Debug.PrintInfo("Adding object to set")
    Sets.AddObjectToSet(set, newAI)
  end
  local order = AIDirector.aiOrders[orderName]
  if order ~= nil then
    AI.AssignExternalAIOrder(order, newAI)
  end
  local squad = AIDirector.aiSquads[squadName]
  if squad ~= nil then
    Sets.AddObjectToSet(squad, newAI)
  end
  return newAI
end

function AIDirector.StartNewWave()
  AIDirector.Super.StartNewWave()
  FadeFogIn()
end

function AIDirector.EnterRestState()
  if AIDirector.currentWave == 0 then
    AIDirector.Super.EnterRestState()
  else
    FadeFogOut()
    AIDirector.OnEndOfContractionsWave()
    Callbacks.RegisterForTimer("ExitScript", 10, false)
  end
end

function AIDirector.GetCurrentWaveDebugText()
  return "Wave 15"
end

function AIDirector.PlaySoundNewWave()
  if not MP.IsClient() then
    Extern.HostWaveSound = waveSounds.newWaveAlert
  end
  AIDirector.Super.PlaySoundNewWave()
end

function AIDirector.PlaySoundWaveAmbient()
  if not MP.IsClient() then
    Extern.HostWaveSound = waveSounds.startOfWave
  end
  AIDirector.Super.PlaySoundWaveAmbient()
end

function AIDirector.PlaySoundWaveOver()
  if not MP.IsClient() then
    Extern.HostWaveSound = waveSounds.endOfWave
  end
  AIDirector.Super.PlaySoundWaveOver()
end

StaggeredSpawns = AIDirector.StaggeredSpawns
UpdateAllSpawnPointList = AIDirector.UpdateAllSpawnPointList
RespawnLostEnemies = AIDirector.RespawnLostEnemies
EnterRampUpState = AIDirector.EnterRampUpState
OnAnyDeath = AIDirector.OnAnyDeath
DoRampUpState = AIDirector.DoRampUpState
EnterRampDownState = AIDirector.EnterRampDownState
EnterRestState = AIDirector.EnterRestState
PlaySoundNewWave = AIDirector.PlaySoundNewWave
OnHeavyFogRegionEnter = AIDirector.OnHeavyFogRegionEnter
OnHeavyFogRegionExit = AIDirector.OnHeavyFogRegionExit
UpdateHeavyFogAudioEffects = AIDirector.UpdateHeavyFogAudioEffects
RegisterHeavyFogCameraFilterRegions = AIDirector.RegisterHeavyFogCameraFilterRegions
UnregisterHeavyFogCameraFilterRegions = AIDirector.UnregisterHeavyFogCameraFilterRegions
ExitScript = AIDirector.ExitScript
CheckForAIDeaths = AIDirector.CheckForAIDeaths
SpawnHarvesterAndScheduleNext = AIDirector.SpawnHarvesterAndScheduleNext
DebugDisplay = AIDirector.DebugDisplay
OnPlayerStateChange = AIDirector.OnPlayerStateChange
UpdateFogEffectValues = AIDirector.UpdateFogEffectValues
if myObject ~= nil then
  if MP.IsClient() then
    Callbacks.RegisterForScriptValueUpdated("ClientUpdateLoop")
  else
    AIDirector.DoWaves()
  end
end
