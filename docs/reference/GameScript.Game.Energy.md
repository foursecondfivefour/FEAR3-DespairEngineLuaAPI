# GameScript.Game.Energy

[Индекс](../API.md)

## GameScript.Game.Energy.AdjustEnergyLevel

```lua
GameScript.Game.Energy.AdjustEnergyLevel(arg1, arg2)
```

Источник: [Lua, строка 1995](../../luasense_decompiled.lua#L1995). Имена `argN` — placeholders реконструкции.

Moves energy level up or down by the set amount.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |
| 2.0 | EnergyChange | Units to adjust current energy level by |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    },
    "2.0": {
      "@K[209]": "EnergyChange",
      "@K[211]": "Units to adjust current energy level by"
    }
  },
  "@K[203]": "Moves energy level up or down by the set amount.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.EnableAutoFill

```lua
GameScript.Game.Energy.EnableAutoFill(arg1, arg2)
```

Источник: [Lua, строка 1998](../../luasense_decompiled.lua#L1998). Имена `argN` — placeholders реконструкции.

Moves energy level to the set amount.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |
| 2.0 | Enable | Whether the Energy Component should currently engage its auto-fill mechanism |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    },
    "2.0": {
      "@K[209]": "Enable",
      "@K[211]": "Whether the Energy Component should currently engage its auto-fill mechanism"
    }
  },
  "@K[203]": "Moves energy level to the set amount.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.GetEnergyFillRate

```lua
GameScript.Game.Energy.GetEnergyFillRate(arg1)
```

Источник: [Lua, строка 2001](../../luasense_decompiled.lua#L2001). Имена `argN` — placeholders реконструкции.

Gets the fill rate from the component.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    }
  },
  "@K[203]": "Gets the fill rate from the component.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.GetEnergyLevel

```lua
GameScript.Game.Energy.GetEnergyLevel(arg1, arg2)
```

Источник: [Lua, строка 2004](../../luasense_decompiled.lua#L2004). Имена `argN` — placeholders реконструкции.

Checks an object for its current energy level (absolute value, NOT percentage), returning 0 if there is no Energy Component

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with an Energy Component |
| 2.0 | ComponentName | The name of the Energy Component to fetch the value from |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with an Energy Component"
    },
    "2.0": {
      "@K[209]": "ComponentName",
      "@K[211]": "The name of the Energy Component to fetch the value from"
    }
  },
  "@K[203]": "Checks an object for its current energy level (absolute value, NOT percentage), returning 0 if there is no Energy Component"
}
```

</details>

## GameScript.Game.Energy.ResetEnergyDrainRate

```lua
GameScript.Game.Energy.ResetEnergyDrainRate(arg1)
```

Источник: [Lua, строка 2007](../../luasense_decompiled.lua#L2007). Имена `argN` — placeholders реконструкции.

Resets drain rate to Forge setting.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    }
  },
  "@K[203]": "Resets drain rate to Forge setting.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.ResetEnergyFillRate

```lua
GameScript.Game.Energy.ResetEnergyFillRate(arg1)
```

Источник: [Lua, строка 2010](../../luasense_decompiled.lua#L2010). Имена `argN` — placeholders реконструкции.

Resets fill rate to Forge setting.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    }
  },
  "@K[203]": "Resets fill rate to Forge setting.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.SetEnergyDrainRate

```lua
GameScript.Game.Energy.SetEnergyDrainRate(arg1, arg2)
```

Источник: [Lua, строка 2013](../../luasense_decompiled.lua#L2013). Имена `argN` — placeholders реконструкции.

Change the speed at which Draining occurs.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |
| 2.0 | DrainRate | Units per second that draining should result in |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    },
    "2.0": {
      "@K[209]": "DrainRate",
      "@K[211]": "Units per second that draining should result in"
    }
  },
  "@K[203]": "Change the speed at which Draining occurs.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.SetEnergyFillRate

```lua
GameScript.Game.Energy.SetEnergyFillRate(arg1, arg2)
```

Источник: [Lua, строка 2016](../../luasense_decompiled.lua#L2016). Имена `argN` — placeholders реконструкции.

Change the speed at which Filling occurs.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |
| 2.0 | FillRate | Units per second that filling should result in |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    },
    "2.0": {
      "@K[209]": "FillRate",
      "@K[211]": "Units per second that filling should result in"
    }
  },
  "@K[203]": "Change the speed at which Filling occurs.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.SetEnergyLevel

```lua
GameScript.Game.Energy.SetEnergyLevel(arg1, arg2)
```

Источник: [Lua, строка 2019](../../luasense_decompiled.lua#L2019). Имена `argN` — placeholders реконструкции.

Moves energy level to the set amount.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |
| 2.0 | EnergyLevel | Energy level to jump to |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    },
    "2.0": {
      "@K[209]": "EnergyLevel",
      "@K[211]": "Energy level to jump to"
    }
  },
  "@K[203]": "Moves energy level to the set amount.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.SetEnergyLevelOnObject

```lua
GameScript.Game.Energy.SetEnergyLevelOnObject(arg1, arg2, arg3)
```

Источник: [Lua, строка 2022](../../luasense_decompiled.lua#L2022). Имена `argN` — placeholders реконструкции.

Moves energy level to the set amount.  If there is no Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are overriding the energy level on |
| 2.0 | ComponentName | Name of the energy component to overwrite |
| 3.0 | EnergyLevel | Energy level to jump to |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are overriding the energy level on"
    },
    "2.0": {
      "@K[209]": "ComponentName",
      "@K[211]": "Name of the energy component to overwrite"
    },
    "3.0": {
      "@K[209]": "EnergyLevel",
      "@K[211]": "Energy level to jump to"
    }
  },
  "@K[203]": "Moves energy level to the set amount.  If there is no Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.StartDrainingEnergy

```lua
GameScript.Game.Energy.StartDrainingEnergy(arg1)
```

Источник: [Lua, строка 2025](../../luasense_decompiled.lua#L2025). Имена `argN` — placeholders реконструкции.

Cause the energy meter to start draining to 0.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    }
  },
  "@K[203]": "Cause the energy meter to start draining to 0.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.StartFillingEnergy

```lua
GameScript.Game.Energy.StartFillingEnergy(arg1)
```

Источник: [Lua, строка 2028](../../luasense_decompiled.lua#L2028). Имена `argN` — placeholders реконструкции.

Cause the energy meter to start filling towards full.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    }
  },
  "@K[203]": "Cause the energy meter to start filling towards full.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>

## GameScript.Game.Energy.StopEnergyRateChange

```lua
GameScript.Game.Energy.StopEnergyRateChange(arg1)
```

Источник: [Lua, строка 2031](../../luasense_decompiled.lua#L2031). Имена `argN` — placeholders реконструкции.

Halts all filling and draining.  If the component is not an Energy Component, there will be a red screen

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    }
  },
  "@K[203]": "Halts all filling and draining.  If the component is not an Energy Component, there will be a red screen"
}
```

</details>
