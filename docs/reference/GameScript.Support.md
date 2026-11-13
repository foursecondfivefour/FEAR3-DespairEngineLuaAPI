# GameScript.Support

[Индекс](../API.md)

## GameScript.Support.AddDescription

```lua
GameScript.Support.AddDescription(arg1)
```

Источник: [Lua, строка 3010](../../luasense_decompiled.lua#L3010). Имена `argN` — placeholders реконструкции.

When the script is selected in the tools the description text will be displayed.  It is also visible in non-final game in the C++ debugger

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "When the script is selected in the tools the description text will be displayed.  It is also visible in non-final game in the C++ debugger"
}
```

</details>

## GameScript.Support.AddToWorldVectorVariable

```lua
GameScript.Support.AddToWorldVectorVariable(arg1, arg2)
```

Источник: [Lua, строка 3013](../../luasense_decompiled.lua#L3013). Имена `argN` — placeholders реконструкции.

Take a variable containing a vector of world variable 'WorldsToAddVariableName' and add them to the world list held in 'WorldVectorScriptName', it can then be used in Game.StreamWorld or other commands.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | WorldVectorScriptName | The variable name we will use to refer to this list |
| 2.0 | WorldsToAddVariableName | The variable containing world we wish to add |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "WorldVectorScriptName",
      "@K[211]": "The variable name we will use to refer to this list"
    },
    "2.0": {
      "@K[209]": "WorldsToAddVariableName",
      "@K[211]": "The variable containing world we wish to add"
    }
  },
  "@K[203]": "Take a variable containing a vector of world variable 'WorldsToAddVariableName' and add them to the world list held in 'WorldVectorScriptName', it can then be used in Game.StreamWorld or other commands."
}
```

</details>

## GameScript.Support.CreateScriptEvent

```lua
GameScript.Support.CreateScriptEvent(arg1, arg2)
```

Источник: [Lua, строка 3016](../../luasense_decompiled.lua#L3016). Имена `argN` — placeholders реконструкции.

Create an script event variable from the SequenceEvent name which can be triggered from script and used for messages on the object that uses the script.  This event and message will automatically be properly handled by the network.This function will return an id number which will be used when you want to StartScriptEvent(), or RegisterForScriptEvent().   Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EventVariableName | A name that is used to reference the variable in the script component, Usually used for display in forge, but in this case, we hide it because it is just clutter |
| 2.0 | SequenceEventName | Name of the sequenceEvent in the global sequence component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EventVariableName",
      "@K[211]": "A name that is used to reference the variable in the script component, Usually used for display in forge, but in this case, we hide it because it is just clutter"
    },
    "2.0": {
      "@K[209]": "SequenceEventName",
      "@K[211]": "Name of the sequenceEvent in the global sequence component"
    }
  },
  "@K[203]": "Create an script event variable from the SequenceEvent name which can be triggered from script and used for messages on the object that uses the script.  This event and message will automatically be properly handled by the network.This function will return an id number which will be used when you want to StartScriptEvent(), or RegisterForScriptEvent().   Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.CreateWorldVectorVariable

```lua
GameScript.Support.CreateWorldVectorVariable(arg1)
```

