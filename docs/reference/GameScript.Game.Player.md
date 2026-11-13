# GameScript.Game.Player

[Индекс](../API.md)

## GameScript.Game.Player.AreAllPlayersInState

```lua
GameScript.Game.Player.AreAllPlayersInState(arg1)
```

Источник: [Lua, строка 2569](../../luasense_decompiled.lua#L2569). Имена `argN` — placeholders реконструкции.

Checks to see if all players are in a particular state

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | State | Global state index that is being checked against |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "State",
      "@K[211]": "Global state index that is being checked against"
    }
  },
  "@K[203]": "Checks to see if all players are in a particular state"
}
```

</details>

## GameScript.Game.Player.CanPlayerPossess

```lua
GameScript.Game.Player.CanPlayerPossess(arg1)
```

Источник: [Lua, строка 2572](../../luasense_decompiled.lua#L2572). Имена `argN` — placeholders реконструкции.

Will return true when the component is uninhibited from initiating a possession attempt by its watch variable list, by being Object State disabled, or because already engaging in possession

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the possessing player. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the possessing player."
    }
  },
  "@K[203]": "Will return true when the component is uninhibited from initiating a possession attempt by its watch variable list, by being Object State disabled, or because already engaging in possession"
}
```

</details>

## GameScript.Game.Player.ClearTetherBreadcrumbs

```lua
GameScript.Game.Player.ClearTetherBreadcrumbs(arg1)
```

Источник: [Lua, строка 2575](../../luasense_decompiled.lua#L2575). Имена `argN` — placeholders реконструкции.

Marks all existing tether breadcrumbs as invalid.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player containing a Tether Anchor component. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player containing a Tether Anchor component."
    }
  },
  "@K[203]": "Marks all existing tether breadcrumbs as invalid."
}
```

</details>

## GameScript.Game.Player.ClearTetherSafeRadiusOverride

```lua
GameScript.Game.Player.ClearTetherSafeRadiusOverride(arg1)
```

Источник: [Lua, строка 2578](../../luasense_decompiled.lua#L2578). Имена `argN` — placeholders реконструкции.

Clears out any previous calls to "SetTEtherSafeRadiusOverride"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player being tethered. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player being tethered."
    }
  },
  "@K[203]": "Clears out any previous calls to \"SetTEtherSafeRadiusOverride\""
}
```

</details>

## GameScript.Game.Player.DisableTetherSpawnTagSet

```lua
GameScript.Game.Player.DisableTetherSpawnTagSet(arg1)
```

Источник: [Lua, строка 2581](../../luasense_decompiled.lua#L2581). Имена `argN` — placeholders реконструкции.

Removes a previously enabled set of spawn tags as the current tether destination group

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | SetObject | The object containing a SetComponent, expected to have a set of player spawn tag objects. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "SetObject",
      "@K[211]": "The object containing a SetComponent, expected to have a set of player spawn tag objects."
    }
  },
  "@K[203]": "Removes a previously enabled set of spawn tags as the current tether destination group"
}
```

</details>

## GameScript.Game.Player.DoesPlayerHaveLineOfSightToPosition

```lua
GameScript.Game.Player.DoesPlayerHaveLineOfSightToPosition(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2584](../../luasense_decompiled.lua#L2584). Имена `argN` — placeholders реконструкции.

Return whether or not the player with index 'globalPlayerIndex' has line of sight to the position.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | targetPosition | The position were are checking for Line of Sight.  A Table with fields x,y,z |
| 2.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |
| 3.0 | useHeadPosition | If 'useHeadPosition' is true we do line of sight from the head, else from the base of the capsule |
| 4.0 | defaultReturn | If player doesn't exist what do youu want this function to return |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "targetPosition",
      "@K[211]": "The position were are checking for Line of Sight.  A Table with fields x,y,z"
    },
    "2.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    },
    "3.0": {
      "@K[209]": "useHeadPosition",
      "@K[211]": "If 'useHeadPosition' is true we do line of sight from the head, else from the base of the capsule"
    },
    "4.0": {
      "@K[209]": "defaultReturn",
      "@K[211]": "If player doesn't exist what do youu want this function to return"
    }
  },
  "@K[203]": "Return whether or not the player with index 'globalPlayerIndex' has line of sight to the position."
}
```

</details>

## GameScript.Game.Player.EnableTetherSpawnTagSet

```lua
GameScript.Game.Player.EnableTetherSpawnTagSet(arg1)
```

Источник: [Lua, строка 2587](../../luasense_decompiled.lua#L2587). Имена `argN` — placeholders реконструкции.

Assigns a set of spawn tags as the current tether destination group

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | SetObject | The object containing a SetComponent, expected to have a set of player spawn tag objects. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "SetObject",
      "@K[211]": "The object containing a SetComponent, expected to have a set of player spawn tag objects."
    }
  },
  "@K[203]": "Assigns a set of spawn tags as the current tether destination group"
}
```

