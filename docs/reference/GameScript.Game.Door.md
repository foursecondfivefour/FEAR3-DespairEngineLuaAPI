# GameScript.Game.Door

[Индекс](../API.md)

## GameScript.Game.Door.Enable

```lua
GameScript.Game.Door.Enable(arg1, arg2)
```

Источник: [Lua, строка 1938](../../luasense_decompiled.lua#L1938). Имена `argN` — placeholders реконструкции.

Enables or disables the door functionality of the given object. This is different than the EnableAllEnableables function

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to be enabled (requires a Door Object Component) |
| 2.0 | bEnable | If true, then the door will be enabled. If false, then the door will be disabled. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to be enabled (requires a Door Object Component)"
    },
    "2.0": {
      "@K[209]": "bEnable",
      "@K[211]": "If true, then the door will be enabled. If false, then the door will be disabled."
    }
  },
  "@K[203]": "Enables or disables the door functionality of the given object. This is different than the EnableAllEnableables function"
}
```

</details>

## GameScript.Game.Door.GetPosition

```lua
GameScript.Game.Door.GetPosition(arg1)
```

Источник: [Lua, строка 1941](../../luasense_decompiled.lua#L1941). Имена `argN` — placeholders реконструкции.

Returns the position of the door: 0 if it is closed, 1 if it is open, -1 if it is open in the opposite direction (if it swings both ways). This function is only applicable for "Simple Doors", i.e. those that have the "Advanced Controls" setting set to false. Otherwise, it will always return 0.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to check |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to check"
    }
  },
  "@K[203]": "Returns the position of the door: 0 if it is closed, 1 if it is open, -1 if it is open in the opposite direction (if it swings both ways). This function is only applicable for \"Simple Doors\", i.e. those that have the \"Advanced Controls\" setting set to false. Otherwise, it will always return 0."
}
```

</details>

## GameScript.Game.Door.GetStatus

```lua
GameScript.Game.Door.GetStatus(arg1)
```

Источник: [Lua, строка 1944](../../luasense_decompiled.lua#L1944). Имена `argN` — placeholders реконструкции.

Get a table of info about the door status with fields:
.state = GameScript.DoorState.kLoose, GameScript.DoorState.kOpen, GameScript.DoorState.kClosed
.bLocked = true,false
.bEnabled = true,false
.bActive = true,false


Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object from which we get the door status (requires a Door Object Component) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object from which we get the door status (requires a Door Object Component)"
    }
  },
  "@K[203]": "Get a table of info about the door status with fields:\n.state = GameScript.DoorState.kLoose, GameScript.DoorState.kOpen, GameScript.DoorState.kClosed\n.bLocked = true,false\n.bEnabled = true,false\n.bActive = true,false\n"
}
```

</details>

## GameScript.Game.Door.Lock

```lua
GameScript.Game.Door.Lock(arg1, arg2)
```

Источник: [Lua, строка 1947](../../luasense_decompiled.lua#L1947). Имена `argN` — placeholders реконструкции.

Locks or unlocks the given door object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to be locked/unlocked (requires a Door Object Component) |
| 2.0 | bEnable | If true, then the door will be locked. If false, then the door will be unlocked. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to be locked/unlocked (requires a Door Object Component)"
    },
    "2.0": {
      "@K[209]": "bEnable",
      "@K[211]": "If true, then the door will be locked. If false, then the door will be unlocked."
    }
  },
  "@K[203]": "Locks or unlocks the given door object."
}
```

</details>

## GameScript.Game.Door.LockSilent

```lua
GameScript.Game.Door.LockSilent(arg1, arg2)
```

