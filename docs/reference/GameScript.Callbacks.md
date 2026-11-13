# GameScript.Callbacks

[Индекс](../API.md)

## GameScript.Callbacks.RegisterAIEnterExitRegion

```lua
GameScript.Callbacks.RegisterAIEnterExitRegion(arg1, arg2, arg3)
```

Источник: [Lua, строка 1343](../../luasense_decompiled.lua#L1343). Имена `argN` — placeholders реконструкции.

Register to get a callback whenever an AI enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 3.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "3.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Register to get a callback whenever an AI enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit."
}
```

</details>

## GameScript.Callbacks.RegisterForDeathSequenceNetFixupCallback

```lua
GameScript.Callbacks.RegisterForDeathSequenceNetFixupCallback(arg1)
```

Источник: [Lua, строка 1346](../../luasense_decompiled.lua#L1346). Имена `argN` — placeholders реконструкции.

Registers a function to be called when this object's Death Choreographer needs to possibly fix up a death sequence to be triggered over the network do to gore setting on the client.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Registers a function to be called when this object's Death Choreographer needs to possibly fix up a death sequence to be triggered over the network do to gore setting on the client."
}
```

</details>

## GameScript.Callbacks.RegisterForDeathSequenceSelectCallback

```lua
GameScript.Callbacks.RegisterForDeathSequenceSelectCallback(arg1)
```

Источник: [Lua, строка 1349](../../luasense_decompiled.lua#L1349). Имена `argN` — placeholders реконструкции.

Registers a function to be called when this object's Death Choreographer Component needs to determine which death sequence to use.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Registers a function to be called when this object's Death Choreographer Component needs to determine which death sequence to use."
}
```

</details>

## GameScript.Callbacks.RegisterForDisable

```lua
GameScript.Callbacks.RegisterForDisable(arg1)
```

Источник: [Lua, строка 1352](../../luasense_decompiled.lua#L1352). Имена `argN` — placeholders реконструкции.

Register the function to be called on object that owns this script when the 'Disable' for the script component occurs.  This will execute 'FunctionName' immediately before turning off the script component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Register the function to be called on object that owns this script when the 'Disable' for the script component occurs.  This will execute 'FunctionName' immediately before turning off the script component."
}
```

</details>

## GameScript.Callbacks.RegisterForGlobalTimer

```lua
GameScript.Callbacks.RegisterForGlobalTimer(arg1, arg2, arg3)
```

Источник: [Lua, строка 1355](../../luasense_decompiled.lua#L1355). Имена `argN` — placeholders реконструкции.

Register the function to be called on "ScriptObject" every "TimeInSeconds" seconds in global time (i.e. not subject to time-altering game effects). In most cases, you do NOT want to use this function.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |
| 2.0 | TimeInSeconds | The time in seconds between callbacks |
| 3.0 | IsPeriodic | If we repeat the call every "TimeInSeconds" seconds. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    },
    "2.0": {
      "@K[209]": "TimeInSeconds",
      "@K[211]": "The time in seconds between callbacks"
    },
    "3.0": {
      "@K[209]": "IsPeriodic",
      "@K[211]": "If we repeat the call every \"TimeInSeconds\" seconds."
    }
  },
  "@K[203]": "Register the function to be called on \"ScriptObject\" every \"TimeInSeconds\" seconds in global time (i.e. not subject to time-altering game effects). In most cases, you do NOT want to use this function."
}
```

</details>

## GameScript.Callbacks.RegisterForMsg

```lua
GameScript.Callbacks.RegisterForMsg(arg1, arg2, arg3)
```

Источник: [Lua, строка 1358](../../luasense_decompiled.lua#L1358). Имена `argN` — placeholders реконструкции.

Register for a callback on "pScriptObject" when "pMessageObject" receives a message of "type", and call function "callbackFunctionName".

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MessageType | The type of message for which we are waiting. |
| 2.0 | MessageObject | The object that we are watching for a message |
| 3.0 | FunctionName | The name of the callback function. The only function argument is the object that received the message. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MessageType",
      "@K[211]": "The type of message for which we are waiting."
    },
    "2.0": {
      "@K[209]": "MessageObject",
      "@K[211]": "The object that we are watching for a message"
    },
    "3.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function. The only function argument is the object that received the message."
    }
  },
  "@K[203]": "Register for a callback on \"pScriptObject\" when \"pMessageObject\" receives a message of \"type\", and call function \"callbackFunctionName\"."
}
```

