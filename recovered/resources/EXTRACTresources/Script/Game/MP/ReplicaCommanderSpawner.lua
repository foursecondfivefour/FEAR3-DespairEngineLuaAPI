local Support = GameScript.Support
local Game = GameScript.Game
local Player = GameScript.Game.Player
local AIActions = GameScript.AIActions
local MP = Game.MP
local ObjectTags = Game.ObjectTags
local Sets = Game.Sets
local myObject = Game.GetMyObject()
Support.RegisterObjectTemplateVariable("SpawnTemplate", "The template for AI to spawn")
if not MP.IsClient() then
  local rotation = Game.GetRotation(myObject)
  local spawnedObject = Game.SpawnWithRotation("SpawnTemplate", Game.GetPosition(myObject), rotation)
  local orderObject = ObjectTags.GetObjectsWithTag("Multiplayer game type-specific")
  if orderObject ~= nil then
    for key, value in pairs(orderObject) do
      if value ~= nil then
        Sets.AddObjectToSet(value, spawnedObject)
      end
    end
  end
  local numPlayers = Player.GetNumPlayers()
  for curPlayer = GameScript.PlayerIndex.kGlobalPlayer1, numPlayers - 1 do
    if MP.GetTeamForPlayer(curPlayer) == 0 then
      playerObj = Player.GetPlayerAvatarObjectByIndex(curPlayer)
      Game.SendTextMessage(playerObj, "AISpawned")
      Support.ExitScript()
    end
  end
end
