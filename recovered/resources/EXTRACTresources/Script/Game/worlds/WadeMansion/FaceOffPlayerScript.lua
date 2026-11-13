local Game = GameScript.Game
local Support = GameScript.Support
local Utilities = GameScript.Utilities
local Msg = GameScript.MsgCallback
local Player = GameScript.Game.Player
local ObjectTags = GameScript.Game.ObjectTags
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local startTime = 0
Support.ExportFloatVariable("ShotTime", -1, "The time it took point man to fire the shot")
Support.ExportFloatVariable("AnimationVariable", 0, "This value is changed based on who won and lost in a coop game to set into the animation graph to provide a slight advantage to one player or another.")
local looseAnimValue = Support.ImportFloatVariableWithDefault("Loose Animation Value", "The value to put into the animation graph for the loosing player.", 45)
local pointMan, fettel, myObject, otherPlayer

function FindPlayers()
  local pmTagTable = ObjectTags.GetObjectsWithTag("Point Man")
  if pmTagTable then
    for key, object in pairs(pmTagTable) do
      if object then
        pointMan = object
      end
    end
  end
  local fettelTagTable = ObjectTags.GetObjectsWithTag("Fettel")
  if fettelTagTable then
    for key, object in pairs(fettelTagTable) do
      if object then
        fettel = object
      end
    end
  end
  myObject = GameScript.Game.GetMyObject()
end

function OpponentTakingDamage()
  GameScript.Debug.PrintInfo("OpponentTakingDamage")
  if otherPlayer then
    Callbacks.UnregisterForMsg(GameScript.MsgCallback.DamageMessage, otherPlayer, "OpponentTakingDamage")
  end
  Extern.ShotTime = GameScript.Support.GetGameTime() - startTime
  GameScript.Debug.PrintInfo("OpponentTakingDamage - start time: " .. startTime .. " shottime: " .. Extern.ShotTime)
  Callbacks.RegisterForTimer("TimerCallback", 0.25, false)
  Game.SendTextMessage(myObject, "HUDFadeToBlack")
end

function TimerCallback()
  GameScript.Debug.PrintInfo("TimerCallback - start time: " .. startTime .. " shottime: " .. Extern.ShotTime)
  if myObject then
    Game.SendTextMessage(myObject, "ShotFired")
  end
end

function OnValueUpdatedForClient()
  if Extern.ShotTime == -1 then
    return
  end
  GameScript.Debug.PrintInfo("OnValueUpdatedForClient - shottime: " .. Extern.ShotTime)
  if myObject then
    Game.SendTextMessage(myObject, "ShotFired")
  end
  Callbacks.UnregisterForScriptValueUpdated("OnValueUpdatedForClient")
end

function SetUpAnimationExtern()
  local numPlayers = Player.GetNumPlayers()
  if 1 < numPlayers then
    local player1Object = Player.GetPlayerAvatarObjectByIndex(GameScript.PlayerIndex.kGlobalPlayer1)
    local p1Agg = GameScript.FEARScore.GetTotalChallengeCategoryPoints(GameScript.PlayerIndex.kGlobalPlayer1, 0)
    local p1Tac = GameScript.FEARScore.GetTotalChallengeCategoryPoints(GameScript.PlayerIndex.kGlobalPlayer1, 1)
    local p1Spec = GameScript.FEARScore.GetTotalChallengeCategoryPoints(GameScript.PlayerIndex.kGlobalPlayer1, 2)
    local p1Psy = GameScript.FEARScore.GetTotalChallengeCategoryPoints(GameScript.PlayerIndex.kGlobalPlayer1, 3)
    local p2Agg = GameScript.FEARScore.GetTotalChallengeCategoryPoints(GameScript.PlayerIndex.kGlobalPlayer2, 0)
    local p2Tac = GameScript.FEARScore.GetTotalChallengeCategoryPoints(GameScript.PlayerIndex.kGlobalPlayer2, 1)
    local p2Spec = GameScript.FEARScore.GetTotalChallengeCategoryPoints(GameScript.PlayerIndex.kGlobalPlayer2, 2)
    local p2Psy = GameScript.FEARScore.GetTotalChallengeCategoryPoints(GameScript.PlayerIndex.kGlobalPlayer2, 3)
    local p1Pts = 0
    local p2Pts = 0
    if p1Agg > p2Agg then
      p1Pts = p1Pts + 1
    elseif p1Agg < p2Agg then
      p2Pts = p2Pts + 1
    end
    if p1Tac > p2Tac then
      p1Pts = p1Pts + 1
    elseif p1Tac < p2Tac then
      p2Pts = p2Pts + 1
    end
    if p1Spec > p2Spec then
      p1Pts = p1Pts + 1
    elseif p1Spec < p2Spec then
      p2Pts = p2Pts + 1
    end
    if p1Psy > p2Psy then
      p1Pts = p1Pts + 1
    elseif p1Psy < p2Psy then
      p2Pts = p2Pts + 1
    end
    if p1Pts < p2Pts and player1Object == myObject or p1Pts > p2Pts and player1Object ~= myObject then
      Extern.AnimationVariable = looseAnimValue
    end
  end
end

function DoInit()
  FindPlayers()
  Callbacks.UnregisterForTimer("DoInit")
  if myObject == nil then
    return
  end
  if fettel == nil then
    GameScript.Debug.PrintInfo("Fettel is nil wait .5 seconds")
    Callbacks.RegisterForTimer("DoInit", 0.5, false)
    return
  end
  if pointMan == nil then
    GameScript.Debug.PrintInfo("pointMan is nil wait .5 seconds")
    Callbacks.RegisterForTimer("DoInit", 0.5, false)
    return
  end
  GameScript.Debug.PrintInfo("My Object: " .. GameScript.Game.GetName(myObject))
  GameScript.Debug.PrintInfo("Point Man Object: " .. GameScript.Game.GetName(pointMan))
  GameScript.Debug.PrintInfo("Fettel Object: " .. GameScript.Game.GetName(fettel))
  if myObject == pointMan then
    otherPlayer = fettel
  else
    otherPlayer = pointMan
  end
  GameScript.Debug.PrintInfo("Other Object: " .. GameScript.Game.GetName(otherPlayer))
  SetUpAnimationExtern()
  if Game.MP.IsNetworkGame() then
    if Game.MP.IsRemoteScript() then
      Callbacks.RegisterForScriptValueUpdated("OnValueUpdatedForClient")
    elseif otherPlayer then
      Callbacks.RegisterForMsg(GameScript.MsgCallback.DamageMessage, otherPlayer, "OpponentTakingDamage")
    end
    startTime = GameScript.Support.GetGameTime()
  else
    if otherPlayer then
      Callbacks.RegisterForMsg(GameScript.MsgCallback.DamageMessage, otherPlayer, "OpponentTakingDamage")
    end
    startTime = GameScript.Support.GetGameTime()
  end
end

Callbacks.RegisterForTimer("DoInit", 0.5, false)
