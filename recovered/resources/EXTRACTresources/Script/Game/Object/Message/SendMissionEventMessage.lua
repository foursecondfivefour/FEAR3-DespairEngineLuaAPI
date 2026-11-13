local GS = GameScript
local Game = GS.Game
local Support = GS.Support
local TxtObjectTable = Support.ImportObjectHandleVariable("Object(s) to Message", "The objects to send the message to")
local MissionEvent = Support.ImportStaticTextVariable("MissionEvent", "The text event.")

function SendMissionEventMessage()
  for k, object in pairs(TxtObjectTable) do
    if object and Game.IsLoaded(object) then
      Game.SendMissionEventMessage(object, MissionEvent)
    end
  end
end

SendMissionEventMessage()
