local Game = GameScript.Game
local ObjectTags = Game.ObjectTags
local Callbacks = GameScript.Callbacks
local Print = GameScript.Debug.PrintInfo
local me = Game.GetMyObject()
if me ~= nil then
  local tagID = ObjectTags.GetObjectTagUID("Casting Projectile")
  Callbacks.RegisterObjectTagEnterExitRegion(me, tagID, "ProjectileEntersRegion", "")
end

function ProjectileEntersRegion(regionInfo)
  local bIsTaget = regionInfo.region == Game.GetProjectileTarget(regionInfo.object)
  if bIsTaget then
    Game.SendTextMessage(me, "enableToSpawn")
    Game.Kill(regionInfo.object, 1)
  else
  end
end