</details>

## GameScript.Game.Player.GetAllPlayerControlledObjectsByIndex

```lua
GameScript.Game.Player.GetAllPlayerControlledObjectsByIndex(arg1)
```

Источник: [Lua, строка 2590](../../luasense_decompiled.lua#L2590). Имена `argN` — placeholders реконструкции.

Return every object controlled (directly or indirectly) by the player at the moment.  Ex: If the player is a ghost (avatar) in a body in a vehicle, all three objects will be returned.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    }
  },
  "@K[203]": "Return every object controlled (directly or indirectly) by the player at the moment.  Ex: If the player is a ghost (avatar) in a body in a vehicle, all three objects will be returned."
}
```

</details>

## GameScript.Game.Player.GetGlobalIndexFromLocalIndex

```lua
GameScript.Game.Player.GetGlobalIndexFromLocalIndex(arg1)
```

Источник: [Lua, строка 2593](../../luasense_decompiled.lua#L2593). Имена `argN` — placeholders реконструкции.

Return the global index of the local player with the given local index, will return GameScript.PlayerIndex.kNotAGlobalPlayer if the local index is invalid or unused.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | localPlayerIndex | The index of the local player whose global index we want. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "localPlayerIndex",
      "@K[211]": "The index of the local player whose global index we want."
    }
  },
  "@K[203]": "Return the global index of the local player with the given local index, will return GameScript.PlayerIndex.kNotAGlobalPlayer if the local index is invalid or unused."
}
```

</details>

## GameScript.Game.Player.GetLastTimePlayerSpawnTagUsed

```lua
GameScript.Game.Player.GetLastTimePlayerSpawnTagUsed(arg1)
```

Источник: [Lua, строка 2596](../../luasense_decompiled.lua#L2596). Имена `argN` — placeholders реконструкции.

Gets the last time that the spawn tag was used.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are getting the last time used from |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are getting the last time used from"
    }
  },
  "@K[203]": "Gets the last time that the spawn tag was used."
}
```

</details>

## GameScript.Game.Player.GetMaxPossessionTime

```lua
GameScript.Game.Player.GetMaxPossessionTime(arg1)
```

Источник: [Lua, строка 2599](../../luasense_decompiled.lua#L2599). Имена `argN` — placeholders реконструкции.

Gets the possession time for the possessed vehicle.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the possessing player. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the possessing player."
    }
  },
  "@K[203]": "Gets the possession time for the possessed vehicle."
}
```

</details>

## GameScript.Game.Player.GetNumLocalPlayers

```lua
GameScript.Game.Player.GetNumLocalPlayers()
```

Источник: [Lua, строка 2602](../../luasense_decompiled.lua#L2602). Имена `argN` — placeholders реконструкции.

Get the number of local players in the game.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Get the number of local players in the game."
}
```

</details>

## GameScript.Game.Player.GetNumPlayers

```lua
GameScript.Game.Player.GetNumPlayers()
```

Источник: [Lua, строка 2605](../../luasense_decompiled.lua#L2605). Имена `argN` — placeholders реконструкции.

Get the number of players in the game.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Get the number of players in the game."
}
```

</details>

## GameScript.Game.Player.GetPlayerAvatarObjectByIndex

```lua
GameScript.Game.Player.GetPlayerAvatarObjectByIndex(arg1)
```

Источник: [Lua, строка 2608](../../luasense_decompiled.lua#L2608). Имена `argN` — placeholders реконструкции.

Return the main avatar of the player with index 'globalPlayerIndex'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    }
  },
  "@K[203]": "Return the main avatar of the player with index 'globalPlayerIndex'."
}
```

</details>

## GameScript.Game.Player.GetPlayerAvatarPositionByIndex

```lua
GameScript.Game.Player.GetPlayerAvatarPositionByIndex(arg1)
```

Источник: [Lua, строка 2611](../../luasense_decompiled.lua#L2611). Имена `argN` — placeholders реконструкции.

Return the position of the main avatar of the player with index 'globalPlayerIndex'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The 'globalPlayerIndex' for the player |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The 'globalPlayerIndex' for the player"
    }
  },
  "@K[203]": "Return the position of the main avatar of the player with index 'globalPlayerIndex'."
}
```

</details>

## GameScript.Game.Player.GetPlayerControlledObjectByIndex

```lua
GameScript.Game.Player.GetPlayerControlledObjectByIndex(arg1)
```