</details>

## GameScript.Callbacks.RegisterForPostCheckpointActivation

```lua
GameScript.Callbacks.RegisterForPostCheckpointActivation(arg1)
```

Источник: [Lua, строка 1361](../../luasense_decompiled.lua#L1361). Имена `argN` — placeholders реконструкции.

This callback does nothing during the initial run of a script, However on checkpoint reload, it waits until the object has been activated(which includes the network connection for this object).  Then after all of the callbacks from the checkpoint have been restored, this callback is used so that any other checkpoint issues can be fixed up.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "This callback does nothing during the initial run of a script, However on checkpoint reload, it waits until the object has been activated(which includes the network connection for this object).  Then after all of the callbacks from the checkpoint have been restored, this callback is used so that any other checkpoint issues can be fixed up."
}
```

</details>

## GameScript.Callbacks.RegisterForScriptValueUpdated

```lua
GameScript.Callbacks.RegisterForScriptValueUpdated(arg1)
```

Источник: [Lua, строка 1364](../../luasense_decompiled.lua#L1364). Имена `argN` — placeholders реконструкции.

Register the function to be called on object that owns this script whenever a value is pushed from the game into the script.For instance, if a variable is synced across the network from the host and then pushed into the client script his will execute 'FunctionName' so that the value can be handled locally on the client.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Register the function to be called on object that owns this script whenever a value is pushed from the game into the script.For instance, if a variable is synced across the network from the host and then pushed into the client script his will execute 'FunctionName' so that the value can be handled locally on the client."
}
```

</details>

## GameScript.Callbacks.RegisterForStopCondition

```lua
GameScript.Callbacks.RegisterForStopCondition(arg1)
```

Источник: [Lua, строка 1367](../../luasense_decompiled.lua#L1367). Имена `argN` — placeholders реконструкции.

Register the function to be called on object that owns this script when the 'StopCondition' for the script component occurs.  This will execute 'FunctionName' immediately before turning off the script component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Register the function to be called on object that owns this script when the 'StopCondition' for the script component occurs.  This will execute 'FunctionName' immediately before turning off the script component."
}
```

</details>

## GameScript.Callbacks.RegisterForTimer

```lua
GameScript.Callbacks.RegisterForTimer(arg1, arg2, arg3)
```

Источник: [Lua, строка 1370](../../luasense_decompiled.lua#L1370). Имена `argN` — placeholders реконструкции.

Register the function to be called on "ScriptObject" every "TimeInSeconds" seconds in game time.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |
| 2.0 | TimeInSeconds | The time in seconds between callbacks |
| 3.0 | IsPeriodic | If we repeat the call every "TimeInSeconds" seconds. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    },
    "2.0": {
      "@K[209]": "TimeInSeconds",
      "@K[211]": "The time in seconds between callbacks"
    },
    "3.0": {
      "@K[209]": "IsPeriodic",
      "@K[211]": "If we repeat the call every \"TimeInSeconds\" seconds."
    }
  },
  "@K[203]": "Register the function to be called on \"ScriptObject\" every \"TimeInSeconds\" seconds in game time."
}
```

</details>

## GameScript.Callbacks.RegisterForUpdateEveryFrame

```lua
GameScript.Callbacks.RegisterForUpdateEveryFrame(arg1)
```

Источник: [Lua, строка 1373](../../luasense_decompiled.lua#L1373). Имена `argN` — placeholders реконструкции.

Register the function to be called on object that owns this script every game frame.Only one function can be registered per object.  If you try to register a new function it will unregister the original callback.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Register the function to be called on object that owns this script every game frame.Only one function can be registered per object.  If you try to register a new function it will unregister the original callback."
}
```

</details>

## GameScript.Callbacks.RegisterForWatchVariableChange

```lua
GameScript.Callbacks.RegisterForWatchVariableChange(arg1, arg2)
```

Источник: [Lua, строка 1376](../../luasense_decompiled.lua#L1376). Имена `argN` — placeholders реконструкции.

When the watch variable change send a callback with argument msg that has a field "oldValue" and "newValue".

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | VariableName | The name of the variable we are watching for change. |
| 2.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "VariableName",
      "@K[211]": "The name of the variable we are watching for change."
    },
    "2.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "When the watch variable change send a callback with argument msg that has a field \"oldValue\" and \"newValue\"."
}
```

</details>

## GameScript.Callbacks.RegisterObjectInSetEnterExitRegion

