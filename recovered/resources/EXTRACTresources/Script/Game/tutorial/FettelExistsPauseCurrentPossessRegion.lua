local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Player = Game.Player
local ObjectTags = Game.ObjectTags
local Energy = GameScript.Game.Energy
local Utilities = GameScript.Utilities
local GS = GameScript
local Callbacks = GameScript.Callbacks
local Sets = Game.Sets
Support.AddDescription("Disable Energy Drain.")
local Set = Support.ImportSetObject("Set", "Set to use for checking contents")
local MinContentsLeft = Support.ImportFloatVariable("Min Contents Left", "Minimum amount of contents that should be left before enabling object?")
local MaxContentsLeft = Support.ImportFloatVariable("Max Contents Left", "Maximum amount of contents that should be left before enabling object?")
local EnableObject = Support.ImportSingleObject("Enable Object", "Enable this object")
local Set2 = Support.ImportSetObject("Set2", "Set to use for checking contents")
local MinContentsLeft2 = Support.ImportFloatVariable("Min Contents Left 2", "Minimum amount of contents that should be left before enabling object?")
local MaxContentsLeft2 = Support.ImportFloatVariable("Max Contents Left 2", "Maximum amount of contents that should be left before enabling object?")
local PointManPlayerID = GS.PlayerIndex.kGlobalPlayer1
local FettelPlayerID = GS.PlayerIndex.kGlobalPlayer2

function UnpausePossess()
  Player.PauseCurrentPossession(FettelPlayerID, false)
end

function UnblockBurnout()
  Player.InhibitCurrentPossessionEnding(FettelPlayerID, false)
end

function SetSizeChange()
  local ContentsLeft = Sets.GetNumObjectsInSet(Set)
  if ContentsLeft >= MinContentsLeft and ContentsLeft <= MaxContentsLeft and Game.IsLoaded(EnableObject) then
    Game.EnableAllEnableables(EnableObject, true)
    UnpausePossess()
    Callbacks.UnregisterSetTracker(Set)
    Callbacks.RegisterSetTracker(Set2, "SetSizeChange2", "SetSizeChange2")
  end
end

function SetSizeChange2()
  local ContentsLeft2 = Sets.GetNumObjectsInSet(Set2)
  if ContentsLeft2 >= MinContentsLeft2 and ContentsLeft2 <= MaxContentsLeft2 then
    UnblockBurnout()
    Callbacks.UnregisterSetTracker(Set2)
  end
end

PointManPlayerID, FettelPlayerID = Utilities.GetPointManFettelIndices()
if FettelPlayerID ~= GS.PlayerIndex.kNotAGlobalPlayer then
  Player.PauseCurrentPossession(FettelPlayerID, true)
  Player.InhibitCurrentPossessionEnding(FettelPlayerID, true)
end
if Set and EnableObject then
  Callbacks.RegisterSetTracker(Set, "SetSizeChange", "SetSizeChange")
else
  Debug.PrintWarning("Missing necessary objects")
end
