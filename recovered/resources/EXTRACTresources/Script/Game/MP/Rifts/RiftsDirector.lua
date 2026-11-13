local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local LuaHelpers = GS.LuaHelpers
local Player = Game.Player
local Support = GS.Support
local Debug = GS.Debug
local Objectives = Game.Objectives
local Graphics = Game.Graphics
local Regions = Game.Regions
local Sets = Game.Sets
local Utilities = GS.Utilities
local MP = Game.MP
local Physics = Game.Physics
local AI = Game.AI
local ObjectState = GS.ObjectState
local AIDirector = MP.AIDirectorBase
local FEAR = GS.FEAR
local FEARScore = GS.FEARScore
local kDebugMemoryTest = false
local kMaxNumWaves = 20
local kMaxNumRounds = 3
local kWrapWaves = false
local kCelebrationAnimGraphName = "Celebration Animation Graph Resource"
local localPlayer
local prevHackMsgID = 0
local prevHackGameWon = 0
local prevWaveNumber = 0
local waveStartTime = 0
local wavePlayersDowned = 0
local waveTotalCratesReturned = 0
local playerCratesReturned = {}
playerCratesReturned[GS.PlayerIndex.kGlobalPlayer1] = 0
playerCratesReturned[GS.PlayerIndex.kGlobalPlayer2] = 0
playerCratesReturned[GS.PlayerIndex.kGlobalPlayer3] = 0
playerCratesReturned[GS.PlayerIndex.kGlobalPlayer4] = 0
local consecutiveWavesNoCrates = 0
local SentLastManStandingMsg = false
local debugMemorySizes = {
  persistent = nil,
  waste = {current = 0, max = 0},
  waves = {},
  waveUpdate = false
}

function debugMemorySizes.Clear(this)
  this.persistent = nil
  this.waste.current = 0
  this.waste.max = 0
  this.waves = {}
  waveUpdate = false
end

local debugDisableRiftEvent = false
local m_bPlayersRegistered = false
local kNumWaves = Support.ImportFloatVariableWithDefault("Num Waves (max " .. kMaxNumWaves .. ")", "", 5)
local disableWithFogSet = Support.ImportObjectHandleVariable("Items to Disable When Fog Rolls In (SET)", "Set for collection of objects that should be disabled when the fog rolls in, and reenabled when it rolls out.")
local newWaveMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin New Wave", "")
local beginRestPeriodMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Rest Period", "")
local increaseAlmaDifficultyMsgId = Support.ImportStaticTextVariable("MissionEvent: Increase Alma Difficulty", "")
local riftPulseCinemaObj = Support.ImportSingleObject("RiftPulse Cinema Object", "")
Support.RegisterWorldVectorVariable("Persistent Worlds", "")

function MakeWaveWorldString(waveNum)
  return "Wave " .. waveNum .. " World(s)"
end

for i = 1, kMaxNumWaves do
  Support.RegisterWorldVectorVariable(MakeWaveWorldString(i), "")
end
Support.CreateWorldVectorVariable("Desired Worlds", "")
Support.CreateWorldVectorVariable("Required Worlds", "")
Support.ExportFloatVariable("HackMsgID", 0, "Hack extern/export variable for the MissionEventMessage ID to be passed to clients.")
Support.ExportFloatVariable("HackGameWon", 0, "Hack extern/export variable for the host to tell clients to celebrate, they won the game!")
Support.ExportFloatVariable("WaveNumber", 1, "Extern/export variable for the wave number to be passed to clients.")
Support.ExportFloatVariable("RoundNumber", 1, "Extern/export variable for the round number to be passed to clients.")
local weaponRackSet = Support.ImportSetObject("Weapon Rack Objects Set", "The weapon rack objects placed in the level")
local barrierSet = Support.ImportSetObject("Barrier Objects Set", "The set of barrier objects placed in the level")
local AlmaScript = Support.ImportObjectHandleVariable("Wandering Alma Script Object", "")
Support.RegisterAnimationGraphResourceVariable(kCelebrationAnimGraphName, "The animation graph with the player celebration anims.")
local myObject = Game.GetMyObject()
local kWaveScores = {}
kWaveScores[1] = Support.ImportFloatVariableWithDefault("Score : Wave 1", "", 100)
for i = 2, kMaxNumWaves * kMaxNumRounds do
  kWaveScores[i] = Support.ImportFloatVariableWithDefault("-----Score : Wave " .. i, "", 100)
end
local kScoreSurvivalIncrement = Support.ImportFloatVariableWithDefault("Score : Survival Increment", "", 100)
local score = {
  totalPoints = 0,
  wavePoints = kWaveScores[1],
  survivalBonus = kScoreSurvivalIncrement
}
Support.ExportFloatVariable("totalPoints", 0, "Extern/export variable for score info to be passed to clients.")
Support.ExportFloatVariable("wavePoints", 0, "Extern/export variable for score info to be passed to clients.")
Support.ExportFloatVariable("survivalBonus", 1, "Extern/export variable for score info to be passed to clients.")

