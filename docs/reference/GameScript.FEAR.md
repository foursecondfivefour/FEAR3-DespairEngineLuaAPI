# GameScript.FEAR

[Индекс](../API.md)

## GameScript.FEAR.AddNumberValueToAnnouncementPacket

```lua
GameScript.FEAR.AddNumberValueToAnnouncementPacket(arg1, arg2)
```

Источник: [Lua, строка 1529](../../luasense_decompiled.lua#L1529). Имена `argN` — placeholders реконструкции.

Adds a number value to the specified announcement display packet.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PacketId | The id of the packet which the number will be added to. |
| 2.0 | Number | The number value added to the packet. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PacketId",
      "@K[211]": "The id of the packet which the number will be added to."
    },
    "2.0": {
      "@K[209]": "Number",
      "@K[211]": "The number value added to the packet."
    }
  },
  "@K[203]": "Adds a number value to the specified announcement display packet."
}
```

</details>

## GameScript.FEAR.AddStaticTextValueToAnnouncementPacket

```lua
GameScript.FEAR.AddStaticTextValueToAnnouncementPacket(arg1, arg2)
```

Источник: [Lua, строка 1532](../../luasense_decompiled.lua#L1532). Имена `argN` — placeholders реконструкции.

Adds a string value to the specified announcement display packet.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PacketId | The id of the packet which the string will be added to. |
| 2.0 | StaticTextID | The string value added to the packet. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PacketId",
      "@K[211]": "The id of the packet which the string will be added to."
    },
    "2.0": {
      "@K[209]": "StaticTextID",
      "@K[211]": "The string value added to the packet."
    }
  },
  "@K[203]": "Adds a string value to the specified announcement display packet."
}
```

</details>

## GameScript.FEAR.AddStringValueToAnnouncementPacket

```lua
GameScript.FEAR.AddStringValueToAnnouncementPacket(arg1, arg2)
```

Источник: [Lua, строка 1535](../../luasense_decompiled.lua#L1535). Имена `argN` — placeholders реконструкции.

Adds a string value to the specified announcement display packet.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PacketId | The id of the packet which the string will be added to. |
| 2.0 | String | The string value added to the packet. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PacketId",
      "@K[211]": "The id of the packet which the string will be added to."
    },
    "2.0": {
      "@K[209]": "String",
      "@K[211]": "The string value added to the packet."
    }
  },
  "@K[203]": "Adds a string value to the specified announcement display packet."
}
```

</details>

## GameScript.FEAR.BroadcastAnnoucementPacket

```lua
GameScript.FEAR.BroadcastAnnoucementPacket(arg1)
```

Источник: [Lua, строка 1538](../../luasense_decompiled.lua#L1538). Имена `argN` — placeholders реконструкции.

Sends the announcement display packet to the message queue of every local player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PacketId | The id of the packet to display. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PacketId",
      "@K[211]": "The id of the packet to display."
    }
  },
  "@K[203]": "Sends the announcement display packet to the message queue of every local player."
}
```

</details>

## GameScript.FEAR.CreateAnnoucementPacket

```lua
GameScript.FEAR.CreateAnnoucementPacket(arg1, arg2, arg3)
```

Источник: [Lua, строка 1541](../../luasense_decompiled.lua#L1541). Имена `argN` — placeholders реконструкции.

Creates an announcement display packet and returns the id of the packet. If packet was not created, -1 is returned.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player who the announcement should be displayed for. |
| 2.0 | Destination | Used to indicate where the announcement should be displayed. |
| 3.0 | Announcement | The name of the announcement as defined in global data. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player who the announcement should be displayed for."
    },
    "2.0": {
      "@K[209]": "Destination",
      "@K[211]": "Used to indicate where the announcement should be displayed."
    },
    "3.0": {
      "@K[209]": "Announcement",
      "@K[211]": "The name of the announcement as defined in global data."
    }
  },
  "@K[203]": "Creates an announcement display packet and returns the id of the packet. If packet was not created, -1 is returned."
}
```

</details>

## GameScript.FEAR.CreepBossAction

```lua
GameScript.FEAR.CreepBossAction(arg1, arg2)
```

Источник: [Lua, строка 1544](../../luasense_decompiled.lua#L1544). Имена `argN` — placeholders реконструкции.

Sets various settings on the given enemy such that he attacks very aggressively

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | Creep object |
| 2.0 | Attack | Type of attack to perform |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "Creep object"
    },
    "2.0": {
      "@K[209]": "Attack",
      "@K[211]": "Type of attack to perform"
    }
  },
  "@K[203]": "Sets various settings on the given enemy such that he attacks very aggressively"
}
```