Источник: [Lua, строка 1950](../../luasense_decompiled.lua#L1950). Имена `argN` — placeholders реконструкции.

Locks or unlocks the given door object silently.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to be locked/unlocked (requires a Door Object Component) |
| 2.0 | bEnable | If true, then the door will be locked. If false, then the door will be unlocked. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to be locked/unlocked (requires a Door Object Component)"
    },
    "2.0": {
      "@K[209]": "bEnable",
      "@K[211]": "If true, then the door will be locked. If false, then the door will be unlocked."
    }
  },
  "@K[203]": "Locks or unlocks the given door object silently."
}
```

</details>

## GameScript.Game.Door.MoveToNextPosition

```lua
GameScript.Game.Door.MoveToNextPosition(arg1)
```

Источник: [Lua, строка 1953](../../luasense_decompiled.lua#L1953). Имена `argN` — placeholders реконструкции.

Moves the door its next preset position.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to be moved (requires a Door Object Component) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to be moved (requires a Door Object Component)"
    }
  },
  "@K[203]": "Moves the door its next preset position."
}
```

</details>

## GameScript.Game.Door.MoveToPercentPosition

```lua
GameScript.Game.Door.MoveToPercentPosition(arg1, arg2)
```

Источник: [Lua, строка 1956](../../luasense_decompiled.lua#L1956). Имена `argN` — placeholders реконструкции.

Moves the door to a particular percent of its full movement range.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to be moved (requires a Door Object Component) |
| 2.0 | fPercent | How far open the door should be, on a scale of [0, 1]. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to be moved (requires a Door Object Component)"
    },
    "2.0": {
      "@K[209]": "fPercent",
      "@K[211]": "How far open the door should be, on a scale of [0, 1]."
    }
  },
  "@K[203]": "Moves the door to a particular percent of its full movement range."
}
```

</details>

## GameScript.Game.Door.MoveToPercentPositionSilent

```lua
GameScript.Game.Door.MoveToPercentPositionSilent(arg1, arg2)
```

Источник: [Lua, строка 1959](../../luasense_decompiled.lua#L1959). Имена `argN` — placeholders реконструкции.

Moves the door to a particular percent of its full movement range silently.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to be moved (requires a Door Object Component) |
| 2.0 | fPercent | How far open the door should be, on a scale of [0, 1]. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to be moved (requires a Door Object Component)"
    },
    "2.0": {
      "@K[209]": "fPercent",
      "@K[211]": "How far open the door should be, on a scale of [0, 1]."
    }
  },
  "@K[203]": "Moves the door to a particular percent of its full movement range silently."
}
```

</details>

## GameScript.Game.Door.MoveToPercentPositionWithSpeedAndAcceleration

```lua
GameScript.Game.Door.MoveToPercentPositionWithSpeedAndAcceleration(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1962](../../luasense_decompiled.lua#L1962). Имена `argN` — placeholders реконструкции.

Moves the door to a particular percent of its full movement range.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to be moved (requires a Door Object Component) |
| 2.0 | fPercent | How far open the door should be, on a scale of [0, 1]. |
| 3.0 | fSpeed | How fast the door should open deg/s or m/s. |
| 4.0 | fAcceleration | Acceleration override [0 = use default from hinge] |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to be moved (requires a Door Object Component)"
    },
    "2.0": {
      "@K[209]": "fPercent",
      "@K[211]": "How far open the door should be, on a scale of [0, 1]."
    },
    "3.0": {
      "@K[209]": "fSpeed",
      "@K[211]": "How fast the door should open deg/s or m/s."
    },
    "4.0": {
      "@K[209]": "fAcceleration",
      "@K[211]": "Acceleration override [0 = use default from hinge]"
    }
  },
  "@K[203]": "Moves the door to a particular percent of its full movement range."
}
```

</details>

## GameScript.Game.Door.MoveToPresetPosition

```lua
GameScript.Game.Door.MoveToPresetPosition(arg1, arg2)
```

Источник: [Lua, строка 1965](../../luasense_decompiled.lua#L1965). Имена `argN` — placeholders реконструкции.

Moves the door to one of its preset positions.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DoorObject | The Door Object to be moved (requires a Door Object Component) |
| 2.0 | nPosition | Which preset position should we move the door to. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DoorObject",
      "@K[211]": "The Door Object to be moved (requires a Door Object Component)"
    },
    "2.0": {
      "@K[209]": "nPosition",
      "@K[211]": "Which preset position should we move the door to."
    }
  },
  "@K[203]": "Moves the door to one of its preset positions."
}
```

</details>