function score.PlayerDown(this)
  if this.survivalBonus > 0 then
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Contraction Survival Bonus Lost")
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
    FEAR.BroadcastAnnoucementPacket(announcementID)
  end
end

function score.WaveOver(this)
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) then
    end
  end
  this.totalPoints = this.wavePoints + this.survivalBonus
  this.survivalBonus = this.survivalBonus + kScoreSurvivalIncrement
  this.wavePoints = kWaveScores[Extern.WaveNumber * Extern.RoundNumber]
end

function score.NetworkSync(this)
  if MP.IsClient() then
    this.totalPoints = Extern.totalPoints
    this.wavePoints = Extern.wavePoints
    this.survivalBonus = Extern.survivalBonus
  else
    Extern.totalPoints = this.totalPoints
    Extern.wavePoints = this.wavePoints
    Extern.survivalBonus = this.survivalBonus
  end
end

function score.PrintEndOfWaveUpdate(this)
  local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Contraction Wave Score")
  FEAR.AddNumberValueToAnnouncementPacket(announcementID, score.wavePoints)
  FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
  FEAR.BroadcastAnnoucementPacket(announcementID)
  announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Contraction Survival Bonus")
  FEAR.AddNumberValueToAnnouncementPacket(announcementID, score.survivalBonus)
  FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
  FEAR.BroadcastAnnoucementPacket(announcementID)
  announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Contraction Round Total")
  FEAR.AddNumberValueToAnnouncementPacket(announcementID, score.wavePoints + score.survivalBonus)
  FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
  FEAR.BroadcastAnnoucementPacket(announcementID)
  announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Contraction Total Score")
  FEAR.AddNumberValueToAnnouncementPacket(announcementID, score.totalPoints + score.wavePoints + score.survivalBonus)
  FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityMedium)
  FEAR.BroadcastAnnoucementPacket(announcementID)
end

function GetActualNumPlayers()
  local ActualNumPlayers = 0
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) then
      ActualNumPlayers = ActualNumPlayers + 1
    end
  end
  return ActualNumPlayers
end

function EnableRepairableBarriers()
  if barrierSet ~= nil then
    local barrierObjs = Sets.GetObjectsInSet(barrierSet)
    for k, obj in pairs(barrierObjs) do
      if obj ~= nil then
        Game.SendMissionEventMessage(obj, beginRestPeriodMsgId)
      end
    end
  end
end

function DisableRepairableBarriers()
  if barrierSet ~= nil then
    local barrierObjs = Sets.GetObjectsInSet(barrierSet)
    for k, obj in pairs(barrierObjs) do
      if obj ~= nil then
        Game.SendMissionEventMessage(obj, newWaveMsgId)
      end
    end
  end
end

function OnMissionEventMessage(message)
  if not MP.IsClient() then
    Extern.HackMsgID = message.textID
    if AlmaScript ~= nil and 0 < #AlmaScript and AlmaScript[1] ~= nil and AlmaScript[1] ~= myObject then
      Game.SendMissionEventMessage(AlmaScript[1], message.textID)
    end
  end
  if message.textID == newWaveMsgId then
    OnStartOfWave()
  elseif message.textID == beginRestPeriodMsgId then
    if not MP.IsClient() then
      DisplayEndOfWaveMessages(Extern.WaveNumber)
    end
    OnEndOfWave()
  end
end

function DoStartupStreaming()
  if kDebugMemoryTest then
    Callbacks.RegisterForTimer("StreamNextWaveMap", 10, false)
    return
  else
    Callbacks.UnregisterForMsg(GS.MsgCallback.EnterPlayableState, myObject, "DoStartupStreaming")
  end
  Support.RemoveFromWorldVectorVariable("Desired Worlds", "Desired Worlds")
  Support.AddToWorldVectorVariable("Desired Worlds", MakeWaveWorldString(1))
  Support.RemoveFromWorldVectorVariable("Required Worlds", "Required Worlds")
  Support.AddToWorldVectorVariable("Required Worlds", "Persistent Worlds")
  GS.Game.StreamWorldsWithSaveOverride("Desired Worlds", "Required Worlds", false)
  Callbacks.RegisterForTimer("StreamNextWaveMap", 15, false)
end

