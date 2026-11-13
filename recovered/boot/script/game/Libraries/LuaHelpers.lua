local mainGlobal = _G
local GS = Despair.GameScript
local Util = GS.Utilities
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
local next = mainGlobal.next
module(...)
local Helpers = GS.LuaHelpers

function CopyListKeysToArrayIndicies(list)
  for key, value in pairs(list) do
    if type(key) ~= "number" then
      local keyNumber = tonumber(key)
      if keyNumber ~= nil then
        list[keyNumber] = value
      end
    end
  end
end

function TableCopy(a, b)
  for key, value in pairs(b) do
    a[key] = value
  end
end

function GetNumTableKeys(table)
  local count = 0
  for key, value in pairs(table) do
    count = count + 1
  end
  return count
end

function KeyExistsInTable(key, table)
  for k, v in pairs(table) do
    if k == key then
      return true
    end
  end
  return false
end

function AddUniqueItemToTable(t, item)
  for index, value in ipairs(t) do
    if value == item then
      return
    end
  end
  table.insert(t, item)
end

function GetRandomItemFromTable(t)
  local numElements = #t
  if numElements == 0 then
    return nil
  end
  local randIndex = Util.GetRandomInteger(1, numElements)
  return t[randIndex], randIndex
end

function GetRandomItemFromTableMeetingCondition(t, conditionFunc)
  local numElements = #t
  if 0 < numElements then
    local testElement, initialIndex = GetRandomItemFromTable(t)
    local testIndex = initialIndex + 1
    if numElements < testIndex then
      testIndex = 1
    end
    while not conditionFunc(testElement) and testIndex ~= initialIndex do
      testElement = t[testIndex]
      testIndex = testIndex + 1
      if numElements < testIndex then
        testIndex = 1
      end
    end
    if testIndex ~= initialIndex then
      return testElement
    end
  end
  return nil
end

function StartCinema(CinemaObject, PrimaryPlayerIsFettel, SecondaryPlayerProxyIsEmpty)
  if CinemaObject and type(PrimaryPlayerIsFettel) == "boolean" and type(SecondaryPlayerProxyIsEmpty) == "boolean" then
    if not PrimaryPlayerIsFettel or SecondaryPlayerProxyIsEmpty then
      local PointManIndex, FettelIndex = Util.GetPointManFettelIndecies()
      local PrimaryIndex, SecondaryIndex = PointManIndex, GS.PlayerIndex.kNotAGlobalPlayer
      if PrimaryPlayerIsFettel then
        if FettelIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
          PrimaryIndex = FettelIndex
        else
          return false
        end
      end
      if not PrimaryPlayerIsFettel and not SecondaryPlayerProxyIsEmpty and FettelIndex ~= GS.PlayerIndex.kNotAGlobalPlayer then
        SecondaryIndex = FettelIndex
      end
      if GS.Game.IsLoaded(CinemaObject) then
        GS.Game.RunCutscene(CinemaObject, PrimaryIndex, SecondaryIndex)
        return true
      else
        GS.Debug.PrintWarning(GS.Game.GetName(GS.Game.GetMyObject()) .. ": Cinema Object is no longer loaded when attempting to start it.")
        return false
      end
    else
      GS.Debug.PrintError(GS.Game.GetName(GS.Game.GetMyObject()) .. ": Both Primary and Secondary Player Proxies are set to Fettel")
      return false
    end
  else
    GS.Debug.PrintWarning(GS.Game.GetName(GS.Game.GetMyObject()) .. ": Function Arguments were invalid")
    return false
  end
end
