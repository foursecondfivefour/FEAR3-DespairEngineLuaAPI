local Callbacks = GameScript.Callbacks
local Game = GameScript.Game
local LuaHelpers = GameScript.LuaHelpers
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
local ObjectState = GameScript.ObjectState
local AIDirector = MP.AIDirectorBase
local Math3d = GameScript.LuaMath3d
local alma = {object = nil, targetIndex = -1}
local localPlayerSlowedByAlma
local prevHackMsgID = 0
local prevPlayerDownedByAlma = -1
local prevPlayerBlindedByAlma = -1
local prevPlayerTeleportedByAlma = -1
local prevPlayerSlowedDownByAlma = -1
local teleportCalledOnce = false
local numPlayers = Player.GetNumPlayers()
local maxPlayer = numPlayers - 1
local newWaveMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin New Wave", "")
local beginRestPeriodMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Rest Period", "")
local increaseAlmaDifficultyMsgId = Support.ImportStaticTextVariable("MissionEvent: Increase Alma Difficulty", "")
local almaSpawnTable = {}
Support.RegisterObjectTemplateVariable("Alma Object Template", "Used to spawn Alma.")
local almaSpawnPoints = Support.ImportObjectHandleVariable("Alma Spawn Points", "Valid points where Alma may randomly spawn.")
Support.ImportObjectHandleVariable("Alma Punishment Points", "Valid points where Alma may teleport players she punishes.")
Support.ExportFloatVariable("HackMsgID", 0, "Hack extern/export variable for the MissionEventMessage ID to be passed to clients.")
Support.ExportFloatVariable("PlayerDownedByAlma", -1, "Extern/export variable for broadcasting which player has been downed by Alma, if any.")
Support.ExportFloatVariable("PlayerBlindedByAlma", -1, "Extern/export variable for broadcasting which player has been blinded by Alma, if any.")
Support.ExportFloatVariable("PlayerTeleportedByAlma", -1, "Extern/export variable for broadcasting which player has been teleported by Alma, if any.")
Support.ExportFloatVariable("PlayerSlowedDownByAlma", -1, "Extern/export variable for broadcasting which player has been slowed down by Alma, if any.")
local debugSpawnAlmaOften = Support.ImportBoolVariableWithDefault("Debug Spawn Alma Often", "", false)
local enablePunishments = not Support.ImportBoolVariableWithDefault("Debug Disable Almas Punishments", "", false)
local spawnNearPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1
local almaDifficultyLevel = 1
local debugDrawAlmaAttack = Support.ImportBoolVariableWithDefault("Debug Draw Alma Attack", "", false)
debugDrawAlmaAttack = false
Support.ExportFloatVariable("Debug_AlmaPos_x", -1, "")
Support.ExportFloatVariable("Debug_AlmaPos_y", -1, "")
Support.ExportFloatVariable("Debug_AlmaPos_z", -1, "")
Support.ExportFloatVariable("Debug_AlmaVictimPos_x", -1, "")
Support.ExportFloatVariable("Debug_AlmaVictimPos_y", -1, "")
Support.ExportFloatVariable("Debug_AlmaVictimPos_z", -1, "")
local almaDebugInfo = {
  herPos = {
    x = -1,
    y = -1,
    z = -1
  },
  victimPos = {
    x = -1,
    y = -1,
    z = -1
  },
  attackTime = 0
}

function almaDebugInfo.herPos.IsValid(this)
  return this.x ~= -1 and this.y ~= -1 and this.z ~= -1
end

function almaDebugInfo.victimPos.IsValid(this)
  return this.x ~= -1 and this.y ~= -1 and this.z ~= -1
end

function almaDebugInfo.Reset(this)
  this.herPos.x, this.herPos.y, this.herPos.z = -1, -1, -1
  this.victimPos.x, this.victimPos.y, this.victimPos.z = -1, -1, -1
  this.attackTime = 0
end

local myObject = Game.GetMyObject()

function OnMissionEventMessage(message)
  if not MP.IsClient() then
    Extern.HackMsgID = message.textID
  end
  if message.textID == newWaveMsgId then
    OnStartOfWave()
  elseif message.textID == beginRestPeriodMsgId then
    OnEndOfWave()
  elseif message.textID == increaseAlmaDifficultyMsgId then
    almaDifficultyLevel = almaDifficultyLevel + 1
  end
end