function StreamNextWaveMap()
  if Game.GetNumDesiredWorldsPending() > 0 then
    if AIDirector.debugDraw then
      Debug.PrintToScreenWithTimer("NOT Streaming in map for wave " .. Extern.WaveNumber, 1, Utilities.kGreen, false)
      Debug.PrintToScreenWithTimer("  Wave world is still loading." .. Extern.WaveNumber, 1, Utilities.kGreen, false)
      Debug.PrintToScreenWithTimer("  We'll try again in a second." .. Extern.WaveNumber, 1, Utilities.kGreen, false)
    end
    Callbacks.RegisterForTimer("StreamNextWaveMap", 1, false)
    return
  end
  if kDebugMemoryTest then
    debugMemorySizes.waveUpdate = false
    if debugMemorySizes.waves[kMaxNumWaves] ~= nil then
      StreamOutAllWaves()
      return
    end
    Support.RemoveFromWorldVectorVariable("Desired Worlds", "Desired Worlds")
    Support.RemoveFromWorldVectorVariable("Required Worlds", "Required Worlds")
    Support.AddToWorldVectorVariable("Required Worlds", "Persistent Worlds")
    GS.Game.StreamWorldsWithSaveOverride("Desired Worlds", "Required Worlds", false)
    Callbacks.RegisterForTimer("MemoryTestDesireCurrentWave", 5, false)
    return
  end
  if AIDirector.debugDraw then
    Debug.PrintToScreenWithTimer("Streaming in map for wave " .. Extern.WaveNumber + (Extern.RoundNumber - 1) * kNumWaves, 10, Utilities.kGreen, false)
  end
  local nextWaveNum = Extern.WaveNumber + 1
  if nextWaveNum > kNumWaves then
    if kDebugMemoryTest then
      StreamOutAllWaves()
      return
    end
    if kWrapWaves then
      nextWaveNum = 1
    else
      nextWaveNum = nil
    end
  end
  Support.RemoveFromWorldVectorVariable("Desired Worlds", "Desired Worlds")
  if nextWaveNum ~= nil then
    Support.AddToWorldVectorVariable("Desired Worlds", MakeWaveWorldString(nextWaveNum))
  end
  Support.RemoveFromWorldVectorVariable("Required Worlds", "Required Worlds")
  Support.AddToWorldVectorVariable("Required Worlds", "Persistent Worlds")
  Support.AddToWorldVectorVariable("Required Worlds", MakeWaveWorldString(Extern.WaveNumber))
  GS.Game.StreamWorldsWithSaveOverride("Desired Worlds", "Required Worlds", false)
end

function MemoryTestDesireCurrentWave()
  if AIDirector.debugDraw then
    Debug.PrintToScreenWithTimer("Streaming in map for wave " .. Extern.WaveNumber, 10, Utilities.kGreen, false)
  end
  debugMemorySizes.waste.current = debugMemorySizes.persistent - Debug.GetSystemFreeMB()
  if debugMemorySizes.waste.max < debugMemorySizes.waste.current then
    debugMemorySizes.waste.max = debugMemorySizes.waste.current
  end
  debugMemorySizes.waveUpdate = true
  Support.RemoveFromWorldVectorVariable("Desired Worlds", "Desired Worlds")
  Support.AddToWorldVectorVariable("Desired Worlds", MakeWaveWorldString(Extern.WaveNumber))
  Support.RemoveFromWorldVectorVariable("Required Worlds", "Required Worlds")
  Support.AddToWorldVectorVariable("Required Worlds", "Persistent Worlds")
  GS.Game.StreamWorldsWithSaveOverride("Desired Worlds", "Required Worlds", false)
  Callbacks.RegisterForTimer("MemoryTestRequireCurrentWave", 15, false)
end

function MemoryTestRequireCurrentWave()
  if Game.GetNumDesiredWorldsPending() > 0 then
    Callbacks.RegisterForTimer("MemoryTestRequireCurrentWave", 1, false)
    return
  end
  Support.RemoveFromWorldVectorVariable("Desired Worlds", "Desired Worlds")
  Support.RemoveFromWorldVectorVariable("Required Worlds", "Required Worlds")
  Support.AddToWorldVectorVariable("Required Worlds", "Persistent Worlds")
  Support.AddToWorldVectorVariable("Required Worlds", MakeWaveWorldString(Extern.WaveNumber))
  GS.Game.StreamWorldsWithSaveOverride("Desired Worlds", "Required Worlds", false)
end

function StreamOutAllWaves()
  Support.RemoveFromWorldVectorVariable("Desired Worlds", "Desired Worlds")
  Support.RemoveFromWorldVectorVariable("Required Worlds", "Required Worlds")
  Support.AddToWorldVectorVariable("Required Worlds", "Persistent Worlds")
  GS.Game.StreamWorldsWithSaveOverride("Desired Worlds", "Required Worlds", false)
  if kDebugMemoryTest then
    Callbacks.RegisterForTimer("AddEndOfTestMemoryLogMark", 5, false)
  end
end

function AddStartOfTestMemoryLogMark()
  if Debug.MemoryLogMark ~= nil then
    Debug.MemoryLogMark("Before Loading First Wave")
  end
  Debug.PrintToScreenWithTimer("*** No waves streamed in yet - Start of Test ***", 10, Utilities.kGreen, false)
  if Debug.GetSystemMemoryAvailable ~= nil then
    debugMemorySizes.persistent = Debug.GetSystemFreeMB()
  end