</details>

## GameScript.FEAR.DismemberObject

```lua
GameScript.FEAR.DismemberObject(arg1, arg2)
```

Источник: [Lua, строка 1547](../../luasense_decompiled.lua#L1547). Имена `argN` — placeholders реконструкции.

Uses the DismembermentComponent in an object, and will attempt to cause a dismemberment of the specified type

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DismemberTarget | The object that is going to be dismembered. |
| 2.0 | DismemberTypeName | The type of dismemberment to attempt. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DismemberTarget",
      "@K[211]": "The object that is going to be dismembered."
    },
    "2.0": {
      "@K[209]": "DismemberTypeName",
      "@K[211]": "The type of dismemberment to attempt."
    }
  },
  "@K[203]": "Uses the DismembermentComponent in an object, and will attempt to cause a dismemberment of the specified type"
}
```

</details>

## GameScript.FEAR.DoScavengerEPALeap

```lua
GameScript.FEAR.DoScavengerEPALeap(arg1, arg2)
```

Источник: [Lua, строка 1550](../../luasense_decompiled.lua#L1550). Имена `argN` — placeholders реконструкции.

Orders the scavenger to leap onto an EPA at a specified location. Assumes EPA is already the AI's target.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The scavenger AI object we are ordering to leap. |
| 2.0 | LeapLocationIndex | Index into AI Attach Locations component for where AI is to leap to. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The scavenger AI object we are ordering to leap."
    },
    "2.0": {
      "@K[209]": "LeapLocationIndex",
      "@K[211]": "Index into AI Attach Locations component for where AI is to leap to."
    }
  },
  "@K[203]": "Orders the scavenger to leap onto an EPA at a specified location. Assumes EPA is already the AI's target."
}
```

</details>

## GameScript.FEAR.EnableSlowMo

```lua
GameScript.FEAR.EnableSlowMo(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1553](../../luasense_decompiled.lua#L1553). Имена `argN` — placeholders реконструкции.

Enable SlowMotion Control for player at a rate controled by the curve

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player who goes into slowMo |
| 2.0 | Enable | A bool to enable or disable the slowMo |
| 3.0 | SlowMoCurveName | The name in the ScriptComponent curve template list that refers to the slowMo curve |
| 4.0 | VoiceCurveName | The name in the ScriptComponent curve template list that refers to the Voice curve |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player who goes into slowMo"
    },
    "2.0": {
      "@K[209]": "Enable",
      "@K[211]": "A bool to enable or disable the slowMo"
    },
    "3.0": {
      "@K[209]": "SlowMoCurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the slowMo curve"
    },
    "4.0": {
      "@K[209]": "VoiceCurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the Voice curve"
    }
  },
  "@K[203]": "Enable SlowMotion Control for player at a rate controled by the curve"
}
```

</details>

## GameScript.FEAR.FlickerPlayerFlashlight

```lua
GameScript.FEAR.FlickerPlayerFlashlight(arg1, arg2)
```

