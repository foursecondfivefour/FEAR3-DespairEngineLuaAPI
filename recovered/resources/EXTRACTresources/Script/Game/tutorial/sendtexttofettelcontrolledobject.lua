local Callbacks = GameScript.Callbacks
local Support = GameScript.Support
local Game = GameScript.Game
local Player = Game.Player
local ObjectTags = Game.ObjectTags
local text = Support.ImportStringVariable("Text Message", "Text Message to send to object(s) when entering region")
local timer = Support.ImportFloatVariable("Timer", "Time to wait until sending text message")
local fettelAvatar, fettelControlledAvatar

function SendText()
  Game.SendTextMessage(fettelControlledAvatar, text)
end

local i = 0
while i <= Player.GetNumPlayers() do
  local avatar = Player.GetPlayerAvatarObjectByIndex(i)
  if avatar and ObjectTags.DoesObjectHaveTag(avatar, "Fettel") then
    fettelAvatar = avatar
    fettelControlledAvatar = Player.GetPlayerControlledObjectByIndex(i)
  end
  i = i + 1
end
if fettelControlledAvatar ~= nil then
  if timer == 0 then
    SendText()
  else
    Callbacks.RegisterForTimer("SendText", timer, false)
  end
end
