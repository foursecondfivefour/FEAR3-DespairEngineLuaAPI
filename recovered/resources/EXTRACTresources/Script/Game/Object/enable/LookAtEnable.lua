local Game = GameScript.Game
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Util = GameScript.Utilities
local PlayerCameraPosition = {}
local RayCastTable = {}
local EnableTable = Support.ImportObjectHandleVariable("Enable These", "The object(s) to be enabled")
local RequireLOS = Support.ImportBoolVariableWithDefault("Require Line of Sight?", "Should we have LOS to the position before enabling the object(s)?", false)
local PositionTable = Support.ImportObjectHandleVariable("Position(s)", "The positions of this object(s) will be used for the Look-At")
local MaxAngle = Support.ImportFloatVariable("Max Angle", "The maximum angle between the player's LookRot and object position.")
local Enable = Support.ImportBoolVariableWithDefault("Enable?", "1 will enable the object when it's in view.", true)
local UpdateSeconds = Support.ImportFloatVariableWithDefault("Update every X Seconds", "The script will test the player look-at every X seconds.  The minimum value is 0.0333", 0.12)
local RunOnce = Support.ImportBoolVariableWithDefault("Run Once?", "Setting this to True will cause the script to stop checking after the first time", false)
local AllreadyRun = false

function Update()
  local NumberOfPlayers = Game.Player.GetNumPlayers()
  local i = 1
  while NumberOfPlayers >= i do
    if Player.IsActivePlayer(GameScript.PlayerIndexArray[i]) then
      for k, position in pairs(PositionTable) do
        if position and Game.IsLoaded(position) and Game.IsPlayerLookRotFacingObject(GameScript.PlayerIndexArray[i], position, MaxAngle) and (RequireLOS and Util.LineOfSight(GameScript.PlayerIndexArray[i], position) or not RequireLOS) then
          for k, EnableObject in pairs(EnableTable) do
            Game.EnableAllEnableables(EnableObject, Enable)
          end
          if RunOnce then
            Callbacks.UnregisterForTimer("Update")
            Support.ExitScript()
            return
          end
        end
      end
    end
    i = i + 1
  end
end

local Self = Game.GetMyObject()
if EnableTable and 0 < #PositionTable then
  if UpdateSeconds < 0.03333 then
    UpdateSeconds = 0.03333
  end
  Callbacks.RegisterForTimer("Update", UpdateSeconds, true)
elseif Self then
  Debug.PrintError(Game.GetName(Self) .. ": Necessary script settings were invalid")
end
