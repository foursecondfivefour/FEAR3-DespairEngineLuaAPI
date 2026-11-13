# GameScript.Game.Death

[Индекс](../API.md)

## GameScript.Game.Death.GetDeathChoreographerSequence

```lua
GameScript.Game.Death.GetDeathChoreographerSequence(arg1)
```

Источник: [Lua, строка 1902](../../luasense_decompiled.lua#L1902). Имена `argN` — placeholders реконструкции.

Finds the death choreographer in a recently killed object and returns the name of the death sequence used. This function returns an empty string on error.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | KilledObject | The recently killed object |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "KilledObject",
      "@K[211]": "The recently killed object"
    }
  },
  "@K[203]": "Finds the death choreographer in a recently killed object and returns the name of the death sequence used. This function returns an empty string on error."
}
```

</details>

## GameScript.Game.Death.GetLastDamageInfo

```lua
GameScript.Game.Death.GetLastDamageInfo()
```

Источник: [Lua, строка 1905](../../luasense_decompiled.lua#L1905). Имена `argN` — placeholders реконструкции.

Returns information about the last unit of damage delivered to the script's object

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns information about the last unit of damage delivered to the script's object"
}
```

</details>

## GameScript.Game.Death.GetLastDamageInfoFromObject

```lua
GameScript.Game.Death.GetLastDamageInfoFromObject(arg1)
```

Источник: [Lua, строка 1908](../../luasense_decompiled.lua#L1908). Имена `argN` — placeholders реконструкции.

Returns information about the last unit of damage delivered to the object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DamagedObject | The object from which we are retrieving damage info |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DamagedObject",
      "@K[211]": "The object from which we are retrieving damage info"
    }
  },
  "@K[203]": "Returns information about the last unit of damage delivered to the object"
}
```

</details>

## GameScript.Game.Death.GetLastDamagePlayerIndexFromObject

```lua
GameScript.Game.Death.GetLastDamagePlayerIndexFromObject(arg1)
```

Источник: [Lua, строка 1911](../../luasense_decompiled.lua#L1911). Имена `argN` — placeholders реконструкции.

Returns the player index of whoever last damaged the object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DamagedObject | The object from which we are retrieving damage info |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DamagedObject",
      "@K[211]": "The object from which we are retrieving damage info"
    }
  },
  "@K[203]": "Returns the player index of whoever last damaged the object"
}
```

</details>

## GameScript.Game.Death.IsBloodEnabled

```lua
GameScript.Game.Death.IsBloodEnabled()
```

Источник: [Lua, строка 1914](../../luasense_decompiled.lua#L1914). Имена `argN` — placeholders реконструкции.

Returns whether blood is enabled in the current game, as determined by the active player profiles.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns whether blood is enabled in the current game, as determined by the active player profiles."
}
```

</details>

## GameScript.Game.Death.IsDamagePinning

```lua
GameScript.Game.Death.IsDamagePinning(arg1)
```

Источник: [Lua, строка 1917](../../luasense_decompiled.lua#L1917). Имена `argN` — placeholders реконструкции.

Returns whether specific damage (as returned by GetLastDamageInfo) was pinning damage.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DamageInfo | The damage info to check, as returned by GetLastDamageInfo |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DamageInfo",
      "@K[211]": "The damage info to check, as returned by GetLastDamageInfo"
    }
  },
  "@K[203]": "Returns whether specific damage (as returned by GetLastDamageInfo) was pinning damage."
}
```

</details>

## GameScript.Game.Death.IsGoreEnabled

```lua
GameScript.Game.Death.IsGoreEnabled()
```

Источник: [Lua, строка 1920](../../luasense_decompiled.lua#L1920). Имена `argN` — placeholders реконструкции.

Returns whether gore is enabled in the current game, as determined by the active player profiles.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns whether gore is enabled in the current game, as determined by the active player profiles."
}
```

</details>

## GameScript.Game.Death.SetDeathChoreographerSequence

```lua
GameScript.Game.Death.SetDeathChoreographerSequence(arg1)
```

Источник: [Lua, строка 1923](../../luasense_decompiled.lua#L1923). Имена `argN` — placeholders реконструкции.

Instructs the death choreographer for the script's component to use the specified death death sequence. If a Death Choreographer Component is not available in the object, then a red screen will occur.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | SequenceName | The name of the death sequence to select |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "SequenceName",
      "@K[211]": "The name of the death sequence to select"
    }
  },
  "@K[203]": "Instructs the death choreographer for the script's component to use the specified death death sequence. If a Death Choreographer Component is not available in the object, then a red screen will occur."
}
```

</details>
