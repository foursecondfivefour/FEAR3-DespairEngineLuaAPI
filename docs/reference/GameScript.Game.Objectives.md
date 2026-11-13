# GameScript.Game.Objectives

[Индекс](../API.md)

## GameScript.Game.Objectives.Add

```lua
GameScript.Game.Objectives.Add(arg1, arg2)
```

Источник: [Lua, строка 2413](../../luasense_decompiled.lua#L2413). Имена `argN` — placeholders реконструкции.

Adds an objective identified by the given <type, text ID> pair

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ObjectiveType | The type of objective, forms one half an objective's unique identifier |
| 2.0 | ObjectiveTextID | The text ID description of the objective, forms the other half of an objective's unique identifier |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ObjectiveType",
      "@K[211]": "The type of objective, forms one half an objective's unique identifier"
    },
    "2.0": {
      "@K[209]": "ObjectiveTextID",
      "@K[211]": "The text ID description of the objective, forms the other half of an objective's unique identifier"
    }
  },
  "@K[203]": "Adds an objective identified by the given <type, text ID> pair"
}
```

</details>

## GameScript.Game.Objectives.AddObject

```lua
GameScript.Game.Objectives.AddObject(arg1, arg2, arg3)
```

Источник: [Lua, строка 2416](../../luasense_decompiled.lua#L2416). Имена `argN` — placeholders реконструкции.

Finds the objective identified by the given <type, text ID> pair and adds the specified object to its object list

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to be added as an objective |
| 2.0 | ObjectiveType | The type of objective, forms one half an objective's unique identifier |
| 3.0 | ObjectiveTextID | The text ID description of the objective, forms the other half of an objective's unique identifier |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to be added as an objective"
    },
    "2.0": {
      "@K[209]": "ObjectiveType",
      "@K[211]": "The type of objective, forms one half an objective's unique identifier"
    },
    "3.0": {
      "@K[209]": "ObjectiveTextID",
      "@K[211]": "The text ID description of the objective, forms the other half of an objective's unique identifier"
    }
  },
  "@K[203]": "Finds the objective identified by the given <type, text ID> pair and adds the specified object to its object list"
}
```

</details>

## GameScript.Game.Objectives.GetStatus

```lua
GameScript.Game.Objectives.GetStatus(arg1, arg2)
```

Источник: [Lua, строка 2419](../../luasense_decompiled.lua#L2419). Имена `argN` — placeholders реконструкции.

Returns the status of the objective identified by the given <type, text ID> pair (ObjectiveStatus.Active, ObjectiveStatus.Inactive, ObjectiveStatus.Completed, ObjectiveStatus.Failed)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ObjectiveType | The type of objective, forms one half an objective's unique identifier (ObjectiveType.kWaypoint, ObjectiveType.Destroy, ObjectiveType.kProtect, ObjectiveType.kVIP, ObjectiveType.kTextOnly) |
| 2.0 | ObjectiveTextID | The text ID description of the objective, forms the other half of an objective's unique identifier |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ObjectiveType",
      "@K[211]": "The type of objective, forms one half an objective's unique identifier (ObjectiveType.kWaypoint, ObjectiveType.Destroy, ObjectiveType.kProtect, ObjectiveType.kVIP, ObjectiveType.kTextOnly)"
    },
    "2.0": {
      "@K[209]": "ObjectiveTextID",
      "@K[211]": "The text ID description of the objective, forms the other half of an objective's unique identifier"
    }
  },
  "@K[203]": "Returns the status of the objective identified by the given <type, text ID> pair (ObjectiveStatus.Active, ObjectiveStatus.Inactive, ObjectiveStatus.Completed, ObjectiveStatus.Failed)"
}
```

</details>

## GameScript.Game.Objectives.Remove

```lua
GameScript.Game.Objectives.Remove(arg1, arg2)
```

Источник: [Lua, строка 2422](../../luasense_decompiled.lua#L2422). Имена `argN` — placeholders реконструкции.

Removes the objective identified by the given <type, text ID> pair

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ObjectiveType | The type of objective, forms one half an objective's unique identifier |
| 2.0 | ObjectiveTextID | The text ID description of the objective, forms the other half of an objective's unique identifier |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ObjectiveType",
      "@K[211]": "The type of objective, forms one half an objective's unique identifier"
    },
    "2.0": {
      "@K[209]": "ObjectiveTextID",
      "@K[211]": "The text ID description of the objective, forms the other half of an objective's unique identifier"
    }
  },
  "@K[203]": "Removes the objective identified by the given <type, text ID> pair"
}
```

</details>

## GameScript.Game.Objectives.RemoveObject

```lua
GameScript.Game.Objectives.RemoveObject(arg1, arg2, arg3)
```

Источник: [Lua, строка 2425](../../luasense_decompiled.lua#L2425). Имена `argN` — placeholders реконструкции.

Finds the objective identified by the given <type, text ID> pair and removes the specified object from its object list

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to be removed from the objective |
| 2.0 | ObjectiveType | The type of objective, forms one half an objective's unique identifier |
| 3.0 | ObjectiveTextID | The text ID description of the objective, forms the other half of an objective's unique identifier |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to be removed from the objective"
    },
    "2.0": {
      "@K[209]": "ObjectiveType",
      "@K[211]": "The type of objective, forms one half an objective's unique identifier"
    },
    "3.0": {
      "@K[209]": "ObjectiveTextID",
      "@K[211]": "The text ID description of the objective, forms the other half of an objective's unique identifier"
    }
  },
  "@K[203]": "Finds the objective identified by the given <type, text ID> pair and removes the specified object from its object list"
}
```

</details>

## GameScript.Game.Objectives.SetStatus

```lua
GameScript.Game.Objectives.SetStatus(arg1, arg2, arg3)
```

Источник: [Lua, строка 2428](../../luasense_decompiled.lua#L2428). Имена `argN` — placeholders реконструкции.

Sets the status of the objective identified by the given <type, text ID> pair

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ObjectiveType | The type of objective, forms one half an objective's unique identifier |
| 2.0 | ObjectiveTextID | The text ID description of the objective, forms the other half of an objective's unique identifier |
| 3.0 | ObjectiveStatus | The objective's new status (0 = Active, 1 = Inactive, 2 = Completed, 3 = Failed) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ObjectiveType",
      "@K[211]": "The type of objective, forms one half an objective's unique identifier"
    },
    "2.0": {
      "@K[209]": "ObjectiveTextID",
      "@K[211]": "The text ID description of the objective, forms the other half of an objective's unique identifier"
    },
    "3.0": {
      "@K[209]": "ObjectiveStatus",
      "@K[211]": "The objective's new status (0 = Active, 1 = Inactive, 2 = Completed, 3 = Failed)"
    }
  },
  "@K[203]": "Sets the status of the objective identified by the given <type, text ID> pair"
}
```

</details>
