local Game = GameScript.Game
local Support = GameScript.Support
local Callbacks = GameScript.Callbacks
local Utilities = GameScript.Utilities
local Player = Game.Player
local ObjectTags = Game.ObjectTags
local Debug = GameScript.Debug
local MP = GameScript.Game.MP
local bFettelOnly = Support.ImportBoolVariableWithDefault("Fettel Only", "Don't spawn these in a Pointman Single Player game", false)
local Link1 = Support.ImportSingleObject("Ragdoll 1 Link", "Linkable ragdoll object")
local Link2 = Support.ImportSingleObject("Ragdoll 2 Link", "Linkable ragdoll object")
local Link3 = Support.ImportSingleObject("Ragdoll 3 Link", "Linkable ragdoll object")
local Link4 = Support.ImportSingleObject("Ragdoll 4 Link", "Linkable ragdoll object")
GameScript.Support.ExportFloatVariable("NetResult", 0, "Random selection that is returned.")
local fettelAvatar
local TimeInSeconds = 0.02
local Groups = 0
MyObject = GameScript.Game.GetMyObject()
AllLinks = {}

function CheckForFettel()
  local i = 0
  while i <= Player.GetNumPlayers() do
    local avatar = Player.GetPlayerAvatarObjectByIndex(i)
    if avatar and ObjectTags.DoesObjectHaveTag(avatar, "Fettel") then
      fettelAvatar = avatar
    end
    i = i + 1
  end
end

function RandomizeBodies()
  Utilities.GenerateRandomSeed()
  local numToRandom = Groups * 2
  local result = Utilities.GetRandomInteger(1, numToRandom) / 2
  result = math.ceil(result)
  Extern.NetResult = result
  RemoveUnchosen()
end

function RemoveUnchosen()
  RandomObject = AllLinks[Extern.NetResult]
  if not MP.IsClient() then
    for k, obj in pairs(AllLinks) do
      if obj ~= nil and obj ~= AllLinks and obj ~= RandomObject then
        Game.Kill(obj, 0)
      end
    end
  end
  Game.Kill(MyObject, 0)
end

function RemoveAllBodies()
  if not MP.IsClient() then
    for k, obj in pairs(AllLinks) do
      if obj ~= nil and obj ~= AllLinks then
        Game.Kill(obj, 0)
      end
    end
  end
end

function BuildArrays()
  if Link1 ~= nil and Link1 ~= MyObject then
    Groups = Groups + 1
    AllLinks[Groups] = Link1
  end
  if Link2 ~= nil and Link2 ~= MyObject then
    Groups = Groups + 1
    AllLinks[Groups] = Link2
  end
  if Link3 ~= nil and Link3 ~= MyObject then
    Groups = Groups + 1
    AllLinks[Groups] = Link3
  end
  if Link4 ~= nil and Link4 ~= MyObject then
    Groups = Groups + 1
    AllLinks[Groups] = Link4
  end
  if Groups < 2 then
    Debug.PrintError("You must have more then one possible Linkable Body in this script!")
    Support.ExitScript()
  end
end

BuildArrays()
if not MP.IsClient() then
  if bFettelOnly then
    CheckForFettel()
    if fettelAvatar == nil then
      RemoveAllBodies()
    else
      Callbacks.RegisterForTimer("RandomizeBodies", TimeInSeconds, false)
    end
  else
    Callbacks.RegisterForTimer("RandomizeBodies", TimeInSeconds, false)
  end
else
  Callbacks.RegisterForScriptValueUpdated("RemoveUnchosen")
end
