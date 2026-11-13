# GameScript.Game.AI

[Индекс](../API.md)

## GameScript.Game.AI.AssignExternalAIOrder

```lua
GameScript.Game.AI.AssignExternalAIOrder(arg1, arg2)
```

Источник: [Lua, строка 1758](../../luasense_decompiled.lua#L1758). Имена `argN` — placeholders реконструкции.

Assigns an AI Order from an object to an AI or Squad

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | OrderObject | The empireObject containing the order to be assigned |
| 2.0 | AssigneeObject | The AI or Squad that receives the order |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "OrderObject",
      "@K[211]": "The empireObject containing the order to be assigned"
    },
    "2.0": {
      "@K[209]": "AssigneeObject",
      "@K[211]": "The AI or Squad that receives the order"
    }
  },
  "@K[203]": "Assigns an AI Order from an object to an AI or Squad"
}
```

</details>

## GameScript.Game.AI.EnableAIObject

```lua
GameScript.Game.AI.EnableAIObject(arg1, arg2)
```

Источник: [Lua, строка 1761](../../luasense_decompiled.lua#L1761). Имена `argN` — placeholders реконструкции.

Enables or disables the AI component within the specified object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | AI | The specific AI object we are enabling/disabling |
| 2.0 | bEnable | Whether we are enabling (1) or disabling (0) the AI |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "AI",
      "@K[211]": "The specific AI object we are enabling/disabling"
    },
    "2.0": {
      "@K[209]": "bEnable",
      "@K[211]": "Whether we are enabling (1) or disabling (0) the AI"
    }
  },
  "@K[203]": "Enables or disables the AI component within the specified object"
}
```

</details>

## GameScript.Game.AI.EnableNodeMapInRegion

```lua
GameScript.Game.AI.EnableNodeMapInRegion(arg1, arg2, arg3)
```

Источник: [Lua, строка 1764](../../luasense_decompiled.lua#L1764). Имена `argN` — placeholders реконструкции.

Enables or disables the specified node map

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | NodeMapName | The specific node map name name we are enabling/disabling |
| 2.0 | EmpireObject | The region to enable/disable nodes in |
| 3.0 | bEnable | Whether we are enabling (1) or disabling (0) the node map |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "NodeMapName",
      "@K[211]": "The specific node map name name we are enabling/disabling"
    },
    "2.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The region to enable/disable nodes in"
    },
    "3.0": {
      "@K[209]": "bEnable",
      "@K[211]": "Whether we are enabling (1) or disabling (0) the node map"
    }
  },
  "@K[203]": "Enables or disables the specified node map"
}
```

</details>

## GameScript.Game.AI.EnableNodesInRegion

```lua
GameScript.Game.AI.EnableNodesInRegion(arg1, arg2, arg3)
```

Источник: [Lua, строка 1767](../../luasense_decompiled.lua#L1767). Имена `argN` — placeholders реконструкции.

Enables or disables nodes in the specified node map

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | NodeMapEmpireObject | The ai node map to enable/disable nodes |
| 2.0 | RegionObject | The region to enable/disable nodes in |
| 3.0 | bEnable | Whether we are enabling (true) or disabling (false) the nodes |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "NodeMapEmpireObject",
      "@K[211]": "The ai node map to enable/disable nodes"
    },
    "2.0": {
      "@K[209]": "RegionObject",
      "@K[211]": "The region to enable/disable nodes in"
    },
    "3.0": {
      "@K[209]": "bEnable",
      "@K[211]": "Whether we are enabling (true) or disabling (false) the nodes"
    }
  },
  "@K[203]": "Enables or disables nodes in the specified node map"
}
```

</details>

## GameScript.Game.AI.EnableSmartMapsInRegion

```lua
GameScript.Game.AI.EnableSmartMapsInRegion(arg1, arg2)
```

Источник: [Lua, строка 1770](../../luasense_decompiled.lua#L1770). Имена `argN` — placeholders реконструкции.

Enables or disables all smart nodes in the specified region

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | RegionObject | The region to enable/disable nodes in |
| 2.0 | bEnable | Whether we are enabling (true) or disabling (false) the nodes |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "RegionObject",
      "@K[211]": "The region to enable/disable nodes in"
    },
    "2.0": {
      "@K[209]": "bEnable",
      "@K[211]": "Whether we are enabling (true) or disabling (false) the nodes"
    }
  },
  "@K[203]": "Enables or disables all smart nodes in the specified region"
}
```

</details>

## GameScript.Game.AI.GetAIIdentityType

```lua
GameScript.Game.AI.GetAIIdentityType(arg1)
```

Источник: [Lua, строка 1773](../../luasense_decompiled.lua#L1773). Имена `argN` — placeholders реконструкции.

Returns the AIIdentityType of the passed in object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The EmpireObject of the AI |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The EmpireObject of the AI"
    }
  },
  "@K[203]": "Returns the AIIdentityType of the passed in object"
}
```

</details>

## GameScript.Game.AI.GetAITargetInfo

```lua
GameScript.Game.AI.GetAITargetInfo(arg1)
```

Источник: [Lua, строка 1776](../../luasense_decompiled.lua#L1776). Имена `argN` — placeholders реконструкции.

Returns AITarget information

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Object | The empireObject of the AI |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Object",
      "@K[211]": "The empireObject of the AI"
    }
  },
  "@K[203]": "Returns AITarget information"
}
```

</details>

## GameScript.Game.AI.GetDistanceToClosestEnemy

```lua
GameScript.Game.AI.GetDistanceToClosestEnemy(arg1)
```

Источник: [Lua, строка 1779](../../luasense_decompiled.lua#L1779). Имена `argN` — placeholders реконструкции.

Returns the distance to enemy closest to the passed-in object. The object requires Nation and Pos/Rot Components.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The Empire Object whose enemies we are getting the distance to. Requires a Nation Component. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The Empire Object whose enemies we are getting the distance to. Requires a Nation Component."
    }
  },
  "@K[203]": "Returns the distance to enemy closest to the passed-in object. The object requires Nation and Pos/Rot Components."
}
```

</details>

## GameScript.Game.AI.InhibitPossession

```lua
GameScript.Game.AI.InhibitPossession(arg1, arg2)
```

Источник: [Lua, строка 1782](../../luasense_decompiled.lua#L1782). Имена `argN` — placeholders реконструкции.

AI is prevented from being possessed when bInhibit is true

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The EmpireObject of the AI |
| 2.0 | bInhibit | Whether possession should be inhibited |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The EmpireObject of the AI"
    },
    "2.0": {
      "@K[209]": "bInhibit",
      "@K[211]": "Whether possession should be inhibited"
    }
  },
  "@K[203]": "AI is prevented from being possessed when bInhibit is true"
}
```

</details>

## GameScript.Game.AI.IsAIControlled

```lua
GameScript.Game.AI.IsAIControlled(arg1)
```

Источник: [Lua, строка 1785](../../luasense_decompiled.lua#L1785). Имена `argN` — placeholders реконструкции.

Return if the object is currently being controlled by the ai.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are checking if ai controlled |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are checking if ai controlled"
    }
  },
  "@K[203]": "Return if the object is currently being controlled by the ai."
}
```

</details>
