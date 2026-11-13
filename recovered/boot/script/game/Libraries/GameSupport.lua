local mainGlobal = _G
local GS = Despair.GameScript
local Helpers = GS.LuaHelpers
local Debug = GS.Debug
local pairs = mainGlobal.pairs
local ipairs = mainGlobal.ipairs
local type = mainGlobal.type
local tostring = mainGlobal.tostring
local tonumber = mainGlobal.tonumber
local table = mainGlobal.table
local math = mainGlobal.math
local next = mainGlobal.next
module(...)
local Support = GS.Support

function ImportFirstObject(scriptName, description)
  local objList = Support.ImportObjectHandleVariable(scriptName, description)
  if table.getn(objList) > 0 then
    return objList[1]
  end
  return nil
end

function NumberToBool(f)
  if f == 0 then
    return false
  end
  return true
end

function ImportAnimLabelTag(baseName, description)
  local t = {}
  local animTagName = " - AnimLabelTag - "
  t.group = Support.ImportStringVariable(baseName .. animTagName .. "Group", description)
  t.label = Support.ImportStringVariable(baseName .. animTagName .. "Label", " ")
  t.type = Support.ImportEnumVariable("GameScript.AnimTagType", baseName .. animTagName .. "Type", " ")
  return t
end
