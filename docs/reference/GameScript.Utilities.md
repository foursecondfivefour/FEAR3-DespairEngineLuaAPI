# GameScript.Utilities

[Индекс](../API.md)

## GameScript.Utilities.CastRay

```lua
GameScript.Utilities.CastRay(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 3154](../../luasense_decompiled.lua#L3154). Имена `argN` — placeholders реконструкции.

Casts a ray from one point to another, and returns a table with the normal and distance to the first object, if any, that is hit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | StartPos | StartPos is a vector for where the ray starts.<br> |
| 2.0 | CastDirection | CastDirection is a vector that indicates the direction to cast the ray.(table with x,y,z)<br> |
| 3.0 | RayInputParameters | RayInputParameters is a table that contains a variety of options.<br>Note that is any of these parameters are missing, the default will be used, for instance distance will be zero<br>"dist" is the length of ray cast (in meters).<br>"collisGroup" Which collision group definition does the ray use for instance is "small debris", would only collide with environment<br>"checkProxies" Whether we want to check for detailed proxy collisions such as the limbs of a human, or just the bounding capsule<br> |
| 4.0 | RayOutput | The results of the cast is a table with fields:<br>"hasHit" bool for whether or not anything was hit<br>"object" handle to the object the ray hit.<br>"distanceToCollision" Distance from the start before collision occurred.<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "StartPos",
      "@K[211]": "StartPos is a vector for where the ray starts.\n"
    },
    "2.0": {
      "@K[209]": "CastDirection",
      "@K[211]": "CastDirection is a vector that indicates the direction to cast the ray.(table with x,y,z)\n"
    },
    "3.0": {
      "@K[209]": "RayInputParameters",
      "@K[211]": "RayInputParameters is a table that contains a variety of options.\nNote that is any of these parameters are missing, the default will be used, for instance distance will be zero\n\"dist\" is the length of ray cast (in meters).\n\"collisGroup\" Which collision group definition does the ray use for instance is \"small debris\", would only collide with environment\n\"checkProxies\" Whether we want to check for detailed proxy collisions such as the limbs of a human, or just the bounding capsule\n"
    },
    "4.0": {
      "@K[209]": "RayOutput",
      "@K[211]": "The results of the cast is a table with fields:\n\"hasHit\" bool for whether or not anything was hit\n\"object\" handle to the object the ray hit.\n\"distanceToCollision\" Distance from the start before collision occurred.\n"
    }
  },
  "@K[203]": "Casts a ray from one point to another, and returns a table with the normal and distance to the first object, if any, that is hit."
}
```

</details>

## GameScript.Utilities.DoesRayCollide

```lua
GameScript.Utilities.DoesRayCollide(arg1, arg2, arg3)
```

Источник: [Lua, строка 3157](../../luasense_decompiled.lua#L3157). Имена `argN` — placeholders реконструкции.

Casts a ray from one point to another, and returns true if it hit something

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | StartPos | StartPos is a vector for where the ray starts.<br> |
| 2.0 | CastDirection | CastDirection is a vector that indicates the direction to cast the ray.(table with x,y,z)<br> |
| 3.0 | RayInputParameters | RayInputParameters is a table that contains a variety of options.<br>Note that is any of these parameters are missing, the default will be used, for instance distance will be zero<br>"dist" is the length of ray cast (in meters).<br>"collisGroup" Which collision group definition does the ray use for instance is "small debris", would only collide with environment<br>"checkProxies" Whether we want to check for detailed proxy collisions such as the limbs of a human, or just the bounding capsule<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "StartPos",
      "@K[211]": "StartPos is a vector for where the ray starts.\n"
    },
    "2.0": {
      "@K[209]": "CastDirection",
      "@K[211]": "CastDirection is a vector that indicates the direction to cast the ray.(table with x,y,z)\n"
    },
    "3.0": {
      "@K[209]": "RayInputParameters",
      "@K[211]": "RayInputParameters is a table that contains a variety of options.\nNote that is any of these parameters are missing, the default will be used, for instance distance will be zero\n\"dist\" is the length of ray cast (in meters).\n\"collisGroup\" Which collision group definition does the ray use for instance is \"small debris\", would only collide with environment\n\"checkProxies\" Whether we want to check for detailed proxy collisions such as the limbs of a human, or just the bounding capsule\n"
    }
  },
  "@K[203]": "Casts a ray from one point to another, and returns true if it hit something"
}
```

</details>

## GameScript.Utilities.GenerateRandomSeed

```lua
GameScript.Utilities.GenerateRandomSeed()
```

Источник: [Lua, строка 3160](../../luasense_decompiled.lua#L3160). Имена `argN` — placeholders реконструкции.

Generate a new random seed value)

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Generate a new random seed value)"
}
```

</details>

## GameScript.Utilities.GetDistanceBetweenObjects

