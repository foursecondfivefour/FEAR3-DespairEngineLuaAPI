# GameScript.Game.Regions

[Индекс](../API.md)

## GameScript.Game.Regions.DistanceToEnd

```lua
GameScript.Game.Regions.DistanceToEnd(arg1, arg2, arg3)
```

Источник: [Lua, строка 2743](../../luasense_decompiled.lua#L2743). Имена `argN` — placeholders реконструкции.

Return distance from "TestObject" to the end plane of "TestRegion".  Currently only valid for box regions.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | RegionObject | Region to test against |
| 2.0 | TestObject | Object to calculate distance |
| 3.0 | Relative | If true the return value is 0-1 relative to the length of the region. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "RegionObject",
      "@K[211]": "Region to test against"
    },
    "2.0": {
      "@K[209]": "TestObject",
      "@K[211]": "Object to calculate distance"
    },
    "3.0": {
      "@K[209]": "Relative",
      "@K[211]": "If true the return value is 0-1 relative to the length of the region."
    }
  },
  "@K[203]": "Return distance from \"TestObject\" to the end plane of \"TestRegion\".  Currently only valid for box regions."
}
```

</details>

## GameScript.Game.Regions.GetNumberOfObjectsInRegionMonitor

```lua
GameScript.Game.Regions.GetNumberOfObjectsInRegionMonitor(arg1)
```

Источник: [Lua, строка 2746](../../luasense_decompiled.lua#L2746). Имена `argN` — placeholders реконструкции.

Return number of specified objects in region monitored by component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | RegionMonitorObject | The object containing the region monitor to test |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "RegionMonitorObject",
      "@K[211]": "The object containing the region monitor to test"
    }
  },
  "@K[203]": "Return number of specified objects in region monitored by component."
}
```

</details>

## GameScript.Game.Regions.GetObjectsInRegion

```lua
GameScript.Game.Regions.GetObjectsInRegion(arg1)
```

Источник: [Lua, строка 2749](../../luasense_decompiled.lua#L2749). Имена `argN` — placeholders реконструкции.

Return a list of objects in a region

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The region for which we are checking contents |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The region for which we are checking contents"
    }
  },
  "@K[203]": "Return a list of objects in a region"
}
```

</details>

## GameScript.Game.Regions.GetObjectsInRegionWithTag

```lua
GameScript.Game.Regions.GetObjectsInRegionWithTag(arg1, arg2)
```

Источник: [Lua, строка 2752](../../luasense_decompiled.lua#L2752). Имена `argN` — placeholders реконструкции.

Return a list of objects in a region with a particular tag

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The region for which we are checking contents |
| 2.0 | ObjectTag | The tag that for which we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The region for which we are checking contents"
    },
    "2.0": {
      "@K[209]": "ObjectTag",
      "@K[211]": "The tag that for which we are checking"
    }
  },
  "@K[203]": "Return a list of objects in a region with a particular tag"
}
```

</details>

## GameScript.Game.Regions.GetRegionInfo

```lua
GameScript.Game.Regions.GetRegionInfo(arg1)
```

Источник: [Lua, строка 2755](../../luasense_decompiled.lua#L2755). Имена `argN` — placeholders реконструкции.

Return a table containing info on a region if the object has a region component. There is a type that matches the enum in GameScript.RegionType, GameScript.RegionType.Box or .Sphere or .Cylinder. Then based on the type you know to check regionInfo.height or .width or .depth or .radius

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object for which we are requesting region info |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object for which we are requesting region info"
    }
  },
  "@K[203]": "Return a table containing info on a region if the object has a region component. There is a type that matches the enum in GameScript.RegionType, GameScript.RegionType.Box or .Sphere or .Cylinder. Then based on the type you know to check regionInfo.height or .width or .depth or .radius"
}
```

</details>

## GameScript.Game.Regions.IsBoneInRegion

```lua
GameScript.Game.Regions.IsBoneInRegion(arg1, arg2, arg3)
```

Источник: [Lua, строка 2758](../../luasense_decompiled.lua#L2758). Имена `argN` — placeholders реконструкции.

Returns true or false based on whether the bone specified inside TestObject is inside region of the RegionObject. This is the slowest region test.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TestObject | The object we are testing |
| 2.0 | BoneName | The name of the bone inside the object |
| 3.0 | RegionObject | The region in question |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TestObject",
      "@K[211]": "The object we are testing"
    },
    "2.0": {
      "@K[209]": "BoneName",
      "@K[211]": "The name of the bone inside the object"
    },
    "3.0": {
      "@K[209]": "RegionObject",
      "@K[211]": "The region in question"
    }
  },
  "@K[203]": "Returns true or false based on whether the bone specified inside TestObject is inside region of the RegionObject. This is the slowest region test."
}
```

</details>

## GameScript.Game.Regions.IsCenterOfMassInRegion

```lua
GameScript.Game.Regions.IsCenterOfMassInRegion(arg1, arg2)
```

Источник: [Lua, строка 2761](../../luasense_decompiled.lua#L2761). Имена `argN` — placeholders реконструкции.

Returns true or false based on whether the TestObject's center-of-mass is inside region of the RegionObject. This is one of the slower region tests.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TestObject | The object we are testing |
| 2.0 | RegionObject | The region in question |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TestObject",
      "@K[211]": "The object we are testing"
    },
    "2.0": {
      "@K[209]": "RegionObject",
      "@K[211]": "The region in question"
    }
  },
  "@K[203]": "Returns true or false based on whether the TestObject's center-of-mass is inside region of the RegionObject. This is one of the slower region tests."
}
```

</details>

## GameScript.Game.Regions.IsInRegion

```lua
GameScript.Game.Regions.IsInRegion(arg1, arg2)
```

Источник: [Lua, строка 2764](../../luasense_decompiled.lua#L2764). Имена `argN` — placeholders реконструкции.

Return whether "TestObject" is in "TestRegion".

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | RegionObject | The region to test against |
| 2.0 | TestObject | The object to test against the region |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "RegionObject",
      "@K[211]": "The region to test against"
    },
    "2.0": {
      "@K[209]": "TestObject",
      "@K[211]": "The object to test against the region"
    }
  },
  "@K[203]": "Return whether \"TestObject\" is in \"TestRegion\"."
}
```

</details>
