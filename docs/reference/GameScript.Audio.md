# GameScript.Audio

[Индекс](../API.md)

## GameScript.Audio.ApplyEPA

```lua
GameScript.Audio.ApplyEPA(arg1, arg2)
```

Источник: [Lua, строка 1312](../../luasense_decompiled.lua#L1312). Имена `argN` — placeholders реконструкции.

Enable or disable EPA effects for the local player over specified duration.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Enabled | Whether to enable or disable EPA effects. |
| 2.0 | FadeDuration | Time over which to fade the EPA effects in or out. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Enabled",
      "@K[211]": "Whether to enable or disable EPA effects."
    },
    "2.0": {
      "@K[209]": "FadeDuration",
      "@K[211]": "Time over which to fade the EPA effects in or out."
    }
  },
  "@K[203]": "Enable or disable EPA effects for the local player over specified duration."
}
```

</details>

## GameScript.Audio.ApplyLowHP

```lua
GameScript.Audio.ApplyLowHP(arg1)
```

Источник: [Lua, строка 1315](../../luasense_decompiled.lua#L1315). Имена `argN` — placeholders реконструкции.

Enable or disable low HP effects for the local player.  If related effects are already active, e.g. tinnitus, the result will be a logic mix.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Enabled | Whether to enable or disable low HP effects. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Enabled",
      "@K[211]": "Whether to enable or disable low HP effects."
    }
  },
  "@K[203]": "Enable or disable low HP effects for the local player.  If related effects are already active, e.g. tinnitus, the result will be a logic mix."
}
```

</details>

## GameScript.Audio.ApplyTinnitus

```lua
GameScript.Audio.ApplyTinnitus(arg1)
```

Источник: [Lua, строка 1318](../../luasense_decompiled.lua#L1318). Имена `argN` — placeholders реконструкции.

Apply an amount of tinnitus to the local player.  If tinnitus is already active, the new amount will be mixed with the existing amount in a logical way.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Amount | Amount of tinnitus to apply.  This value affects duration and volume of tinnitus sound and filtering of other sounds |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Amount",
      "@K[211]": "Amount of tinnitus to apply.  This value affects duration and volume of tinnitus sound and filtering of other sounds"
    }
  },
  "@K[203]": "Apply an amount of tinnitus to the local player.  If tinnitus is already active, the new amount will be mixed with the existing amount in a logical way."
}
```

</details>

## GameScript.Audio.GetBusVolume

```lua
GameScript.Audio.GetBusVolume(arg1)
```

Источник: [Lua, строка 1321](../../luasense_decompiled.lua#L1321). Имена `argN` — placeholders реконструкции.

Get the volume of a bus by name.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | BusName | Name of the bus to get the volume of |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "BusName",
      "@K[211]": "Name of the bus to get the volume of"
    }
  },
  "@K[203]": "Get the volume of a bus by name."
}
```

</details>

## GameScript.Audio.GetEffectParam

```lua
GameScript.Audio.GetEffectParam(arg1, arg2, arg3)
```

Источник: [Lua, строка 1324](../../luasense_decompiled.lua#L1324). Имена `argN` — placeholders реконструкции.

Get the value of an effect param by name.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | BusName | Name of the bus to get the effect of |
| 2.0 | EffectName | Name of the effect to get the param of |
| 3.0 | ParamIndex | Index of the param to get the value of |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "BusName",
      "@K[211]": "Name of the bus to get the effect of"
    },
    "2.0": {
      "@K[209]": "EffectName",
      "@K[211]": "Name of the effect to get the param of"
    },
    "3.0": {
      "@K[209]": "ParamIndex",
      "@K[211]": "Index of the param to get the value of"
    }
  },
  "@K[203]": "Get the value of an effect param by name."
}
```

</details>

## GameScript.Audio.MuteMusic

```lua
GameScript.Audio.MuteMusic(arg1, arg2)
```

Источник: [Lua, строка 1326](../../luasense_decompiled.lua#L1326). Имена `argN` — placeholders реконструкции.

@K[219]

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MusicName | @K[219] |
| 2.0 | Muted | @K[219] |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MusicName",
      "@K[211]": "@K[219]"
    },
    "2.0": {
      "@K[209]": "Muted",
      "@K[211]": "@K[219]"
    }
  },
  "@K[203]": "@K[219]"
}
```