```lua
GameScript.Callbacks.RegisterObjectInSetEnterExitRegion(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1379](../../luasense_decompiled.lua#L1379). Имена `argN` — placeholders реконструкции.

Register to get a callback whenever an object from a specified set enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | SetObject | The Set whose objects we are checking |
| 3.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 4.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "SetObject",
      "@K[211]": "The Set whose objects we are checking"
    },
    "3.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "4.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Register to get a callback whenever an object from a specified set enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit."
}
```

</details>

## GameScript.Callbacks.RegisterObjectTagEnterExitRegion

```lua
GameScript.Callbacks.RegisterObjectTagEnterExitRegion(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1382](../../luasense_decompiled.lua#L1382). Имена `argN` — placeholders реконструкции.

Register to get a callback whenever an object with the specified tag enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | ObjectTag | Integer representation of the Object Tag. |
| 3.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 4.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "ObjectTag",
      "@K[211]": "Integer representation of the Object Tag."
    },
    "3.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "4.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Register to get a callback whenever an object with the specified tag enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit."
}
```

</details>

## GameScript.Callbacks.RegisterPlayerEnterExitRegion

```lua
GameScript.Callbacks.RegisterPlayerEnterExitRegion(arg1, arg2, arg3)
```

Источник: [Lua, строка 1385](../../luasense_decompiled.lua#L1385). Имена `argN` — placeholders реконструкции.

Register to get a callback whenever a player enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 3.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "3.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Register to get a callback whenever a player enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit."
}
```

</details>

## GameScript.Callbacks.RegisterPlayerHeadEnterExitRegion

```lua
GameScript.Callbacks.RegisterPlayerHeadEnterExitRegion(arg1, arg2, arg3)
```

Источник: [Lua, строка 1388](../../luasense_decompiled.lua#L1388). Имена `argN` — placeholders реконструкции.

Register to get a callback whenever a player's head enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 3.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "3.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Register to get a callback whenever a player's head enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit."
}
```

</details>

## GameScript.Callbacks.RegisterSetTracker

```lua
GameScript.Callbacks.RegisterSetTracker(arg1, arg2, arg3)
```

Источник: [Lua, строка 1391](../../luasense_decompiled.lua#L1391). Имена `argN` — placeholders реконструкции.

Register to get a callback whenever an object is added or removed from a set.  You can specify an enter AND exit function or just the enter OR exit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Set | The Set to monitor. |
| 2.0 | OnAddFunctionName | The name of the callback function when an object is added to the set. |
| 3.0 | OnRemoveFunctionName | The name of the callback function when an object is removed to the set. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Set",
      "@K[211]": "The Set to monitor."
    },
    "2.0": {
      "@K[209]": "OnAddFunctionName",
      "@K[211]": "The name of the callback function when an object is added to the set."
    },
    "3.0": {
      "@K[209]": "OnRemoveFunctionName",
      "@K[211]": "The name of the callback function when an object is removed to the set."
    }
  },
  "@K[203]": "Register to get a callback whenever an object is added or removed from a set.  You can specify an enter AND exit function or just the enter OR exit."
}
```

</details>

## GameScript.Callbacks.RegisterSpecificObjectEnterExitRegion

```lua
GameScript.Callbacks.RegisterSpecificObjectEnterExitRegion(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1394](../../luasense_decompiled.lua#L1394). Имена `argN` — placeholders реконструкции.

Register to get a callback whenever an object from a specified set enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | SpecificObject | The specific object we are checking |
| 3.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 4.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "SpecificObject",
      "@K[211]": "The specific object we are checking"
    },
    "3.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "4.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Register to get a callback whenever an object from a specified set enters or exits the specified region.  You can specify an enter AND exit function or just the enter OR exit."
}
```

</details>

## GameScript.Callbacks.UnregisterAIEnterExitRegion

```lua
GameScript.Callbacks.UnregisterAIEnterExitRegion(arg1, arg2, arg3)
```

Источник: [Lua, строка 1397](../../luasense_decompiled.lua#L1397). Имена `argN` — placeholders реконструкции.

Register to get a callback whenever an AI enters or exits the specified region.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 3.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "3.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Register to get a callback whenever an AI enters or exits the specified region."
}
```

</details>

## GameScript.Callbacks.UnregisterAllMsgCallbacks

```lua
GameScript.Callbacks.UnregisterAllMsgCallbacks()
```

