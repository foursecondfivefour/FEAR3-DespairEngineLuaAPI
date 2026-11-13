local Game = GameScript.Game
local Player = Game.Player
local Regions = Game.Regions
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local Util = GameScript.Utilities
local LuaHelpers = GameScript.LuaHelpers
local PlayerCameraPosition = {}
local RayCastTable = {}
local InRegionsTable = {}
local CinemaObject = Support.ImportFirstObject("Cinema Object", "The object containing the Cutscene Component")
local SecondaryCinemaObject = Support.ImportFirstObject("Secondary Cinema Object", "This is necessary if Both Players in Cinema is set to 0(false)")
local RequireLOS = Support.ImportBoolVariableWithDefault("Require Line of Sight?", "Should we have LOS to the position before enabling the object(s)?", true)
local PositionTable = Support.ImportObjectHandleVariable("Position(s)", "The positions of this object(s) will be used for the Look-At")
local MaxAngle = Support.ImportFloatVariable("Max Angle", "The maximum angle between the player's LookRot and object position.")
local UpdateSeconds = Support.ImportFloatVariableWithDefault("Update every X Seconds", "The script will test the player look-at every X seconds.  The minimum value is 0.0333", 0.12)
local RunOnce = Support.ImportBoolVariableWithDefault("Run Once?", "Setting this to True will cause the script to stop checking after the first time", false)
local BothPlayers = Support.ImportBoolVariableWithDefault("Both Players in Cinema?", "1 Both Players will be passed to the cinema. 0 Each player will get their own cinema. REQUIRES a Secondary Cinema Object.", true)
local RegionTable = Support.ImportObjectHandleVariable("Region(s)", "If a region(s) is submitted then Only players in the region will be tested for Look-At")

function Update()
  local NumberOfPlayers = Game.Player.GetNumPlayers()
  local i = 1
  while NumberOfPlayers >= i do
    if 0 < #RegionTable and Regions.IsPlayerInRegions(GameScript.PlayerIndexArray[i], RegionTable) or #RegionTable == 0 then
      for k, position in pairs(PositionTable) do
        if Game.IsPlayerLookRotFacingObject(GameScript.PlayerIndexArray[i], position, MaxAngle) and (RequireLOS and Util.LineOfSight(GameScript.PlayerIndexArray[i], position) or not RequireLOS) then
          if not BothPlayers then
            local i_Avatar = Player.GetPlayerAvatarObjectByIndex(GameScript.PlayerIndexArray[i])
            if Game.ObjectTags.DoesObjectHaveTag(i_Avatar, "Point Man") then
              LuaHelpers.StartCinema(CinemaObject, false, true)
            else
              LuaHelpers.StartCinema(SecondaryCinemaObject, true, true)
            end
          else
            LuaHelpers.StartCinema(CinemaObject, false, false)
          end
          if RunOnce then
            Callbacks.UnregisterForTimer("Update")
          end
        end
      end
    end
    i = i + 1
  end
end

if CinemaObject and 0 < #PositionTable then
  if UpdateSeconds < 0.03333 then
    UpdateSeconds = 0.03333
  end
  Callbacks.RegisterForTimer("Update", UpdateSeconds, true)
end