Источник: [Lua, строка 2614](../../luasense_decompiled.lua#L2614). Имена `argN` — placeholders реконструкции.

Return the object currently controlled by the player with index 'globalPlayerIndex'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    }
  },
  "@K[203]": "Return the object currently controlled by the player with index 'globalPlayerIndex'."
}
```

</details>

## GameScript.Game.Player.GetPlayerDistanceToPosition

```lua
GameScript.Game.Player.GetPlayerDistanceToPosition(arg1, arg2)
```

Источник: [Lua, строка 2617](../../luasense_decompiled.lua#L2617). Имена `argN` — placeholders реконструкции.

Return distance of the player with index 'globalPlayerIndex' to the position.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |
| 2.0 | targetPosition | The position were are checking for distance.  A Table with fields x,y,z |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    },
    "2.0": {
      "@K[209]": "targetPosition",
      "@K[211]": "The position were are checking for distance.  A Table with fields x,y,z"
    }
  },
  "@K[203]": "Return distance of the player with index 'globalPlayerIndex' to the position."
}
```

</details>

## GameScript.Game.Player.GetPlayerGameComplete

```lua
GameScript.Game.Player.GetPlayerGameComplete(arg1)
```

Источник: [Lua, строка 2620](../../luasense_decompiled.lua#L2620). Имена `argN` — placeholders реконструкции.

Returns whether the player has successfully completed the game. This function only works on local players, other cases will always return false.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player we want to check. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player we want to check."
    }
  },
  "@K[203]": "Returns whether the player has successfully completed the game. This function only works on local players, other cases will always return false."
}
```

</details>

## GameScript.Game.Player.GetPlayerIndexByObject

```lua
GameScript.Game.Player.GetPlayerIndexByObject(arg1)
```

Источник: [Lua, строка 2623](../../luasense_decompiled.lua#L2623). Имена `argN` — placeholders реконструкции.

Return the player index of the object if owned by the player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are getting the global player index for |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are getting the global player index for"
    }
  },
  "@K[203]": "Return the player index of the object if owned by the player."
}
```

</details>

## GameScript.Game.Player.GetPlayerObjectByIndex

```lua
GameScript.Game.Player.GetPlayerObjectByIndex(arg1)
```

Источник: [Lua, строка 2626](../../luasense_decompiled.lua#L2626). Имена `argN` — placeholders реконструкции.

Return the player object for the player with index 'globalPlayerIndex'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    }
  },
  "@K[203]": "Return the player object for the player with index 'globalPlayerIndex'."
}
```

</details>

## GameScript.Game.Player.GetPlayerPlaneDistance

```lua
GameScript.Game.Player.GetPlayerPlaneDistance(arg1, arg2, arg3)
```

Источник: [Lua, строка 2629](../../luasense_decompiled.lua#L2629). Имена `argN` — placeholders реконструкции.

Return distance of the player with index 'globalPlayerIndex' from the plane with normal 'targetNormal' that contains the point 'targetPosition'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |
| 2.0 | targetPosition | The position were are checking for distance.  A Table with fields x,y,z |
| 3.0 | targetNormal | The normal of the plane were are checking for distance.  A Table with fields x,y,z |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    },
    "2.0": {
      "@K[209]": "targetPosition",
      "@K[211]": "The position were are checking for distance.  A Table with fields x,y,z"
    },
    "3.0": {
      "@K[209]": "targetNormal",
      "@K[211]": "The normal of the plane were are checking for distance.  A Table with fields x,y,z"
    }
  },
  "@K[203]": "Return distance of the player with index 'globalPlayerIndex' from the plane with normal 'targetNormal' that contains the point 'targetPosition'."
}
```

</details>

## GameScript.Game.Player.GetPlayerSpawnTagIndex

```lua
GameScript.Game.Player.GetPlayerSpawnTagIndex(arg1)
```

Источник: [Lua, строка 2632](../../luasense_decompiled.lua#L2632). Имена `argN` — placeholders реконструкции.

Gets the spawn tag index from an object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are getting a spawn tag index from |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are getting a spawn tag index from"
    }
  },
  "@K[203]": "Gets the spawn tag index from an object."
}
```

</details>

## GameScript.Game.Player.GetPlayerSpawnTagMaximumPlayersAllowed

```lua
GameScript.Game.Player.GetPlayerSpawnTagMaximumPlayersAllowed(arg1)
```

Источник: [Lua, строка 2635](../../luasense_decompiled.lua#L2635). Имена `argN` — placeholders реконструкции.

Gets the maximum number of players allowed to be active for this spawn tag to be used.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are getting the max players requirement from |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are getting the max players requirement from"
    }
  },
  "@K[203]": "Gets the maximum number of players allowed to be active for this spawn tag to be used."
}
```