function OnStartOfWave()
  if not MP.IsClient() then
    ScheduleAlmaSpawn()
  end
end

function OnEndOfWave()
  if not MP.IsClient() then
    KillAlma()
    Callbacks.UnregisterForTimer("KillAlmaAndScheduleRespawn")
    Callbacks.UnregisterForTimer("SpawnAlma")
  end
end

function ScheduleAlmaSpawn()
  if almaSpawnPoints ~= nil and 0 < #almaSpawnPoints then
    local randMin, randMax = 10, 20
    if debugSpawnAlmaOften then
      randMin, randMax = 10, 11
    end
    local almaTime = Utilities.GetRandomRealNumber(randMin, randMax)
    Callbacks.RegisterForTimer("SpawnAlma", almaTime, false)
  end
end

function GetSpawnpoint(targetIndex)
  local maxDesiredSpawnDistance = 30
  local playerTable = {}
  if targetIndex ~= GameScript.PlayerIndex.kNotAGlobalPlayer then
    table.insert(playerTable, targetIndex)
  else
    for curPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1, maxPlayer do
      if Player.IsActivePlayer(curPlayerIndex) then
        table.insert(playerTable, curPlayerIndex)
      end
    end
  end
  local nearbyPoints = {}
  if debugSpawnAlmaOften or 1 < almaDifficultyLevel then
    for k, curPlayerIndex in pairs(playerTable) do
      for s, spawnInfo in pairs(almaSpawnTable) do
        local distance = Player.GetPlayerDistanceToPosition(curPlayerIndex, spawnInfo.pos)
        if maxDesiredSpawnDistance > distance then
          LuaHelpers.AddUniqueItemToTable(nearbyPoints, spawnInfo)
        end
      end
    end
  end
  local unobstructedPoints = {}
  if debugSpawnAlmaOften or 2 < almaDifficultyLevel then
    for k, curPlayerIndex in pairs(playerTable) do
      for s, spawnInfo in pairs(nearbyPoints) do
        if Game.IsPlayerLookRotFacingObject(curPlayerIndex, spawnInfo.point, 43) then
          LuaHelpers.AddUniqueItemToTable(unobstructedPoints, spawnInfo)
        end
      end
    end
  end
  local visiblePoints = {}
  local candidatePoints
  if 0 < #visiblePoints then
    candidatePoints = visiblePoints
  elseif 0 < #unobstructedPoints then
    candidatePoints = unobstructedPoints
  elseif 0 < #nearbyPoints then
    candidatePoints = nearbyPoints
  else
    candidatePoints = almaSpawnTable
  end
  if debugSpawnAlmaOften or 4 < almaDifficultyLevel then
    local minDist = maxDesiredSpawnDistance
    local closestSpawnPoint
    for s, spawnInfo in pairs(candidatePoints) do
      local spawnPos = spawnInfo.pos
      for k, curPlayerIndex in pairs(playerTable) do
        local distance = Player.GetPlayerDistanceToPosition(curPlayerIndex, spawnInfo.pos)
        if minDist > distance then
          minDist = distance
          closestSpawnPoint = spawnPoint
        end
      end
    end
    if closestSpawnPoint ~= nil then
      return closestSpawnPoint
    end
  end
  return LuaHelpers.GetRandomItemFromTable(candidatePoints)
end

