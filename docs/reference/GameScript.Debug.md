# GameScript.Debug

[Индекс](../API.md)

## GameScript.Debug.CallRegistryCommand

```lua
GameScript.Debug.CallRegistryCommand(arg1)
```

Источник: [Lua, строка 1442](../../luasense_decompiled.lua#L1442). Имена `argN` — placeholders реконструкции.

Call a registry command or set a registry object's value. Examples: CallRegistryCommand("/Audio/Debug/showSoundTable true")
"/Audio/Debug/StopAllSoundCueInstance")

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Command | Registry object path and Command, or field |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Command",
      "@K[211]": "Registry object path and Command, or field"
    }
  },
  "@K[203]": "Call a registry command or set a registry object's value. Examples: CallRegistryCommand(\"/Audio/Debug/showSoundTable true\")\n\"/Audio/Debug/StopAllSoundCueInstance\")"
}
```

</details>

## GameScript.Debug.DataMinerAddFieldFloat

```lua
GameScript.Debug.DataMinerAddFieldFloat(arg1, arg2, arg3)
```

Источник: [Lua, строка 1445](../../luasense_decompiled.lua#L1445). Имена `argN` — placeholders реконструкции.

Adds a float value into a row

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TableName | Name of table to insert the row into |
| 2.0 | FieldName | Name of field to add a value |
| 3.0 | value | float value to place in field |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TableName",
      "@K[211]": "Name of table to insert the row into"
    },
    "2.0": {
      "@K[209]": "FieldName",
      "@K[211]": "Name of field to add a value"
    },
    "3.0": {
      "@K[209]": "value",
      "@K[211]": "float value to place in field"
    }
  },
  "@K[203]": "Adds a float value into a row"
}
```

</details>

## GameScript.Debug.DataMinerAddFieldInt

```lua
GameScript.Debug.DataMinerAddFieldInt(arg1, arg2, arg3)
```

Источник: [Lua, строка 1448](../../luasense_decompiled.lua#L1448). Имена `argN` — placeholders реконструкции.

Adds a integer value into a row

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TableName | Name of table to insert the row into |
| 2.0 | FieldName | Name of field to add a value |
| 3.0 | value | integer value to place in field |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TableName",
      "@K[211]": "Name of table to insert the row into"
    },
    "2.0": {
      "@K[209]": "FieldName",
      "@K[211]": "Name of field to add a value"
    },
    "3.0": {
      "@K[209]": "value",
      "@K[211]": "integer value to place in field"
    }
  },
  "@K[203]": "Adds a integer value into a row"
}
```

</details>

## GameScript.Debug.DataMinerAddFieldString

```lua
GameScript.Debug.DataMinerAddFieldString(arg1, arg2, arg3)
```

Источник: [Lua, строка 1451](../../luasense_decompiled.lua#L1451). Имена `argN` — placeholders реконструкции.

Adds a string value into a row

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TableName | Name of table to insert the row into |
| 2.0 | FieldName | Name of field to add a value |
| 3.0 | value | float value to place in field |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TableName",
      "@K[211]": "Name of table to insert the row into"
    },
    "2.0": {
      "@K[209]": "FieldName",
      "@K[211]": "Name of field to add a value"
    },
    "3.0": {
      "@K[209]": "value",
      "@K[211]": "float value to place in field"
    }
  },
  "@K[203]": "Adds a string value into a row"
}
```

</details>

## GameScript.Debug.DataMinerCreateRow

```lua
GameScript.Debug.DataMinerCreateRow(arg1)
```

Источник: [Lua, строка 1454](../../luasense_decompiled.lua#L1454). Имена `argN` — placeholders реконструкции.

Creates a row to be inserted into a dataminer table

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TableName | Name of table to create a new row |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TableName",
      "@K[211]": "Name of table to create a new row"
    }
  },
  "@K[203]": "Creates a row to be inserted into a dataminer table"
}
```

</details>

## GameScript.Debug.DataMinerSessionBegin

```lua
GameScript.Debug.DataMinerSessionBegin()
```

Источник: [Lua, строка 1457](../../luasense_decompiled.lua#L1457). Имена `argN` — placeholders реконструкции.

Creates a session so that data my be recorded and tied to the session id

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Creates a session so that data my be recorded and tied to the session id"
}
```

</details>

## GameScript.Debug.DataMinerSessionEnd

```lua
GameScript.Debug.DataMinerSessionEnd()
```

