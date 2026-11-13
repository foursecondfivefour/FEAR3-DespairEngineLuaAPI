local GS = GameScript
local Callbacks = GS.Callbacks
local Game = GS.Game
local Player = Game.Player
local Support = GS.Support
local Debug = GS.Debug
local MP = Game.MP
local Camera = GS.Game.Camera
local FEAR = GS.FEAR
local myObject = Game.GetMyObject()
local glowComponent = Support.RegisterComponentHandle("Glow Rendering")
local myPlayerIndex = Player.GetPlayerIndexByObject(myObject)
local localPlayer = Player.IsLocalPlayer(myPlayerIndex)

function SetInvulnerable(bInvulnerable)
  Debug.PrintInfo("Player " .. myPlayerIndex .. " is now invulnerable.")
  Game.SetHitPointPriorityInvulnerable(myObject, 1, bInvulnerable)
end

function OnTextMessage(msg)
  if msg.text == "InvulnerableOn" then
    SetInvulnerable(true)
  end
end

Game.EnableComponent(glowComponent, true)
Callbacks.RegisterForMsg(GS.MsgCallback.TextMessage, myObject, "OnTextMessage")
