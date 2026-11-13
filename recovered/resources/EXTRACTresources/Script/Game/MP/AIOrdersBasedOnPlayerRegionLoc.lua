local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Player = Game.Player
local Support = GS.Support
local Debug = GS.Debug
local Regions = Game.Regions
local AI = Game.AI
local Utilities = GS.Utilities
local MP = Game.MP
local ObjectTags = Game.ObjectTags
local aiTypes = GameScript.AIIdentityType
local kBrown = 1
local kWhite = 2
local kBlack = 3
local kGrey = 4
local kRed = 5
local kGreen = 6
local kBlue = 7
local kCyan = 8
local kMagenta = 9
local kYellow = 10
local kNumColorGroups = 10
local kAllColors = 11
local kColorRegionSets = {}
kColorRegionSets[kBrown] = Support.ImportObjectList("Brown Region Set", "")
kColorRegionSets[kWhite] = Support.ImportObjectList("------White Region Set", "")
kColorRegionSets[kBlack] = Support.ImportObjectList("------Black Region Set", "")
kColorRegionSets[kGrey] = Support.ImportObjectList("------Grey Region Set", "")
kColorRegionSets[kRed] = Support.ImportObjectList("------Red Region Set", "")
kColorRegionSets[kGreen] = Support.ImportObjectList("------Green Region Set", "")
kColorRegionSets[kBlue] = Support.ImportObjectList("------Blue Region Set", "")
kColorRegionSets[kCyan] = Support.ImportObjectList("------Cyan Region Set", "")
kColorRegionSets[kMagenta] = Support.ImportObjectList("------Magenta Region Set", "")
kColorRegionSets[kYellow] = Support.ImportObjectList("------Yellow Region Set", "")
local ATCGruntAIOrders = {}
ATCGruntAIOrders[kBrown] = Support.ImportSingleObject("ATC Grunt Brown AI Order", "")
ATCGruntAIOrders[kWhite] = Support.ImportSingleObject("------ATC Grunt White AI Order", "")
ATCGruntAIOrders[kBlack] = Support.ImportSingleObject("------ATC Grunt Black AI Order", "")
ATCGruntAIOrders[kGrey] = Support.ImportSingleObject("------ATC Grunt Grey AI Order", "")
ATCGruntAIOrders[kRed] = Support.ImportSingleObject("------ATC Grunt Red AI Order", "")
ATCGruntAIOrders[kGreen] = Support.ImportSingleObject("------ATC Grunt Green AI Order", "")
ATCGruntAIOrders[kBlue] = Support.ImportSingleObject("------ATC Grunt Blue AI Order", "")
ATCGruntAIOrders[kCyan] = Support.ImportSingleObject("------ATC Grunt Cyan AI Order", "")
ATCGruntAIOrders[kMagenta] = Support.ImportSingleObject("------ATC Grunt Magenta AI Order", "")
ATCGruntAIOrders[kYellow] = Support.ImportSingleObject("------ATC Grunt Yellow AI Order", "")
ATCGruntAIOrders[kAllColors] = Support.ImportSingleObject("------ATC Grunt All colors AI Order", "")
local CannibalAIOrders = {}
CannibalAIOrders[kBrown] = Support.ImportSingleObject("Cannibal Brown AI Order", "")
CannibalAIOrders[kWhite] = Support.ImportSingleObject("------Cannibal White AI Order", "")
CannibalAIOrders[kBlack] = Support.ImportSingleObject("------Cannibal Black AI Order", "")
CannibalAIOrders[kGrey] = Support.ImportSingleObject("------Cannibal Grey AI Order", "")
CannibalAIOrders[kRed] = Support.ImportSingleObject("------Cannibal Red AI Order", "")
CannibalAIOrders[kGreen] = Support.ImportSingleObject("------Cannibal Green AI Order", "")
CannibalAIOrders[kBlue] = Support.ImportSingleObject("------Cannibal Blue AI Order", "")
CannibalAIOrders[kCyan] = Support.ImportSingleObject("------Cannibal Cyan AI Order", "")
CannibalAIOrders[kMagenta] = Support.ImportSingleObject("------Cannibal Magenta AI Order", "")
CannibalAIOrders[kYellow] = Support.ImportSingleObject("------Cannibal Yellow AI Order", "")
CannibalAIOrders[kAllColors] = Support.ImportSingleObject("------Cannibal All colors AI Order", "")
local PhaseCasterAIOrders = {}
PhaseCasterAIOrders[kBrown] = Support.ImportSingleObject("PhaseCaster Brown AI Order", "")
PhaseCasterAIOrders[kWhite] = Support.ImportSingleObject("------PhaseCaster White AI Order", "")
PhaseCasterAIOrders[kBlack] = Support.ImportSingleObject("------PhaseCaster Black AI Order", "")
PhaseCasterAIOrders[kGrey] = Support.ImportSingleObject("------PhaseCaster Grey AI Order", "")
PhaseCasterAIOrders[kRed] = Support.ImportSingleObject("------PhaseCaster Red AI Order", "")
PhaseCasterAIOrders[kGreen] = Support.ImportSingleObject("------PhaseCaster Green AI Order", "")
PhaseCasterAIOrders[kBlue] = Support.ImportSingleObject("------PhaseCaster Blue AI Order", "")
PhaseCasterAIOrders[kCyan] = Support.ImportSingleObject("------PhaseCaster Cyan AI Order", "")
PhaseCasterAIOrders[kMagenta] = Support.ImportSingleObject("------PhaseCaster Magenta AI Order", "")
PhaseCasterAIOrders[kYellow] = Support.ImportSingleObject("------PhaseCaster Yellow AI Order", "")
PhaseCasterAIOrders[kAllColors] = Support.ImportSingleObject("------PhaseCaster All colors AI Order", "")
local PAAIOrders = {}
PAAIOrders[kBrown] = Support.ImportSingleObject("PA Brown AI Order", "")
PAAIOrders[kWhite] = Support.ImportSingleObject("------PA White AI Order", "")
PAAIOrders[kBlack] = Support.ImportSingleObject("------PA Black AI Order", "")
PAAIOrders[kGrey] = Support.ImportSingleObject("------PA Grey AI Order", "")
PAAIOrders[kRed] = Support.ImportSingleObject("------PA Red AI Order", "")
PAAIOrders[kGreen] = Support.ImportSingleObject("------PA Green AI Order", "")
PAAIOrders[kBlue] = Support.ImportSingleObject("------PA Blue AI Order", "")
PAAIOrders[kCyan] = Support.ImportSingleObject("------PA Cyan AI Order", "")
PAAIOrders[kMagenta] = Support.ImportSingleObject("------PA Magenta AI Order", "")
PAAIOrders[kYellow] = Support.ImportSingleObject("------PA Yellow AI Order", "")
PAAIOrders[kAllColors] = Support.ImportSingleObject("------PA All colors AI Order", "")
local EPAAIOrders = {}
EPAAIOrders[kBrown] = Support.ImportSingleObject("EPA Brown AI Order", "")
EPAAIOrders[kWhite] = Support.ImportSingleObject("------EPA White AI Order", "")
EPAAIOrders[kBlack] = Support.ImportSingleObject("------EPA Black AI Order", "")
EPAAIOrders[kGrey] = Support.ImportSingleObject("------EPA Grey AI Order", "")
EPAAIOrders[kRed] = Support.ImportSingleObject("------EPA Red AI Order", "")
EPAAIOrders[kGreen] = Support.ImportSingleObject("------EPA Green AI Order", "")
EPAAIOrders[kBlue] = Support.ImportSingleObject("------EPA Blue AI Order", "")
EPAAIOrders[kCyan] = Support.ImportSingleObject("------EPA Cyan AI Order", "")
EPAAIOrders[kMagenta] = Support.ImportSingleObject("------EPA Magenta AI Order", "")
EPAAIOrders[kYellow] = Support.ImportSingleObject("------EPA Yellow AI Order", "")
EPAAIOrders[kAllColors] = Support.ImportSingleObject("------EPA All colors AI Order", "")
local kDebugDraw = Support.ImportBoolVariable("Debug Draw", "")
local kMyObject = Game.GetMyObject()
local RegionPlayerIsIn = {
  kAllColors,
  kAllColors,
  kAllColors,
  kAllColors
}