Источник: [Lua, строка 1556](../../luasense_decompiled.lua#L1556). Имена `argN` — placeholders реконструкции.

Flickers a player's flashlight following a specific curve.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player whose flashlight we are flickering |
| 2.0 | FlickerInfo | A table containing information on the flicker. The only required field is "curve", which is the script name of an imported curve template. Optional fields include:<br>"flickerTime" - the number of seconds to flicker the flashlight. Default value is 1.<br>"turnOffAtCompletion" - if true, the flashlight will be turned off when the flicker ends. Default value is true.<br>"allowTurnOn" - if true, the flashlight can be turned on/off during the flicker. Default value is true.<br>"forceFlashlightOn" - if true, the flashlight will be forcibly turned on when the flicker starts. Default value is true. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player whose flashlight we are flickering"
    },
    "2.0": {
      "@K[209]": "FlickerInfo",
      "@K[211]": "A table containing information on the flicker. The only required field is \"curve\", which is the script name of an imported curve template. Optional fields include:\n\"flickerTime\" - the number of seconds to flicker the flashlight. Default value is 1.\n\"turnOffAtCompletion\" - if true, the flashlight will be turned off when the flicker ends. Default value is true.\n\"allowTurnOn\" - if true, the flashlight can be turned on/off during the flicker. Default value is true.\n\"forceFlashlightOn\" - if true, the flashlight will be forcibly turned on when the flicker starts. Default value is true."
    }
  },
  "@K[203]": "Flickers a player's flashlight following a specific curve."
}
```

</details>

## GameScript.FEAR.FlickerPlayerHUD

```lua
GameScript.FEAR.FlickerPlayerHUD(arg1, arg2, arg3)
```

Источник: [Lua, строка 1559](../../luasense_decompiled.lua#L1559). Имена `argN` — placeholders реконструкции.

Flickers a player's flashlight following a specific curve.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player whose HUD we are flickering |
| 2.0 | FlickerName | The name of the flicker in the HUD |
| 3.0 | DurationOverride | An override for the duration of the flicker. Use -1 for the defaults set in the flicker. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player whose HUD we are flickering"
    },
    "2.0": {
      "@K[209]": "FlickerName",
      "@K[211]": "The name of the flicker in the HUD"
    },
    "3.0": {
      "@K[209]": "DurationOverride",
      "@K[211]": "An override for the duration of the flicker. Use -1 for the defaults set in the flicker."
    }
  },
  "@K[203]": "Flickers a player's flashlight following a specific curve."
}
```

</details>

## GameScript.FEAR.GameDebugDump

```lua
GameScript.FEAR.GameDebugDump(arg1)
```

Источник: [Lua, строка 1562](../../luasense_decompiled.lua#L1562). Имена `argN` — placeholders реконструкции.

Dumps a whole whack of debug data to the hard drive.
Example: GameScript.FEAR.GameDebugDump("DebugDumps\")

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DirectoryPrefix | The name of the directory to place dumps under. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DirectoryPrefix",
      "@K[211]": "The name of the directory to place dumps under."
    }
  },
  "@K[203]": "Dumps a whole whack of debug data to the hard drive.\nExample: GameScript.FEAR.GameDebugDump(\"DebugDumps\\\")"
}
```

</details>

## GameScript.FEAR.GetGenericCounter

```lua
GameScript.FEAR.GetGenericCounter()
```

Источник: [Lua, строка 1565](../../luasense_decompiled.lua#L1565). Имена `argN` — placeholders реконструкции.

Returns the current value of the generic counter

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the current value of the generic counter"
}
```

</details>

## GameScript.FEAR.GetGenericTimer

```lua
GameScript.FEAR.GetGenericTimer()
```

Источник: [Lua, строка 1568](../../luasense_decompiled.lua#L1568). Имена `argN` — placeholders реконструкции.

Returns the current value of the generic timer.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the current value of the generic timer."
}
```

</details>

## GameScript.FEAR.GetMaxTimeBetweenAmbientEvents

```lua
GameScript.FEAR.GetMaxTimeBetweenAmbientEvents()
```

Источник: [Lua, строка 1571](../../luasense_decompiled.lua#L1571). Имена `argN` — placeholders реконструкции.

Return the maximum amount of time between ambient events (events that do NOT affect player tension), as set in the Ambient Event Manager Component in the Global Data Object

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return the maximum amount of time between ambient events (events that do NOT affect player tension), as set in the Ambient Event Manager Component in the Global Data Object"
}
```

</details>

## GameScript.FEAR.GetMaxTimeBetweenTensionEvents

```lua
GameScript.FEAR.GetMaxTimeBetweenTensionEvents()
```

Источник: [Lua, строка 1574](../../luasense_decompiled.lua#L1574). Имена `argN` — placeholders реконструкции.

Return the maximum amount of time between generative scares (events that DO affect player tension), as set in the Ambient Event Manager Component in the Global Data Object

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return the maximum amount of time between generative scares (events that DO affect player tension), as set in the Ambient Event Manager Component in the Global Data Object"
}
```

</details>

## GameScript.FEAR.GetMinTimeBetweenAmbientEvents

```lua
GameScript.FEAR.GetMinTimeBetweenAmbientEvents()
```

Источник: [Lua, строка 1577](../../luasense_decompiled.lua#L1577). Имена `argN` — placeholders реконструкции.

Return the minimum amount of time between ambient events (events that do NOT affect player tension), as set in the Ambient Event Manager Component in the Global Data Object

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return the minimum amount of time between ambient events (events that do NOT affect player tension), as set in the Ambient Event Manager Component in the Global Data Object"
}
```

