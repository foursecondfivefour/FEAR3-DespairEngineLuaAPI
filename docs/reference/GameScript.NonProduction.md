# GameScript.NonProduction

[Индекс](../API.md)

## GameScript.NonProduction.GetFrameNumber

```lua
GameScript.NonProduction.GetFrameNumber()
```

Источник: [Lua, строка 2989](../../luasense_decompiled.lua#L2989). Имена `argN` — placeholders реконструкции.

Return the current frame number for game

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return the current frame number for game"
}
```

</details>

## GameScript.NonProduction.GetObjectInReticle

```lua
GameScript.NonProduction.GetObjectInReticle()
```

Источник: [Lua, строка 2992](../../luasense_decompiled.lua#L2992). Имена `argN` — placeholders реконструкции.

Return a handle for the object that is currently in the main player's reticle

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return a handle for the object that is currently in the main player's reticle"
}
```

</details>

## GameScript.NonProduction.GetPhysicsObjectsInBox

```lua
GameScript.NonProduction.GetPhysicsObjectsInBox(arg1, arg2)
```

Источник: [Lua, строка 2995](../../luasense_decompiled.lua#L2995). Имена `argN` — placeholders реконструкции.

Grab a list of all the physics objects that are currently in the world and have part of their bounding volumes within the box formed from the min and max corner positions

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MinCorner | A table with x,y,z that is the position of the minX,Y,Z for the box |
| 2.0 | MaxCorner | A table with x,y,z that is the position of the maxX,Y,Z for the box |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MinCorner",
      "@K[211]": "A table with x,y,z that is the position of the minX,Y,Z for the box"
    },
    "2.0": {
      "@K[209]": "MaxCorner",
      "@K[211]": "A table with x,y,z that is the position of the maxX,Y,Z for the box"
    }
  },
  "@K[203]": "Grab a list of all the physics objects that are currently in the world and have part of their bounding volumes within the box formed from the min and max corner positions"
}
```

</details>

## GameScript.NonProduction.SetLookRot

```lua
GameScript.NonProduction.SetLookRot(arg1)
```

Источник: [Lua, строка 2998](../../luasense_decompiled.lua#L2998). Имена `argN` — placeholders реконструкции.

If the object has a LookRotation component, it will be set to the roll, pitch, heading argument

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TargetRotation | A table that contains the roll, pitch, heading in the r,p,h fields |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TargetRotation",
      "@K[211]": "A table that contains the roll, pitch, heading in the r,p,h fields"
    }
  },
  "@K[203]": "If the object has a LookRotation component, it will be set to the roll, pitch, heading argument"
}
```

</details>

## GameScript.NonProduction.TransferPlayerControl

```lua
GameScript.NonProduction.TransferPlayerControl(arg1, arg2)
```

Источник: [Lua, строка 3001](../../luasense_decompiled.lua#L3001). Имена `argN` — placeholders реконструкции.

Transfers player control from one object to another.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FromObject | The game object that currently has player control |
| 2.0 | ToObject | The game object that will receive player control |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FromObject",
      "@K[211]": "The game object that currently has player control"
    },
    "2.0": {
      "@K[209]": "ToObject",
      "@K[211]": "The game object that will receive player control"
    }
  },
  "@K[203]": "Transfers player control from one object to another."
}
```

</details>