</details>

## GameScript.Game.Player.GetPlayerSpawnTagMinimumPlayersRequired

```lua
GameScript.Game.Player.GetPlayerSpawnTagMinimumPlayersRequired(arg1)
```

Источник: [Lua, строка 2638](../../luasense_decompiled.lua#L2638). Имена `argN` — placeholders реконструкции.

Gets the minimum number of players required to be active for this spawn tag to be used.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are getting the min players requirement from |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are getting the min players requirement from"
    }
  },
  "@K[203]": "Gets the minimum number of players required to be active for this spawn tag to be used."
}
```

</details>

## GameScript.Game.Player.GetPlayerSpawnTagNationCheckPassed

```lua
GameScript.Game.Player.GetPlayerSpawnTagNationCheckPassed(arg1, arg2)
```

Источник: [Lua, строка 2641](../../luasense_decompiled.lua#L2641). Имена `argN` — placeholders реконструкции.

Returns if the global player index referenced passes the nation check criteria in the spawn tag object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global player index which we are doing a nation comparison with |
| 2.0 | EmpireObject | The empireObject which we are doing a spawn tag nation comparison to |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global player index which we are doing a nation comparison with"
    },
    "2.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are doing a spawn tag nation comparison to"
    }
  },
  "@K[203]": "Returns if the global player index referenced passes the nation check criteria in the spawn tag object."
}
```

</details>

## GameScript.Game.Player.GetPlayerSpawnTagSpawnLocation

```lua
GameScript.Game.Player.GetPlayerSpawnTagSpawnLocation(arg1)
```

Источник: [Lua, строка 2644](../../luasense_decompiled.lua#L2644). Имена `argN` — placeholders реконструкции.

Returns the location that a player will be spawned at from this spawn tag object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are getting a spawn location from |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are getting a spawn location from"
    }
  },
  "@K[203]": "Returns the location that a player will be spawned at from this spawn tag object."
}
```

</details>

## GameScript.Game.Player.GetPlayerSpawnTagSpawnRotation

```lua
GameScript.Game.Player.GetPlayerSpawnTagSpawnRotation(arg1)
```

Источник: [Lua, строка 2647](../../luasense_decompiled.lua#L2647). Имена `argN` — placeholders реконструкции.

Returns the rotation that a player will be spawned at from this spawn tag object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are getting a spawn rotation from |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are getting a spawn rotation from"
    }
  },
  "@K[203]": "Returns the rotation that a player will be spawned at from this spawn tag object."
}
```

</details>

## GameScript.Game.Player.GetPlayerSpawnTemplateIndex

```lua
GameScript.Game.Player.GetPlayerSpawnTemplateIndex(arg1)
```

Источник: [Lua, строка 2650](../../luasense_decompiled.lua#L2650). Имена `argN` — placeholders реконструкции.

Returns the index (starting from 1) in the Player Spawn Info of the current spawn template for the given player

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global player index for whose spawn template index we are getting |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global player index for whose spawn template index we are getting"
    }
  },
  "@K[203]": "Returns the index (starting from 1) in the Player Spawn Info of the current spawn template for the given player"
}
```

</details>

## GameScript.Game.Player.GetPossessingPlayerIndex

```lua
GameScript.Game.Player.GetPossessingPlayerIndex(arg1)
```

Источник: [Lua, строка 2653](../../luasense_decompiled.lua#L2653). Имена `argN` — placeholders реконструкции.

Return the player index of the player possessing the object if possessed by a player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are getting the possing player global player index for |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are getting the possing player global player index for"
    }
  },
  "@K[203]": "Return the player index of the player possessing the object if possessed by a player."
}
```

</details>

## GameScript.Game.Player.GetPossessionDelay

```lua
GameScript.Game.Player.GetPossessionDelay(arg1)
```

Источник: [Lua, строка 2656](../../luasense_decompiled.lua#L2656). Имена `argN` — placeholders реконструкции.

Returns the possession delay that is set up for the possessed vehicle.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the possessing player. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the possessing player."
    }
  },
  "@K[203]": "Returns the possession delay that is set up for the possessed vehicle."
}
```

</details>

## GameScript.Game.Player.GetValidSpawnTagObjects

```lua
GameScript.Game.Player.GetValidSpawnTagObjects(arg1, arg2, arg3)
```

Источник: [Lua, строка 2659](../../luasense_decompiled.lua#L2659). Имена `argN` — placeholders реконструкции.

Gets the list of spawn tag objects that are valid for the player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global player index for which we're looking for valid spawn tags |
| 2.0 | numberOfPlayers | The number of players currently in the game |
| 3.0 | reuseExclusionDelta | How long must we wait before looking to reuse a spawn tag |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global player index for which we're looking for valid spawn tags"
    },
    "2.0": {
      "@K[209]": "numberOfPlayers",
      "@K[211]": "The number of players currently in the game"
    },
    "3.0": {
      "@K[209]": "reuseExclusionDelta",
      "@K[211]": "How long must we wait before looking to reuse a spawn tag"
    }
  },
  "@K[203]": "Gets the list of spawn tag objects that are valid for the player."
}
```