</details>

## GameScript.FEAR.GetMinTimeBetweenTensionEvents

```lua
GameScript.FEAR.GetMinTimeBetweenTensionEvents()
```

Источник: [Lua, строка 1580](../../luasense_decompiled.lua#L1580). Имена `argN` — placeholders реконструкции.

Return the minimum amount of time between generative scares (events that DO affect player tension), as set in the Ambient Event Manager Component in the Global Data Object

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return the minimum amount of time between generative scares (events that DO affect player tension), as set in the Ambient Event Manager Component in the Global Data Object"
}
```

</details>

## GameScript.FEAR.GetPlayerColor

```lua
GameScript.FEAR.GetPlayerColor(arg1)
```

Источник: [Lua, строка 1583](../../luasense_decompiled.lua#L1583). Имена `argN` — placeholders реконструкции.

Returns the value of the color associated with the global player index in 32 bit argb format

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The global player index of the player whose color you want. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The global player index of the player whose color you want."
    }
  },
  "@K[203]": "Returns the value of the color associated with the global player index in 32 bit argb format"
}
```

</details>

## GameScript.FEAR.GetProbabilityOfFakeEventForCategory

```lua
GameScript.FEAR.GetProbabilityOfFakeEventForCategory(arg1)
```

Источник: [Lua, строка 1586](../../luasense_decompiled.lua#L1586). Имена `argN` — placeholders реконструкции.

Returns the probability (on a scale of 0.0 to 1.0) that any given Ambient Event for the specified category will be a fake (i.e. it will not fire, though it will update the internal timers as though it had.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Category | The name of the affected Ambient Event Category |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Category",
      "@K[211]": "The name of the affected Ambient Event Category"
    }
  },
  "@K[203]": "Returns the probability (on a scale of 0.0 to 1.0) that any given Ambient Event for the specified category will be a fake (i.e. it will not fire, though it will update the internal timers as though it had."
}
```

</details>

## GameScript.FEAR.GetSlowMoPercentRemaining

```lua
GameScript.FEAR.GetSlowMoPercentRemaining(arg1)
```

Источник: [Lua, строка 1589](../../luasense_decompiled.lua#L1589). Имена `argN` — placeholders реконструкции.

Checks the object for a Slow Mo Component and returns how much slow mo is remaining, as a percent [0, 1]

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with a Slow Mo Component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with a Slow Mo Component"
    }
  },
  "@K[203]": "Checks the object for a Slow Mo Component and returns how much slow mo is remaining, as a percent [0, 1]"
}
```

</details>

## GameScript.FEAR.GetTimeSinceLastAmbientEvent

```lua
GameScript.FEAR.GetTimeSinceLastAmbientEvent()
```

Источник: [Lua, строка 1592](../../luasense_decompiled.lua#L1592). Имена `argN` — placeholders реконструкции.

Returns the time (in seconds) since the last ambient event (events which do not affect player tension)

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the time (in seconds) since the last ambient event (events which do not affect player tension)"
}
```

</details>

## GameScript.FEAR.GetTimeSinceLastAmbientEventStartedForCategory

```lua
GameScript.FEAR.GetTimeSinceLastAmbientEventStartedForCategory(arg1)
```

Источник: [Lua, строка 1595](../../luasense_decompiled.lua#L1595). Имена `argN` — placeholders реконструкции.

Returns the time (in seconds) since the last ambient event started for the given category

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Category | The ambient event category we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Category",
      "@K[211]": "The ambient event category we are checking"
    }
  },
  "@K[203]": "Returns the time (in seconds) since the last ambient event started for the given category"
}
```

</details>

## GameScript.FEAR.GetTimeSinceLastAmbientEventStartedForCategoryGroup

```lua
GameScript.FEAR.GetTimeSinceLastAmbientEventStartedForCategoryGroup(arg1)
```

Источник: [Lua, строка 1598](../../luasense_decompiled.lua#L1598). Имена `argN` — placeholders реконструкции.

Returns the time (in seconds) since the last ambient event started for the given category group

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CategoryGroup | The ambient event category group we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CategoryGroup",
      "@K[211]": "The ambient event category group we are checking"
    }
  },
  "@K[203]": "Returns the time (in seconds) since the last ambient event started for the given category group"
}
```

</details>

## GameScript.FEAR.GetTimeSinceLastTensionEvent

```lua
GameScript.FEAR.GetTimeSinceLastTensionEvent()
```

Источник: [Lua, строка 1601](../../luasense_decompiled.lua#L1601). Имена `argN` — placeholders реконструкции.

Returns the time (in seconds) since the last generative scare event (events which do affect player tension)

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the time (in seconds) since the last generative scare event (events which do affect player tension)"
}
```

