local GS = GameScript
local Support = GS.Support
local Game = GS.Game
local Callbacks = GameScript.Callbacks
local Player = GameScript.Game.Player
local MP = Game.MP
local kTrue = 1
local kFalse = 0
Support.ExportFloatVariable("Done", kFalse, "An external net-sync'd variable that we use to trigger the same action on the client that the host script takes")
local bEnableHeading = Support.ImportBoolVariable("Enable Heading", "Do you wish to enable heading on this player?")
local bEnablePitch = Support.ImportBoolVariable("Enable Pitch", "Do you wish to enable pitch on this player?")
local bEnableMovement = Support.ImportBoolVariable("Enable Movement", "Do you wish to enable movement on this player?")
local bEnableOther = Support.ImportBoolVariable("Enable Other", "Do you wish to enable other on this player?")
local ObjectTag = Support.ImportStringVariable("Object Tag Name", "The ObjectTag name that will need to be on the player.")
local timer = Support.ImportFloatVariableWithDefault("Timer", "Time to wait before executing", 0)

function TakeAction()
  local numPlayers = Player.GetNumPlayers()
  for index = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
    local playerObject = Player.GetPlayerObjectByIndex(index)
    if playerObject ~= nil then
      local avatarObject = Player.GetPlayerAvatarObjectByIndex(index)
      if avatarObject ~= nil and Game.ObjectTags.DoesObjectHaveTag(avatarObject, ObjectTag) then
        Game.EnableObjectInput(playerObject, bEnableHeading, bEnablePitch, bEnableMovement, bEnableOther)
      end
    end
  end
end

function OnTakeActionForHost()
  Extern.Done = kTrue
  TakeAction()
end

function OnValueUpdatedForClient()
  if Extern.Done == kTrue then
    TakeAction()
    Callbacks.UnregisterForScriptValueUpdated()
  end
end

function Execute()
  if not MP.IsClient() then
    Callbacks.RegisterForTimer("OnTakeActionForHost", 0, false)
  else
    Callbacks.RegisterForScriptValueUpdated("OnValueUpdatedForClient")
  end
end

if timer == 0 then
  Execute()
else
  Callbacks.RegisterForTimer("Execute", timer, false)
end