</details>

## GameScript.Game.Player.HasPlayerCollectedObject

```lua
GameScript.Game.Player.HasPlayerCollectedObject(arg1, arg2)
```

Источник: [Lua, строка 2662](../../luasense_decompiled.lua#L2662). Имена `argN` — placeholders реконструкции.

Will return true if the local player has collected the collectible object in question. This function can only ever work on local players, as we do not have that kind of profile access on remote players.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LocalPlayerIndex | The local player index of the player to check. |
| 2.0 | CollectibleID | The ID of the collectible object in question, as defined in global data |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LocalPlayerIndex",
      "@K[211]": "The local player index of the player to check."
    },
    "2.0": {
      "@K[209]": "CollectibleID",
      "@K[211]": "The ID of the collectible object in question, as defined in global data"
    }
  },
  "@K[203]": "Will return true if the local player has collected the collectible object in question. This function can only ever work on local players, as we do not have that kind of profile access on remote players."
}
```

</details>

## GameScript.Game.Player.InhibitCurrentPossessionEnding

```lua
GameScript.Game.Player.InhibitCurrentPossessionEnding(arg1, arg2)
```

Источник: [Lua, строка 2665](../../luasense_decompiled.lua#L2665). Имена `argN` — placeholders реконструкции.

Inhibits ending possession for the given player, if they are actually possessing another object at the time. This function will silently fail if the player is not currently possessing something. It is important to write scripts that pair a InhibitCurrentPossessionEnding(index, true) with a InhibitCurrentPossessionEnding(index, false).

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the possessing player. |
| 2.0 | Inhibit | Whether we are inhibiting (true) or uninhibiting (false) ending the current possession |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the possessing player."
    },
    "2.0": {
      "@K[209]": "Inhibit",
      "@K[211]": "Whether we are inhibiting (true) or uninhibiting (false) ending the current possession"
    }
  },
  "@K[203]": "Inhibits ending possession for the given player, if they are actually possessing another object at the time. This function will silently fail if the player is not currently possessing something. It is important to write scripts that pair a InhibitCurrentPossessionEnding(index, true) with a InhibitCurrentPossessionEnding(index, false)."
}
```

</details>

## GameScript.Game.Player.IsActivePlayer

```lua
GameScript.Game.Player.IsActivePlayer(arg1)
```

Источник: [Lua, строка 2668](../../luasense_decompiled.lua#L2668). Имена `argN` — placeholders реконструкции.

Return if the player is currently active in a multiplayer game.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The global player index which we are checking is active |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The global player index which we are checking is active"
    }
  },
  "@K[203]": "Return if the player is currently active in a multiplayer game."
}
```

</details>

## GameScript.Game.Player.IsLocalPlayer

```lua
GameScript.Game.Player.IsLocalPlayer(arg1)
```

Источник: [Lua, строка 2671](../../luasense_decompiled.lua#L2671). Имена `argN` — placeholders реконструкции.

Return if the object is currently being controlled on this machine locally.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The global player index which we are checking if controlled on local machine |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The global player index which we are checking if controlled on local machine"
    }
  },
  "@K[203]": "Return if the object is currently being controlled on this machine locally."
}
```

</details>

## GameScript.Game.Player.IsPlayerControlled

```lua
GameScript.Game.Player.IsPlayerControlled(arg1)
```

Источник: [Lua, строка 2674](../../luasense_decompiled.lua#L2674). Имена `argN` — placeholders реконструкции.

Return if the object is currently being controlled by the player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are checking if player controlled |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are checking if player controlled"
    }
  },
  "@K[203]": "Return if the object is currently being controlled by the player."
}
```

</details>

## GameScript.Game.Player.IsPlayerFlashlightOn

```lua
GameScript.Game.Player.IsPlayerFlashlightOn(arg1)
```

Источник: [Lua, строка 2677](../../luasense_decompiled.lua#L2677). Имена `argN` — placeholders реконструкции.

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

## GameScript.Game.Player.IsPlayerInState

```lua
GameScript.Game.Player.IsPlayerInState(arg1, arg2)
```

Источник: [Lua, строка 2680](../../luasense_decompiled.lua#L2680). Имена `argN` — placeholders реконструкции.

Checks to see if specified player is in a particular state

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index to check state |
| 2.0 | State | Global state index that is being checked against |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index to check state"
    },
    "2.0": {
      "@K[209]": "State",
      "@K[211]": "Global state index that is being checked against"
    }
  },
  "@K[203]": "Checks to see if specified player is in a particular state"
}
```

