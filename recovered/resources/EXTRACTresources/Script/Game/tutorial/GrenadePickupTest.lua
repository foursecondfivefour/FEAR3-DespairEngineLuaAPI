local Game = GameScript.Game
local Player = Game.Player
local Callbacks = GameScript.Callbacks
local Utilities = GameScript.Utilities
local Support = GameScript.Support
local pointMan
local Pprompted = false
local Fprompted = false
local DisplayTextTable = {}
DisplayTextTable.textAreaName = "TutorialText"
DisplayTextTable.displayTime = 3
local GrenadePrompt = Support.ImportStaticTextVariable("Use Grenade Prompt", "The prompt that should appear when explaining how to use grenades")
local PointManObject = Player.GetPlayerControlledObjectByIndex(0)
local FettelObject = Player.GetPlayerControlledObjectByIndex(1)

function AmmoPickedUpP(msg)
  if Pprompted then
    return
  end
  if PointManObject == nil then
    return
  end
  if msg.ammoType == "FragGrenade" then
    DisplayTextTable.textId = GrenadePrompt
    Game.DisplayText(DisplayTextTable, 0, true, Game.GetMyObject())
    Pprompted = true
  else
  end
end

function AmmoPickedUpF(msg)
  if Fprompted then
    return
  end
  if FettelObject == nil then
    return
  end
  if msg.ammoType == "FragGrenade" then
    DisplayTextTable.textId = GrenadePrompt
    Game.DisplayText(DisplayTextTable, 1, true, Game.GetMyObject())
    Fprompted = true
  else
  end
end

if PointManObject ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.AmmoPickupForCarrierMessage, PointManObject, "AmmoPickedUpP")
end
if FettelObject ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.AmmoPickupForCarrierMessage, FettelObject, "AmmoPickedUpF")
end
