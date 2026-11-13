local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Game = GameScript.Game
local Camera = GameScript.Game.Camera
local ObjectTags = Game.ObjectTags
local Player = Game.Player
local thisObject = Game.GetMyObject()
local playerIndexArray = GameScript.PlayerIndexArray
Support.RegisterTextureVariable("ColorLUT", "The lookup table to use for color correction in the camera filters")
local texName = Support.ImportStringVariable("TextureName", "The name of the texture in the filter material")

function SetLUT(globalPlayer)
  Camera.SetCameraFilterNamedTexture(globalPlayer, texName, "ColorLUT")
end

function HandleCameraFilterGroupChangeMsg(msg)
  local globalPlayer = Camera.GetPlayerIndexFromCameraId(msg.camID)
  SetLUT(globalPlayer)
end

function Initialize()
  local numPlayers = Player.GetNumPlayers()
  for i = 1, numPlayers do
    local playerIndex = playerIndexArray[i]
    local globalIndex = Player.GetGlobalIndexFromLocalIndex(playerIndex)
    SetLUT(globalIndex)
  end
end

Callbacks.RegisterForMsg(GameScript.MsgCallback.CameraFilterGroupChangeMessage, thisObject, "HandleCameraFilterGroupChangeMsg")
Initialize()
GameScript.Callbacks.RegisterForPostCheckpointActivation("Initialize")