</details>

## GameScript.Game.Player.PauseCurrentPossession

```lua
GameScript.Game.Player.PauseCurrentPossession(arg1, arg2)
```

Источник: [Lua, строка 2683](../../luasense_decompiled.lua#L2683). Имена `argN` — placeholders реконструкции.

Pauses the possession timer for the given player, if they are actually possessing another object at the time. This function will silently fail if the player is not currently possessing something. It is important to write scripts that pair a PauseCurrentPossession(index, true) with a PauseCurrentPossessiong(index, false). Keep in mind that it is possible for the possession timer to pause from several different sources (scripts, entering vehicles, etc)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the possessing player. |
| 2.0 | Pause | Whether we are pausing (true) or resuming (false) the current possession timer |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the possessing player."
    },
    "2.0": {
      "@K[209]": "Pause",
      "@K[211]": "Whether we are pausing (true) or resuming (false) the current possession timer"
    }
  },
  "@K[203]": "Pauses the possession timer for the given player, if they are actually possessing another object at the time. This function will silently fail if the player is not currently possessing something. It is important to write scripts that pair a PauseCurrentPossession(index, true) with a PauseCurrentPossessiong(index, false). Keep in mind that it is possible for the possession timer to pause from several different sources (scripts, entering vehicles, etc)"
}
```

</details>

## GameScript.Game.Player.ResetPossessionTimer

```lua
GameScript.Game.Player.ResetPossessionTimer(arg1)
```

Источник: [Lua, строка 2686](../../luasense_decompiled.lua#L2686). Имена `argN` — placeholders реконструкции.

Will give a player back their full possession timeout meter, if currently in possession of a body

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the possessing player. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the possessing player."
    }
  },
  "@K[203]": "Will give a player back their full possession timeout meter, if currently in possession of a body"
}
```

</details>

## GameScript.Game.Player.RevivePlayer

```lua
GameScript.Game.Player.RevivePlayer(arg1)
```

Источник: [Lua, строка 2689](../../luasense_decompiled.lua#L2689). Имена `argN` — placeholders реконструкции.

Revives the given player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player to revive. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player to revive."
    }
  },
  "@K[203]": "Revives the given player."
}
```

</details>

## GameScript.Game.Player.RevivePlayerInstant

```lua
GameScript.Game.Player.RevivePlayerInstant(arg1)
```

Источник: [Lua, строка 2692](../../luasense_decompiled.lua#L2692). Имена `argN` — placeholders реконструкции.

Revives the given player without going through the 'Use' system.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player to revive. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player to revive."
    }
  },
  "@K[203]": "Revives the given player without going through the 'Use' system."
}
```

</details>

## GameScript.Game.Player.SetCheckpointLoad

```lua
GameScript.Game.Player.SetCheckpointLoad(arg1, arg2)
```

Источник: [Lua, строка 2695](../../luasense_decompiled.lua#L2695). Имена `argN` — placeholders реконструкции.

Changes the game behavior when the player presses A to respawn in campaign mode.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject on which we are changing this setting |
| 2.0 | bFail | Reload(true) or Respawn(false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject on which we are changing this setting"
    },
    "2.0": {
      "@K[209]": "bFail",
      "@K[211]": "Reload(true) or Respawn(false)"
    }
  },
  "@K[203]": "Changes the game behavior when the player presses A to respawn in campaign mode."
}
```

</details>

## GameScript.Game.Player.SetCrouch

```lua
GameScript.Game.Player.SetCrouch(arg1, arg2)
```

Источник: [Lua, строка 2698](../../luasense_decompiled.lua#L2698). Имена `argN` — placeholders реконструкции.

Forces the player to crouch.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerObject | The player object which that will crouch. |
| 2.0 | Crouch | Unused.  Somebody please delete me. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerObject",
      "@K[211]": "The player object which that will crouch."
    },
    "2.0": {
      "@K[209]": "Crouch",
      "@K[211]": "Unused.  Somebody please delete me."
    }
  },
  "@K[203]": "Forces the player to crouch."
}
```

</details>

## GameScript.Game.Player.SetFailedOnRespawn

```lua
GameScript.Game.Player.SetFailedOnRespawn(arg1, arg2)
```