Источник: [Lua, строка 1460](../../luasense_decompiled.lua#L1460). Имена `argN` — placeholders реконструкции.

Ends a session and uploads files to the database

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Ends a session and uploads files to the database"
}
```

</details>

## GameScript.Debug.DataMinerSetNoSessionRequired

```lua
GameScript.Debug.DataMinerSetNoSessionRequired()
```

Источник: [Lua, строка 1463](../../luasense_decompiled.lua#L1463). Имена `argN` — placeholders реконструкции.

Enables recording data without a session

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Enables recording data without a session"
}
```

</details>

## GameScript.Debug.DataMinerSubmitRow

```lua
GameScript.Debug.DataMinerSubmitRow(arg1)
```

Источник: [Lua, строка 1466](../../luasense_decompiled.lua#L1466). Имена `argN` — placeholders реконструкции.

Inserts a row into the desired dataminer table

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TableName | Name of table to insert the row into |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TableName",
      "@K[211]": "Name of table to insert the row into"
    }
  },
  "@K[203]": "Inserts a row into the desired dataminer table"
}
```

</details>

## GameScript.Debug.DrawArrow

```lua
GameScript.Debug.DrawArrow(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1469](../../luasense_decompiled.lua#L1469). Имена `argN` — placeholders реконструкции.

Draws an arrow

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Origin | The arrow's origin |
| 2.0 | EndPoint | The arrow's origin |
| 3.0 | Radius | The arrow's radius |
| 4.0 | Color | The color of the arrow, with fields "r", "g", "b", and "a" |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Origin",
      "@K[211]": "The arrow's origin"
    },
    "2.0": {
      "@K[209]": "EndPoint",
      "@K[211]": "The arrow's origin"
    },
    "3.0": {
      "@K[209]": "Radius",
      "@K[211]": "The arrow's radius"
    },
    "4.0": {
      "@K[209]": "Color",
      "@K[211]": "The color of the arrow, with fields \"r\", \"g\", \"b\", and \"a\""
    }
  },
  "@K[203]": "Draws an arrow"
}
```

</details>

## GameScript.Debug.DrawLine

```lua
GameScript.Debug.DrawLine(arg1, arg2, arg3)
```

Источник: [Lua, строка 1472](../../luasense_decompiled.lua#L1472). Имена `argN` — placeholders реконструкции.

Draws a line

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Point1 | One end-point of the line |
| 2.0 | Point2 | The other end-point of the line |
| 3.0 | Color | The color of the line, with fields "r", "g", "b", and "a" |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Point1",
      "@K[211]": "One end-point of the line"
    },
    "2.0": {
      "@K[209]": "Point2",
      "@K[211]": "The other end-point of the line"
    },
    "3.0": {
      "@K[209]": "Color",
      "@K[211]": "The color of the line, with fields \"r\", \"g\", \"b\", and \"a\""
    }
  },
  "@K[203]": "Draws a line"
}
```

</details>

## GameScript.Debug.DrawSphere

```lua
GameScript.Debug.DrawSphere(arg1, arg2, arg3)
```

Источник: [Lua, строка 1475](../../luasense_decompiled.lua#L1475). Имена `argN` — placeholders реконструкции.

Draws a sphere

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Origin | The sphere's origin |
| 2.0 | Radius | The sphere's radius |
| 3.0 | Color | The color of the sphere, with fields "r", "g", "b", and "a" |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Origin",
      "@K[211]": "The sphere's origin"
    },
    "2.0": {
      "@K[209]": "Radius",
      "@K[211]": "The sphere's radius"
    },
    "3.0": {
      "@K[209]": "Color",
      "@K[211]": "The color of the sphere, with fields \"r\", \"g\", \"b\", and \"a\""
    }
  },
  "@K[203]": "Draws a sphere"
}
```

</details>

## GameScript.Debug.ExitGame

```lua
GameScript.Debug.ExitGame()
```

Источник: [Lua, строка 1478](../../luasense_decompiled.lua#L1478). Имена `argN` — placeholders реконструкции.

Exit the game entirely, shout down all the managers and stop the executable

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Exit the game entirely, shout down all the managers and stop the executable"
}
```

</details>

## GameScript.Debug.GetProfileCounter

```lua
GameScript.Debug.GetProfileCounter(arg1)
```

Источник: [Lua, строка 1481](../../luasense_decompiled.lua#L1481). Имена `argN` — placeholders реконструкции.

Returns the current frame's value of a particular profile counter.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[209] | Name of the profile counter. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[209]",
      "@K[211]": "Name of the profile counter."
    }
  },
  "@K[203]": "Returns the current frame's value of a particular profile counter."
}
```

</details>

## GameScript.Debug.GetProfileTimer

```lua
GameScript.Debug.GetProfileTimer(arg1)
```

Источник: [Lua, строка 1484](../../luasense_decompiled.lua#L1484). Имена `argN` — placeholders реконструкции.

Returns the current frame's time in seconds of a particular profile timer.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[209] | Name of the profile timer. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[209]",
      "@K[211]": "Name of the profile timer."
    }
  },
  "@K[203]": "Returns the current frame's time in seconds of a particular profile timer."
}
```