Источник: [Lua, строка 1400](../../luasense_decompiled.lua#L1400). Имена `argN` — placeholders реконструкции.

Unregister for any callbacks that were previously registered by "RegisterForMsg", or automatically during checkpoint load

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Unregister for any callbacks that were previously registered by \"RegisterForMsg\", or automatically during checkpoint load"
}
```

</details>

## GameScript.Callbacks.UnregisterForDeathSequenceNetFixupCallback

```lua
GameScript.Callbacks.UnregisterForDeathSequenceNetFixupCallback(arg1)
```

Источник: [Lua, строка 1403](../../luasense_decompiled.lua#L1403). Имена `argN` — placeholders реконструкции.

Unregisters a function that has been registered to select a death sequence for an object to fix up the synced death sequence

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Unregisters a function that has been registered to select a death sequence for an object to fix up the synced death sequence"
}
```

</details>

## GameScript.Callbacks.UnregisterForDeathSequenceSelectCallback

```lua
GameScript.Callbacks.UnregisterForDeathSequenceSelectCallback(arg1)
```

Источник: [Lua, строка 1406](../../luasense_decompiled.lua#L1406). Имена `argN` — placeholders реконструкции.

Unregisters a function that has been registered to select a death sequence for an object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Unregisters a function that has been registered to select a death sequence for an object"
}
```

</details>

## GameScript.Callbacks.UnregisterForDisable

```lua
GameScript.Callbacks.UnregisterForDisable()
```

Источник: [Lua, строка 1409](../../luasense_decompiled.lua#L1409). Имена `argN` — placeholders реконструкции.

Unregister the function that is called when the object that owns this script is disabled

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Unregister the function that is called when the object that owns this script is disabled"
}
```

</details>

## GameScript.Callbacks.UnregisterForMsg

```lua
GameScript.Callbacks.UnregisterForMsg(arg1, arg2, arg3)
```

Источник: [Lua, строка 1412](../../luasense_decompiled.lua#L1412). Имена `argN` — placeholders реконструкции.

Unregister callback for message of "type" named "callbackFunctionName" on "pScriptObject" from "pMessageObject"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MessageType | The type of message for which we are waiting. |
| 2.0 | MessageObject | The object that we are watching for a  message |
| 3.0 | FunctionName | The name of the callback function. The only function argument is the object that received the message. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MessageType",
      "@K[211]": "The type of message for which we are waiting."
    },
    "2.0": {
      "@K[209]": "MessageObject",
      "@K[211]": "The object that we are watching for a  message"
    },
    "3.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function. The only function argument is the object that received the message."
    }
  },
  "@K[203]": "Unregister callback for message of \"type\" named \"callbackFunctionName\" on \"pScriptObject\" from \"pMessageObject\""
}
```

</details>

## GameScript.Callbacks.UnregisterForScriptValueUpdated

```lua
GameScript.Callbacks.UnregisterForScriptValueUpdated()
```

Источник: [Lua, строка 1415](../../luasense_decompiled.lua#L1415). Имена `argN` — placeholders реконструкции.

Unregister the function that is called when a value if pushed from the game into the script.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Unregister the function that is called when a value if pushed from the game into the script."
}
```

</details>

## GameScript.Callbacks.UnregisterForStopCondition

```lua
GameScript.Callbacks.UnregisterForStopCondition()
```

Источник: [Lua, строка 1418](../../luasense_decompiled.lua#L1418). Имена `argN` — placeholders реконструкции.

Unregister the function that is called when the object that owns this script meets the condition set in the script component.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Unregister the function that is called when the object that owns this script meets the condition set in the script component."
}
```

</details>

## GameScript.Callbacks.UnregisterForTimer

```lua
GameScript.Callbacks.UnregisterForTimer(arg1)
```

Источник: [Lua, строка 1421](../../luasense_decompiled.lua#L1421). Имена `argN` — placeholders реконструкции.

Unregister the timer callback function.  Note that only periodic callbacks can but unregistered.  Since Periodic callbacks are limited to one per callback name, it is obvious which one is meant.  For one-time timer callbacks there can be multiples, so we can not determine which callback is to be unregistered.  Once you register for a one-time callback, it will happen, it is too late to try to unregister.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function."
    }
  },
  "@K[203]": "Unregister the timer callback function.  Note that only periodic callbacks can but unregistered.  Since Periodic callbacks are limited to one per callback name, it is obvious which one is meant.  For one-time timer callbacks there can be multiples, so we can not determine which callback is to be unregistered.  Once you register for a one-time callback, it will happen, it is too late to try to unregister."
}
```