</details>

## GameScript.FEAR.IncrementCurrentPlayerTensionLevel

```lua
GameScript.FEAR.IncrementCurrentPlayerTensionLevel(arg1, arg2)
```

Источник: [Lua, строка 1604](../../luasense_decompiled.lua#L1604). Имена `argN` — placeholders реконструкции.

Adds the "Increment" amount to the player's tension level. The Increment amount can be negative to lower the tension

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player whose tension level we are altering. |
| 2.0 | Increment | The amount to add to the player's tension, can be negative. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player whose tension level we are altering."
    },
    "2.0": {
      "@K[209]": "Increment",
      "@K[211]": "The amount to add to the player's tension, can be negative."
    }
  },
  "@K[203]": "Adds the \"Increment\" amount to the player's tension level. The Increment amount can be negative to lower the tension"
}
```

</details>

## GameScript.FEAR.IsPhasing

```lua
GameScript.FEAR.IsPhasing(arg1)
```

Источник: [Lua, строка 1607](../../luasense_decompiled.lua#L1607). Имена `argN` — placeholders реконструкции.

This method pertains to the AI notion of phasing, which is essentially a teleport - rather than existing in another world temporarily. This method will tell whether the AI in the midst of a phase behavior or not.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The AI object to check for phasing |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The AI object to check for phasing"
    }
  },
  "@K[203]": "This method pertains to the AI notion of phasing, which is essentially a teleport - rather than existing in another world temporarily. This method will tell whether the AI in the midst of a phase behavior or not."
}
```

</details>

## GameScript.FEAR.IsPlayerFlashlightOn

```lua
GameScript.FEAR.IsPlayerFlashlightOn(arg1)
```

Источник: [Lua, строка 1610](../../luasense_decompiled.lua#L1610). Имена `argN` — placeholders реконструкции.

Return if the player's flashlight is currently on.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The global player index for which we are checking flashlight status. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The global player index for which we are checking flashlight status."
    }
  },
  "@K[203]": "Return if the player's flashlight is currently on."
}
```

</details>

## GameScript.FEAR.NotifyOfExternalEvent

```lua
GameScript.FEAR.NotifyOfExternalEvent()
```

Источник: [Lua, строка 1613](../../luasense_decompiled.lua#L1613). Имена `argN` — placeholders реконструкции.

Notifies the Ambient Event/Generative Scare system that an external event has occurred

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Notifies the Ambient Event/Generative Scare system that an external event has occurred"
}
```

</details>

## GameScript.FEAR.RefillSlowMo

```lua
GameScript.FEAR.RefillSlowMo(arg1)
```

Источник: [Lua, строка 1616](../../luasense_decompiled.lua#L1616). Имена `argN` — placeholders реконструкции.

Checks the object for a Slow Mo Component and sets its current duration to its maximum value

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with a Slow Mo Component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with a Slow Mo Component"
    }
  },
  "@K[203]": "Checks the object for a Slow Mo Component and sets its current duration to its maximum value"
}
```

</details>

## GameScript.FEAR.RegisterAmbientEvent

```lua
GameScript.FEAR.RegisterAmbientEvent(arg1, arg2)
```

Источник: [Lua, строка 1619](../../luasense_decompiled.lua#L1619). Имена `argN` — placeholders реконструкции.

Register/Unregister ambient event object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are (un)registering |
| 2.0 | bRegister | Register(true) or unregister(false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are (un)registering"
    },
    "2.0": {
      "@K[209]": "bRegister",
      "@K[211]": "Register(true) or unregister(false)"
    }
  },
  "@K[203]": "Register/Unregister ambient event object"
}
```

</details>

## GameScript.FEAR.SendAnnoucementPacket

```lua
GameScript.FEAR.SendAnnoucementPacket(arg1)
```