function SpawnAlma()
  Extern.Debug_AlmaPos_x, Extern.Debug_AlmaPos_y, Extern.Debug_AlmaPos_z = -1, -1, -1
  Extern.Debug_AlmaVictimPos_x, Extern.Debug_AlmaVictimPos_y, Extern.Debug_AlmaVictimPos_z = -1, -1, -1
  Extern.PlayerDownedByAlma = -1
  Extern.PlayerBlindedByAlma = -1
  Extern.PlayerTeleportedByAlma = -1
  Extern.PlayerSlowedDownByAlma = -1
  local almasPreferredTargetPlayer = GameScript.PlayerIndex.kNotAGlobalPlayer
  if debugSpawnAlmaOften or 1 < almaDifficultyLevel then
    spawnNearPlayerIndex = spawnNearPlayerIndex + 1
    if spawnNearPlayerIndex > MP.GetNumberOfActivePlayers() - 1 then
      spawnNearPlayerIndex = GameScript.PlayerIndex.kGlobalPlayer1
    end
    if Player.IsActivePlayer(spawnNearPlayerIndex) then
      almasPreferredTargetPlayer = spawnNearPlayerIndex
    end
  end
  local spawnPoint = GetSpawnpoint(almasPreferredTargetPlayer)
  if spawnPoint == nil then
    Debug.PrintError("almasPreferredTargetPlayer : " .. tostring(almasPreferredTargetPlayer) .. " @summary SpawnAlma() failed to find a valid spawnPoint - scheduling respawn")
    ScheduleAlmaSpawn()
    return
  end
  local almaSpawnPos = spawnPoint.pos
  local almaSpawnRot = spawnPoint.rot
  alma.object = Game.SpawnWithRotation("Alma Object Template", almaSpawnPos, almaSpawnRot)
  alma.targetIndex = -1
  if alma.object == nil then
  end
  Callbacks.RegisterForMsg(GameScript.MsgCallback.LabelStateAnimationTag, alma.object, "OnAlmaPoint")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.DeleteObjectMessage, alma.object, "OnAlmaDeleted")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.KillObjectMessage, alma.object, "OnAlmaKilled")
  Game.SetAnimationVariable(alma.object, "Walk", 1)
  local almaTime = Utilities.GetRandomRealNumber(20, 21)
  Callbacks.RegisterForTimer("KillAlmaAndScheduleRespawn", almaTime, false)
end

function PlayShortAlmaPunishmentSound()
  Game.SendTextMessage(myObject, "play short alma punishment sound")
end

function PlayLongAlmaPunishmentSound()
  Game.SendTextMessage(myObject, "play long alma punishment sound")
end

function OnAlmaPoint(TagInfo)
  local targetInfo
  if alma.object ~= nil then
    targetInfo = AI.GetAITargetInfo(alma.object)
  end
  if targetInfo ~= nil and targetInfo.m_bIsInfoValid and targetInfo.m_bIsPlayerControlled then
    alma.targetIndex = targetInfo.m_nControllingPlayerIndex
    Game.SendTextMessage(alma.object, "alma is pointing")
    Callbacks.UnregisterForTimer("KillAlmaAndScheduleRespawn")
    Callbacks.RegisterForTimer("KillAlmaAndScheduleRespawn", 1.5, false)
    RotateAlmaTowardTarget()
    Callbacks.RegisterForTimer("TeleportAlma", 0.3, false)
    DoAlmaPunishment()
  end
end

function OnAlmaDeleted()
  OnAlmaRemovedUnexpectedly()
end

function OnAlmaKilled()
  OnAlmaRemovedUnexpectedly()
end

function OnAlmaRemovedUnexpectedly()
  alma.object = nil
end

function RotateAlmaTowardTarget()
  local playerObj = Player.GetPlayerControlledObjectByIndex(alma.targetIndex)
  local playerLocation = Game.GetPosition(playerObj)
  local almaLocation = Game.GetPosition(alma.object)
  local almaToPlayerVect = Math3d.VectorSubtract(playerLocation, almaLocation)
  Math3d.VectorNormalize(almaToPlayerVect)
  local almaRotation = Math3d.GetRotationForForward(almaToPlayerVect)
  Game.TeleportObjectWithRotation(alma.object, almaLocation, almaRotation)
end

function TeleportAlma()
  local playerObj = Player.GetPlayerControlledObjectByIndex(alma.targetIndex)
  local playerLocation = Game.GetPosition(playerObj)
  local almaLocation = Game.GetPosition(alma.object)
  local playerToAlmaVect = Math3d.VectorSubtract(almaLocation, playerLocation)
  Math3d.VectorNormalize(playerToAlmaVect)
  almaLocation = Math3d.VectorAdd(playerLocation, Math3d.VectorMultiply(playerToAlmaVect, 2))
  local almaRotation = Math3d.GetRotationForForward(Math3d.VectorMultiply(playerToAlmaVect, -1))
  Game.TeleportObjectWithRotation(alma.object, almaLocation, almaRotation)
end