Источник: [Lua, строка 3019](../../luasense_decompiled.lua#L3019). Имена `argN` — placeholders реконструкции.

Create an empty world vector associated with the script component under <TemplateScriptName>. This will not be editable in tools, but can be used with the cmmands, AddToWorldVectorVariable and RemoveFromWorldVectorVariable to create new world vector combinations that can then be used with Game.StreamWorld or other commands.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | WorldVectorScriptName | The variable name we will use to refer to this list |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "WorldVectorScriptName",
      "@K[211]": "The variable name we will use to refer to this list"
    }
  },
  "@K[203]": "Create an empty world vector associated with the script component under <TemplateScriptName>. This will not be editable in tools, but can be used with the cmmands, AddToWorldVectorVariable and RemoveFromWorldVectorVariable to create new world vector combinations that can then be used with Game.StreamWorld or other commands."
}
```

</details>

## GameScript.Support.DoesObjectTemplateMatch

```lua
GameScript.Support.DoesObjectTemplateMatch(arg1, arg2)
```

Источник: [Lua, строка 3022](../../luasense_decompiled.lua#L3022). Имена `argN` — placeholders реконструкции.

Checks to see if the template for the <EmpireObject> matches the template that is associated with the ".dsObject" file in the script component under <TemplateScriptName>.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | Object for which we are checking |
| 2.0 | TemplateScriptName | The name in the ScriptComponent object template list that refers to the object template we are searching |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "Object for which we are checking"
    },
    "2.0": {
      "@K[209]": "TemplateScriptName",
      "@K[211]": "The name in the ScriptComponent object template list that refers to the object template we are searching"
    }
  },
  "@K[203]": "Checks to see if the template for the <EmpireObject> matches the template that is associated with the \".dsObject\" file in the script component under <TemplateScriptName>."
}
```

</details>

## GameScript.Support.ExitScript

```lua
GameScript.Support.ExitScript()
```

Источник: [Lua, строка 3025](../../luasense_decompiled.lua#L3025). Имена `argN` — placeholders реконструкции.

Exit the script for this object so it no longer updates or responds to callbacks

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Exit the script for this object so it no longer updates or responds to callbacks"
}
```

</details>

## GameScript.Support.ExportFloatVariable

```lua
GameScript.Support.ExportFloatVariable(arg1, arg2, arg3)
```

Источник: [Lua, строка 3028](../../luasense_decompiled.lua#L3028). Имена `argN` — placeholders реконструкции.

Create a variable in the script that will be accessible through the script component of this object and then can then be accessed by other components in this object or from other objects, for example through a WatchVariable. The variable of this name in the script is host authoritative in a networked environment.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be defining in the script |
| 2.0 | InitialValue | The initial value we will give the variable.  This is visible in Forge and Landscape |
| 3.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be defining in the script"
    },
    "2.0": {
      "@K[209]": "InitialValue",
      "@K[211]": "The initial value we will give the variable.  This is visible in Forge and Landscape"
    },
    "3.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script that will be accessible through the script component of this object and then can then be accessed by other components in this object or from other objects, for example through a WatchVariable. The variable of this name in the script is host authoritative in a networked environment.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.GetCurveValue

```lua
GameScript.Support.GetCurveValue(arg1, arg2)
```

Источник: [Lua, строка 3031](../../luasense_decompiled.lua#L3031). Имена `argN` — placeholders реконструкции.

Returns value of the curve, chosen to match the CurveScriptName in the tools, at the position inputValue.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CurveScriptName | The name that the script used to register the curve. |
| 2.0 | InputValue | Inpboostut value for which point on the curve to look up. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CurveScriptName",
      "@K[211]": "The name that the script used to register the curve."
    },
    "2.0": {
      "@K[209]": "InputValue",
      "@K[211]": "Inpboostut value for which point on the curve to look up."
    }
  },
  "@K[203]": "Returns value of the curve, chosen to match the CurveScriptName in the tools, at the position inputValue."
}
```

</details>

## GameScript.Support.GetGameTime

```lua
GameScript.Support.GetGameTime()
```

Источник: [Lua, строка 3034](../../luasense_decompiled.lua#L3034). Имена `argN` — placeholders реконструкции.

Return the current game time in seconds.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return the current game time in seconds."
}
```

</details>

## GameScript.Support.GetGameTimeDelta

```lua
GameScript.Support.GetGameTimeDelta()
```

Источник: [Lua, строка 3037](../../luasense_decompiled.lua#L3037). Имена `argN` — placeholders реконструкции.

Return the current game time delta in seconds.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return the current game time delta in seconds."
}
```

</details>

## GameScript.Support.GetImportObjectTable

```lua
GameScript.Support.GetImportObjectTable(arg1)
```