end

function AddEndOfTestMemoryLogMark()
  if Debug.MemoryLogMark ~= nil then
    Debug.MemoryLogMark("After Unloading Last Wave")
  end
  Debug.PrintToScreenWithTimer("*** All waves streamed out - Test Over ***", 999, Utilities.kGreen, false)
  debugMemorySizes.waste.current = debugMemorySizes.persistent - Debug.GetSystemFreeMB()
  if debugMemorySizes.waste.max < debugMemorySizes.waste.current then
    debugMemorySizes.waste.max = debugMemorySizes.waste.current
  end
end

function HandleObjectStateChangeMsg(msgTable)
  local newInNearDeath = msgTable.newState == GameScript.ObjectState.NearDeath
  if newInNearDeath then
    CheckForLastManStanding()
    CheckForEndOfGame()
  else
    CheckForLastManStanding()
  end
end

function OnStartOfWave()
  local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Starting Wave")
  FEAR.AddNumberValueToAnnouncementPacket(announcementID, Extern.WaveNumber + (Extern.RoundNumber - 1) * kNumWaves)
  FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
  FEAR.BroadcastAnnoucementPacket(announcementID)
  FEAR.SetGenericCounter(Extern.WaveNumber)
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    playerObject = Player.GetPlayerControlledObjectByIndex(index)
    if playerObject ~= nil then
      Game.SendMissionEventMessage(playerObject, newWaveMsgId)
    end
  end
  StartRiftPulse()
  DisableRepairableBarriers()
  waveStartTime = Support.GetGameTime()
  if not m_bPlayersRegistered then
    CheckForEndOfGame()
    RegisterAllPlayers()
  end
  Game.SendMissionEventMessage(Utilities.GetGlobalDataObject(), newWaveMsgId)
end

function RegisterAllPlayers()
  local numPlayers = Player.GetNumPlayers() - 1
  for playerIndex = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(playerIndex) then
      RegisterPlayerCallback(playerIndex)
    end
  end
  if FEARSquadSet ~= nil then
    Callbacks.RegisterSetTracker(FEARSquadSet, "", "HandleRemovedFromSet")
  end
  m_bPlayersRegistered = true
end

function RegisterPlayerCallback(playerIndex)
  local playerAvatarObject = Player.GetPlayerAvatarObjectByIndex(playerIndex)
  if MP.GetTeamForPlayer(playerIndex) == 1 then
    Debug.PrintError("Player " .. tostring(playerIndex) .. " callbacks not set, the player is a Spectre already. Weirdness will probably commence shortly. @summary Player is on team 1 during callback registration")
    return
  end
  if playerAvatarObject ~= nil then
    Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, playerAvatarObject, "HandleObjectStateChangeMsg")
    if FEARSquadSet ~= nil then
      Sets.AddObjectToSet(FEARSquadSet, playerAvatarObject)
    end
  else
    Debug.PrintError("Player " .. tostring(playerIndex) .. " callbacks not set, the player avatar is nil @summary Player callbacks not be set because the Avatar Object is nil")
  end
end

function UnregisterPlayerCallback(playerIndex)
  local playerAvatarObject = Player.GetPlayerAvatarObjectByIndex(playerIndex)
  if playerAvatarObject ~= nil and MP.GetTeamForPlayer(playerIndex) == 0 then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, playerAvatarObject, "HandleObjectStateChangeMsg")
    if FEARSquadSet ~= nil then
      Sets.RemoveObjectFromSet(FEARSquadSet, playerAvatarObject)
    end
  end
end