Источник: [Lua, строка 2701](../../luasense_decompiled.lua#L2701). Имена `argN` — placeholders реконструкции.

Changes the game behavior when the player presses A to respawn in campaign mode.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject on which we are changing this setting |
| 2.0 | bFail | Reload(true) or Respawn(false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject on which we are changing this setting"
    },
    "2.0": {
      "@K[209]": "bFail",
      "@K[211]": "Reload(true) or Respawn(false)"
    }
  },
  "@K[203]": "Changes the game behavior when the player presses A to respawn in campaign mode."
}
```

</details>

## GameScript.Game.Player.SetLocalTetherTimeoutPeriod

```lua
GameScript.Game.Player.SetLocalTetherTimeoutPeriod(arg1, arg2)
```

Источник: [Lua, строка 2704](../../luasense_decompiled.lua#L2704). Имена `argN` — placeholders реконструкции.

Sets how long the timeout period is before tethering

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player to tether. |
| 2.0 | Period | Number of seconds before tethering |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player to tether."
    },
    "2.0": {
      "@K[209]": "Period",
      "@K[211]": "Number of seconds before tethering"
    }
  },
  "@K[203]": "Sets how long the timeout period is before tethering"
}
```

</details>

## GameScript.Game.Player.SetLocalTetherWarningPct

```lua
GameScript.Game.Player.SetLocalTetherWarningPct(arg1, arg2)
```

Источник: [Lua, строка 2707](../../luasense_decompiled.lua#L2707). Имена `argN` — placeholders реконструкции.

Sets how high the warning level intensity is.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player to tether. |
| 2.0 | Percent | Percentage from 0 to 1 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player to tether."
    },
    "2.0": {
      "@K[209]": "Percent",
      "@K[211]": "Percentage from 0 to 1"
    }
  },
  "@K[203]": "Sets how high the warning level intensity is."
}
```

</details>

## GameScript.Game.Player.SetLocalTetherZone

```lua
GameScript.Game.Player.SetLocalTetherZone(arg1, arg2)
```

Источник: [Lua, строка 2710](../../luasense_decompiled.lua#L2710). Имена `argN` — placeholders реконструкции.

Sets the tether zone in the player's tether component to allow the associated FX to be played.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player to tether. |
| 2.0 | TetherZone | Use GameScript.TetherZone.XXXX |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player to tether."
    },
    "2.0": {
      "@K[209]": "TetherZone",
      "@K[211]": "Use GameScript.TetherZone.XXXX"
    }
  },
  "@K[203]": "Sets the tether zone in the player's tether component to allow the associated FX to be played."
}
```

</details>

## GameScript.Game.Player.SetMaxPossessionTime

```lua
GameScript.Game.Player.SetMaxPossessionTime(arg1, arg2)
```

Источник: [Lua, строка 2713](../../luasense_decompiled.lua#L2713). Имена `argN` — placeholders реконструкции.

Sets the possession time for the possessed vehicle.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the possessing player. |
| 2.0 | InMaxPossessionTime | The New Maximum possession time for a vehicle. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the possessing player."
    },
    "2.0": {
      "@K[209]": "InMaxPossessionTime",
      "@K[211]": "The New Maximum possession time for a vehicle."
    }
  },
  "@K[203]": "Sets the possession time for the possessed vehicle."
}
```

</details>

## GameScript.Game.Player.SetPlayerGameComplete

```lua
GameScript.Game.Player.SetPlayerGameComplete(arg1)
```

Источник: [Lua, строка 2716](../../luasense_decompiled.lua#L2716). Имена `argN` — placeholders реконструкции.

Sets the "Game Completed" flag in the profile of the player. This function only works on local players.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player we want to set the "Game completed" flag on. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player we want to set the \"Game completed\" flag on."
    }
  },
  "@K[203]": "Sets the \"Game Completed\" flag in the profile of the player. This function only works on local players."
}
```

</details>

## GameScript.Game.Player.SetPlayerIndestructible

```lua
GameScript.Game.Player.SetPlayerIndestructible(arg1, arg2)
```

Источник: [Lua, строка 2719](../../luasense_decompiled.lua#L2719). Имена `argN` — placeholders реконструкции.

Sets the player to be indestructible or not

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global player index for whose spawn template index we are setting |
| 2.0 | indestructible | Is the player indestructible or not |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global player index for whose spawn template index we are setting"
    },
    "2.0": {
      "@K[209]": "indestructible",
      "@K[211]": "Is the player indestructible or not"
    }
  },
  "@K[203]": "Sets the player to be indestructible or not"
}
```

</details>

## GameScript.Game.Player.SetPlayerRespawnTagIndexResponse

```lua
GameScript.Game.Player.SetPlayerRespawnTagIndexResponse(arg1, arg2)
```

Источник: [Lua, строка 2722](../../luasense_decompiled.lua#L2722). Имена `argN` — placeholders реконструкции.

Sets the spawn tag index that a player can use to respawn from after a request has been received to do so.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global player index which we are assigned a spawn tag index for |
| 2.0 | bFail | The spawn tag index assigned to respawn from |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global player index which we are assigned a spawn tag index for"
    },
    "2.0": {
      "@K[209]": "bFail",
      "@K[211]": "The spawn tag index assigned to respawn from"
    }
  },
  "@K[203]": "Sets the spawn tag index that a player can use to respawn from after a request has been received to do so."
}
```