Источник: [Lua, строка 3040](../../luasense_decompiled.lua#L3040). Имена `argN` — placeholders реконструкции.

Returns all objects specified by the Import Object Handle Variable of the given name. The list always returns a table, even if it only returns one object. If the Import Object Handle Variable is returning "Objects in My Set" or "Objects in a Set", then it will not return the specified object, but rather the objects inside its Set Component if it has one.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable whose value we are getting |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable whose value we are getting"
    }
  },
  "@K[203]": "Returns all objects specified by the Import Object Handle Variable of the given name. The list always returns a table, even if it only returns one object. If the Import Object Handle Variable is returning \"Objects in My Set\" or \"Objects in a Set\", then it will not return the specified object, but rather the objects inside its Set Component if it has one."
}
```

</details>

## GameScript.Support.GetImportWatchVariableValue

```lua
GameScript.Support.GetImportWatchVariableValue(arg1)
```

Источник: [Lua, строка 3043](../../luasense_decompiled.lua#L3043). Имена `argN` — placeholders реконструкции.

Returns the value of the watch variable of the given name. Returns 0 if the variable is unbound or does not exist.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the watch variable whose value we are getting |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the watch variable whose value we are getting"
    }
  },
  "@K[203]": "Returns the value of the watch variable of the given name. Returns 0 if the variable is unbound or does not exist."
}
```

</details>

## GameScript.Support.GetObjectVariableFromComponent

```lua
GameScript.Support.GetObjectVariableFromComponent(arg1, arg2, arg3)
```

Источник: [Lua, строка 3046](../../luasense_decompiled.lua#L3046). Имена `argN` — placeholders реконструкции.

Returns value of the variable contained in the component named "ComponentName" in "EmpireObject".

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting a variable |
| 2.0 | ObjectVariableName | The name of the variable in the "EmpireObject". |
| 3.0 | ComponentName | The name of the component in the "EmpireObject". |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting a variable"
    },
    "2.0": {
      "@K[209]": "ObjectVariableName",
      "@K[211]": "The name of the variable in the \"EmpireObject\"."
    },
    "3.0": {
      "@K[209]": "ComponentName",
      "@K[211]": "The name of the component in the \"EmpireObject\"."
    }
  },
  "@K[203]": "Returns value of the variable contained in the component named \"ComponentName\" in \"EmpireObject\"."
}
```

</details>

## GameScript.Support.GetPlatform

```lua
GameScript.Support.GetPlatform()
```

Источник: [Lua, строка 3049](../../luasense_decompiled.lua#L3049). Имена `argN` — placeholders реконструкции.

Return an enum for the platform.  GameScript.Platform.XBox360,PS3,Win32

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return an enum for the platform.  GameScript.Platform.XBox360,PS3,Win32"
}
```

</details>

## GameScript.Support.GetRandomFactor

```lua
GameScript.Support.GetRandomFactor()
```

Источник: [Lua, строка 3052](../../luasense_decompiled.lua#L3052). Имена `argN` — placeholders реконструкции.

Return a random number from 0.0 to 1.0(range includes both 0 and 1)

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return a random number from 0.0 to 1.0(range includes both 0 and 1)"
}
```

</details>

## GameScript.Support.GetRandomInteger

```lua
GameScript.Support.GetRandomInteger(arg1, arg2)
```

Источник: [Lua, строка 3055](../../luasense_decompiled.lua#L3055). Имена `argN` — placeholders реконструкции.

Return a random integer from minValue to maxValue(range includes both min and max)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MinValue | Lowest possible return |
| 2.0 | MaxValue | Highest possible return |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MinValue",
      "@K[211]": "Lowest possible return"
    },
    "2.0": {
      "@K[209]": "MaxValue",
      "@K[211]": "Highest possible return"
    }
  },
  "@K[203]": "Return a random integer from minValue to maxValue(range includes both min and max)"
}
```

</details>

## GameScript.Support.GetScriptExportVariable

```lua
GameScript.Support.GetScriptExportVariable(arg1, arg2)
```