function DoAlmaPunishment()
  if alma.targetIndex == -1 then
    return
  end
  if alma.object == nil then
    return
  end
  local victimObj = Player.GetPlayerControlledObjectByIndex(alma.targetIndex)
  if enablePunishments == false then
    if not IsCarryingCrate(victimObj) then
      Game.SendTextMessage(victimObj, "stunned by alma")
    end
    PlayShortAlmaPunishmentSound()
    return
  end
  local almaPos = Game.GetPosition(alma.object)
  Extern.Debug_AlmaPos_x, Extern.Debug_AlmaPos_y, Extern.Debug_AlmaPos_z = almaPos.x, almaPos.y, almaPos.z
  local victimPos = Game.GetPosition(victimObj)
  Extern.Debug_AlmaVictimPos_x, Extern.Debug_AlmaVictimPos_y, Extern.Debug_AlmaVictimPos_z = victimPos.x, victimPos.y, victimPos.z
  local possiblePunishments = {AlmaPunishment_SlowDown, AlmaPunishment_Blinded}
  if 1 < almaDifficultyLevel then
    table.insert(possiblePunishments, AlmaPunishment_Teleport)
  end
  if 2 < almaDifficultyLevel then
    table.insert(possiblePunishments, AlmaPunishment_NearDeath)
  end
  local chosenPunishment = LuaHelpers.GetRandomItemFromTable(possiblePunishments)
  chosenPunishment(alma.targetIndex)
end

function IsMech(playerControlledObject)
  return Game.ObjectTags.DoesObjectHaveTag(playerControlledObject, "Power Armor")
end

function GetPlayerInsideMech(playerControlledMech)
  local InventoryTable = Game.GetInventoryItems(playerControlledMech, 4)
  return InventoryTable[1]
end

function KickPlayerOutOfMech(playerControlledMech)
  local driver = GetPlayerInsideMech(playerControlledMech)
  if driver and Game.IsRiding(driver) then
    Game.ForceRiderOutOfVehicle(driver, playerControlledMech, true)
    return true
  end
  return false
end

function IsCarryingCrate(playerObj)
  local augInv = Game.GetInventoryItemsByTypeAndName(playerObj, 3, "Medkit Inventory")
  return 0 < #augInv
end

function AlmaPunishment_NearDeath(playerIndex)
  if Player.IsActivePlayer(playerIndex) then
    local playerObj = Player.GetPlayerControlledObjectByIndex(playerIndex)
    if playerObj == nil then
      Debug.PrintError("Player " .. playerIndex .. " could not be punished " .. "@summary The target for Alma's punishment has a nil avatar")
      return
    end
    Game.SendTextMessage(playerObj, "enable alma attack glow effects 3 seconds")
    local mechObj
    if IsMech(playerObj) then
      mechObj = playerObj
      playerObj = GetPlayerInsideMech(mechObj)
    end
    if Player.IsLocalPlayer(playerIndex) and mechObj ~= nil then
      KickPlayerOutOfMech(mechObj)
    end
    if not MP.IsClient() then
      Game.Damage(playerObj, 100)
      Extern.PlayerDownedByAlma = playerIndex
    end
    if Player.IsLocalPlayer(playerIndex) then
      PlayShortAlmaPunishmentSound()
      almaDebugInfo:Reset()
      almaDebugInfo.attackTime = Support.GetGameTime()
    end
  else
    Debug.PrintError("Player " .. playerIndex .. " could not be punished " .. "@summary The player Alma targeted is not active any longer, possible disconnect")
  end
end

function AlmaPunishment_Blinded(playerIndex)
  if Player.IsActivePlayer(playerIndex) then
    local playerObj = Player.GetPlayerControlledObjectByIndex(playerIndex)
    if playerObj == nil then
      Debug.PrintError("Player " .. playerIndex .. " could not be punished " .. "@summary The target for Alma's punishment has a nil avatar")
      return
    end
    Game.SendTextMessage(playerObj, "enable alma attack glow effects 10 seconds")
    if not IsCarryingCrate(playerObj) then
      Game.SendTextMessage(playerObj, "stunned by alma")
    end
    if not MP.IsClient() then
      Extern.PlayerBlindedByAlma = playerIndex
    end
    if Player.IsLocalPlayer(playerIndex) then
      Game.SendTextMessage(playerObj, "blinded by alma")
      PlayLongAlmaPunishmentSound()
      almaDebugInfo:Reset()
      almaDebugInfo.attackTime = Support.GetGameTime()
    end
  else
    Debug.PrintError("Player " .. playerIndex .. " could not be punished " .. "@summary The player Alma targeted is not active any longer, possible disconnect")
  end
end

