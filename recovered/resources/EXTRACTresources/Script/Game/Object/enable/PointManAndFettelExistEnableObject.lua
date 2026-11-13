local Support = GameScript.Support
local Game = GameScript.Game
local Debug = GameScript.Debug
local Player = Game.Player
local ObjectTags = Game.ObjectTags
Support.AddDescription("Enable an object or objects in a set when the script is started and if the game has PM and Fettel in it.")
local enableObj = Support.ImportObjectHandleVariable("EnableObj", "Object or Objects that are enabled when trigger entered")
local PMAvatar, FettelAvatar
local i = 0
while i <= Player.GetNumPlayers() do
  local avatar = Player.GetPlayerAvatarObjectByIndex(i)
  if avatar then
    if ObjectTags.DoesObjectHaveTag(avatar, "Point Man") then
      PMAvatar = avatar
    end
    if ObjectTags.DoesObjectHaveTag(avatar, "Fettel") then
      FettelAvatar = avatar
    end
  end
  i = i + 1
end
if PMAvatar and FettelAvatar and enableObj ~= nil then
  Debug.PrintInfoIf(0 < g_debugMode, "Enable Object - Number:" .. table.getn(enableObj))
  for key, nextObj in pairs(enableObj) do
    Game.EnableAllEnableables(nextObj, true)
  end
end
