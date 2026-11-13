local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Player = Game.Player
local ObjectTags = Game.ObjectTags
Support.AddDescription("Enable an object or objects in a set when the script is started and if the game doesn't PM in it.")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")
local PMAvatar
local i = 0
while i <= Player.GetNumPlayers() do
  local avatar = Player.GetPlayerAvatarObjectByIndex(i)
  if avatar and ObjectTags.DoesObjectHaveTag(avatar, "Point Man") then
    PMAvatar = avatar
  end
  i = i + 1
end
if PMAvatar and enableObj ~= nil then
  Debug.PrintInfoIf(0 < g_debugMode, "Enable Object - Number:" .. table.getn(enableObj))
  for key, nextObj in pairs(enableObj) do
    Game.EnableAllEnableables(nextObj, true)
  end
end
