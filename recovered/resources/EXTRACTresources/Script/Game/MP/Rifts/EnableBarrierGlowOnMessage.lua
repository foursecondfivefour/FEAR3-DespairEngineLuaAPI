local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Support = GS.Support
local Graphics = GS.Game.Graphics
local Debug = GS.Debug
local MP = Game.MP
local BeginRestPeriodMsgId = Support.ImportStaticTextVariable("MissionEvent: Begin Rest Period", "")
local NewWaveMsgId = Support.ImportStaticTextVariable("MissionEvent: New Wave Message", "")
Support.ExportFloatVariable("ShouldEnableGlow", 0, "Hack extern/export variable for the ShouldEnableUsables to be passed to clients.")
local kGlowAmount = 3
local myObject = Game.GetMyObject()
Extern.lastShouldValue = -1

function ProcessMissionEventMessage(missionEventMessage)
  if missionEventMessage.textID == BeginRestPeriodMsgId then
    Extern.ShouldEnableGlow = 1
    Graphics.SetNamedMaterialScalar(myObject, "GLINT", kGlowAmount)
  elseif missionEventMessage.textID == NewWaveMsgId then
    Extern.ShouldEnableGlow = 0
    Graphics.SetNamedMaterialScalar(myObject, "GLINT", 0)
  end
end

function CheckToEnableGlow(removedObject)
  local ShouldEnable = Extern.ShouldEnableGlow
  if Extern.lastShouldValue ~= ShouldEnable then
    if ShouldEnable == 1 then
      Graphics.SetNamedMaterialScalar(myObject, "GLINT", kGlowAmount)
      Extern.lastShouldValue = 1
    else
      Graphics.SetNamedMaterialScalar(myObject, "GLINT", 0)
      Extern.lastShouldValue = 0
    end
  end
end

if not MP.IsClient() then
  Callbacks.RegisterForMsg(GS.MsgCallback.MissionEventMessage, myObject, "ProcessMissionEventMessage")
else
  Callbacks.RegisterForScriptValueUpdated("CheckToEnableGlow")
end
