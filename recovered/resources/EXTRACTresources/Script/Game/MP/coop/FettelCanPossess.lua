local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Support = GS.Support
local Player = Game.Player
local Utilities = GS.Utilities
local MP = Game.MP
local Debug = GS.Debug
local scriptObject
local possessionAllowed = true
local Suspending = 0
Support.ExportFloatVariable("FettelCanPossess", 0, "Can Fettel possess people?")
Support.ImportWatchVariable("Possession Allowed", "Used to check if possession is allowed at init time")

function Initialize()
  scriptObject = Game.GetMyObject()
  Callbacks.RegisterForMsg(GS.MsgCallback.PossessionAllowedMessage, scriptObject, "HandlePossessionAllowedMsg")
  Callbacks.RegisterForMsg(GS.MsgCallback.PlayerCanPossessMessage, scriptObject, "HandlePlayerCanPossessMsg")
  local PointManPlayerID = GS.PlayerIndex.kNotAGlobalPlayer
  local FettelPlayerID = GS.PlayerIndex.kNotAGlobalPlayer
  PointManPlayerID, FettelPlayerID = Utilities.GetPointManFettelIndices()
  Extern.FettelCanPossess = 0
  if FettelPlayerID ~= GS.PlayerIndex.kNotAGlobalPlayer and Player.CanPlayerPossess(FettelPlayerID) then
    Extern.FettelCanPossess = 1
  end
  if Support.GetImportWatchVariableValue("Possession Allowed") == 0 then
    possessionAllowed = false
  end
  UpdateMeshEffect()
end

function UpdateMeshEffect()
  if Extern.FettelCanPossess == 1 and possessionAllowed then
    Game.SendTextMessage(scriptObject, "FettelCanPossess")
  else
    Game.SendTextMessage(scriptObject, "FettelCannotPossess")
  end
end

function HandlePossessionAllowedMsg(msgData)
  possessionAllowed = msgData.bAllowed
  UpdateMeshEffect()
end

function HandlePlayerCanPossessMsg(msgData)
  if msgData.bCanPossess then
    Extern.FettelCanPossess = 1
  else
    Extern.FettelCanPossess = 0
  end
  UpdateMeshEffect()
end

if MP.GetGameMode() == GS.MPGameMode.kCoop then
  Initialize()
else
  Support.ExitScript()
end