</details>

## GameScript.Debug.GetSystemMemoryAvailable

```lua
GameScript.Debug.GetSystemMemoryAvailable()
```

Источник: [Lua, строка 1487](../../luasense_decompiled.lua#L1487). Имена `argN` — placeholders реконструкции.

Returns the number of bytes available in system memory.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the number of bytes available in system memory."
}
```

</details>

## GameScript.Debug.MemoryLogMark

```lua
GameScript.Debug.MemoryLogMark(arg1)
```

Источник: [Lua, строка 1490](../../luasense_decompiled.lua#L1490). Имена `argN` — placeholders реконструкции.

Creates a custom mark in the memory debug log.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Text | Text for memory mark. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Text",
      "@K[211]": "Text for memory mark."
    }
  },
  "@K[203]": "Creates a custom mark in the memory debug log."
}
```

</details>

## GameScript.Debug.MessageLog

```lua
GameScript.Debug.MessageLog(arg1, arg2)
```

Источник: [Lua, строка 1493](../../luasense_decompiled.lua#L1493). Имена `argN` — placeholders реконструкции.

Print a log of all the messages received by an object if on.  If try to turn on when on or off while off, returns false

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ObjectToLog | Object to watch for messages |
| 2.0 | TurnOn | If true turn on log, if false, turn off |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ObjectToLog",
      "@K[211]": "Object to watch for messages"
    },
    "2.0": {
      "@K[209]": "TurnOn",
      "@K[211]": "If true turn on log, if false, turn off"
    }
  },
  "@K[203]": "Print a log of all the messages received by an object if on.  If try to turn on when on or off while off, returns false"
}
```

</details>

## GameScript.Debug.PrintCallstack

```lua
GameScript.Debug.PrintCallstack()
```

Источник: [Lua, строка 1496](../../luasense_decompiled.lua#L1496). Имена `argN` — placeholders реконструкции.

Prints the current callstack of the script.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Prints the current callstack of the script."
}
```

</details>

## GameScript.Debug.PrintError

```lua
GameScript.Debug.PrintError(arg1)
```

Источник: [Lua, строка 1499](../../luasense_decompiled.lua#L1499). Имена `argN` — placeholders реконструкции.

Print a string describing an error with the script.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[218] | Error message |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[218]",
      "@K[211]": "Error message"
    }
  },
  "@K[203]": "Print a string describing an error with the script."
}
```

</details>

## GameScript.Debug.PrintInfo

```lua
GameScript.Debug.PrintInfo(arg1)
```

Источник: [Lua, строка 1502](../../luasense_decompiled.lua#L1502). Имена `argN` — placeholders реконструкции.

Print a string of information from the script.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[218] | Info message |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[218]",
      "@K[211]": "Info message"
    }
  },
  "@K[203]": "Print a string of information from the script."
}
```

</details>

## GameScript.Debug.PrintToBottomOfScreen

```lua
GameScript.Debug.PrintToBottomOfScreen(arg1)
```

Источник: [Lua, строка 1505](../../luasense_decompiled.lua#L1505). Имена `argN` — placeholders реконструкции.

Print a string to the lowest position of the screen that fits on-screen . If you want to continue to see the text you need to make this call every frame. SeeAlso:PrintToScreenWithTimer.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[218] | Message to display on screen |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[218]",
      "@K[211]": "Message to display on screen"
    }
  },
  "@K[203]": "Print a string to the lowest position of the screen that fits on-screen . If you want to continue to see the text you need to make this call every frame. SeeAlso:PrintToScreenWithTimer."
}
```

</details>

## GameScript.Debug.PrintToScreen

```lua
GameScript.Debug.PrintToScreen(arg1, arg2, arg3)
```

Источник: [Lua, строка 1508](../../luasense_decompiled.lua#L1508). Имена `argN` — placeholders реконструкции.

Print a string to the screen for this frame.  If you want to continue to see the text you need to make this call every frame. SeeAlso:PrintToScreenWithTimer.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[218] | Message to display on screen |
| 2.0 | ScreenPosX | Position to start the text on the screen (0.0 to 1.0) where 0 is the left side of screen. |
| 3.0 | ScreenPosY | Position to start the text on the screen (0.0 to 1.0) where 0 is the top side of screen. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[218]",
      "@K[211]": "Message to display on screen"
    },
    "2.0": {
      "@K[209]": "ScreenPosX",
      "@K[211]": "Position to start the text on the screen (0.0 to 1.0) where 0 is the left side of screen."
    },
    "3.0": {
      "@K[209]": "ScreenPosY",
      "@K[211]": "Position to start the text on the screen (0.0 to 1.0) where 0 is the top side of screen."
    }
  },
  "@K[203]": "Print a string to the screen for this frame.  If you want to continue to see the text you need to make this call every frame. SeeAlso:PrintToScreenWithTimer."
}
```

