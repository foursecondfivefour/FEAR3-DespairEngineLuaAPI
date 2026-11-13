local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local xbox = GameScript.Platform.XBox360
local ps = GameScript.Platform.PS3
local pc = GameScript.Platform.Win32
local FEAR = GameScript.FEAR
local initialSplitScreen = Support.ImportWatchVariable("SplitScreen", "Variable that changes to 1 when we are in split screen mode")
local initialIsCampaign = Support.ImportWatchVariable("IsCampaign", "Variable that changes to 1 when we are in a campaign game")
local platformType = Support.GetPlatform()

function OnConfigurationChanged(isSplitScreen, isCampaign)
  if isSplitScreen == 1 then
    FEAR.SetGlobalPerformanceValue("/Decals/Simple/enableDecals false")
    FEAR.SetGlobalPerformanceValue("/ParticleMgr/particleCollisionEnabled false")
    FEAR.SetGlobalPerformanceValue("/Game/modelDamageEnabled false")
    FEAR.SetGlobalPerformanceValue("/Renderer/GraphicsDevice/sceneLightShadowsEnabled false")
    FEAR.SetGlobalPerformanceValue("/Renderer/GraphicsDevice/areaLightMaxShadowLag 1.0")
  else
    FEAR.SetGlobalPerformanceValue("/Decals/Simple/enableDecals true")
    FEAR.SetGlobalPerformanceValue("/Game/modelDamageEnabled true")
    FEAR.SetGlobalPerformanceValue("/Renderer/GraphicsDevice/sceneLightShadowsEnabled true")
    FEAR.SetGlobalPerformanceValue("/Renderer/GraphicsDevice/areaLightMaxShadowLag 0.0")
    if isCampaign == 1 then
      FEAR.SetGlobalPerformanceValue("/ParticleMgr/particleCollisionEnabled true")
    else
      FEAR.SetGlobalPerformanceValue("/ParticleMgr/particleCollisionEnabled false")
    end
  end
  if isCampaign == 1 then
    FEAR.SetGlobalPerformanceValue("/Physics/EnablePersonCustomShapeCreation true")
  else
    FEAR.SetGlobalPerformanceValue("/Physics/EnablePersonCustomShapeCreation false")
  end
end

function OnSplitScreenChange(msg)
  Debug.PrintInfo("OnSplitScreenChange")
  local isCampaign = Support.GetImportWatchVariableValue("IsCampaign")
  OnConfigurationChanged(msg.newValue, isCampaign)
end

function OnIsCampaignChange(msg)
  Debug.PrintInfo("OnIsCampaignChange")
  local splitScreen = Support.GetImportWatchVariableValue("SplitScreen")
  OnConfigurationChanged(splitScreen, msg.newValue)
end

OnConfigurationChanged(initialSplitScreen, initialIsCampaign)
Callbacks.RegisterForWatchVariableChange("SplitScreen", "OnSplitScreenChange")
Callbacks.RegisterForWatchVariableChange("IsCampaign", "OnIsCampaignChange")
if platformType == xbox then
end
