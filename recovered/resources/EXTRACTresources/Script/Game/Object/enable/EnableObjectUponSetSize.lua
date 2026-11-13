GameScript.Support.AddDescription("Script to enable an object upon a given set being a given number")
local Game = GameScript.Game
local Sets = Game.Sets
local Callbacks = GameScript.Callbacks
local Debug = GameScript.Debug
local Support = GameScript.Support
local Set = Support.ImportSetObject("Set", "Set to use for checking contents")
local MinContentsLeft = Support.ImportFloatVariable("Min Contents Left", "Minimum amount of contents that should be left before enabling object?")
local MaxContentsLeft = Support.ImportFloatVariable("Max Contents Left", "Maximum amount of contents that should be left before enabling object?")
local EnableObject = Support.ImportSingleObject("Enable Object", "Enable this object")

function SetSizeChange()
  local ContentsLeft = Sets.GetNumObjectsInSet(Set)
  if ContentsLeft >= MinContentsLeft and ContentsLeft <= MaxContentsLeft and Game.IsLoaded(EnableObject) then
    Game.EnableAllEnableables(EnableObject, true)
    Callbacks.UnregisterSetTracker(Set)
  end
end

if Set and EnableObject then
  Callbacks.RegisterSetTracker(Set, "SetSizeChange", "SetSizeChange")
else
  Debug.PrintWarning("Missing necessary objects")
end