function OnEndOfWave()
  local waveTime = Support.GetGameTime() - waveStartTime
  local timeTextMins = math.floor(waveTime / 60)
  local timeTextSecs = math.floor(waveTime % 60)
  if timeTextSecs < 10 then
    timeTextSecs = "0" .. timeTextSecs
  end
  if Extern.WaveNumber > 3 then
    AIDirector.enableHarvesters()
  end
  score:NetworkSync()
  Game.SendMissionEventMessage(Utilities.GetGlobalDataObject(), beginRestPeriodMsgId)
  if not MP.IsClient() then
    if kDebugMemoryTest then
      debugMemorySizes.waveUpdate = false
    end
    if wavePlayersDowned == 0 and Game.GetDifficulty() == 4 and MP.GetNumberOfActivePlayers() == 1 then
      for key, index in pairs(GameScript.PlayerIndex) do
        if Player.IsActivePlayer(index) then
          Game.AwardAchievementOccurrence(index, GameScript.Achievements.Hard_Wave_No_LS_Contractions)
        end
      end
    end
    if waveTotalCratesReturned == 0 then
      consecutiveWavesNoCrates = consecutiveWavesNoCrates + 1
      if 3 <= consecutiveWavesNoCrates then
        for key, index in pairs(GameScript.PlayerIndex) do
          if Player.IsActivePlayer(index) then
            Game.AwardAchievementOccurrence(index, GameScript.Achievements.No_Crates_Waves_Contractions)
          end
        end
      end
    end
    Extern.WaveNumber = Extern.WaveNumber + 1
    if Extern.WaveNumber > 20 then
      for key, index in pairs(GameScript.PlayerIndex) do
        if Player.IsActivePlayer(index) then
          Game.AwardAchievementOccurrence(index, GameScript.Achievements.Complete_Waves_Contractions)
        end
      end
    end
    if Extern.WaveNumber > kNumWaves then
      if kWrapWaves then
        Extern.WaveNumber = 1
        Extern.RoundNumber = Extern.RoundNumber + 1
      else
        EndGameWin()
        return
      end
    end
    if Extern.WaveNumber % 4 == 0 then
      local almaScriptObj = Support.GetImportObjectTable("Wandering Alma Script Object")
      if almaScriptObj ~= nil and 0 < #almaScriptObj and almaScriptObj[1] ~= nil and almaScriptObj[1] ~= myObject then
        Game.SendMissionEventMessage(almaScriptObj[1], increaseAlmaDifficultyMsgId)
      end
    end
    if weaponRackSet ~= nil then
      local weaponRackObjs = Sets.GetObjectsInSet(weaponRackSet)
      for k, obj in pairs(weaponRackObjs) do
        if obj ~= nil then
          Game.SendMissionEventMessage(obj, beginRestPeriodMsgId)
        end
      end
    end
    if kDebugMemoryTest then
      Callbacks.RegisterForTimer("StreamNextWaveMap", 2, false)
    else
      Callbacks.RegisterForTimer("StreamNextWaveMap", 15, false)
    end
    score:WaveOver()
    Callbacks.RegisterForTimer("RevivePlayers", 1.5, false)
  end
  EnableRepairableBarriers()
  wavePlayersDowned = 0
  waveTotalCratesReturned = 0
end

function DisplayEndOfWaveMessages(wave)
  if wave < kNumWaves then
    local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "End of Wave")
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Stock Up")
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationQueue, "Rebuild")
    FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityLow)
    FEAR.BroadcastAnnoucementPacket(announcementID)
    local numPlayers = Player.GetNumPlayers()
    for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
      playerObject = Player.GetPlayerControlledObjectByIndex(index)
      if playerObject ~= nil then
        Game.SendMissionEventMessage(playerObject, beginRestPeriodMsgId)
      end
    end
  end
end

function SendTextMessageToLocalPlayer(Message)
  local numPlayers = Player.GetNumPlayers() - 1
  for playerIndex = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsLocalPlayer(playerIndex) then
      local curPlayerObject = Player.GetPlayerAvatarObjectByIndex(playerIndex)
      if curPlayerObject ~= nil then
        Game.SendTextMessage(curPlayerObject, Message)
      else
        Debug.PrintInfo("The Player Avatar for player " .. playerIndex .. " is apparently null.")
      end
    end
  end
end

function SendBlackoutMessage()
  SendTextMessageToLocalPlayer("PlayerGotSwallowed")
end

function EndGameWin()
  if not MP.IsClient() then
    Extern.HackGameWon = 1
  end
  DisplayWinMessage()
  SendTextMessageToLocalPlayer("InvulnerableOn")
  Callbacks.RegisterForTimer("SendBlackoutMessage", 5, false)
  Callbacks.RegisterForTimer("EndGameWinCallback", 7, false)
end

function DisplayWinMessage()
  local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationMarquee, "Contractions Win")
  FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
  FEAR.BroadcastAnnoucementPacket(announcementID)
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

function PlayAnimationAfterLastStand(msgTable)
  if msgTable.oldState == GameScript.ObjectState.NearDeath and msgTable.newState == GameScript.ObjectState.Default and msgTable.object ~= nil then
    Callbacks.RegisterForMsg(GS.MsgCallback.AnimationGraphPushedMessage, msgTable.object, "CelebrationAnimGraphPushed")
    Game.SetAnimationGraphResource(msgTable.object, kCelebrationAnimGraphName)
  end
end

function PlayCelebrationAnimOnPlayers()
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) then
      local playerObject = Player.GetPlayerControlledObjectByIndex(index)
      if playerObject ~= nil then
        local mechObj
        if IsMech(playerObject) then
          mechObj = playerObject
          playerObject = GetPlayerInsideMech(mechObj)
        end
        if Player.IsLocalPlayer(index) and mechObj ~= nil then
          KickPlayerOutOfMech(mechObj)
        end
        if Player.IsPlayerInState(index, GameScript.ObjectState.NearDeath) then
          if not MP.IsClient() then
            Player.RevivePlayerInstant(index)
          end
          Callbacks.RegisterForMsg(GameScript.MsgCallback.ObjectStateChangeMessage, playerObject, "PlayAnimationAfterLastStand")
        else
          Callbacks.RegisterForMsg(GS.MsgCallback.AnimationGraphPushedMessage, playerObject, "CelebrationAnimGraphPushed")
          Game.SetAnimationGraphResource(playerObject, kCelebrationAnimGraphName)
        end
      end
    end
  end