function UpdateAIOrders()
  local AIObjects = ObjectTags.GetObjectsWithTag("AI")
  for k, aiObject in pairs(AIObjects) do
    if Game.GetHitPointPercent(aiObject) > 0 then
      local targetInfo = AI.GetAITargetInfo(aiObject)
      local regionColor = kAllColors
      if targetInfo.m_bIsInfoValid and targetInfo.m_nControllingPlayerIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
        regionColor = RegionPlayerIsIn[targetInfo.m_nControllingPlayerIndex + 1]
      end
      local aiIdentity = AI.GetAIIdentityType(aiObject)
      if aiIdentity == aiTypes.Soldier or aiIdentity == aiTypes.Grunt or aiIdentity == aiTypes.Sniper or aiIdentity == aiTypes.HeavyRocket then
        AI.AssignExternalAIOrder(ATCGruntAIOrders[regionColor], aiObject)
      elseif aiIdentity == aiTypes.Cannibal then
        AI.AssignExternalAIOrder(CannibalAIOrders[regionColor], aiObject)
      elseif aiIdentity == aiTypes.PhaseCaster then
        AI.AssignExternalAIOrder(PhaseCasterAIOrders[regionColor], aiObject)
      elseif aiIdentity == aiTypes.PA then
        AI.AssignExternalAIOrder(PAAIOrders[regionColor], aiObject)
      elseif aiIdentity == aiTypes.EPA then
        AI.AssignExternalAIOrder(EPAAIOrders[regionColor], aiObject)
      end
    end
  end