function AlmaPunishment_Teleport(playerIndex)
  if Player.IsActivePlayer(playerIndex) then
    local playerObj = Player.GetPlayerControlledObjectByIndex(playerIndex)
    if playerObj == nil then
      Debug.PrintError("Player " .. playerIndex .. " could not be punished " .. "@summary The target for Alma's punishment has a nil avatar")
      return
    end
    Game.SendTextMessage(playerObj, "enable teleported by alma glow effects")
    if not IsCarryingCrate(playerObj) then
      Game.SendTextMessage(playerObj, "stunned by alma")
    end
    if not MP.IsClient() then
      Extern.PlayerTeleportedByAlma = playerIndex
    end
    if Player.IsLocalPlayer(playerIndex) then
      PlayShortAlmaPunishmentSound()
      Game.SendTextMessage(playerObj, "teleported by alma fadeout")
      Callbacks.RegisterForTimer("DoAlmaTeleport", 1.5, false)
      teleportCalledOnce = false
      almaDebugInfo:Reset()
      almaDebugInfo.attackTime = Support.GetGameTime()
    end
  else
    Debug.PrintError("Player " .. playerIndex .. " could not be punished " .. "@summary The player Alma targeted is not active any longer, possible disconnect")
  end
end

function AlmaPunishment_SlowDown(playerIndex)
  if Player.IsActivePlayer(playerIndex) then
    local playerObj = Player.GetPlayerControlledObjectByIndex(playerIndex)
    if playerObj == nil then
      Debug.PrintError("Player " .. playerIndex .. " could not be punished " .. "@summary The target for Alma's punishment has a nil avatar")
      return
    end
    Game.SendTextMessage(playerObj, "enable alma attack glow effects 10 seconds")
    if not IsCarryingCrate(playerObj) then
      Game.SendTextMessage(playerObj, "stunned by alma")
    end
    if not MP.IsClient() then
      Extern.PlayerSlowedDownByAlma = playerIndex
    end
    if Player.IsLocalPlayer(playerIndex) then
      Player.SetVelocityScale(playerObj, 0.2)
      PlayLongAlmaPunishmentSound()
      Game.SendTextMessage(playerObj, "slowed down by alma")
      Callbacks.RegisterForTimer("EndOfAlmaSlowDown", 9.5, false)
      localPlayerSlowedByAlma = playerObj
      almaDebugInfo:Reset()
      almaDebugInfo.attackTime = Support.GetGameTime()
    end
  else
    Debug.PrintError("Player " .. playerIndex .. " could not be punished " .. "@summary The player Alma targeted is not active any longer, possible disconnect")
  end
end

function DoAlmaTeleport()
  local playerObj = Player.GetPlayerControlledObjectByIndex(Extern.PlayerTeleportedByAlma)
  if teleportCalledOnce and (IsMech(playerObj) or Game.IsRiding(playerObj)) then
    Callbacks.RegisterForTimer("DoAlmaTeleport", 0.1, false)
    return
  end
  if IsMech(playerObj) then
    KickPlayerOutOfMech(playerObj)
    Callbacks.RegisterForTimer("DoAlmaTeleport", 0.25, false)
    teleportCalledOnce = true
    return
  elseif Game.IsRiding(playerObj) then
    Callbacks.RegisterForTimer("DoAlmaTeleport", 0.25, false)
    teleportCalledOnce = true
    return
  end
  Game.SendTextMessage(playerObj, "teleported by alma fadein")
  local teleportPoints = Support.GetImportObjectTable("Alma Punishment Points")
  local pointObject = LuaHelpers.GetRandomItemFromTable(teleportPoints)
  local teleportPos = Game.GetPosition(pointObject)
  local teleportRot = Game.GetRotation(pointObject)
  Game.TeleportObjectWithRotation(playerObj, teleportPos, teleportRot)
end

function EndOfAlmaSlowDown()
  if localPlayerSlowedByAlma ~= nil and Game.IsLoaded(localPlayerSlowedByAlma) then
    Player.SetVelocityScale(localPlayerSlowedByAlma, 1)
    localPlayerSlowedByAlma = nil
  end
end

function KillAlmaAndScheduleRespawn()
  KillAlma()
  ScheduleAlmaSpawn()
end

function KillAlma()
  if alma.object ~= nil then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.LabelStateAnimationTag, alma.object, "OnAlmaPoint")
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.DeleteObjectMessage, alma.object, "OnAlmaDeleted")
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.KillObjectMessage, alma.object, "OnAlmaKilled")
    Callbacks.UnregisterForTimer("TeleportAlma")
    Game.SendTextMessage(alma.object, "flicker out")
    alma.object = nil
  end