end

function CelebrationAnimGraphPushed(object)
  local index = Player.GetPlayerIndexByObject(object)
  if Player.IsLocalPlayer(index) then
    Game.EnableObjectInput(Player.GetPlayerObjectByIndex(index), false, false, false, false)
  end
  local animVarValue = 1 + (index - GS.PlayerIndex.kGlobalPlayer1)
  Game.SetAnimationVariable(object, "Context_Celebration_Number", animVarValue)
  Callbacks.RegisterForMsg(GS.MsgCallback.AnimationFinishedMessage, object, "CelebrationAnimFinished")
end

function CelebrationAnimFinished(object)
  Game.RemoveAnimationGraphResource(object)
  local index = Player.GetPlayerIndexByObject(object)
  if Player.IsLocalPlayer(index) then
    Game.EnableObjectInput(Player.GetPlayerObjectByIndex(index), true, true, true, true)
  end
end

function EndGameWinCallback()
  Debug.PrintWarning("--------------------- MP SCORING")
  local killScore = FEARScore.GetCurrentMissionPoints(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.MissionScoreCategory.ContractionsKills)
  local reviveScore = FEARScore.GetCurrentMissionPoints(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.MissionScoreCategory.ContractionsRevive)
  local repairScore = FEARScore.GetCurrentMissionPoints(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.MissionScoreCategory.ContractionsBarricadeRepair)
  local crateScore = FEARScore.GetCurrentMissionPoints(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.MissionScoreCategory.ContractionsCrates)
  local total = killScore + reviveScore + repairScore + crateScore
  Debug.PrintWarning("--------------------- Kill Score : " .. killScore)
  Debug.PrintWarning("--------------------- Revive Score : " .. reviveScore)
  Debug.PrintWarning("--------------------- Repair Score : " .. repairScore)
  Debug.PrintWarning("--------------------- Crate Score : " .. crateScore)
  Debug.PrintWarning("--------------------- TOTAL Score : " .. total)
  Debug.PrintWarning("--------------------- MP SCORING")
  Game.HidePlayerView()
  if not MP.IsClient() then
    Callbacks.RegisterForTimer("HostEndGame", 0.25, false)
  else
    Support.ExitScript()
  end
end

function EndGameLose()
  Debug.PrintWarning("--------------------- MP SCORING")
  local killScore = FEARScore.GetCurrentMissionPoints(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.MissionScoreCategory.ContractionsKills)
  local reviveScore = FEARScore.GetCurrentMissionPoints(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.MissionScoreCategory.ContractionsRevive)
  local repairScore = FEARScore.GetCurrentMissionPoints(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.MissionScoreCategory.ContractionsBarricadeRepair)
  local crateScore = FEARScore.GetCurrentMissionPoints(GameScript.PlayerIndex.kGlobalPlayer1, GameScript.MissionScoreCategory.ContractionsCrates)
  local total = killScore + reviveScore + repairScore + crateScore
  Debug.PrintWarning("--------------------- Kill Score : " .. killScore)
  Debug.PrintWarning("--------------------- Revive Score : " .. reviveScore)
  Debug.PrintWarning("--------------------- Repair Score : " .. repairScore)
  Debug.PrintWarning("--------------------- Crate Score : " .. crateScore)
  Debug.PrintWarning("--------------------- TOTAL Score : " .. total)
  Debug.PrintWarning("--------------------- MP SCORING")
  if AlmaScript ~= nil and 0 < #AlmaScript and AlmaScript[1] ~= nil and AlmaScript[1] ~= myObject then
    Game.SendTextMessage(AlmaScript[1], "EndLife")
  end
  Game.HidePlayerView()
  if not MP.IsClient() then
    Callbacks.RegisterForTimer("HostEndGame", 0.25, false)
  else
    Support.ExitScript()
  end
end

function HostEndGame()
  FEARScore.CalculateMissionScore()
  if Extern.HackGameWon then
    Game.SetGameWon()
  else
    Game.SetGameFailed()
  end
  HandleLeaveGameMessage()
  Support.ExitScript()
end

function CheckForEndOfGame()
  if MP.AreAllPlayersDown() then
    EndGameLose()
  end
end

function RevivePlayers()
  local numPlayers = Player.GetNumPlayers()
  for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
    if Player.IsActivePlayer(index) and Player.IsPlayerInState(index, ObjectState.NearDeath) then
      Player.RevivePlayerInstant(index)
    end
  end
end

function HandlePlayerDowned()
  EndGameLose()
end

function PlayerStateChanged(msgTable)
  Debug.PrintToOutputAndScreenWithTimer("In Player State Changed")
  if msgTable.newState == ObjectState.NearDeath then
    if MP.GetNumberOfActivePlayers() == 1 then
      HandlePlayerDowned()
    end
    score:PlayerDown()
  end
