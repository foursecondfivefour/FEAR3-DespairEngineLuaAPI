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
local AIDirector = {}
if myObject ~= nil then
  AIDirector = MP.AIDirectorBase.MakeChild(myObject)
end

function RegisterEnemyTemplates(templateTable, variableName, squadName, orderName)
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
  RegisterEnemyTemplates(AIDirector.enemyTemplates, "atc_smg_noCharge", "standard_squad", "soldier_orders")
  RegisterEnemyTemplates(AIDirector.enemyTemplates, "atc_smg", "standard_squad", "soldier_orders")
  RegisterEnemyTemplates(AIDirector.enemyTemplates, "atc_light_shotgun", "standard_squad", "soldier_orders")
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
  heightFar = 16,
  heightMax = 1,
  heightBottom = -25,
  heightTop = 0
}
fogInfo.fogValuesBetweenWave = {
  depthNear = 15,
  depthFar = 100,
  depthMax = 0.5,
  heightNear = 30,
  heightFar = 100,
  heightMax = 1,
  heightBottom = 8,
  heightTop = 20
}
fogInfo.fogValues.heightBottom = 4.1
fogInfo.fogValues.heightTop = 4.5
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
fogInfo.fogValues.heightFar = 10
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
  wave:RestTime(30)
  wave:RampUpTime(7)
  wave:SustainEnemyCount(20)
  wave:AddEnemy("atc_smg_noCharge", 0.3)
  wave:AddEnemy("atc_smg", 0.2)
  wave:AddEnemy("atc_light_shotgun", 0.5)
  wave:MaxEnemies1P(3)
  wave:MaxEnemies2P(5)
  wave:MaxEnemies3P(6)
  wave:MaxEnemies4P(7)
  AIDirector.NormalizeWaveTableWeights(AIDirector.waveInfoTable)
end

function AIDirector.NewWave(waveNum)
  Debug.PrintErrorIf(1 < waveNum, "This script only supports ONE wave.")
  return AIDirector.Super.NewWave(waveNum)
end

function AIDirector.GetRandomTemplateToSpawn(optionalEnemyInfo)
  local enemyInfoTable = AIDirector.waveInfo.enemyInfo
  if optionalEnemyInfo ~= nil then
    enemyInfoTable = optionalEnemyInfo
  end
  local randomNum = Utilities.GetRandomPercent()
  for e, enemyInfo in ipairs(enemyInfoTable) do
    if randomNum > enemyInfo.weight then
      randomNum = randomNum - enemyInfo.weight
    else
      local enemyType = AIDirector.enemyTemplates[enemyInfo.type]
      local numVariations = #enemyType
      Debug.PrintErrorIf(numVariations == 0, "Enemy type " .. enemyInfo.type .. " has no templates set")
      local varIndex = Utilities.GetRandomInteger(1, numVariations)
      return enemyType[varIndex], enemyType.squad, enemyType.order
    end
  end
  Debug.PrintError("GetRandomTemplateToSpawn() failed to find a good template")
  return nil, nil, nil
end

function AIDirector.SpawnAI()
  local templateName, squadName, orderName = AIDirector.GetRandomTemplateToSpawn()
  local newAI = AIDirector.Super.SpawnAI(templateName)
  if newAI == nil then
    Debug.PrintError("@summary SpawnAI() could not spawn AI in a wave script, the super class's SpawnAI function failed")
    return nil
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
  return "Wave 2"
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