end

function PlayerEntersBrownRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kBrown
end

function PlayerEntersWhiteRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kWhite
end

function PlayerEntersBlackRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kBlack
end

function PlayerEntersGreyRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kGrey
end

function PlayerEntersRedRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kRed
end

function PlayerEntersGreenRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kGreen
end

function PlayerEntersBlueRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kBlue
end

function PlayerEntersCyanRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kCyan
end

function PlayerEntersMagentaRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kMagenta
end

function PlayerEntersYellowRegion(PlayerInfo)
  local playerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object) + 1
  RegionPlayerIsIn[playerIndex] = kYellow
end

function DrawDebug()
  Debug.PrintToScreen("Player1 Region = " .. RegionPlayerIsIn[1], 0.8, 0.72)
  Debug.PrintToScreen("Player2 Region = " .. RegionPlayerIsIn[2], 0.8, 0.76)
  Debug.PrintToScreen("Player3 Region = " .. RegionPlayerIsIn[3], 0.8, 0.8)
  Debug.PrintToScreen("Player4 Region = " .. RegionPlayerIsIn[4], 0.8, 0.84)
end

if not MP.IsClient() then
  for k, region in pairs(kColorRegionSets[kBrown]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersBrownRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kWhite]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersWhiteRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kBlack]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersBlackRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kGrey]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersGreyRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kRed]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersRedRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kGreen]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersGreenRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kBlue]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersBlueRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kCyan]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersCyanRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kMagenta]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersMagentaRegion", "")
  end
  for k, region in pairs(kColorRegionSets[kYellow]) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntersYellowRegion", "")
  end
  Callbacks.RegisterForTimer("UpdateAIOrders", 1, true)
  if kDebugDraw then
    Callbacks.RegisterForUpdateEveryFrame("DrawDebug")
  end
else
  Support.ExitScript()
end
