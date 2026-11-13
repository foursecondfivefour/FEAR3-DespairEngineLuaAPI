local Game = GameScript.Game
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Util = GameScript.Utilities
local PlayerCameraPosition = {}
local RayCastTable = {}
local ObjectTable = Support.ImportObjectHandleVariable("Object(s)", "The object(s) to send text message to.")
local RequireLOS = Support.ImportBoolVariableWithDefault("Require Line of Sight?", "Should we have LOS to the position before enabling the object(s)?", false)
local PositionTable = Support.ImportObjectHandleVariable("Position(s)", "The positions of this object(s) will be used for the Look-At")
local MaxAngle = Support.ImportFloatVariable("Max Angle", "The maximum angle between the player's LookRot and object position.")
local UpdateSeconds = Support.ImportFloatVariableWithDefault("Update every X Seconds", "The script will test the player look-at every X seconds.  The minimum value is 0.0333", 0.12)
local RunOnce = Support.ImportBoolVariableWithDefault("Run Once?", "Setting this to True will cause the script to stop checking after the first time", false)
local text = Support.ImportStringVariable("Text Message", "Text Message to send to object(s) when entering region")
local AllreadyRun = false

function Update()
  local NumberOfPlayers = Game.Player.GetNumPlayers()
  local i = 1
  Debug.PrintInfoIf(g_debugMode > 0, "Starting Look Check")
  while NumberOfPlayers >= i do
    if Player.IsActivePlayer(GameScript.PlayerIndexArray[i]) then
      for k, position in pairs(PositionTable) do
        Debug.PrintInfoIf(g_debugMode > 0, "Is Player Facing?")
        if Game.IsPlayerLookRotFacingObject(GameScript.PlayerIndexArray[i], position, MaxAngle) then
          Debug.PrintInfoIf(g_debugMode > 0, "Is there line of sight?")
          if RequireLOS and Util.LineOfSight(GameScript.PlayerIndexArray[i], position) or not RequireLOS then
            Debug.PrintInfoIf(g_debugMode > 0, "About to Send Message")
            SendText()
            if RunOnce then
              Callbacks.UnregisterForTimer("Update")
              Support.ExitScript()
              return
            end
          end
        end
      end
    end
    i = i + 1
  end
end

function SendText()
  local set = Support.GetImportObjectTable("Object(s)")
  if set then
    for name, object in pairs(set) do
      Game.SendTextMessage(object, text)
    end
  end
end

local Self = Game.GetMyObject()
if ObjectTable and 0 < #PositionTable then
  if UpdateSeconds < 0.03333 then
    UpdateSeconds = 0.03333
  end
  Callbacks.RegisterForTimer("Update", UpdateSeconds, true)
end