end

function StartRiftPulse()
  if debugDisableRiftEvent then
    return
  end
  if riftPulseCinemaObj ~= nil then
    Game.RunCutscene(riftPulseCinemaObj, GS.PlayerIndex.kGlobalPlayer1, GS.PlayerIndex.kGlobalPlayer2)
    local numPlayers = Player.GetNumPlayers()
    for index = GS.PlayerIndex.kGlobalPlayer1, numPlayers do
      if Player.IsActivePlayer(index) and Player.IsLocalPlayer(index) then
        local playerObj = Player.GetPlayerAvatarObjectByIndex(index)
        Game.SendTextMessage(playerObj, "start rift event filter")
      end
    end
    if AIDirector.debugDraw then
      Debug.PrintToScreenWithTimer("Playing rift pulse cinema", 5, Utilities.kBlue, false)
    end
  elseif AIDirector.debugDraw then
    Debug.PrintToScreenWithTimer("No rift pulse cinema to play", 5, Utilities.kBlue, false)
  end
end

function DisableFogDisableList()
  if disableWithFogSet ~= nil and disableWithFogSet ~= myObject then
    for key, effectObject in pairs(disableWithFogSet) do
      Game.EnableAllEnableables(effectObject, false)
    end
  end
end

function ReenableFogDisableList()
  if disableWithFogSet ~= nil and disableWithFogSet ~= myObject then
    for key, effectObject in pairs(disableWithFogSet) do
      Game.EnableAllEnableables(effectObject, true)
    end
  end
end

function CheckForLastManStanding()
  local NumPlayers = MP.GetNumberOfActivePlayers()
  if NumPlayers == 1 then
    return
  end
  local numPlayersNotDown = MP.NumPlayersNotDown()
  if numPlayersNotDown == 1 then
    if not SentLastManStandingMsg then
      local SendLocalMessage = false
      if 1 < Player.GetNumLocalPlayers() then
        local playerObj1 = Player.GetPlayerAvatarObjectByIndex(GS.PlayerIndex.kGlobalPlayer1)
        local playerObj2 = Player.GetPlayerAvatarObjectByIndex(GS.PlayerIndex.kGlobalPlayer2)
        if playerObj1 ~= nil and playerObj2 ~= nil then
          local downedPlayerIndex = GS.PlayerIndex.kGlobalPlayer1
          local lastManPlayerIndex = GS.PlayerIndex.kGlobalPlayer2
          local player1Down = Player.IsPlayerInState(GS.PlayerIndex.kGlobalPlayer1, ObjectState.NearDeath)
          if not player1Down then
            downedPlayerIndex = GS.PlayerIndex.kGlobalPlayer2
            lastManPlayerIndex = GS.PlayerIndex.kGlobalPlayer1
          end
          local announcementID = FEAR.CreateAnnoucementPacket(lastManPlayerIndex, GS.AnnouncementDisplayDestination.kDisplayDestinationMarquee, "Last Actual Player Standing")
          FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
          FEAR.SendAnnoucementPacket(announcementID)
          local downedAnnouncementID = FEAR.CreateAnnoucementPacket(downedPlayerIndex, GS.AnnouncementDisplayDestination.kDisplayDestinationMarquee, "Last Player Standing")
          FEAR.SetAnnoucementPacketPriority(downedAnnouncementID, GS.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
          FEAR.SendAnnoucementPacket(downedAnnouncementID)
        end
      else
        for index = GS.PlayerIndex.kGlobalPlayer1, NumPlayers do
          if Player.IsLocalPlayer(index) then
            local playerObj = Player.GetPlayerAvatarObjectByIndex(index)
            if not Player.IsPlayerInState(index, ObjectState.NearDeath) then
              SendLocalMessage = true
              break
            end
          end
        end
        if SendLocalMessage then
          local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationMarquee, "Last Actual Player Standing")
          FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
          FEAR.BroadcastAnnoucementPacket(announcementID)
        else
          local announcementID = FEAR.CreateAnnoucementPacket(GS.PlayerIndex.kGlobalPlayer1, GS.AnnouncementDisplayDestination.kDisplayDestinationMarquee, "Last Player Standing")
          FEAR.SetAnnoucementPacketPriority(announcementID, GS.AnnouncementDisplayPriority.kDisplayPriorityUrgent)
          FEAR.BroadcastAnnoucementPacket(announcementID)
        end
      end
      SentLastManStandingMsg = true
    end
  else
    SentLastManStandingMsg = false
  end
end