</details>

## GameScript.Audio.MuteMusicWithFade

```lua
GameScript.Audio.MuteMusicWithFade(arg1, arg2, arg3)
```

Источник: [Lua, строка 1328](../../luasense_decompiled.lua#L1328). Имена `argN` — placeholders реконструкции.

@K[219]

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MusicName | @K[219] |
| 2.0 | Muted | @K[219] |
| 3.0 | FadeTime | Time, in seconds, over which to fade music volume |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MusicName",
      "@K[211]": "@K[219]"
    },
    "2.0": {
      "@K[209]": "Muted",
      "@K[211]": "@K[219]"
    },
    "3.0": {
      "@K[209]": "FadeTime",
      "@K[211]": "Time, in seconds, over which to fade music volume"
    }
  },
  "@K[203]": "@K[219]"
}
```

</details>

## GameScript.Audio.RegisterMusic

```lua
GameScript.Audio.RegisterMusic(arg1, arg2)
```

Источник: [Lua, строка 1330](../../luasense_decompiled.lua#L1330). Имена `argN` — placeholders реконструкции.

@K[219]

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MusicName | @K[219] |
| 2.0 | EmpireObject | @K[219] |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MusicName",
      "@K[211]": "@K[219]"
    },
    "2.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "@K[219]"
    }
  },
  "@K[203]": "@K[219]"
}
```

</details>

## GameScript.Audio.SetBusVolume

```lua
GameScript.Audio.SetBusVolume(arg1, arg2)
```

Источник: [Lua, строка 1333](../../luasense_decompiled.lua#L1333). Имена `argN` — placeholders реконструкции.

Set the volume of a bus by name.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | BusName | Name of the bus to set the volume of |
| 2.0 | Volume | Volume to set on the bus |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "BusName",
      "@K[211]": "Name of the bus to set the volume of"
    },
    "2.0": {
      "@K[209]": "Volume",
      "@K[211]": "Volume to set on the bus"
    }
  },
  "@K[203]": "Set the volume of a bus by name."
}
```

</details>

## GameScript.Audio.SetEffectParam

```lua
GameScript.Audio.SetEffectParam(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1336](../../luasense_decompiled.lua#L1336). Имена `argN` — placeholders реконструкции.

Set the value of an effect param by name.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | BusName | Name of the bus to set the effect of |
| 2.0 | EffectName | Name of the effect to set the param of |
| 3.0 | ParamIndex | Index of the param to set the value of |
| 4.0 | Value | Value to set on the param |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "BusName",
      "@K[211]": "Name of the bus to set the effect of"
    },
    "2.0": {
      "@K[209]": "EffectName",
      "@K[211]": "Name of the effect to set the param of"
    },
    "3.0": {
      "@K[209]": "ParamIndex",
      "@K[211]": "Index of the param to set the value of"
    },
    "4.0": {
      "@K[209]": "Value",
      "@K[211]": "Value to set on the param"
    }
  },
  "@K[203]": "Set the value of an effect param by name."
}
```

</details>

## GameScript.Audio.StartMusic

```lua
GameScript.Audio.StartMusic(arg1, arg2, arg3)
```

Источник: [Lua, строка 1338](../../luasense_decompiled.lua#L1338). Имена `argN` — placeholders реконструкции.

@K[219]

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MusicName | @K[219] |
| 2.0 | Muted | @K[219] |
| 3.0 | StopOtherMusic | @K[219] |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MusicName",
      "@K[211]": "@K[219]"
    },
    "2.0": {
      "@K[209]": "Muted",
      "@K[211]": "@K[219]"
    },
    "3.0": {
      "@K[209]": "StopOtherMusic",
      "@K[211]": "@K[219]"
    }
  },
  "@K[203]": "@K[219]"
}
```

</details>

## GameScript.Audio.StopMusic

```lua
GameScript.Audio.StopMusic()
```

Источник: [Lua, строка 1340](../../luasense_decompiled.lua#L1340). Имена `argN` — placeholders реконструкции.

@K[219]

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "@K[219]"
}
```

</details>