Источник: [Lua, строка 1622](../../luasense_decompiled.lua#L1622). Имена `argN` — placeholders реконструкции.

Sends the announcement display packet to the message queue for one particular local player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PacketId | The id of the packet to display. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PacketId",
      "@K[211]": "The id of the packet to display."
    }
  },
  "@K[203]": "Sends the announcement display packet to the message queue for one particular local player."
}
```

</details>

## GameScript.FEAR.SetAnnoucementPacketDestination

```lua
GameScript.FEAR.SetAnnoucementPacketDestination(arg1, arg2)
```

Источник: [Lua, строка 1625](../../luasense_decompiled.lua#L1625). Имена `argN` — placeholders реконструкции.

Sets the display destination of the specified announcement display packet.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PacketId | The id of the packet. |
| 2.0 | Destination | Used to indicate where the announcement should be displayed. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PacketId",
      "@K[211]": "The id of the packet."
    },
    "2.0": {
      "@K[209]": "Destination",
      "@K[211]": "Used to indicate where the announcement should be displayed."
    }
  },
  "@K[203]": "Sets the display destination of the specified announcement display packet."
}
```

</details>

## GameScript.FEAR.SetAnnoucementPacketPriority

```lua
GameScript.FEAR.SetAnnoucementPacketPriority(arg1, arg2)
```

Источник: [Lua, строка 1628](../../luasense_decompiled.lua#L1628). Имена `argN` — placeholders реконструкции.

Sets the display priority of the specified announcement display packet.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PacketId | The id of the packet. |
| 2.0 | Priority | Used to indicate the display priority of the announcement. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PacketId",
      "@K[211]": "The id of the packet."
    },
    "2.0": {
      "@K[209]": "Priority",
      "@K[211]": "Used to indicate the display priority of the announcement."
    }
  },
  "@K[203]": "Sets the display priority of the specified announcement display packet."
}
```

</details>

## GameScript.FEAR.SetAnnoucementPacketTime

```lua
GameScript.FEAR.SetAnnoucementPacketTime(arg1, arg2)
```

Источник: [Lua, строка 1631](../../luasense_decompiled.lua#L1631). Имена `argN` — placeholders реконструкции.

Sets the display time of the specified announcement display packet.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PacketId | The id of the packet. |
| 2.0 | Time | Used to indicate the display time of the announcement. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PacketId",
      "@K[211]": "The id of the packet."
    },
    "2.0": {
      "@K[209]": "Time",
      "@K[211]": "Used to indicate the display time of the announcement."
    }
  },
  "@K[203]": "Sets the display time of the specified announcement display packet."
}
```

</details>

## GameScript.FEAR.SetCurrentPlayerTensionLevel

```lua
GameScript.FEAR.SetCurrentPlayerTensionLevel(arg1, arg2)
```

Источник: [Lua, строка 1634](../../luasense_decompiled.lua#L1634). Имена `argN` — placeholders реконструкции.

Sets the current tension level for the specified player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player whose tension level we are setting. |
| 2.0 | Tension | The player's new tension level. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player whose tension level we are setting."
    },
    "2.0": {
      "@K[209]": "Tension",
      "@K[211]": "The player's new tension level."
    }
  },
  "@K[203]": "Sets the current tension level for the specified player."
}
```

</details>

## GameScript.FEAR.SetDLCInventoryGroupOption

```lua
GameScript.FEAR.SetDLCInventoryGroupOption()
```

Источник: [Lua, строка 1637](../../luasense_decompiled.lua#L1637). Имена `argN` — placeholders реконструкции.

Highly specialized script that should be called on local player avatar objects. Grabs the script-owning object and sets all state-enabled primary weapon inventories to the group as defined in that player's profile's DLC inventory option.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Highly specialized script that should be called on local player avatar objects. Grabs the script-owning object and sets all state-enabled primary weapon inventories to the group as defined in that player's profile's DLC inventory option."
}
```

</details>

## GameScript.FEAR.SetGenericCounter

```lua
GameScript.FEAR.SetGenericCounter(arg1)
```

Источник: [Lua, строка 1640](../../luasense_decompiled.lua#L1640). Имена `argN` — placeholders реконструкции.

Sets the current value of the generic counter

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Count | The new value of the generic counter. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Count",
      "@K[211]": "The new value of the generic counter."
    }
  },
  "@K[203]": "Sets the current value of the generic counter"
}
```

</details>

## GameScript.FEAR.SetGenericTimer

```lua
GameScript.FEAR.SetGenericTimer(arg1)
```

Источник: [Lua, строка 1643](../../luasense_decompiled.lua#L1643). Имена `argN` — placeholders реконструкции.

Sets the current value of the generic timer

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Time | The new value of the generic timer. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Time",
      "@K[211]": "The new value of the generic timer."
    }
  },
  "@K[203]": "Sets the current value of the generic timer"
}
```

