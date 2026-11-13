local Game = GameScript.Game
local Player = GameScript.Game.Player
local Support = GameScript.Support
local Debug = GameScript.Debug
local Callbacks = GameScript.Callbacks
local LuaHelpers = GameScript.LuaHelpers
local EnablesLeft
local IsPointManOutsideRegion = true
local IsFettelOutsideRegion = true
local RegionList = Support.ImportObjectHandleVariable("Region(s) to Enter", "A player entering this region(s), will trigger start the cinema")
local CinemaObject = Support.ImportFirstObject("Cinema Object", "The object containing the Cutscene Component")
local SecondaryCinemaObject = Support.ImportFirstObject("Secondary Cinema Object", "The object containing the Cutscene Component")
local NumberOfEnables = Support.ImportFloatVariable("Number Of Enables", "The number of times this cinema will run. 0 is Infinite")
local PlayerCheck = Support.ImportFloatVariableWithDefault("Player Check", "Player check to perform: 0: no player check required; 1: only Pointman must exist; 2: only Fettel must exist", 0)
local BothPlayersInCinema = Support.NumberToBool(Support.ImportFloatVariable("Both Players In Cinema?", "1 Any time any player enters the region(s) the cinema will be attempted with both players.  PointMan as Primary and Fettel as Secondary. 0 The cinema will be started on just the player that has entered the Region. NOTE: With this set to 0 the Cinema Object will be played on PointMan and the Secondary Cinema Object will be played on Fettel"))
local RequireAllPlayersInRegion = Support.NumberToBool(Support.ImportFloatVariable("Require All Players In Region to Enable?", "0 The Cinema will start when any player enters the region. 1 The Cinema will only start when both players are in the Region. NOTE:  Should ONLY be used when both players are in the cinema."))

function PlayerEntRegion(PlayerInfo)
  if PlayerInfo.object and (RequireAllPlayersInRegion and Game.Regions.AllPlayersInTableOfRegions(RegionList) or not RequireAllPlayersInRegion) then
    if 0 < PlayerCheck then
      local numPlayers = Player.GetNumPlayers()
      for index = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers do
        local playerObject = Player.GetPlayerAvatarObjectByIndex(index)
        if playerObject ~= nil then
          if PlayerCheck == 2 then
            if Game.ObjectTags.DoesObjectHaveTag(playerObject, "Point Man") then
              return
            end
          elseif PlayerCheck == 1 and Game.ObjectTags.DoesObjectHaveTag(playerObject, "Fettel") then
            return
          end
        end
      end
    end
    if BothPlayersInCinema then
      LuaHelpers.StartCinema(CinemaObject, false, false)
    else
      local PlayerIndex = Player.GetPlayerIndexByObject(PlayerInfo.object)
      local playerObject = Player.GetPlayerAvatarObjectByIndex(PlayerIndex)
      if Game.ObjectTags.DoesObjectHaveTag(playerObject, "Point Man") then
        LuaHelpers.StartCinema(CinemaObject, false, true)
      elseif SecondaryCinemaObject then
        LuaHelpers.StartCinema(SecondaryCinemaObject, true, true)
      else
        LuaHelpers.StartCinema(CinemaObject, true, true)
      end
    end
    if EnablesLeft then
      EnablesLeft = EnablesLeft - 1
      if EnablesLeft <= 0 then
        for key, region in pairs(RegionList) do
          Callbacks.UnregisterPlayerEnterExitRegion(region, "PlayerEntRegion", "")
        end
      end
    end
  end
end

if RegionList then
  for key, region in pairs(RegionList) do
    Callbacks.RegisterPlayerEnterExitRegion(region, "PlayerEntRegion", "")
  end
  EnablesLeft = 0 < NumberOfEnables and NumberOfEnables or nil
end