```lua
GameScript.Utilities.GetDistanceBetweenObjects(arg1, arg2)
```

Источник: [Lua, строка 3163](../../luasense_decompiled.lua#L3163). Имена `argN` — placeholders реконструкции.

Returns distance in meters, returns extremely large number is either object does not have a position(no PosRot or doesn't exist).

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject1 | One of two empireObjects for which we are checking the distance between. |
| 2.0 | EmpireObject2 | The second of two empireObjects for which we are checking the distance between. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject1",
      "@K[211]": "One of two empireObjects for which we are checking the distance between."
    },
    "2.0": {
      "@K[209]": "EmpireObject2",
      "@K[211]": "The second of two empireObjects for which we are checking the distance between."
    }
  },
  "@K[203]": "Returns distance in meters, returns extremely large number is either object does not have a position(no PosRot or doesn't exist)."
}
```

</details>

## GameScript.Utilities.GetGlobalDataObject

```lua
GameScript.Utilities.GetGlobalDataObject()
```

Источник: [Lua, строка 3166](../../luasense_decompiled.lua#L3166). Имена `argN` — placeholders реконструкции.

Get a handle to the global data object which can be useful for listening to messages such as GameScript.MsgCallback.PlayerRegistrationMessage

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Get a handle to the global data object which can be useful for listening to messages such as GameScript.MsgCallback.PlayerRegistrationMessage"
}
```

</details>

## GameScript.Utilities.GetRandomInteger

```lua
GameScript.Utilities.GetRandomInteger(arg1, arg2)
```

Источник: [Lua, строка 3169](../../luasense_decompiled.lua#L3169). Имена `argN` — placeholders реконструкции.

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

## GameScript.Utilities.GetRandomPercent

```lua
GameScript.Utilities.GetRandomPercent()
```

Источник: [Lua, строка 3172](../../luasense_decompiled.lua#L3172). Имена `argN` — placeholders реконструкции.

Return a random number from 0.0 to 1.0(range includes both 0 and 1)

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return a random number from 0.0 to 1.0(range includes both 0 and 1)"
}
```

</details>

## GameScript.Utilities.GetRayCollisionDistance

```lua
GameScript.Utilities.GetRayCollisionDistance(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 3175](../../luasense_decompiled.lua#L3175). Имена `argN` — placeholders реконструкции.

Casts a ray from one point to another, and returns a table with the distance to the first object, if any, that is hit.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | StartPos | StartPos is a vector for where the ray starts.<br> |
| 2.0 | CastDirection | CastDirection is a vector that indicates the direction to cast the ray.(table with x,y,z)<br> |
| 3.0 | RayInputParameters | RayInputParameters is a table that contains a variety of options.<br>Note that is any of these parameters are missing, the default will be used, for instance distance will be zero<br>"dist" is the length of ray cast (in meters).<br>"collisGroup" Which collision group definition does the ray use for instance is "small debris", would only collide with environment<br>"checkProxies" Whether we want to check for detailed proxy collisions such as the limbs of a human, or just the bounding capsule<br> |
| 4.0 | RayDistanceOutput | The results of the cast is a table with fields:<br>"hasHit" bool for whether or not anything was hit<br>"distanceToCollision" Distance from the start before collision occurred.<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "StartPos",
      "@K[211]": "StartPos is a vector for where the ray starts.\n"
    },
    "2.0": {
      "@K[209]": "CastDirection",
      "@K[211]": "CastDirection is a vector that indicates the direction to cast the ray.(table with x,y,z)\n"
    },
    "3.0": {
      "@K[209]": "RayInputParameters",
      "@K[211]": "RayInputParameters is a table that contains a variety of options.\nNote that is any of these parameters are missing, the default will be used, for instance distance will be zero\n\"dist\" is the length of ray cast (in meters).\n\"collisGroup\" Which collision group definition does the ray use for instance is \"small debris\", would only collide with environment\n\"checkProxies\" Whether we want to check for detailed proxy collisions such as the limbs of a human, or just the bounding capsule\n"
    },
    "4.0": {
      "@K[209]": "RayDistanceOutput",
      "@K[211]": "The results of the cast is a table with fields:\n\"hasHit\" bool for whether or not anything was hit\n\"distanceToCollision\" Distance from the start before collision occurred.\n"
    }
  },
  "@K[203]": "Casts a ray from one point to another, and returns a table with the distance to the first object, if any, that is hit."
}
```

</details>

## GameScript.Utilities.GetTextIDString

```lua
GameScript.Utilities.GetTextIDString(arg1)
```

Источник: [Lua, строка 3178](../../luasense_decompiled.lua#L3178). Имена `argN` — placeholders реконструкции.

Get the string for the passed in Text ID.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TextID | The text ID of the string to get. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TextID",
      "@K[211]": "The text ID of the string to get."
    }
  },
  "@K[203]": "Get the string for the passed in Text ID."
}
```

</details>
