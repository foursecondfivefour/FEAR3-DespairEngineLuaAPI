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
local playerTransferMsg = GameScript.MsgCallback.PlayerTransferControlMessage
local PointManPlayerID = GS.PlayerIndex.kNotAGlobalPlayer
local FettelPlayerID = GS.PlayerIndex.kNotAGlobalPlayer

function UnInhibitPossess()
  Player.InhibitCurrentPossessionEnding(FettelPlayerID, false)
end

function SetSizeChange()
  local ContentsLeft = Sets.GetNumObjectsInSet(Set)
  if ContentsLeft >= MinContentsLeft and ContentsLeft <= MaxContentsLeft and Game.IsLoaded(EnableObject) then
    Game.EnableAllEnableables(EnableObject, true)
    UnInhibitPossess()
    Callbacks.UnregisterSetTracker(Set)
  end
end

PointManPlayerID, FettelPlayerID = Utilities.GetPointManFettelIndices()
if FettelPlayerID ~= kNotAGlobalPlayer then
  Player.InhibitCurrentPossessionEnding(FettelPlayerID, true)
end
if Set and EnableObject then
  Callbacks.RegisterSetTracker(Set, "SetSizeChange", "SetSizeChange")
else
  Debug.PrintWarning("Missing necessary objects")
end