</details>

## GameScript.Callbacks.UnregisterForUpdateEveryFrame

```lua
GameScript.Callbacks.UnregisterForUpdateEveryFrame()
```

Источник: [Lua, строка 1424](../../luasense_decompiled.lua#L1424). Имена `argN` — placeholders реконструкции.

Unregister the function that is called every frame on the object that owns this script.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Unregister the function that is called every frame on the object that owns this script."
}
```

</details>

## GameScript.Callbacks.UnregisterObjectEnterExitRegion

```lua
GameScript.Callbacks.UnregisterObjectEnterExitRegion(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1427](../../luasense_decompiled.lua#L1427). Имена `argN` — placeholders реконструкции.

Unregisters callbacks made whenever an object with the specified tag enters or exits the specified region.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region being monitored. |
| 2.0 | ObjectTag | Integer representation of the Object Tag. |
| 3.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 4.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region being monitored."
    },
    "2.0": {
      "@K[209]": "ObjectTag",
      "@K[211]": "Integer representation of the Object Tag."
    },
    "3.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "4.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Unregisters callbacks made whenever an object with the specified tag enters or exits the specified region."
}
```

</details>

## GameScript.Callbacks.UnregisterObjectInSetEnterExitRegion

```lua
GameScript.Callbacks.UnregisterObjectInSetEnterExitRegion(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1430](../../luasense_decompiled.lua#L1430). Имена `argN` — placeholders реконструкции.

Unregisters callbacks made whenever an object from a specified set enters or exits the specified region.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | SetObject | The Set whose objects we are checking |
| 3.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 4.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "SetObject",
      "@K[211]": "The Set whose objects we are checking"
    },
    "3.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "4.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Unregisters callbacks made whenever an object from a specified set enters or exits the specified region."
}
```

</details>

## GameScript.Callbacks.UnregisterPlayerEnterExitRegion

```lua
GameScript.Callbacks.UnregisterPlayerEnterExitRegion(arg1, arg2, arg3)
```

Источник: [Lua, строка 1433](../../luasense_decompiled.lua#L1433). Имена `argN` — placeholders реконструкции.

Unregisters callbacks made whenever a player enters or exits the specified region.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region being monitored. |
| 2.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 3.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region being monitored."
    },
    "2.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "3.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Unregisters callbacks made whenever a player enters or exits the specified region."
}
```

</details>

## GameScript.Callbacks.UnregisterSetTracker

```lua
GameScript.Callbacks.UnregisterSetTracker(arg1)
```

Источник: [Lua, строка 1436](../../luasense_decompiled.lua#L1436). Имена `argN` — placeholders реконструкции.

Unregisters callbacks made whenever an object is added or removed from the specified set.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Set | The Set to stop monitoring. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Set",
      "@K[211]": "The Set to stop monitoring."
    }
  },
  "@K[203]": "Unregisters callbacks made whenever an object is added or removed from the specified set."
}
```

</details>

## GameScript.Callbacks.UnregisterSpecificObjectEnterExitRegion

```lua
GameScript.Callbacks.UnregisterSpecificObjectEnterExitRegion(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1439](../../luasense_decompiled.lua#L1439). Имена `argN` — placeholders реконструкции.

Unregisters callbacks made whenever an object from a specified set enters or exits the specified region.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Region | The Region to monitor. |
| 2.0 | SpecificObject | The specific objects we are checking |
| 3.0 | FunctionEnterName | The name of the enter callback function.  Use "" empty quotes to not specify a enter callback. |
| 4.0 | FunctionExitName | The name of the exit callback function.  Use "" empty quotes to not specify a exit callback. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Region",
      "@K[211]": "The Region to monitor."
    },
    "2.0": {
      "@K[209]": "SpecificObject",
      "@K[211]": "The specific objects we are checking"
    },
    "3.0": {
      "@K[209]": "FunctionEnterName",
      "@K[211]": "The name of the enter callback function.  Use \"\" empty quotes to not specify a enter callback."
    },
    "4.0": {
      "@K[209]": "FunctionExitName",
      "@K[211]": "The name of the exit callback function.  Use \"\" empty quotes to not specify a exit callback."
    }
  },
  "@K[203]": "Unregisters callbacks made whenever an object from a specified set enters or exits the specified region."
}
```

</details>