</details>

## GameScript.FEAR.SetGlobalPerformanceValue

```lua
GameScript.FEAR.SetGlobalPerformanceValue(arg1)
```

Источник: [Lua, строка 1646](../../luasense_decompiled.lua#L1646). Имена `argN` — placeholders реконструкции.

Changes global values to adjust performance for different play environments.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PerfCmd | A command for setting global performance values |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PerfCmd",
      "@K[211]": "A command for setting global performance values"
    }
  },
  "@K[203]": "Changes global values to adjust performance for different play environments."
}
```

</details>

## GameScript.FEAR.SetMaxTimeBetweenAmbientEvents

```lua
GameScript.FEAR.SetMaxTimeBetweenAmbientEvents(arg1)
```

Источник: [Lua, строка 1649](../../luasense_decompiled.lua#L1649). Имена `argN` — placeholders реконструкции.

Sets the maximum time between ambient events (events that do NOT affect player tension)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MaxTime | The new maximum time between ambient events |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MaxTime",
      "@K[211]": "The new maximum time between ambient events"
    }
  },
  "@K[203]": "Sets the maximum time between ambient events (events that do NOT affect player tension)"
}
```

</details>

## GameScript.FEAR.SetMaxTimeBetweenTensionEvents

```lua
GameScript.FEAR.SetMaxTimeBetweenTensionEvents(arg1)
```

Источник: [Lua, строка 1652](../../luasense_decompiled.lua#L1652). Имена `argN` — placeholders реконструкции.

Sets the maximum time between generative scares (events that DO affect player tension)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MaxTime | The new maximum time between generative scares |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MaxTime",
      "@K[211]": "The new maximum time between generative scares"
    }
  },
  "@K[203]": "Sets the maximum time between generative scares (events that DO affect player tension)"
}
```

</details>

## GameScript.FEAR.SetMinMaxPlayerTensionLevel

```lua
GameScript.FEAR.SetMinMaxPlayerTensionLevel(arg1, arg2, arg3)
```

Источник: [Lua, строка 1655](../../luasense_decompiled.lua#L1655). Имена `argN` — placeholders реконструкции.

Sets the minimum and maximum tension levels for the specified player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player whose tension range we are setting. |
| 2.0 | MinTension | The player's new minimum tension level. |
| 3.0 | MaxTension | The player's new maximum tension level. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player whose tension range we are setting."
    },
    "2.0": {
      "@K[209]": "MinTension",
      "@K[211]": "The player's new minimum tension level."
    },
    "3.0": {
      "@K[209]": "MaxTension",
      "@K[211]": "The player's new maximum tension level."
    }
  },
  "@K[203]": "Sets the minimum and maximum tension levels for the specified player."
}
```

</details>

## GameScript.FEAR.SetMinTimeBetweenAmbientEvents

```lua
GameScript.FEAR.SetMinTimeBetweenAmbientEvents(arg1)
```

Источник: [Lua, строка 1658](../../luasense_decompiled.lua#L1658). Имена `argN` — placeholders реконструкции.

Sets the minimum time between ambient events (events that do NOT affect player tension)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MinTime | The new minimum time between ambient events that do NOT affect tension |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MinTime",
      "@K[211]": "The new minimum time between ambient events that do NOT affect tension"
    }
  },
  "@K[203]": "Sets the minimum time between ambient events (events that do NOT affect player tension)"
}
```

</details>

## GameScript.FEAR.SetMinTimeBetweenTensionEvents

```lua
GameScript.FEAR.SetMinTimeBetweenTensionEvents(arg1)
```

Источник: [Lua, строка 1661](../../luasense_decompiled.lua#L1661). Имена `argN` — placeholders реконструкции.

Sets the minimum time between generative scares (events that DO affect player tension)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MinTime | The new minimum time between generative scares |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MinTime",
      "@K[211]": "The new minimum time between generative scares"
    }
  },
  "@K[203]": "Sets the minimum time between generative scares (events that DO affect player tension)"
}
```

</details>

## GameScript.FEAR.SetProbabilityOfFakeEventForCategory