Источник: [Lua, строка 3058](../../luasense_decompiled.lua#L3058). Имена `argN` — placeholders реконструкции.

Return the value from the "EmpireObject" of variable exported from the script with the name "ScriptVariableName".

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are examining for a variable |
| 2.0 | ScriptVariableName | The name of the variable in the "EmpireObject". |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are examining for a variable"
    },
    "2.0": {
      "@K[209]": "ScriptVariableName",
      "@K[211]": "The name of the variable in the \"EmpireObject\"."
    }
  },
  "@K[203]": "Return the value from the \"EmpireObject\" of variable exported from the script with the name \"ScriptVariableName\"."
}
```

</details>

## GameScript.Support.GetStreamingWorldNames

```lua
GameScript.Support.GetStreamingWorldNames(arg1, arg2)
```

Источник: [Lua, строка 3061](../../luasense_decompiled.lua#L3061). Имена `argN` — placeholders реконструкции.

Returns the current desired and required worlds.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | desiredWorldsScriptName | The variable name for the desired worlds to be stored in. |
| 2.0 | requiredWorldsScriptName | The variable name for the required worlds to be stored in. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "desiredWorldsScriptName",
      "@K[211]": "The variable name for the desired worlds to be stored in."
    },
    "2.0": {
      "@K[209]": "requiredWorldsScriptName",
      "@K[211]": "The variable name for the required worlds to be stored in."
    }
  },
  "@K[203]": "Returns the current desired and required worlds."
}
```

</details>

## GameScript.Support.HasScriptExportVariable

```lua
GameScript.Support.HasScriptExportVariable(arg1, arg2)
```

