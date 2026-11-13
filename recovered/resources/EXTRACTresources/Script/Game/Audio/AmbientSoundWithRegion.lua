local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local Game = GameScript.Game
local Regions = Game.Regions
local myObject = Game.GetMyObject()
local min = Support.ImportFloatVariable("Min", "Time range minimum")
local max = Support.ImportFloatVariable("Max", "Time range maximum")
local timerActive = false
local timerSet = false

local function SetTimer()
  if timerSet == false and timerActive == true then
    local time = min + Utilities.GetRandomPercent() * (max - min)
    Callbacks.RegisterForTimer("OnTimer", time, false)
    timerSet = true
  end
end

function OnTimer()
  timerSet = false
  if timerActive == true then
    Game.SendTextMessage(myObject, "AmbientSound")
    SetTimer()
  end
end

function OnRegionEnter()
  timerActive = true
  SetTimer()
end

function OnRegionExit()
  timerActive = false
end

if myObject ~= nil then
  Callbacks.RegisterForMsg(GameScript.MsgCallback.RegionEnterMessage, myObject, "OnRegionEnter")
  Callbacks.RegisterForMsg(GameScript.MsgCallback.RegionExitMessage, myObject, "OnRegionExit")
  if Regions.GetNumberOfObjectsInRegionMonitor(myObject) > 0 then
    OnRegionEnter()
  end
end