</details>

## GameScript.Game.Player.SetPlayerSpawnTemplateIndex

```lua
GameScript.Game.Player.SetPlayerSpawnTemplateIndex(arg1, arg2)
```

Источник: [Lua, строка 2725](../../luasense_decompiled.lua#L2725). Имена `argN` — placeholders реконструкции.

Returns the index in the Player Spawn Info of the current spawn template for the given player

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global player index for whose spawn template index we are setting |
| 2.0 | newIndex | The new spawn template index, starting from 1 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global player index for whose spawn template index we are setting"
    },
    "2.0": {
      "@K[209]": "newIndex",
      "@K[211]": "The new spawn template index, starting from 1"
    }
  },
  "@K[203]": "Returns the index in the Player Spawn Info of the current spawn template for the given player"
}
```

</details>

## GameScript.Game.Player.SetPossessionDelay

```lua
GameScript.Game.Player.SetPossessionDelay(arg1, arg2)
```

Источник: [Lua, строка 2728](../../luasense_decompiled.lua#L2728). Имена `argN` — placeholders реконструкции.

Sets the body to body delay for when you possess a body.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The player index of the player to change the delay on. |
| 2.0 | NewDelay | The New Body to Body possess delay. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The player index of the player to change the delay on."
    },
    "2.0": {
      "@K[209]": "NewDelay",
      "@K[211]": "The New Body to Body possess delay."
    }
  },
  "@K[203]": "Sets the body to body delay for when you possess a body."
}
```

</details>

## GameScript.Game.Player.SetTetherSafeRadiusOverride

```lua
GameScript.Game.Player.SetTetherSafeRadiusOverride(arg1, arg2)
```

Источник: [Lua, строка 2731](../../luasense_decompiled.lua#L2731). Имена `argN` — placeholders реконструкции.

Overrides the normal radius based "Safe" distance for the current area

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player being tethered. |
| 2.0 | SafeRadius | The radius being set for the current area |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player being tethered."
    },
    "2.0": {
      "@K[209]": "SafeRadius",
      "@K[211]": "The radius being set for the current area"
    }
  },
  "@K[203]": "Overrides the normal radius based \"Safe\" distance for the current area"
}
```

</details>

## GameScript.Game.Player.SetVelocityScale

```lua
GameScript.Game.Player.SetVelocityScale(arg1, arg2)
```

Источник: [Lua, строка 2734](../../luasense_decompiled.lua#L2734). Имена `argN` — placeholders реконструкции.

Sets the velocity scale on the players region velocity scale component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerObject | The player object which that will have its velocity scaled. |
| 2.0 | VelocityScale | The amount to scale the player's velocity by. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerObject",
      "@K[211]": "The player object which that will have its velocity scaled."
    },
    "2.0": {
      "@K[209]": "VelocityScale",
      "@K[211]": "The amount to scale the player's velocity by."
    }
  },
  "@K[203]": "Sets the velocity scale on the players region velocity scale component."
}
```

</details>

## GameScript.Game.Player.TetherPlayer

```lua
GameScript.Game.Player.TetherPlayer(arg1)
```

Источник: [Lua, строка 2737](../../luasense_decompiled.lua#L2737). Имена `argN` — placeholders реконструкции.

Triggers the tether component the given player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player to tether. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player to tether."
    }
  },
  "@K[203]": "Triggers the tether component the given player."
}
```

</details>

## GameScript.Game.Player.TransferPlayerControl

```lua
GameScript.Game.Player.TransferPlayerControl(arg1, arg2, arg3)
```

Источник: [Lua, строка 2740](../../luasense_decompiled.lua#L2740). Имена `argN` — placeholders реконструкции.

Transfers player control from one object to another.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FromObject | The game object that currently has player control |
| 2.0 | ToObject | The game object that will receive player control |
| 3.0 | DeleteOldFromObject | Delete (true) or leave alone (false) old avatar |

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
    },
    "3.0": {
      "@K[209]": "DeleteOldFromObject",
      "@K[211]": "Delete (true) or leave alone (false) old avatar"
    }
  },
  "@K[203]": "Transfers player control from one object to another."
}
```

</details>