end

function DebugAlma()
  AlmaDebugUpdate()
end

function ClientUpdateLoop()
  if prevHackMsgID ~= Extern.HackMsgID then
    local message = {
      textID = Extern.HackMsgID
    }
    OnMissionEventMessage(message)
    prevHackMsgID = Extern.HackMsgID
  end
  if prevPlayerDownedByAlma ~= Extern.PlayerDownedByAlma then
    if Extern.PlayerDownedByAlma ~= -1 then
      AlmaPunishment_NearDeath(Extern.PlayerDownedByAlma)
    end
    prevPlayerDownedByAlma = Extern.PlayerDownedByAlma
  end
  if prevPlayerBlindedByAlma ~= Extern.PlayerBlindedByAlma then
    if Extern.PlayerBlindedByAlma ~= -1 then
      AlmaPunishment_Blinded(Extern.PlayerBlindedByAlma)
    end
    prevPlayerBlindedByAlma = Extern.PlayerBlindedByAlma
  end
  if prevPlayerTeleportedByAlma ~= Extern.PlayerTeleportedByAlma then
    if Extern.PlayerTeleportedByAlma ~= -1 then
      AlmaPunishment_Teleport(Extern.PlayerTeleportedByAlma)
    end
    prevPlayerTeleportedByAlma = Extern.PlayerTeleportedByAlma
  end
  if prevPlayerSlowedDownByAlma ~= Extern.PlayerSlowedDownByAlma then
    if Extern.PlayerSlowedDownByAlma ~= -1 then
      AlmaPunishment_SlowDown(Extern.PlayerSlowedDownByAlma)
    end
    prevPlayerSlowedDownByAlma = Extern.PlayerSlowedDownByAlma
  end
end

function AlmaDebugUpdate()
  if not debugDrawAlmaAttack then
    return
  end
  if almaDebugInfo.attackTime == 0 then
    return
  end
  local herPos = almaDebugInfo.herPos
  local timeSinceAttack = Support.GetGameTime() - almaDebugInfo.attackTime
  if 20 < timeSinceAttack then
    almaDebugInfo:Reset()
    return
  end
  if not herPos:IsValid() then
    herPos.x, herPos.y, herPos.z = Extern.Debug_AlmaPos_x, Extern.Debug_AlmaPos_y + 1.3, Extern.Debug_AlmaPos_z
  end
  local victimPos = almaDebugInfo.victimPos
  if not victimPos:IsValid() then
    victimPos.x, victimPos.y, victimPos.z = Extern.Debug_AlmaVictimPos_x, Extern.Debug_AlmaVictimPos_y + 1.3, Extern.Debug_AlmaVictimPos_z
  end
  if herPos:IsValid() then
    Debug.DrawSphere(herPos, 0.5, Utilities.kOrange)
    if victimPos:IsValid() then
      Debug.DrawLine(herPos, victimPos, Utilities.kOrange)
      Debug.DrawSphere(victimPos, 0.2, Utilities.kRed)
    end
  end
end

function HandleTextMessage(msgTable)
  if msgTable.text == "EndLife" then
    Callbacks.UnregisterForUpdateEveryFrame()
    Support.ExitScript()
  end
end

function ImportAlmaSpawnPoints()
  if almaSpawnPoints ~= nil then
    for s, spawnPoint in pairs(almaSpawnPoints) do
      if Game.IsLoaded(spawnPoint) then
        local spawnInfo = {
          pos = Game.GetPosition(spawnPoint),
          rot = Game.GetRotation(spawnPoint),
          point = spawnPoint
        }
        table.insert(almaSpawnTable, spawnInfo)
      end
    end
  end
end

if myObject ~= nil and not debugDisableAlma then
  if not MP.IsClient() then
    almaDifficultyLevel = 1
    Callbacks.RegisterForTimer("ImportAlmaSpawnPoints", 0.5, false)
    if debugSpawnAlmaOften then
      Callbacks.RegisterForTimer("ScheduleAlmaSpawn", 5, false)
    else
      Callbacks.RegisterForMsg(GameScript.MsgCallback.MissionEventMessage, myObject, "OnMissionEventMessage")
    end
    Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, myObject, "HandleTextMessage")
  else
    Callbacks.RegisterForScriptValueUpdated("ClientUpdateLoop")
  end
end