```lua
GameScript.FEAR.SetProbabilityOfFakeEventForCategory(arg1, arg2)
```

Источник: [Lua, строка 1664](../../luasense_decompiled.lua#L1664). Имена `argN` — placeholders реконструкции.

Sets the probability (on a scale of 0.0 to 1.0) that any given Ambient Event for the specified category will be a fake (i.e. it will not fire, though it will update the internal timers as though it had.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Category | The name of the affected Ambient Event Category |
| 2.0 | Probability | The probability that any given event for the category will be a fake, on a scale of [0.0, 1.0] |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Category",
      "@K[211]": "The name of the affected Ambient Event Category"
    },
    "2.0": {
      "@K[209]": "Probability",
      "@K[211]": "The probability that any given event for the category will be a fake, on a scale of [0.0, 1.0]"
    }
  },
  "@K[203]": "Sets the probability (on a scale of 0.0 to 1.0) that any given Ambient Event for the specified category will be a fake (i.e. it will not fire, though it will update the internal timers as though it had."
}
```

</details>

## GameScript.FEAR.TurnOnAmbientEvent

```lua
GameScript.FEAR.TurnOnAmbientEvent(arg1, arg2)
```

Источник: [Lua, строка 1667](../../luasense_decompiled.lua#L1667). Имена `argN` — placeholders реконструкции.

Turns an individual Ambient Event on/off. This should be used rarely; if you want a specifically scripted ambient event, then it should probably be handled via cutscenes.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The ambient event object we are turning on/off |
| 2.0 | bTurnOn | Turns the ambient event on (true) or off (false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The ambient event object we are turning on/off"
    },
    "2.0": {
      "@K[209]": "bTurnOn",
      "@K[211]": "Turns the ambient event on (true) or off (false)"
    }
  },
  "@K[203]": "Turns an individual Ambient Event on/off. This should be used rarely; if you want a specifically scripted ambient event, then it should probably be handled via cutscenes."
}
```

</details>

## GameScript.FEAR.TurnOnAmbientEventCategory

```lua
GameScript.FEAR.TurnOnAmbientEventCategory(arg1, arg2)
```

Источник: [Lua, строка 1670](../../luasense_decompiled.lua#L1670). Имена `argN` — placeholders реконструкции.

Turns a category of Ambient Events on/off. Categories are also considered "off" if they belong to a Category Group that has been turned off

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Category | The ambient event category we are turning on/off |
| 2.0 | bTurnOn | Turn the category on(true) or off(false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Category",
      "@K[211]": "The ambient event category we are turning on/off"
    },
    "2.0": {
      "@K[209]": "bTurnOn",
      "@K[211]": "Turn the category on(true) or off(false)"
    }
  },
  "@K[203]": "Turns a category of Ambient Events on/off. Categories are also considered \"off\" if they belong to a Category Group that has been turned off"
}
```

</details>

## GameScript.FEAR.TurnOnAmbientEventCategoryGroup

```lua
GameScript.FEAR.TurnOnAmbientEventCategoryGroup(arg1, arg2)
```

Источник: [Lua, строка 1673](../../luasense_decompiled.lua#L1673). Имена `argN` — placeholders реконструкции.

Turns a category group of Ambient Events on/off. Ambient Events will not play if their Category belongs to any Group that has been turned off

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CategoryGroup | The ambient event category group we are turning on/off |
| 2.0 | bTurnOn | Turn the category on(true) or off(false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CategoryGroup",
      "@K[211]": "The ambient event category group we are turning on/off"
    },
    "2.0": {
      "@K[209]": "bTurnOn",
      "@K[211]": "Turn the category on(true) or off(false)"
    }
  },
  "@K[203]": "Turns a category group of Ambient Events on/off. Ambient Events will not play if their Category belongs to any Group that has been turned off"
}
```

</details>

## GameScript.FEAR.UpdateAISettingsForAggressiveAttack

```lua
GameScript.FEAR.UpdateAISettingsForAggressiveAttack(arg1)
```

Источник: [Lua, строка 1676](../../luasense_decompiled.lua#L1676). Имена `argN` — placeholders реконструкции.

Sets various settings on the given enemy such that he attacks very aggressively

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The enemy whose being set to attack aggressively. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The enemy whose being set to attack aggressively."
    }
  },
  "@K[203]": "Sets various settings on the given enemy such that he attacks very aggressively"
}
```

</details>
