local mainGlobal = _G
local GS = Despair.GameScript
local Game = GS.Game
local Utilities = GS.Utilities
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
local next = mainGlobal.next
module(...)
local Debug = GS.Debug

function PrintTable(thisTable)
  if type(thisTable) == "table" then
    PrintInfo("*PrintTable*:")
    if next(thisTable) == nil then
      PrintInfo("Table is empty")
    else
      for key, value in pairs(thisTable) do
        if type(key) == "string" then
          PrintInfo("Key:\"" .. key .. "\" Value:" .. tostring(value))
        else
          PrintInfo("Key:" .. key .. " Value:" .. tostring(value))
        end
      end
    end
  else
    PrintInfo("*PrintTable*:Not a table:" .. tostring(thisTable))
  end
end

function PrintInfoIf(condition, text)
  if condition then
    PrintInfo(text)
  end
end

function PrintWarningIf(condition, text)
  if condition then
    PrintWarning(text)
  end
end

function PrintErrorIf(condition, text)
  if condition then
    PrintError(text)
  end
end

function DrawArrowAboveObject(Object, HeightAboveObject, Height, Radius, Color, Debug)
  if Debug then
    local Position = Game.GetPosition(Object)
    Debug.DrawArrowAbovePosition(Position, HeightAbovePosition, Height, Radius, Color, true)
  end
end

function DrawArrowAbovePosition(Position, HeightAbovePosition, Height, Radius, Color, Debug)
  if Debug then
    local Finish = Position
    Finish[y] = Finish[y] + HeightAboveObject
    local Start = Finish
    Start[y] = Start[y] + Height
    Debug.DrawArrow(Start, Finish, Radius, Color)
  end
end

function GetSystemFreeMB()
  if Debug.GetSystemMemoryAvailable == nil then
    return nil
  end
  local memAvailable = Debug.GetSystemMemoryAvailable()
  memAvailable = memAvailable / 1048576
  memAvailable = memAvailable * 100
  memAvailable = math.floor(memAvailable)
  memAvailable = memAvailable / 100
  return memAvailable
end

function PrintToOutputAndScreenWithTimer(message, time, color, center)
  if time == nil then
    time = 5
  end
  if color == nil then
    color = Utilities.kRed
  end
  if center == nil then
    center = false
  end
  Debug.PrintToScreenWithTimer(message, time, color, center)
  Debug.PrintInfo(message)
end