Источник: [Lua, строка 3064](../../luasense_decompiled.lua#L3064). Имена `argN` — placeholders реконструкции.

Determines if the "EmpireObject" has export a variable from the script with the name "ScriptVariableName".

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are examining for a variable |
| 2.0 | ScriptVariableName | The name of the variable in the "EmpireObject". |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are examining for a variable"
    },
    "2.0": {
      "@K[209]": "ScriptVariableName",
      "@K[211]": "The name of the variable in the \"EmpireObject\"."
    }
  },
  "@K[203]": "Determines if the \"EmpireObject\" has export a variable from the script with the name \"ScriptVariableName\"."
}
```

</details>

## GameScript.Support.ImportBoolVariable

```lua
GameScript.Support.ImportBoolVariable(arg1, arg2)
```

Источник: [Lua, строка 3067](../../luasense_decompiled.lua#L3067). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools, by a check box, will then be passed into the script   Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools, by a check box, will then be passed into the script   Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportBoolVariableWithDefault

```lua
GameScript.Support.ImportBoolVariableWithDefault(arg1, arg2, arg3)
```

Источник: [Lua, строка 3070](../../luasense_decompiled.lua#L3070). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools, by a check box, will then be passed into the script   Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |
| 3.0 | DefaultValue | The default value of the variable when it is created |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    },
    "3.0": {
      "@K[209]": "DefaultValue",
      "@K[211]": "The default value of the variable when it is created"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools, by a check box, will then be passed into the script   Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportColorVariable

```lua
GameScript.Support.ImportColorVariable(arg1, arg2)
```

Источник: [Lua, строка 3073](../../luasense_decompiled.lua#L3073). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportEnumVariable

```lua
GameScript.Support.ImportEnumVariable(arg1, arg2, arg3)
```

Источник: [Lua, строка 3076](../../luasense_decompiled.lua#L3076). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value will be selected with a combo box and return by this function.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TableName | The name of the table  |
| 2.0 | VariableName | The name of the variable we will be accessing from the script |
| 3.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TableName",
      "@K[211]": "The name of the table "
    },
    "2.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "3.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value will be selected with a combo box and return by this function.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportFloatVariable

```lua
GameScript.Support.ImportFloatVariable(arg1, arg2)
```

Источник: [Lua, строка 3079](../../luasense_decompiled.lua#L3079). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportFloatVariableWithDefault

```lua
GameScript.Support.ImportFloatVariableWithDefault(arg1, arg2, arg3)
```

Источник: [Lua, строка 3082](../../luasense_decompiled.lua#L3082). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |
| 3.0 | DefaultValue | The default value of the variable when it is created |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    },
    "3.0": {
      "@K[209]": "DefaultValue",
      "@K[211]": "The default value of the variable when it is created"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportObjectHandleVariable

```lua
GameScript.Support.ImportObjectHandleVariable(arg1, arg2)
```

Источник: [Lua, строка 3085](../../luasense_decompiled.lua#L3085). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game. Returns true if exists in game and if created in the tools  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game. Returns true if exists in game and if created in the tools  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportObjectList

```lua
GameScript.Support.ImportObjectList(arg1, arg2)
```

Источник: [Lua, строка 3088](../../luasense_decompiled.lua#L3088). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Landscape.  This variable will allow you to set up a list of objects.  The size of the list, and the objects in that list are set in Landscape. The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Landscape.  This variable will allow you to set up a list of objects.  The size of the list, and the objects in that list are set in Landscape. The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportRegionObject

```lua
GameScript.Support.ImportRegionObject(arg1, arg2)
```

Источник: [Lua, строка 3091](../../luasense_decompiled.lua#L3091). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape to an object with a region component.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape to an object with a region component.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportScriptEvent

```lua
GameScript.Support.ImportScriptEvent(arg1, arg2)
```

Источник: [Lua, строка 3094](../../luasense_decompiled.lua#L3094). Имена `argN` — placeholders реконструкции.

Create an event that can be triggered from script and used for messages on the object that uses the script.  This event and message will automatically be properly handled by the network.This function will return an id number which will be used when you want to SendEventMessage(), or RegisterForScriptEvent().  The description is only used for the tools UI  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EventName | A name to look up the id associated with the ecen |
| 2.0 | EventDescription | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EventName",
      "@K[211]": "A name to look up the id associated with the ecen"
    },
    "2.0": {
      "@K[209]": "EventDescription",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create an event that can be triggered from script and used for messages on the object that uses the script.  This event and message will automatically be properly handled by the network.This function will return an id number which will be used when you want to SendEventMessage(), or RegisterForScriptEvent().  The description is only used for the tools UI  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportSetObject

```lua
GameScript.Support.ImportSetObject(arg1, arg2)
```

Источник: [Lua, строка 3097](../../luasense_decompiled.lua#L3097). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape to an object with a set component.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape to an object with a set component.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportSingleObject

```lua
GameScript.Support.ImportSingleObject(arg1, arg2)
```

Источник: [Lua, строка 3100](../../luasense_decompiled.lua#L3100). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape to a single object.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape to a single object.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportStaticTextVariable

```lua
GameScript.Support.ImportStaticTextVariable(arg1, arg2)
```

Источник: [Lua, строка 3103](../../luasense_decompiled.lua#L3103). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools will then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools will then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportStaticTextVariableWithDefault

```lua
GameScript.Support.ImportStaticTextVariableWithDefault(arg1, arg2, arg3)
```

Источник: [Lua, строка 3106](../../luasense_decompiled.lua#L3106). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools will then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |
| 3.0 | DefaultValue | The default value of the variable |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    },
    "3.0": {
      "@K[209]": "DefaultValue",
      "@K[211]": "The default value of the variable"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools will then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportStringVariable

```lua
GameScript.Support.ImportStringVariable(arg1, arg2)
```

Источник: [Lua, строка 3109](../../luasense_decompiled.lua#L3109). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportStringVariableWithDefault

```lua
GameScript.Support.ImportStringVariableWithDefault(arg1, arg2, arg3)
```

Источник: [Lua, строка 3112](../../luasense_decompiled.lua#L3112). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |
| 3.0 | DefaultValue | The default value of the variable |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    },
    "3.0": {
      "@K[209]": "DefaultValue",
      "@K[211]": "The default value of the variable"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportVectorVariable

```lua
GameScript.Support.ImportVectorVariable(arg1, arg2)
```

Источник: [Lua, строка 3115](../../luasense_decompiled.lua#L3115). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.ImportWatchVariable

```lua
GameScript.Support.ImportWatchVariable(arg1, arg2)
```

Источник: [Lua, строка 3118](../../luasense_decompiled.lua#L3118). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools when then be passed into the script as a variable of the same name, when that script is first run in the game.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.IsSplitScreen

```lua
GameScript.Support.IsSplitScreen()
```

Источник: [Lua, строка 3121](../../luasense_decompiled.lua#L3121). Имена `argN` — placeholders реконструкции.

Return a bool indicating whether or not the game is running in split screen

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return a bool indicating whether or not the game is running in split screen"
}
```