</details>

## GameScript.Debug.PrintToScreenWithTimer

```lua
GameScript.Debug.PrintToScreenWithTimer(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1511](../../luasense_decompiled.lua#L1511). Имена `argN` — placeholders реконструкции.

Print a string to the screen and leave it up for "time" seconds. Note that this command collects the messages from several scripts so it manages the placement so that they do not overlap, which means you have no control over placement up/down. for those cases use PrintToScreen and manage send the call every frame

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[218] | Message to display on screen |
| 2.0 | Time | Time in seconds to leave on the screen |
| 3.0 | Color | Color Table with an r,g,b field range 0 to 255 |
| 4.0 | IsCentered | Should the text be centered left/right |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[218]",
      "@K[211]": "Message to display on screen"
    },
    "2.0": {
      "@K[209]": "Time",
      "@K[211]": "Time in seconds to leave on the screen"
    },
    "3.0": {
      "@K[209]": "Color",
      "@K[211]": "Color Table with an r,g,b field range 0 to 255"
    },
    "4.0": {
      "@K[209]": "IsCentered",
      "@K[211]": "Should the text be centered left/right"
    }
  },
  "@K[203]": "Print a string to the screen and leave it up for \"time\" seconds. Note that this command collects the messages from several scripts so it manages the placement so that they do not overlap, which means you have no control over placement up/down. for those cases use PrintToScreen and manage send the call every frame"
}
```

</details>

## GameScript.Debug.PrintWarning

```lua
GameScript.Debug.PrintWarning(arg1)
```

Источник: [Lua, строка 1514](../../luasense_decompiled.lua#L1514). Имена `argN` — placeholders реконструкции.

Print a string warning of potential problem with the script.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[218] | Warning message |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[218]",
      "@K[211]": "Warning message"
    }
  },
  "@K[203]": "Print a string warning of potential problem with the script."
}
```

</details>

## GameScript.Debug.SetOnScreenTextColor

```lua
GameScript.Debug.SetOnScreenTextColor(arg1, arg2, arg3)
```

Источник: [Lua, строка 1517](../../luasense_decompiled.lua#L1517). Имена `argN` — placeholders реконструкции.

Set the RGB color for the future text that is printed to the screen. This is only used with "PrintToScreen" and "PrintToBottomOfScreen" not "PrintToScreenWithTimer"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Red | Amount of Red, 0 to 255 |
| 2.0 | Green | Amount of Blue, 0 to 255 |
| 3.0 | Blue | Amount of Green, 0 to 255 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Red",
      "@K[211]": "Amount of Red, 0 to 255"
    },
    "2.0": {
      "@K[209]": "Green",
      "@K[211]": "Amount of Blue, 0 to 255"
    },
    "3.0": {
      "@K[209]": "Blue",
      "@K[211]": "Amount of Green, 0 to 255"
    }
  },
  "@K[203]": "Set the RGB color for the future text that is printed to the screen. This is only used with \"PrintToScreen\" and \"PrintToBottomOfScreen\" not \"PrintToScreenWithTimer\""
}
```

</details>

## GameScript.Debug.SetOnScreenTimerTextMode

```lua
GameScript.Debug.SetOnScreenTimerTextMode(arg1)
```

Источник: [Lua, строка 1520](../../luasense_decompiled.lua#L1520). Имена `argN` — placeholders реконструкции.

Set vertical placement mode for "PrintToScreenWithTimer" commands

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[235] | Mode for text placement 0 from top, 1 centered, 2 from bottom |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[235]",
      "@K[211]": "Mode for text placement 0 from top, 1 centered, 2 from bottom"
    }
  },
  "@K[203]": "Set vertical placement mode for \"PrintToScreenWithTimer\" commands"
}
```

</details>

## GameScript.Debug.VerifyOnce

```lua
GameScript.Debug.VerifyOnce(arg1)
```

Источник: [Lua, строка 1523](../../luasense_decompiled.lua#L1523). Имена `argN` — placeholders реконструкции.

Triggers a VerifySilentEx call.  This can only be done once per ScriptComponent.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ErrorString | String to send to the verify macro |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ErrorString",
      "@K[211]": "String to send to the verify macro"
    }
  },
  "@K[203]": "Triggers a VerifySilentEx call.  This can only be done once per ScriptComponent."
}
```

</details>