function MemoryTestUpdateLoop()
  if kDebugMemoryTest and debugMemorySizes.persistent ~= nil then
    if debugMemorySizes.waveUpdate then
      debugMemorySizes.waves[Extern.WaveNumber] = debugMemorySizes.persistent - Debug.GetSystemFreeMB()
      if debugMemorySizes.waste.current > 0 then
        debugMemorySizes.waves[Extern.WaveNumber] = debugMemorySizes.waves[Extern.WaveNumber] - debugMemorySizes.waste.current
      end
    end
    Debug.SetOnScreenTextColor(Utilities.kGrey.r, Utilities.kGrey.g, Utilities.kGrey.b)
    local xPos, yPos = 0.7, 0.15
    Debug.PrintToScreen("persistent leaves free: " .. debugMemorySizes.persistent .. " MB", xPos, yPos)
    yPos = yPos + 0.03
    if debugMemorySizes.waste ~= nil then
      xPos = 0.7
      Debug.PrintToScreen("waste: " .. debugMemorySizes.waste.current .. " MB  (max " .. debugMemorySizes.waste.max .. " MB)", xPos, yPos)
      yPos = yPos + 0.03
    end
    yPos = yPos + 0.02
    local yPosStart = yPos
    for w, wave in ipairs(debugMemorySizes.waves) do
      if w == 1 then
        xPos = 0.7
        yPos = yPosStart
      elseif w == 11 then
        xPos = 0.82
        yPos = yPosStart
      end
      Debug.PrintToScreen("w[" .. w .. "] " .. wave .. " MB", xPos, yPos)
      yPos = yPos + 0.03
    end
  end
end

function MemoryDebug()
  if kDebugMemoryTest then
    MemoryTestUpdateLoop()
  end
end

function ClientUpdateLoop()
  if prevHackMsgID ~= Extern.HackMsgID then
    local message = {
      textID = Extern.HackMsgID
    }
    OnMissionEventMessage(message)
    prevHackMsgID = Extern.HackMsgID
  end
  if prevHackGameWon ~= Extern.HackGameWon then
    EndGameWin()
    prevHackGameWon = Extern.HackGameWon
  end
  if prevWaveNumber ~= Extern.WaveNumber then
    DisplayEndOfWaveMessages(prevWaveNumber)
    prevWaveNumber = Extern.WaveNumber
  end
end

function OnCrateReturnedText(msg)
  local index = GS.PlayerIndex.kNotAGlobalPlayer
  if msg.text == "Crate Returned 0" then
    index = GS.PlayerIndex.kGlobalPlayer1
  elseif msg.text == "Crate Returned 1" then
    index = GS.PlayerIndex.kGlobalPlayer2
  elseif msg.text == "Crate Returned 2" then
    index = GS.PlayerIndex.kGlobalPlayer3
  elseif msg.text == "Crate Returned 3" then
    index = GS.PlayerIndex.kGlobalPlayer4
  end
  if index ~= GS.PlayerIndex.kNotAGlobalPlayer then
    Debug.PrintInfo("Crate returned by player " .. index)
    waveTotalCratesReturned = waveTotalCratesReturned + 1
    consecutiveWavesNoCrates = 0
    playerCratesReturned[index] = playerCratesReturned[index] + 1
    if 30 <= playerCratesReturned[index] then
      Game.AwardAchievementOccurrence(index, GS.Achievements.Return_Crates_Contractions)
    end
  end
end

function HandleLeaveGameMessage(msg)
  AIDirector.Reset()
  AIDirector.ExitScript()
  Callbacks.UnregisterForMsg(GS.MsgCallback.LeaveGameMessage, myObject, "HandleLeaveGameMessage")
end

if myObject ~= nil then
  FEAR.SetGenericCounter(Extern.WaveNumber)
  prevWaveNumber = Extern.WaveNumber
  if not MP.IsClient() then
    AIDirector.debugDrawDirectorInfoOnly = true
    Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, myObject, "OnMissionEventMessage")
    if weaponRackSet ~= nil then
      local weaponRackObjs = Sets.GetObjectsInSet(weaponRackSet)
      for k, obj in pairs(weaponRackObjs) do
        if obj ~= nil then
          Callbacks.RegisterForMsg(GS.MsgCallback.TextMessage, obj, "OnCrateReturnedText")
        end
      end
    end
    if kDebugMemoryTest then
      debugMemorySizes:Clear()
      if Debug.MemoryLogMark ~= nil then
        Callbacks.RegisterForTimer("AddStartOfTestMemoryLogMark", 5, false)
      end
      Callbacks.RegisterForTimer("DoStartupStreaming", 10, false)
    else
      Callbacks.RegisterForMsg(GS.MsgCallback.EnterPlayableState, myObject, "DoStartupStreaming")
    end
  else
    Callbacks.RegisterForScriptValueUpdated("ClientUpdateLoop")
  end
  Callbacks.RegisterForMsg(GS.MsgCallback.LeaveGameMessage, myObject, "HandleLeaveGameMessage")
  FEAR.SetGenericCounter(0)
  FEARScore.ResetMissionPoints()
  FEARScore.ResetMissionTimer()
end