</details>

## GameScript.Support.RegisterAnimationGraphResourceVariable

```lua
GameScript.Support.RegisterAnimationGraphResourceVariable(arg1, arg2)
```

Источник: [Lua, строка 3124](../../luasense_decompiled.lua#L3124). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape. The value set in the tools is an animation resource. When this runs in the game it returns true if the variable has a movie. There are other commands that will take this variable name and look up the movie resource for commands such as SetAnimationGraphResource. Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape. The value set in the tools is an animation resource. When this runs in the game it returns true if the variable has a movie. There are other commands that will take this variable name and look up the movie resource for commands such as SetAnimationGraphResource. Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.RegisterComponentHandle

```lua
GameScript.Support.RegisterComponentHandle(arg1, arg2)
```

Источник: [Lua, строка 3127](../../luasense_decompiled.lua#L3127). Имена `argN` — placeholders реконструкции.

Eventually will create a variable that can be set to select a component in Forge. Current does nothing in the tools, but in game gets the handle to a component for your current object that can be used in other calls.  This was set up specifically for IEnergyComponent and if useful, may be generalized.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentName | The name of the component for which we want a handle |
| 2.0 | @K[203] | A description that eventually will be visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentName",
      "@K[211]": "The name of the component for which we want a handle"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that eventually will be visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Eventually will create a variable that can be set to select a component in Forge. Current does nothing in the tools, but in game gets the handle to a component for your current object that can be used in other calls.  This was set up specifically for IEnergyComponent and if useful, may be generalized."
}
```

</details>

## GameScript.Support.RegisterCurveTemplateVariable

```lua
GameScript.Support.RegisterCurveTemplateVariable(arg1, arg2)
```

Источник: [Lua, строка 3130](../../luasense_decompiled.lua#L3130). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is a curve template(i.e. *.dsCurve). When this runs in the game it returns true if the variable has a curve template. There are other commands that will take this variable name and look up the curve template for commands such as SetEnvironmentLight.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is a curve template(i.e. *.dsCurve). When this runs in the game it returns true if the variable has a curve template. There are other commands that will take this variable name and look up the curve template for commands such as SetEnvironmentLight.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.RegisterMenuVariable

```lua
GameScript.Support.RegisterMenuVariable(arg1, arg2)
```

Источник: [Lua, строка 3133](../../luasense_decompiled.lua#L3133). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is a menu(i.e. *.dsMenu). When this runs in the game it returns true if the variable has a menu. There are other commands that will take this variable name and look up the menu for commands such as ShowMovie and ShowFullscreenMovie.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is a menu(i.e. *.dsMenu). When this runs in the game it returns true if the variable has a menu. There are other commands that will take this variable name and look up the menu for commands such as ShowMovie and ShowFullscreenMovie.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.RegisterMovieVariable

```lua
GameScript.Support.RegisterMovieVariable(arg1, arg2)
```

Источник: [Lua, строка 3136](../../luasense_decompiled.lua#L3136). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is movie. When this runs in the game it returns true if the variable has a movie. There are other commands that will take this variable name and look up the movie resource for commands such as ShowMovie.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is movie. When this runs in the game it returns true if the variable has a movie. There are other commands that will take this variable name and look up the movie resource for commands such as ShowMovie.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.RegisterObjectTemplateVariable

```lua
GameScript.Support.RegisterObjectTemplateVariable(arg1, arg2)
```

Источник: [Lua, строка 3139](../../luasense_decompiled.lua#L3139). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is an objectTemplate(i.e. *.dsObject). When this runs in the game it returns true if the variable has an object template. There are other commands that will take this variable name and look up the object template for commands such as SpawnObject.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is an objectTemplate(i.e. *.dsObject). When this runs in the game it returns true if the variable has an object template. There are other commands that will take this variable name and look up the object template for commands such as SpawnObject.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.RegisterTextureVariable

```lua
GameScript.Support.RegisterTextureVariable(arg1, arg2)
```

Источник: [Lua, строка 3142](../../luasense_decompiled.lua#L3142). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is a texture(i.e. *.tif). When this runs in the game it returns true if the variable has a texture. There are other commands that will take this variable name and look up the texture for commands such as SetAmbientCubeMap.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is a texture(i.e. *.tif). When this runs in the game it returns true if the variable has a texture. There are other commands that will take this variable name and look up the texture for commands such as SetAmbientCubeMap.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.RegisterWorldVectorVariable

```lua
GameScript.Support.RegisterWorldVectorVariable(arg1, arg2)
```

Источник: [Lua, строка 3145](../../luasense_decompiled.lua#L3145). Имена `argN` — placeholders реконструкции.

Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is a vector of worlds (i.e. *.dsWorld). When this runs in the game it returns true if the variable has a vector. There are other commands that will take this variable name and look up the world vector for commands such as StreamWorlds.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we will be accessing from the script |
| 2.0 | @K[203] | A description that is visible in Forge and Landscape, ignored in game |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we will be accessing from the script"
    },
    "2.0": {
      "@K[209]": "@K[203]",
      "@K[211]": "A description that is visible in Forge and Landscape, ignored in game"
    }
  },
  "@K[203]": "Create a variable in the script component that can be set in Forge or Landscape.  The value set in the tools is a vector of worlds (i.e. *.dsWorld). When this runs in the game it returns true if the variable has a vector. There are other commands that will take this variable name and look up the world vector for commands such as StreamWorlds.  Note this command must be declared in the initial 'External Declaration' section of the script that is before any other script commands or it will be ignored."
}
```

</details>

## GameScript.Support.RemoveFromWorldVectorVariable

```lua
GameScript.Support.RemoveFromWorldVectorVariable(arg1, arg2)
```

Источник: [Lua, строка 3148](../../luasense_decompiled.lua#L3148). Имена `argN` — placeholders реконструкции.

Take a variable containing a vector of world variable 'WorldsToRemoveVariableName' and remove every occurence of those worlds from the world list held in 'WorldVectorScriptName', it can then be used in Game.StreamWorld or other commands.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | WorldVectorScriptName | The variable name we will use to refer to this list |
| 2.0 | WorldsToRemoveVariableName | The variable containing world we wish to remove |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "WorldVectorScriptName",
      "@K[211]": "The variable name we will use to refer to this list"
    },
    "2.0": {
      "@K[209]": "WorldsToRemoveVariableName",
      "@K[211]": "The variable containing world we wish to remove"
    }
  },
  "@K[203]": "Take a variable containing a vector of world variable 'WorldsToRemoveVariableName' and remove every occurence of those worlds from the world list held in 'WorldVectorScriptName', it can then be used in Game.StreamWorld or other commands."
}
```

</details>

## GameScript.Support.TurnOnScriptUpdate

```lua
GameScript.Support.TurnOnScriptUpdate(arg1)
```

Источник: [Lua, строка 3151](../../luasense_decompiled.lua#L3151). Имена `argN` — placeholders реконструкции.

Enable or disable update of the script in this object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | bUpdate | Enable(true) or disable(false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "bUpdate",
      "@K[211]": "Enable(true) or disable(false)"
    }
  },
  "@K[203]": "Enable or disable update of the script in this object"
}
```

</details>
