local Debug = GameScript.Debug
local Support = GameScript.Support
local Game = GameScript.Game
local Callbacks = GameScript.Callbacks
local Sets = GameScript.Game.Sets
local hide = 0
local numflicker = 0
local maxflicker = GameScript.Support.ImportFloatVariableWithDefault("Ammount of flickers", "Number of times the object will flicker on/off.", 10)
local objFlickerTime = GameScript.Support.ImportFloatVariableWithDefault("Time between flickers", "Time between each flicker.", 0.03)
local facePlayer = GameScript.Support.ImportBoolVariableWithDefault("Face player?", "Should the spawned object face the player?", true)
local reqFlashlight = GameScript.Support.ImportBoolVariableWithDefault("Require Flashlight?", "Will this only trigger if the player has their flashlight on?", true)
local targetSet = Support.ImportSetObject("Set to flicker", "The set in which all the objects will flicker")

function TurnToPlayer()
  if facePlayer == true then
    local player = GameScript.Game.Player.GetPlayerAvatarObjectByIndex(0)
    local playerRot = GameScript.Game.GetRotation(player)
    local teleRot = playerRot
    teleRot.h = playerRot.h + 180
    local myObject = Game.GetMyObject()
    local telePos = Game.GetPosition(myObject)
    GameScript.Game.TeleportObjectWithRotation(myObject, telePos, teleRot)
  end
end

function FlickerObject()
  local AssigneeTable = Sets.GetObjectsInSet(targetSet)
  for k, Assignee in pairs(AssigneeTable) do
    DoFlicker(Assignee)
  end
end

function DoFlicker(flickObj)
  if numflicker >= maxflicker then
    GameScript.Game.Kill(flickObj, 0)
    GameScript.Callbacks.UnregisterForTimer("FlickerObject")
  end
  if hide == 0 then
    GameScript.Game.HideObject(flickObj, true)
    hide = 1
    numflicker = numflicker + 1
  elseif hide == 1 then
    GameScript.Game.HideObject(flickObj, false)
    hide = 0
    numflicker = numflicker + 1
  end
end

local playerExists = GameScript.Game.Player.GetPlayerAvatarObjectByIndex(0)
if playerExists ~= nil then
  if reqFlashlight == true then
    if GameScript.FEAR.IsPlayerFlashlightOn(0) == true then
      TurnToPlayer()
      GameScript.Callbacks.RegisterForTimer("FlickerObject", objFlickerTime, true)
    end
  else
    TurnToPlayer()
    GameScript.Callbacks.RegisterForTimer("FlickerObject", objFlickerTime, true)
  end
end
