# GameScript.Game

[Индекс](../API.md)

## GameScript.Game.AdjustPossessionVisionModeForCinema

```lua
GameScript.Game.AdjustPossessionVisionModeForCinema()
```

Источник: [Lua, строка 1788](../../luasense_decompiled.lua#L1788). Имена `argN` — placeholders реконструкции.

Allows adjustment of the currently controlled object's camera vision mode

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Allows adjustment of the currently controlled object's camera vision mode"
}
```

</details>

## GameScript.Game.ApplyStatusEffect

```lua
GameScript.Game.ApplyStatusEffect(arg1, arg2)
```

Источник: [Lua, строка 1791](../../luasense_decompiled.lua#L1791). Имена `argN` — placeholders реконструкции.

Applies a status effect to a specific object in the world.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EffectObject | The object with the status to apple to the other object. |
| 2.0 | ObjectToAffect | The object have the status affect applied to. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EffectObject",
      "@K[211]": "The object with the status to apple to the other object."
    },
    "2.0": {
      "@K[209]": "ObjectToAffect",
      "@K[211]": "The object have the status affect applied to."
    }
  },
  "@K[203]": "Applies a status effect to a specific object in the world."
}
```

</details>

## GameScript.Game.AreAllRequiredWorldsSynchronized

```lua
GameScript.Game.AreAllRequiredWorldsSynchronized()
```

Источник: [Lua, строка 1794](../../luasense_decompiled.lua#L1794). Имена `argN` — placeholders реконструкции.

Returns true if all of the worlds required by the last streaming trigger have been synchronized across all machines in the game and are ready to be fully used.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns true if all of the worlds required by the last streaming trigger have been synchronized across all machines in the game and are ready to be fully used."
}
```

</details>

## GameScript.Game.AreAllies

```lua
GameScript.Game.AreAllies(arg1, arg2)
```

Источник: [Lua, строка 1797](../../luasense_decompiled.lua#L1797). Имена `argN` — placeholders реконструкции.

Checks  nation settings if the two objects are alliesSee also: IsNeutral(), AreEnemies(), CopyNation()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Object1 | First Object we are comparing |
| 2.0 | Object2 | Second Object we are comparing |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Object1",
      "@K[211]": "First Object we are comparing"
    },
    "2.0": {
      "@K[209]": "Object2",
      "@K[211]": "Second Object we are comparing"
    }
  },
  "@K[203]": "Checks  nation settings if the two objects are alliesSee also: IsNeutral(), AreEnemies(), CopyNation()"
}
```

</details>

## GameScript.Game.AreEnemies

```lua
GameScript.Game.AreEnemies(arg1, arg2)
```

Источник: [Lua, строка 1800](../../luasense_decompiled.lua#L1800). Имена `argN` — placeholders реконструкции.

Checks nation settings to if the two objects are enemies. See also: AreAllies(),IsNeutral(), CopyNation()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Object1 | First Object we are comparing |
| 2.0 | Object2 | Second Object we are comparing |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Object1",
      "@K[211]": "First Object we are comparing"
    },
    "2.0": {
      "@K[209]": "Object2",
      "@K[211]": "Second Object we are comparing"
    }
  },
  "@K[203]": "Checks nation settings to if the two objects are enemies. See also: AreAllies(),IsNeutral(), CopyNation()"
}
```

</details>

## GameScript.Game.AreWorldsSynchronized

```lua
GameScript.Game.AreWorldsSynchronized(arg1)
```

Источник: [Lua, строка 1803](../../luasense_decompiled.lua#L1803). Имена `argN` — placeholders реконструкции.

Returns true if all of the worlds specified have been required and have been synchronized across all machines in the game and are ready to be fully used.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | WorldsToCheck | The list of worlds (by their script variable name) to check if synchronized |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "WorldsToCheck",
      "@K[211]": "The list of worlds (by their script variable name) to check if synchronized"
    }
  },
  "@K[203]": "Returns true if all of the worlds specified have been required and have been synchronized across all machines in the game and are ready to be fully used."
}
```

</details>

## GameScript.Game.AttachToObject

```lua
GameScript.Game.AttachToObject(arg1, arg2)
```

Источник: [Lua, строка 1806](../../luasense_decompiled.lua#L1806). Имена `argN` — placeholders реконструкции.

Take an object that has an attachment component, "ObjectToAttach" and attach it  "EmpireObject".  The relative position and rotation between the two objects at the time of this call is maintained until detached. It is appropriate to spawn or teleport the object to attach to the proper position in the world. There are calls in "Queries" to obtain the position of the objects, sceneNodes or rigid bodies.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to which we are attaching |
| 2.0 | ObjectToAttach | The object that is being attached.  Needs an attachment component. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to which we are attaching"
    },
    "2.0": {
      "@K[209]": "ObjectToAttach",
      "@K[211]": "The object that is being attached.  Needs an attachment component."
    }
  },
  "@K[203]": "Take an object that has an attachment component, \"ObjectToAttach\" and attach it  \"EmpireObject\".  The relative position and rotation between the two objects at the time of this call is maintained until detached. It is appropriate to spawn or teleport the object to attach to the proper position in the world. There are calls in \"Queries\" to obtain the position of the objects, sceneNodes or rigid bodies."
}
```

</details>

## GameScript.Game.AttachToRigidBody

```lua
GameScript.Game.AttachToRigidBody(arg1, arg2, arg3)
```

Источник: [Lua, строка 1809](../../luasense_decompiled.lua#L1809). Имена `argN` — placeholders реконструкции.

Take an object that has an attachment component, "ObjectToAttach" and attach it  "EmpireObject".  The relative position and rotation between the object to attach and the rigid body at the time of this call is maintained until detached. It is appropriate to spawn or teleport the object to attach to the proper position in the world. There are calls in "Queries" to obtain the position of the objects, sceneNodes or rigid bodies.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to which we are attaching |
| 2.0 | SceneNodeName | The scene node in the object to which we are attaching |
| 3.0 | ObjectToAttach | The object that is being attached.  Needs an attachment component. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to which we are attaching"
    },
    "2.0": {
      "@K[209]": "SceneNodeName",
      "@K[211]": "The scene node in the object to which we are attaching"
    },
    "3.0": {
      "@K[209]": "ObjectToAttach",
      "@K[211]": "The object that is being attached.  Needs an attachment component."
    }
  },
  "@K[203]": "Take an object that has an attachment component, \"ObjectToAttach\" and attach it  \"EmpireObject\".  The relative position and rotation between the object to attach and the rigid body at the time of this call is maintained until detached. It is appropriate to spawn or teleport the object to attach to the proper position in the world. There are calls in \"Queries\" to obtain the position of the objects, sceneNodes or rigid bodies."
}
```

</details>

## GameScript.Game.AttachToSceneNode

```lua
GameScript.Game.AttachToSceneNode(arg1, arg2, arg3)
```

Источник: [Lua, строка 1812](../../luasense_decompiled.lua#L1812). Имена `argN` — placeholders реконструкции.

Take an object that has an attachment component, "ObjectToAttach" and attach it  "EmpireObject".  The relative position and rotation between the object to attach and the scene node at the time of this call is maintained until detached. It is appropriate to spawn or teleport the object to attach to the proper position in the world. There are calls in "Queries" to obtain the position of the objects, sceneNodes or rigid bodies.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to which we are attaching |
| 2.0 | SceneNodeName | The scene node in the object to which we are attaching |
| 3.0 | ObjectToAttach | The object that is being attached.  Needs an attachment component. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to which we are attaching"
    },
    "2.0": {
      "@K[209]": "SceneNodeName",
      "@K[211]": "The scene node in the object to which we are attaching"
    },
    "3.0": {
      "@K[209]": "ObjectToAttach",
      "@K[211]": "The object that is being attached.  Needs an attachment component."
    }
  },
  "@K[203]": "Take an object that has an attachment component, \"ObjectToAttach\" and attach it  \"EmpireObject\".  The relative position and rotation between the object to attach and the scene node at the time of this call is maintained until detached. It is appropriate to spawn or teleport the object to attach to the proper position in the world. There are calls in \"Queries\" to obtain the position of the objects, sceneNodes or rigid bodies."
}
```

</details>

## GameScript.Game.AwardAchievementOccurrence

```lua
GameScript.Game.AwardAchievementOccurrence(arg1, arg2)
```

Источник: [Lua, строка 1815](../../luasense_decompiled.lua#L1815). Имена `argN` — placeholders реконструкции.

Rewards the given player an occurrence of the given achievement. Achievements can be accessed in script via the table GameScript.Achievements, where each entry in that field is the internal name defined in the Achievements Global Data component in the Global Data object. The achievement index is given by it's order in the global data component, starting from 1. This function should only be called on the host, and will be synced to clients. It will do nothing if called directly on the client.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The global index of the player that is being rewarded |
| 2.0 | ScriptAchievementIndex | The index of the achievement that is being rewarded |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The global index of the player that is being rewarded"
    },
    "2.0": {
      "@K[209]": "ScriptAchievementIndex",
      "@K[211]": "The index of the achievement that is being rewarded"
    }
  },
  "@K[203]": "Rewards the given player an occurrence of the given achievement. Achievements can be accessed in script via the table GameScript.Achievements, where each entry in that field is the internal name defined in the Achievements Global Data component in the Global Data object. The achievement index is given by it's order in the global data component, starting from 1. This function should only be called on the host, and will be synced to clients. It will do nothing if called directly on the client."
}
```

</details>

## GameScript.Game.BroadcastMissionEventMessage

```lua
GameScript.Game.BroadcastMissionEventMessage(arg1, arg2)
```

Источник: [Lua, строка 1818](../../luasense_decompiled.lua#L1818). Имена `argN` — placeholders реконструкции.

Broadcast a mission-specific event message.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are sending the message to. |
| 2.0 | TextId | The text ID of the message. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are sending the message to."
    },
    "2.0": {
      "@K[209]": "TextId",
      "@K[211]": "The text ID of the message."
    }
  },
  "@K[203]": "Broadcast a mission-specific event message."
}
```

</details>

## GameScript.Game.CompleteCurrentLevel

```lua
GameScript.Game.CompleteCurrentLevel(arg1)
```

Источник: [Lua, строка 1887](../../luasense_decompiled.lua#L1887). Имена `argN` — placeholders реконструкции.

Marks the current level as completed, used for awarding achievements. This function must be called on host and clients. See also: SetCurrentLevel()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player who has completed the current level |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player who has completed the current level"
    }
  },
  "@K[203]": "Marks the current level as completed, used for awarding achievements. This function must be called on host and clients. See also: SetCurrentLevel()"
}
```

</details>

## GameScript.Game.CopyNation

```lua
GameScript.Game.CopyNation(arg1, arg2)
```

Источник: [Lua, строка 1890](../../luasense_decompiled.lua#L1890). Имена `argN` — placeholders реконструкции.

Copy Nation from "SourceObject" to "DestinationObject".See also: IsNeutral(), AreAllies(), AreEnemies()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | SourceObject | The object whose nation we are copying |
| 2.0 | DestinationObject | The object to which we are copying a nation |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "SourceObject",
      "@K[211]": "The object whose nation we are copying"
    },
    "2.0": {
      "@K[209]": "DestinationObject",
      "@K[211]": "The object to which we are copying a nation"
    }
  },
  "@K[203]": "Copy Nation from \"SourceObject\" to \"DestinationObject\".See also: IsNeutral(), AreAllies(), AreEnemies()"
}
```

</details>

## GameScript.Game.Damage

```lua
GameScript.Game.Damage(arg1, arg2)
```

Источник: [Lua, строка 1893](../../luasense_decompiled.lua#L1893). Имена `argN` — placeholders реконструкции.

Send a message to damage the object. See also DamageWithInfo()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are damaging |
| 2.0 | DamageAmount | How much damage to attempt. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are damaging"
    },
    "2.0": {
      "@K[209]": "DamageAmount",
      "@K[211]": "How much damage to attempt."
    }
  },
  "@K[203]": "Send a message to damage the object. See also DamageWithInfo()"
}
```

</details>

## GameScript.Game.DamageWithInfo

```lua
GameScript.Game.DamageWithInfo(arg1, arg2)
```

Источник: [Lua, строка 1896](../../luasense_decompiled.lua#L1896). Имена `argN` — placeholders реконструкции.

Send a message to damage the object. See also Damage()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are damaging |
| 2.0 | DamageInfo | Table with a variety of info options for damaging:<br>"damage" - amount of damage to cause<br>"impactX", "impactY", "impactZ" - position of the "impact" of the damage<br>"sourceX", "sourceY", "sourceZ" - position of the "source" of the damage<br>"type" - the damage type<br>"weaponType" - the weapon type of the damage<br>"hitReactionProbability" - the probability [0,1] of a hit reaction by the target. May require setting a damage or weapon type<br>"sourceObject" - object that is the source of the damage<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are damaging"
    },
    "2.0": {
      "@K[209]": "DamageInfo",
      "@K[211]": "Table with a variety of info options for damaging:\n\"damage\" - amount of damage to cause\n\"impactX\", \"impactY\", \"impactZ\" - position of the \"impact\" of the damage\n\"sourceX\", \"sourceY\", \"sourceZ\" - position of the \"source\" of the damage\n\"type\" - the damage type\n\"weaponType\" - the weapon type of the damage\n\"hitReactionProbability\" - the probability [0,1] of a hit reaction by the target. May require setting a damage or weapon type\n\"sourceObject\" - object that is the source of the damage\n"
    }
  },
  "@K[203]": "Send a message to damage the object. See also Damage()"
}
```

</details>

## GameScript.Game.DataMinerCheckpoint

```lua
GameScript.Game.DataMinerCheckpoint()
```

Источник: [Lua, строка 1899](../../luasense_decompiled.lua#L1899). Имена `argN` — placeholders реконструкции.

Sends a dataminer checkpoint message with the given name

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Sends a dataminer checkpoint message with the given name"
}
```

</details>

## GameScript.Game.Detach

```lua
GameScript.Game.Detach(arg1)
```

Источник: [Lua, строка 1926](../../luasense_decompiled.lua#L1926). Имена `argN` — placeholders реконструкции.

Detaches the specified object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to detach |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to detach"
    }
  },
  "@K[203]": "Detaches the specified object."
}
```

</details>

## GameScript.Game.DisplayText

```lua
GameScript.Game.DisplayText(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1929](../../luasense_decompiled.lua#L1929). Имена `argN` — placeholders реконструкции.

Display text in the UI.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TextDisplayInfo | Information about the text to be displayed |
| 2.0 | GlobalPlayerIndex | The global player index for the local player to show the text |
| 3.0 | ExcusivelyOwned | Is this display request exclusively controlled? |
| 4.0 | EmpireObject | The empireObject for which it is exclusively owned by |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TextDisplayInfo",
      "@K[211]": "Information about the text to be displayed"
    },
    "2.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index for the local player to show the text"
    },
    "3.0": {
      "@K[209]": "ExcusivelyOwned",
      "@K[211]": "Is this display request exclusively controlled?"
    },
    "4.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which it is exclusively owned by"
    }
  },
  "@K[203]": "Display text in the UI."
}
```

</details>

## GameScript.Game.DoesPosRotExist

```lua
GameScript.Game.DoesPosRotExist(arg1)
```

Источник: [Lua, строка 1932](../../luasense_decompiled.lua#L1932). Имена `argN` — placeholders реконструкции.

Returns if an object has a posRot Component

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are checking"
    }
  },
  "@K[203]": "Returns if an object has a posRot Component"
}
```

</details>

## GameScript.Game.DoesSceneNodeExist

```lua
GameScript.Game.DoesSceneNodeExist(arg1, arg2)
```

Источник: [Lua, строка 1935](../../luasense_decompiled.lua#L1935). Имена `argN` — placeholders реконструкции.

Returns if a scene node named "SceneNodeName" exists in this object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are checking |
| 2.0 | SceneNodeName | The name of the scene node for which we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are checking"
    },
    "2.0": {
      "@K[209]": "SceneNodeName",
      "@K[211]": "The name of the scene node for which we are checking"
    }
  },
  "@K[203]": "Returns if a scene node named \"SceneNodeName\" exists in this object."
}
```

</details>

## GameScript.Game.Drop

```lua
GameScript.Game.Drop(arg1)
```

Источник: [Lua, строка 1968](../../luasense_decompiled.lua#L1968). Имена `argN` — placeholders реконструкции.

Drops the given object from its respective inventory. NOTE: due to some wackiness in how we handle inventories in multiplayer, DO NOT write scripts/logics that rely on the existence of an object that is dropped using this function.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ObjectToDrop | The object to drop |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ObjectToDrop",
      "@K[211]": "The object to drop"
    }
  },
  "@K[203]": "Drops the given object from its respective inventory. NOTE: due to some wackiness in how we handle inventories in multiplayer, DO NOT write scripts/logics that rely on the existence of an object that is dropped using this function."
}
```

</details>

## GameScript.Game.EnableAllEnableables

```lua
GameScript.Game.EnableAllEnableables(arg1, arg2)
```

Источник: [Lua, строка 1971](../../luasense_decompiled.lua#L1971). Имена `argN` — placeholders реконструкции.

Enable or disable components in this object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are enabling/disabling |
| 2.0 | bEnable | Enable(true) or disable(false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are enabling/disabling"
    },
    "2.0": {
      "@K[209]": "bEnable",
      "@K[211]": "Enable(true) or disable(false)"
    }
  },
  "@K[203]": "Enable or disable components in this object"
}
```

</details>

## GameScript.Game.EnableAllUsables

```lua
GameScript.Game.EnableAllUsables(arg1, arg2)
```

Источник: [Lua, строка 1974](../../luasense_decompiled.lua#L1974). Имена `argN` — placeholders реконструкции.

Enable or disable Usable components in this object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are enabling/disabling |
| 2.0 | bEnable | Enable(true) or disable(false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are enabling/disabling"
    },
    "2.0": {
      "@K[209]": "bEnable",
      "@K[211]": "Enable(true) or disable(false)"
    }
  },
  "@K[203]": "Enable or disable Usable components in this object"
}
```

</details>

## GameScript.Game.EnableComponent

```lua
GameScript.Game.EnableComponent(arg1, arg2)
```

Источник: [Lua, строка 1977](../../luasense_decompiled.lua#L1977). Имена `argN` — placeholders реконструкции.

Does the same type of enable or disable as Enable/Disable Component does

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |
| 2.0 | Enable | True - enables this component, False - disables |

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
      "@K[211]": "True - enables this component, False - disables"
    }
  },
  "@K[203]": "Does the same type of enable or disable as Enable/Disable Component does"
}
```

</details>

## GameScript.Game.EnableGlowRendering

```lua
GameScript.Game.EnableGlowRendering(arg1, arg2)
```

Источник: [Lua, строка 1980](../../luasense_decompiled.lua#L1980). Имена `argN` — placeholders реконструкции.

Enables or disables controller input.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Enable | Set to true to enable glow rendering input; set to false to disable it. |
| 2.0 | PlayerIndex | Index of the player whose glow rendering we want to enable |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Enable",
      "@K[211]": "Set to true to enable glow rendering input; set to false to disable it."
    },
    "2.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "Index of the player whose glow rendering we want to enable"
    }
  },
  "@K[203]": "Enables or disables controller input."
}
```

</details>

## GameScript.Game.EnableHitPointPriority

```lua
GameScript.Game.EnableHitPointPriority(arg1, arg2, arg3)
```

Источник: [Lua, строка 1983](../../luasense_decompiled.lua#L1983). Имена `argN` — placeholders реконструкции.

Disable a Hit Point component to remove it from the active list

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are searching for a CreateObjectComponent. |
| 2.0 | Priority | The slot number as defined in HitPointControllerComponent |
| 3.0 | Enable | False - stops this level from being considered as part of the total hit points |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are searching for a CreateObjectComponent."
    },
    "2.0": {
      "@K[209]": "Priority",
      "@K[211]": "The slot number as defined in HitPointControllerComponent"
    },
    "3.0": {
      "@K[209]": "Enable",
      "@K[211]": "False - stops this level from being considered as part of the total hit points"
    }
  },
  "@K[203]": "Disable a Hit Point component to remove it from the active list"
}
```

</details>

## GameScript.Game.EnableInput

```lua
GameScript.Game.EnableInput(arg1)
```

Источник: [Lua, строка 1986](../../luasense_decompiled.lua#L1986). Имена `argN` — placeholders реконструкции.

Enables or disables controller input.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Enable | Set to true to enable controller input; set to false to disable it. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Enable",
      "@K[211]": "Set to true to enable controller input; set to false to disable it."
    }
  },
  "@K[203]": "Enables or disables controller input."
}
```

</details>

## GameScript.Game.EnableObjectInput

```lua
GameScript.Game.EnableObjectInput(arg1, arg2, arg3, arg4, arg5)
```

Источник: [Lua, строка 1989](../../luasense_decompiled.lua#L1989). Имена `argN` — placeholders реконструкции.

Enables or disables controller input.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing IPlayerComponent |
| 2.0 | EnableHeading | Set to true to enable heading input; set to false to disable it. |
| 3.0 | EnablePitch | Set to true to enable pitch input; set to false to disable it. |
| 4.0 | EnableMovement | Set to true to enable movement input; set to false to disable it. |
| 5.0 | EnableOther | Set to true to enable other input; set to false to disable it. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing IPlayerComponent"
    },
    "2.0": {
      "@K[209]": "EnableHeading",
      "@K[211]": "Set to true to enable heading input; set to false to disable it."
    },
    "3.0": {
      "@K[209]": "EnablePitch",
      "@K[211]": "Set to true to enable pitch input; set to false to disable it."
    },
    "4.0": {
      "@K[209]": "EnableMovement",
      "@K[211]": "Set to true to enable movement input; set to false to disable it."
    },
    "5.0": {
      "@K[209]": "EnableOther",
      "@K[211]": "Set to true to enable other input; set to false to disable it."
    }
  },
  "@K[203]": "Enables or disables controller input."
}
```

</details>

## GameScript.Game.EnableVFXAnchor

```lua
GameScript.Game.EnableVFXAnchor(arg1, arg2)
```

Источник: [Lua, строка 1992](../../luasense_decompiled.lua#L1992). Имена `argN` — placeholders реконструкции.

Start/Stops a VFXAnchorComponent from emitting

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are searching for a VFXAnchor Component. |
| 2.0 | Enable | True - Causes a VFXAnchorComponent to start emitting |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are searching for a VFXAnchor Component."
    },
    "2.0": {
      "@K[209]": "Enable",
      "@K[211]": "True - Causes a VFXAnchorComponent to start emitting"
    }
  },
  "@K[203]": "Start/Stops a VFXAnchorComponent from emitting"
}
```

</details>

## GameScript.Game.ForceRiderIntoVehicle

```lua
GameScript.Game.ForceRiderIntoVehicle(arg1, arg2, arg3)
```

Источник: [Lua, строка 2034](../../luasense_decompiled.lua#L2034). Имена `argN` — placeholders реконструкции.

Forces an rider object to ride a vehicle object, assuming that the rider has a Rider Component and the vehicle has a Rider Inventory Component

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | RiderObject | The object that we are forcing to ride the vehicle |
| 2.0 | VehicleObject | The object that we are forcing the rider to ride |
| 3.0 | nInvGroup | Inventory group to force the rider into, defaults to zero. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "RiderObject",
      "@K[211]": "The object that we are forcing to ride the vehicle"
    },
    "2.0": {
      "@K[209]": "VehicleObject",
      "@K[211]": "The object that we are forcing the rider to ride"
    },
    "3.0": {
      "@K[209]": "nInvGroup",
      "@K[211]": "Inventory group to force the rider into, defaults to zero."
    }
  },
  "@K[203]": "Forces an rider object to ride a vehicle object, assuming that the rider has a Rider Component and the vehicle has a Rider Inventory Component"
}
```

</details>

## GameScript.Game.ForceRiderOutOfVehicle

```lua
GameScript.Game.ForceRiderOutOfVehicle(arg1, arg2, arg3)
```

Источник: [Lua, строка 2037](../../luasense_decompiled.lua#L2037). Имена `argN` — placeholders реконструкции.

Forces an rider object to exit a vehicle object, assuming that the rider has a Rider Component and the vehicle has a Rider Inventory Component

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | RiderObject | The object that we are forcing to ride the vehicle |
| 2.0 | VehicleObject | The object that we are forcing the rider to ride |
| 3.0 | bSkipExitAnim | Skip entry/exit animation (true) or play them (false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "RiderObject",
      "@K[211]": "The object that we are forcing to ride the vehicle"
    },
    "2.0": {
      "@K[209]": "VehicleObject",
      "@K[211]": "The object that we are forcing the rider to ride"
    },
    "3.0": {
      "@K[209]": "bSkipExitAnim",
      "@K[211]": "Skip entry/exit animation (true) or play them (false)"
    }
  },
  "@K[203]": "Forces an rider object to exit a vehicle object, assuming that the rider has a Rider Component and the vehicle has a Rider Inventory Component"
}
```

</details>

## GameScript.Game.ForceRiderVehicleState

```lua
GameScript.Game.ForceRiderVehicleState(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2040](../../luasense_decompiled.lua#L2040). Имена `argN` — placeholders реконструкции.

Forces an rider object to ride or exit a vehicle object, assuming that the rider has a Rider Component and the vehicle has a Rider Inventory Component.  Includes parameters to start/stop riding and skip entry/exit animations.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | RiderObject | The object that we are forcing to ride the vehicle |
| 2.0 | VehicleObject | The object that we are forcing the rider to ride |
| 3.0 | bStartRiding | Start riding (true) or stop riding (false) |
| 4.0 | bSkipEnterExitAnim | Skip entry/exit animation (true) or play them (false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "RiderObject",
      "@K[211]": "The object that we are forcing to ride the vehicle"
    },
    "2.0": {
      "@K[209]": "VehicleObject",
      "@K[211]": "The object that we are forcing the rider to ride"
    },
    "3.0": {
      "@K[209]": "bStartRiding",
      "@K[211]": "Start riding (true) or stop riding (false)"
    },
    "4.0": {
      "@K[209]": "bSkipEnterExitAnim",
      "@K[211]": "Skip entry/exit animation (true) or play them (false)"
    }
  },
  "@K[203]": "Forces an rider object to ride or exit a vehicle object, assuming that the rider has a Rider Component and the vehicle has a Rider Inventory Component.  Includes parameters to start/stop riding and skip entry/exit animations."
}
```

</details>

## GameScript.Game.ForceStopRiding

```lua
GameScript.Game.ForceStopRiding(arg1, arg2)
```

Источник: [Lua, строка 2043](../../luasense_decompiled.lua#L2043). Имена `argN` — placeholders реконструкции.

Forces an rider object to exit its vehicle. Does the same thing as ForceRiderOutOfVehicle, but does not require a vehicle object handle.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | RiderObject | The object that we are forcing to ride the vehicle |
| 2.0 | bSkipExitAnim | Skip entry/exit animation (true) or play them (false) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "RiderObject",
      "@K[211]": "The object that we are forcing to ride the vehicle"
    },
    "2.0": {
      "@K[209]": "bSkipExitAnim",
      "@K[211]": "Skip entry/exit animation (true) or play them (false)"
    }
  },
  "@K[203]": "Forces an rider object to exit its vehicle. Does the same thing as ForceRiderOutOfVehicle, but does not require a vehicle object handle."
}
```

</details>

## GameScript.Game.GetActiveDestructibleObject

```lua
GameScript.Game.GetActiveDestructibleObject(arg1)
```

Источник: [Lua, строка 2046](../../luasense_decompiled.lua#L2046). Имена `argN` — placeholders реконструкции.

Returns the current object active in the destructible

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing DestructibleObjectControlComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing DestructibleObjectControlComponent"
    }
  },
  "@K[203]": "Returns the current object active in the destructible"
}
```

</details>

## GameScript.Game.GetAllDestructibleObjects

```lua
GameScript.Game.GetAllDestructibleObjects(arg1)
```

Источник: [Lua, строка 2049](../../luasense_decompiled.lua#L2049). Имена `argN` — placeholders реконструкции.

Returns all the objects part of a destructible

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing DestructibleObjectControlComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing DestructibleObjectControlComponent"
    }
  },
  "@K[203]": "Returns all the objects part of a destructible"
}
```

</details>

## GameScript.Game.GetAnimationVariable

```lua
GameScript.Game.GetAnimationVariable(arg1, arg2)
```

Источник: [Lua, строка 2052](../../luasense_decompiled.lua#L2052). Имена `argN` — placeholders реконструкции.

Return the value of the animation variable that matches "AnimationVariable"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are querying for the animation variable |
| 2.0 | AnimationVariable | The name of animation variable of which we want the value |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are querying for the animation variable"
    },
    "2.0": {
      "@K[209]": "AnimationVariable",
      "@K[211]": "The name of animation variable of which we want the value"
    }
  },
  "@K[203]": "Return the value of the animation variable that matches \"AnimationVariable\""
}
```

</details>

## GameScript.Game.GetDamageHistory

```lua
GameScript.Game.GetDamageHistory(arg1)
```

Источник: [Lua, строка 2055](../../luasense_decompiled.lua#L2055). Имена `argN` — placeholders реконструкции.

Returns a table of the object's damage history, where entry in the table is a table itself with two fields: "playerIndex" (the index of the player that has damaged the object) and "damage" (the amount of damage dealt by the player). Damage history can only be grabbed from objects that have Hit Point Controller components.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object whose damage history we are retrieving. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object whose damage history we are retrieving."
    }
  },
  "@K[203]": "Returns a table of the object's damage history, where entry in the table is a table itself with two fields: \"playerIndex\" (the index of the player that has damaged the object) and \"damage\" (the amount of damage dealt by the player). Damage history can only be grabbed from objects that have Hit Point Controller components."
}
```

</details>

## GameScript.Game.GetDestructibleCurrentState

```lua
GameScript.Game.GetDestructibleCurrentState(arg1)
```

Источник: [Lua, строка 2058](../../luasense_decompiled.lua#L2058). Имена `argN` — placeholders реконструкции.

Returns the current state of the destructible

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing DestructibleObjectControlComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing DestructibleObjectControlComponent"
    }
  },
  "@K[203]": "Returns the current state of the destructible"
}
```

</details>

## GameScript.Game.GetDestructibleFinalState

```lua
GameScript.Game.GetDestructibleFinalState(arg1)
```

Источник: [Lua, строка 2061](../../luasense_decompiled.lua#L2061). Имена `argN` — placeholders реконструкции.

Returns the final state of the destructible

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing DestructibleObjectControlComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing DestructibleObjectControlComponent"
    }
  },
  "@K[203]": "Returns the final state of the destructible"
}
```

</details>

## GameScript.Game.GetDestructibleInitialState

```lua
GameScript.Game.GetDestructibleInitialState(arg1)
```

Источник: [Lua, строка 2064](../../luasense_decompiled.lua#L2064). Имена `argN` — placeholders реконструкции.

Returns the initial of the destructible

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing DestructibleObjectControlComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing DestructibleObjectControlComponent"
    }
  },
  "@K[203]": "Returns the initial of the destructible"
}
```

</details>

## GameScript.Game.GetDestructibleObjectHealthPercent

```lua
GameScript.Game.GetDestructibleObjectHealthPercent(arg1)
```

Источник: [Lua, строка 2067](../../luasense_decompiled.lua#L2067). Имена `argN` — placeholders реконструкции.

Returns the health percent of the destructible

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing DestructibleObjectControlComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing DestructibleObjectControlComponent"
    }
  },
  "@K[203]": "Returns the health percent of the destructible"
}
```

</details>

## GameScript.Game.GetDifficulty

```lua
GameScript.Game.GetDifficulty()
```

Источник: [Lua, строка 2070](../../luasense_decompiled.lua#L2070). Имена `argN` — placeholders реконструкции.

Returns the game's current difficulty level, starting from 1. If there is no Difficulty Component in the Global Data object, then this function will throw a red screen and return 0

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the game's current difficulty level, starting from 1. If there is no Difficulty Component in the Global Data object, then this function will throw a red screen and return 0"
}
```

</details>

## GameScript.Game.GetEnergyLevelPercent

```lua
GameScript.Game.GetEnergyLevelPercent(arg1)
```

Источник: [Lua, строка 2073](../../luasense_decompiled.lua#L2073). Имена `argN` — placeholders реконструкции.

Checks an object for its current energy level percent [0,1], returning 0 if there is no Energy Component. WARNING: If there's more than one energy component (as on Fettel), the 'first' one will be returned, which isn't specifically defined.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with an Energy Component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with an Energy Component"
    }
  },
  "@K[203]": "Checks an object for its current energy level percent [0,1], returning 0 if there is no Energy Component. WARNING: If there's more than one energy component (as on Fettel), the 'first' one will be returned, which isn't specifically defined."
}
```

</details>

## GameScript.Game.GetEnvironmentalEffectObjects

```lua
GameScript.Game.GetEnvironmentalEffectObjects(arg1)
```

Источник: [Lua, строка 2076](../../luasense_decompiled.lua#L2076). Имена `argN` — placeholders реконструкции.

Check if "EnvironmentalEffectObject" has a Environmental Effect Component, and if so, get a list of Effect objects in the world.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EnvironmentalEffectObject | The empireObject for which we are examining for an Environmental Effect Component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EnvironmentalEffectObject",
      "@K[211]": "The empireObject for which we are examining for an Environmental Effect Component"
    }
  },
  "@K[203]": "Check if \"EnvironmentalEffectObject\" has a Environmental Effect Component, and if so, get a list of Effect objects in the world."
}
```

</details>

## GameScript.Game.GetForward

```lua
GameScript.Game.GetForward(arg1)
```

Источник: [Lua, строка 2079](../../luasense_decompiled.lua#L2079). Имена `argN` — placeholders реконструкции.

Returns vector3D with forward heading of the object in fields x,y,z of the table, if no matrix exists, there will be all zeros 

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting forward |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting forward"
    }
  },
  "@K[203]": "Returns vector3D with forward heading of the object in fields x,y,z of the table, if no matrix exists, there will be all zeros "
}
```

</details>

## GameScript.Game.GetHitPointPercent

```lua
GameScript.Game.GetHitPointPercent(arg1)
```

Источник: [Lua, строка 2082](../../luasense_decompiled.lua#L2082). Имена `argN` — placeholders реконструкции.

Return the hit points percentage of the empireObject, returns 1.0 if no indestructible

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are searching for hit points |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are searching for hit points"
    }
  },
  "@K[203]": "Return the hit points percentage of the empireObject, returns 1.0 if no indestructible"
}
```

</details>

## GameScript.Game.GetInteractionObjects

```lua
GameScript.Game.GetInteractionObjects(arg1)
```

Источник: [Lua, строка 2085](../../luasense_decompiled.lua#L2085). Имена `argN` — placeholders реконструкции.

Return all objects currently being interacted with.


Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject whose interactions we are retrieving |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject whose interactions we are retrieving"
    }
  },
  "@K[203]": "Return all objects currently being interacted with.\n"
}
```

</details>

## GameScript.Game.GetInteractionUser

```lua
GameScript.Game.GetInteractionUser(arg1)
```

Источник: [Lua, строка 2088](../../luasense_decompiled.lua#L2088). Имена `argN` — placeholders реконструкции.

Return the user currently interacting with the object.


Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject whose interactions we are retrieving |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject whose interactions we are retrieving"
    }
  },
  "@K[203]": "Return the user currently interacting with the object.\n"
}
```

</details>

## GameScript.Game.GetInventoryItems

```lua
GameScript.Game.GetInventoryItems(arg1, arg2)
```

Источник: [Lua, строка 2091](../../luasense_decompiled.lua#L2091). Имена `argN` — placeholders реконструкции.

Return all objects carried by empireObject of the given inventory type.
0 = All inventory lists
1 = Primary Weapon inventory lists
2 = Grenade inventory lists
3 = Augmentation inventory lists
4 = Rider inventory lists
5 = Power-up inventory lists

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject whose inventory we are searching |
| 2.0 | InventoryType | The type of inventory we want to search. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject whose inventory we are searching"
    },
    "2.0": {
      "@K[209]": "InventoryType",
      "@K[211]": "The type of inventory we want to search."
    }
  },
  "@K[203]": "Return all objects carried by empireObject of the given inventory type.\n0 = All inventory lists\n1 = Primary Weapon inventory lists\n2 = Grenade inventory lists\n3 = Augmentation inventory lists\n4 = Rider inventory lists\n5 = Power-up inventory lists"
}
```

</details>

## GameScript.Game.GetInventoryItemsByTypeAndName

```lua
GameScript.Game.GetInventoryItemsByTypeAndName(arg1, arg2, arg3)
```

Источник: [Lua, строка 2094](../../luasense_decompiled.lua#L2094). Имена `argN` — placeholders реконструкции.

Return all objects carried by empireObject of the given inventory type.
0 = All inventory lists
1 = Primary Weapon inventory lists
2 = Grenade inventory lists
3 = Augmentation inventory lists
4 = Rider inventory lists
5 = Power-up inventory lists

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject whose inventory we are searching |
| 2.0 | InventoryType | The type of inventory we want to search. |
| 3.0 | InventoryName | The name of the inventory we want to search. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject whose inventory we are searching"
    },
    "2.0": {
      "@K[209]": "InventoryType",
      "@K[211]": "The type of inventory we want to search."
    },
    "3.0": {
      "@K[209]": "InventoryName",
      "@K[211]": "The name of the inventory we want to search."
    }
  },
  "@K[203]": "Return all objects carried by empireObject of the given inventory type.\n0 = All inventory lists\n1 = Primary Weapon inventory lists\n2 = Grenade inventory lists\n3 = Augmentation inventory lists\n4 = Rider inventory lists\n5 = Power-up inventory lists"
}
```

</details>

## GameScript.Game.GetInventoryOwner

```lua
GameScript.Game.GetInventoryOwner(arg1)
```

Источник: [Lua, строка 2097](../../luasense_decompiled.lua#L2097). Имена `argN` — placeholders реконструкции.

Return the object that is carrying the given empireObject

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject that is being carried |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject that is being carried"
    }
  },
  "@K[203]": "Return the object that is carrying the given empireObject"
}
```

</details>

## GameScript.Game.GetLastMeleeAttack

```lua
GameScript.Game.GetLastMeleeAttack(arg1)
```

Источник: [Lua, строка 2100](../../luasense_decompiled.lua#L2100). Имена `argN` — placeholders реконструкции.

Returns the index (starting from 1) of the last melee attack made by the given object. Returns 0 if the object has not attacked yet, or does not have a Melee Component

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that recently made a melee attack. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that recently made a melee attack."
    }
  },
  "@K[203]": "Returns the index (starting from 1) of the last melee attack made by the given object. Returns 0 if the object has not attacked yet, or does not have a Melee Component"
}
```

</details>

## GameScript.Game.GetMyObject

```lua
GameScript.Game.GetMyObject()
```

Источник: [Lua, строка 2103](../../luasense_decompiled.lua#L2103). Имена `argN` — placeholders реконструкции.

Return the object that owns the script that is running.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Return the object that owns the script that is running."
}
```

</details>

## GameScript.Game.GetName

```lua
GameScript.Game.GetName(arg1)
```

Источник: [Lua, строка 2106](../../luasense_decompiled.lua#L2106). Имена `argN` — placeholders реконструкции.

Return the name of the empireObject

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are searching for name |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are searching for name"
    }
  },
  "@K[203]": "Return the name of the empireObject"
}
```

</details>

## GameScript.Game.GetNumDesiredWorldsPending

```lua
GameScript.Game.GetNumDesiredWorldsPending()
```

Источник: [Lua, строка 2109](../../luasense_decompiled.lua#L2109). Имена `argN` — placeholders реконструкции.

Get number of desired worlds that are currently being streamed into memory, and are not yet ready

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Get number of desired worlds that are currently being streamed into memory, and are not yet ready"
}
```

</details>

## GameScript.Game.GetObjectAttachedTo

```lua
GameScript.Game.GetObjectAttachedTo(arg1)
```

Источник: [Lua, строка 2112](../../luasense_decompiled.lua#L2112). Имена `argN` — placeholders реконструкции.

Returns an object that is attached to another object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to get the object attached to. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to get the object attached to."
    }
  },
  "@K[203]": "Returns an object that is attached to another object."
}
```

</details>

## GameScript.Game.GetOwnerObjectChangeHandlingObject

```lua
GameScript.Game.GetOwnerObjectChangeHandlingObject(arg1)
```

Источник: [Lua, строка 2115](../../luasense_decompiled.lua#L2115). Имена `argN` — placeholders реконструкции.

Return the object that owns the object via the OwnerObjectChangeHandling component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject that is being queried for a OwnerObjectChangeHandling component for ownership |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject that is being queried for a OwnerObjectChangeHandling component for ownership"
    }
  },
  "@K[203]": "Return the object that owns the object via the OwnerObjectChangeHandling component."
}
```

</details>

## GameScript.Game.GetPosition

```lua
GameScript.Game.GetPosition(arg1)
```

Источник: [Lua, строка 2118](../../luasense_decompiled.lua#L2118). Имена `argN` — placeholders реконструкции.

Returns vector3D with position of the object in fields x,y,z of the table, if no position exists, there will be all zeros 

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting position |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting position"
    }
  },
  "@K[203]": "Returns vector3D with position of the object in fields x,y,z of the table, if no position exists, there will be all zeros "
}
```

</details>

## GameScript.Game.GetProjectileTarget

```lua
GameScript.Game.GetProjectileTarget(arg1)
```

Источник: [Lua, строка 2121](../../luasense_decompiled.lua#L2121). Имена `argN` — placeholders реконструкции.

Return the target of the projectile passed to the function.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The projectile |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The projectile"
    }
  },
  "@K[203]": "Return the target of the projectile passed to the function."
}
```

</details>

## GameScript.Game.GetRandomVectorInCone

```lua
GameScript.Game.GetRandomVectorInCone(arg1, arg2)
```

Источник: [Lua, строка 2124](../../luasense_decompiled.lua#L2124). Имена `argN` — placeholders реконструкции.

Returns a vector ( table with x, y, z elements ) that represents a random rotation of the ConeAxis such that the angle between the returned vector and the ConeAxis will be equal to or less than the specified ConeAngle

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ConeAxis | A 3d vector describing the cone's axis |
| 2.0 | ConeAngle | Angle in degrees |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ConeAxis",
      "@K[211]": "A 3d vector describing the cone's axis"
    },
    "2.0": {
      "@K[209]": "ConeAngle",
      "@K[211]": "Angle in degrees"
    }
  },
  "@K[203]": "Returns a vector ( table with x, y, z elements ) that represents a random rotation of the ConeAxis such that the angle between the returned vector and the ConeAxis will be equal to or less than the specified ConeAngle"
}
```

</details>

## GameScript.Game.GetRotateSceneObjectSpeed

```lua
GameScript.Game.GetRotateSceneObjectSpeed(arg1)
```

Источник: [Lua, строка 2127](../../luasense_decompiled.lua#L2127). Имена `argN` — placeholders реконструкции.

Get the current speed of the rotateScene Object is r,p,h degrees per second

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the RotateScenObject component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the RotateScenObject component"
    }
  },
  "@K[203]": "Get the current speed of the rotateScene Object is r,p,h degrees per second"
}
```

</details>

## GameScript.Game.GetRotation

```lua
GameScript.Game.GetRotation(arg1)
```

Источник: [Lua, строка 2130](../../luasense_decompiled.lua#L2130). Имена `argN` — placeholders реконструкции.

Returns vectorRPH with r=roll,p=pitch,h=heading, if no rph exists, there will be all zeros. Reference vectorRPH values with vectorRPH["r"], etc

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting roll, pitch and heading vector |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting roll, pitch and heading vector"
    }
  },
  "@K[203]": "Returns vectorRPH with r=roll,p=pitch,h=heading, if no rph exists, there will be all zeros. Reference vectorRPH values with vectorRPH[\"r\"], etc"
}
```

</details>

## GameScript.Game.GetSceneNodePosition

```lua
GameScript.Game.GetSceneNodePosition(arg1, arg2)
```

Источник: [Lua, строка 2133](../../luasense_decompiled.lua#L2133). Имена `argN` — placeholders реконструкции.

Returns vector3D with position of the scene node of object in fields x,y,z of the table, if no position exists, there will be all zeros 

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting position |
| 2.0 | SceneNodeName | The name of the scene node for which we are requesting position |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting position"
    },
    "2.0": {
      "@K[209]": "SceneNodeName",
      "@K[211]": "The name of the scene node for which we are requesting position"
    }
  },
  "@K[203]": "Returns vector3D with position of the scene node of object in fields x,y,z of the table, if no position exists, there will be all zeros "
}
```

</details>

## GameScript.Game.GetSceneNodeRotation

```lua
GameScript.Game.GetSceneNodeRotation(arg1, arg2)
```

Источник: [Lua, строка 2136](../../luasense_decompiled.lua#L2136). Имена `argN` — placeholders реконструкции.

Returns vectorRPH with r=roll,p=pitch,h=heading, if no rph exists, there will be all zeros. Reference vectorRPH values with vectorRPH["r"], etc

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting roll, pitch and heading vector |
| 2.0 | SceneNodeName | The name of the scene node for which we are requesting roll, pitch and heading vector |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting roll, pitch and heading vector"
    },
    "2.0": {
      "@K[209]": "SceneNodeName",
      "@K[211]": "The name of the scene node for which we are requesting roll, pitch and heading vector"
    }
  },
  "@K[203]": "Returns vectorRPH with r=roll,p=pitch,h=heading, if no rph exists, there will be all zeros. Reference vectorRPH values with vectorRPH[\"r\"], etc"
}
```

</details>

## GameScript.Game.GetSide

```lua
GameScript.Game.GetSide(arg1)
```

Источник: [Lua, строка 2139](../../luasense_decompiled.lua#L2139). Имена `argN` — placeholders реконструкции.

Returns vector3D with side direction of the object in fields x,y,z of the table, if no matrix exists, there will be all zeros 

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting side |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting side"
    }
  },
  "@K[203]": "Returns vector3D with side direction of the object in fields x,y,z of the table, if no matrix exists, there will be all zeros "
}
```

</details>

## GameScript.Game.GetSpawnLocationsFromSpawner

```lua
GameScript.Game.GetSpawnLocationsFromSpawner(arg1)
```

Источник: [Lua, строка 2142](../../luasense_decompiled.lua#L2142). Имена `argN` — placeholders реконструкции.

Check if "SpanwerObject" has a Spawner Component, and if so, get a list of Spawn location objects.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | SpanwerObject | The empireObject for which we are examining for a Spawner Component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "SpanwerObject",
      "@K[211]": "The empireObject for which we are examining for a Spawner Component"
    }
  },
  "@K[203]": "Check if \"SpanwerObject\" has a Spawner Component, and if so, get a list of Spawn location objects."
}
```

</details>

## GameScript.Game.GetSpecificHitPointPercent

```lua
GameScript.Game.GetSpecificHitPointPercent(arg1, arg2)
```

Источник: [Lua, строка 2145](../../luasense_decompiled.lua#L2145). Имена `argN` — placeholders реконструкции.

Return the hit points percentage of a specific health pool in the empireObject, returns 1.0 if no indestructible

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are searching for hit points |
| 2.0 | HealthName | The name of the specific health that we want to query |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are searching for hit points"
    },
    "2.0": {
      "@K[209]": "HealthName",
      "@K[211]": "The name of the specific health that we want to query"
    }
  },
  "@K[203]": "Return the hit points percentage of a specific health pool in the empireObject, returns 1.0 if no indestructible"
}
```

</details>

## GameScript.Game.GetSuspendingObject

```lua
GameScript.Game.GetSuspendingObject(arg1)
```

Источник: [Lua, строка 2148](../../luasense_decompiled.lua#L2148). Имена `argN` — placeholders реконструкции.

Checks a suspended object and reports which object is suspending it. If the object is not suspended, it will return nil

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | SuspendedObject | The object that is being suspended |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "SuspendedObject",
      "@K[211]": "The object that is being suspended"
    }
  },
  "@K[203]": "Checks a suspended object and reports which object is suspending it. If the object is not suspended, it will return nil"
}
```

</details>

## GameScript.Game.GetUp

```lua
GameScript.Game.GetUp(arg1)
```

Источник: [Lua, строка 2151](../../luasense_decompiled.lua#L2151). Имена `argN` — placeholders реконструкции.

Returns vector3D with up direction of the object in fields x,y,z of the table, if no matrix exists, there will be all zeros 

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting up |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting up"
    }
  },
  "@K[203]": "Returns vector3D with up direction of the object in fields x,y,z of the table, if no matrix exists, there will be all zeros "
}
```

</details>

## GameScript.Game.GetWorldName

```lua
GameScript.Game.GetWorldName(arg1)
```

Источник: [Lua, строка 2154](../../luasense_decompiled.lua#L2154). Имена `argN` — placeholders реконструкции.

Return the world in which EmpireObject is currently present.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are finding the world |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are finding the world"
    }
  },
  "@K[203]": "Return the world in which EmpireObject is currently present."
}
```

</details>

## GameScript.Game.HasAchievementBeenAchieved

```lua
GameScript.Game.HasAchievementBeenAchieved(arg1, arg2)
```

Источник: [Lua, строка 2249](../../luasense_decompiled.lua#L2249). Имена `argN` — placeholders реконструкции.

Returns whether the given player has achieved the achievement of the given index. Achievements can be accessed in script via the table GameScript.Achievements, where each entry in that field is the internal name defined in the Achievements Global Data component in the Global Data object. The achievement index is given by it's order in the global data component, starting from 1.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The global index of the player we are checking |
| 2.0 | AchievementIndex | The index of the achievement we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The global index of the player we are checking"
    },
    "2.0": {
      "@K[209]": "AchievementIndex",
      "@K[211]": "The index of the achievement we are checking"
    }
  },
  "@K[203]": "Returns whether the given player has achieved the achievement of the given index. Achievements can be accessed in script via the table GameScript.Achievements, where each entry in that field is the internal name defined in the Achievements Global Data component in the Global Data object. The achievement index is given by it's order in the global data component, starting from 1."
}
```

</details>

## GameScript.Game.HasHitPoints

```lua
GameScript.Game.HasHitPoints(arg1)
```

Источник: [Lua, строка 2252](../../luasense_decompiled.lua#L2252). Имена `argN` — placeholders реконструкции.

Return true if EmpireObject has any hit points, false otherwise

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject which we are searching for hit points |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject which we are searching for hit points"
    }
  },
  "@K[203]": "Return true if EmpireObject has any hit points, false otherwise"
}
```

</details>

## GameScript.Game.HasPlayerStartedLevel

```lua
GameScript.Game.HasPlayerStartedLevel(arg1)
```

Источник: [Lua, строка 2255](../../luasense_decompiled.lua#L2255). Имена `argN` — placeholders реконструкции.

Returns whether the specified player's "has started level" flag is set, which can only be set by the "SetPlayersStartedLevel" function.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The global index of the player we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The global index of the player we are checking"
    }
  },
  "@K[203]": "Returns whether the specified player's \"has started level\" flag is set, which can only be set by the \"SetPlayersStartedLevel\" function."
}
```

</details>

## GameScript.Game.Heal

```lua
GameScript.Game.Heal(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2258](../../luasense_decompiled.lua#L2258). Имена `argN` — placeholders реконструкции.

Send a message to heal a specific health in the object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are healing |
| 2.0 | EmpireObject | The name of the health that receives the heal |
| 3.0 | HealAmount | How much we are healing |
| 4.0 | IsPercent | Is the HealAmount represented as a percentage? |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are healing"
    },
    "2.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The name of the health that receives the heal"
    },
    "3.0": {
      "@K[209]": "HealAmount",
      "@K[211]": "How much we are healing"
    },
    "4.0": {
      "@K[209]": "IsPercent",
      "@K[211]": "Is the HealAmount represented as a percentage?"
    }
  },
  "@K[203]": "Send a message to heal a specific health in the object."
}
```

</details>

## GameScript.Game.HideAllHUD

```lua
GameScript.Game.HideAllHUD()
```

Источник: [Lua, строка 2261](../../luasense_decompiled.lua#L2261). Имена `argN` — placeholders реконструкции.

Hide all HUD.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Hide all HUD."
}
```

</details>

## GameScript.Game.HideObject

```lua
GameScript.Game.HideObject(arg1, arg2)
```

Источник: [Lua, строка 2264](../../luasense_decompiled.lua#L2264). Имена `argN` — placeholders реконструкции.

Show or hide the specified object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are showing/hiding |
| 2.0 | ShouldHide | Hide object = true, show object = false |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are showing/hiding"
    },
    "2.0": {
      "@K[209]": "ShouldHide",
      "@K[211]": "Hide object = true, show object = false"
    }
  },
  "@K[203]": "Show or hide the specified object."
}
```

</details>

## GameScript.Game.HidePlayerView

```lua
GameScript.Game.HidePlayerView()
```

Источник: [Lua, строка 2267](../../luasense_decompiled.lua#L2267). Имена `argN` — placeholders реконструкции.

Tells MenuMgr to remove the mask on the HUD that obstructs the player camera view

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Tells MenuMgr to remove the mask on the HUD that obstructs the player camera view"
}
```

</details>

## GameScript.Game.IsActiveCoverOn

```lua
GameScript.Game.IsActiveCoverOn(arg1)
```

Источник: [Lua, строка 2270](../../luasense_decompiled.lua#L2270). Имена `argN` — placeholders реконструкции.

Tests whether an object is currently in active cover

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are checking the active cover status of |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are checking the active cover status of"
    }
  },
  "@K[203]": "Tests whether an object is currently in active cover"
}
```

</details>

## GameScript.Game.IsAirborne

```lua
GameScript.Game.IsAirborne(arg1)
```

Источник: [Lua, строка 2273](../../luasense_decompiled.lua#L2273). Имена `argN` — placeholders реконструкции.

Tests whether an object is currently airborne

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are checking the airborne status of |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are checking the airborne status of"
    }
  },
  "@K[203]": "Tests whether an object is currently airborne"
}
```

</details>

## GameScript.Game.IsCrouched

```lua
GameScript.Game.IsCrouched(arg1)
```

Источник: [Lua, строка 2276](../../luasense_decompiled.lua#L2276). Имена `argN` — placeholders реконструкции.

Tests whether an object is currently crouched, only works for personPhysics object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are checking the crouch status of |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are checking the crouch status of"
    }
  },
  "@K[203]": "Tests whether an object is currently crouched, only works for personPhysics object"
}
```

</details>

## GameScript.Game.IsDestructibleInFinalState

```lua
GameScript.Game.IsDestructibleInFinalState(arg1)
```

Источник: [Lua, строка 2279](../../luasense_decompiled.lua#L2279). Имена `argN` — placeholders реконструкции.

Returns whether the destructible object is in its final state

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing DestructibleObjectControlComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing DestructibleObjectControlComponent"
    }
  },
  "@K[203]": "Returns whether the destructible object is in its final state"
}
```

</details>

## GameScript.Game.IsDestructibleInInitialState

```lua
GameScript.Game.IsDestructibleInInitialState(arg1)
```

Источник: [Lua, строка 2282](../../luasense_decompiled.lua#L2282). Имена `argN` — placeholders реконструкции.

Returns whether the destructible object is in its initial state

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing DestructibleObjectControlComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing DestructibleObjectControlComponent"
    }
  },
  "@K[203]": "Returns whether the destructible object is in its initial state"
}
```

</details>

## GameScript.Game.IsEnabled

```lua
GameScript.Game.IsEnabled(arg1)
```

Источник: [Lua, строка 2285](../../luasense_decompiled.lua#L2285). Имена `argN` — placeholders реконструкции.

Tests whether an IEnableable component is currently enabled

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
  "@K[203]": "Tests whether an IEnableable component is currently enabled"
}
```

</details>

## GameScript.Game.IsJumping

```lua
GameScript.Game.IsJumping(arg1)
```

Источник: [Lua, строка 2288](../../luasense_decompiled.lua#L2288). Имена `argN` — placeholders реконструкции.

Tests whether an object is currently jumping

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are checking the jumping status of |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are checking the jumping status of"
    }
  },
  "@K[203]": "Tests whether an object is currently jumping"
}
```

</details>

## GameScript.Game.IsLoaded

```lua
GameScript.Game.IsLoaded(arg1)
```

Источник: [Lua, строка 2291](../../luasense_decompiled.lua#L2291). Имена `argN` — placeholders реконструкции.

Checks if the empire object exists

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | Object for which we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "Object for which we are checking"
    }
  },
  "@K[203]": "Checks if the empire object exists"
}
```

</details>

## GameScript.Game.IsNeutral

```lua
GameScript.Game.IsNeutral(arg1)
```

Источник: [Lua, строка 2294](../../luasense_decompiled.lua#L2294). Имена `argN` — placeholders реконструкции.

Checks nation settings to if the two objects are enemies. See also: AreAllies(), AreEnemies(),CopyNation()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are checking neutrality |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are checking neutrality"
    }
  },
  "@K[203]": "Checks nation settings to if the two objects are enemies. See also: AreAllies(), AreEnemies(),CopyNation()"
}
```

</details>

## GameScript.Game.IsObjectInState

```lua
GameScript.Game.IsObjectInState(arg1, arg2)
```

Источник: [Lua, строка 2297](../../luasense_decompiled.lua#L2297). Имена `argN` — placeholders реконструкции.

Returns true if the specified object is in the given state, false if it is not or the object has no ObjectState component

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The object whose state we are checking |
| 2.0 | State | The ObjectState we are checking for |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The object whose state we are checking"
    },
    "2.0": {
      "@K[209]": "State",
      "@K[211]": "The ObjectState we are checking for"
    }
  },
  "@K[203]": "Returns true if the specified object is in the given state, false if it is not or the object has no ObjectState component"
}
```

</details>

## GameScript.Game.IsPauseMenuShowing

```lua
GameScript.Game.IsPauseMenuShowing()
```

Источник: [Lua, строка 2300](../../luasense_decompiled.lua#L2300). Имена `argN` — placeholders реконструкции.

Returns true if the pause menu is currently being displayed.


<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns true if the pause menu is currently being displayed.\n"
}
```

</details>

## GameScript.Game.IsPlayerLookRotFacingObject

```lua
GameScript.Game.IsPlayerLookRotFacingObject(arg1, arg2, arg3)
```

Источник: [Lua, строка 2303](../../luasense_decompiled.lua#L2303). Имена `argN` — placeholders реконструкции.

Returns whether or not a player is facing a target object. Even though this function is grouped with the camera-relative functions, this one does not use the player cameras. This is because the function was written primarily for multiplayer and remote player avatars do not have cameras. Therefore, we must use the avatar's LookRotation Component to approximate if it is facing the object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | Index for player being tested for target in view. |
| 2.0 | TargetObject | The empireObject for which we are checking in player view |
| 3.0 | MaxAngle | The maximum angle between the player's LookRot and object position |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "Index for player being tested for target in view."
    },
    "2.0": {
      "@K[209]": "TargetObject",
      "@K[211]": "The empireObject for which we are checking in player view"
    },
    "3.0": {
      "@K[209]": "MaxAngle",
      "@K[211]": "The maximum angle between the player's LookRot and object position"
    }
  },
  "@K[203]": "Returns whether or not a player is facing a target object. Even though this function is grouped with the camera-relative functions, this one does not use the player cameras. This is because the function was written primarily for multiplayer and remote player avatars do not have cameras. Therefore, we must use the avatar's LookRotation Component to approximate if it is facing the object."
}
```

</details>

## GameScript.Game.IsPossessed

```lua
GameScript.Game.IsPossessed(arg1)
```

Источник: [Lua, строка 2306](../../luasense_decompiled.lua#L2306). Имена `argN` — placeholders реконструкции.

Checks whether an object is possessed or not

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that to check if it is possessed |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that to check if it is possessed"
    }
  },
  "@K[203]": "Checks whether an object is possessed or not"
}
```

</details>

## GameScript.Game.IsRiding

```lua
GameScript.Game.IsRiding(arg1)
```

Источник: [Lua, строка 2309](../../luasense_decompiled.lua#L2309). Имена `argN` — placeholders реконструкции.

Tests whether an object is currently riding

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are checking the riding status of |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are checking the riding status of"
    }
  },
  "@K[203]": "Tests whether an object is currently riding"
}
```

</details>

## GameScript.Game.IsSuspended

```lua
GameScript.Game.IsSuspended(arg1)
```

Источник: [Lua, строка 2312](../../luasense_decompiled.lua#L2312). Имена `argN` — placeholders реконструкции.

Tests whether an object is currently suspended

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are checking the suspend status of |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are checking the suspend status of"
    }
  },
  "@K[203]": "Tests whether an object is currently suspended"
}
```

</details>

## GameScript.Game.Kill

```lua
GameScript.Game.Kill(arg1, arg2)
```

Источник: [Lua, строка 2315](../../luasense_decompiled.lua#L2315). Имена `argN` — placeholders реконструкции.

Send a message to kill the object with certain options.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are killing |
| 2.0 | KillType | How to kill, 0, delete instantly, 1 kill with destruction effects, 2 allow death 'prolog' |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are killing"
    },
    "2.0": {
      "@K[209]": "KillType",
      "@K[211]": "How to kill, 0, delete instantly, 1 kill with destruction effects, 2 allow death 'prolog'"
    }
  },
  "@K[203]": "Send a message to kill the object with certain options."
}
```

</details>

## GameScript.Game.KillAllObjectsInWeaponInventory

```lua
GameScript.Game.KillAllObjectsInWeaponInventory()
```

Источник: [Lua, строка 2317](../../luasense_decompiled.lua#L2317). Имена `argN` — placeholders реконструкции.

<details><summary>Исходная структура call-tip</summary>

```json
{}
```

</details>

## GameScript.Game.OverRideRotateSceneObjectComponent

```lua
GameScript.Game.OverRideRotateSceneObjectComponent(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2431](../../luasense_decompiled.lua#L2431). Имена `argN` — placeholders реконструкции.

Over ride the settings on a RotateSceneObject component so the start time is immediately, and the current speed is reset, and use the new acceleration until the duration is over.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the RotateScenObject component |
| 2.0 | Speed | Table with a r,p,h fields for speed in degrees per second for each axis |
| 3.0 | Acceleration | Table with a r,p,h fields for acceleration in degrees per second per second for each axis |
| 4.0 | MaxSpeed | Table with a r,p,h fields for maxSpeed in degrees per second for each axis |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the RotateScenObject component"
    },
    "2.0": {
      "@K[209]": "Speed",
      "@K[211]": "Table with a r,p,h fields for speed in degrees per second for each axis"
    },
    "3.0": {
      "@K[209]": "Acceleration",
      "@K[211]": "Table with a r,p,h fields for acceleration in degrees per second per second for each axis"
    },
    "4.0": {
      "@K[209]": "MaxSpeed",
      "@K[211]": "Table with a r,p,h fields for maxSpeed in degrees per second for each axis"
    }
  },
  "@K[203]": "Over ride the settings on a RotateSceneObject component so the start time is immediately, and the current speed is reset, and use the new acceleration until the duration is over."
}
```

</details>

## GameScript.Game.RemoveAnimationGraphResource

```lua
GameScript.Game.RemoveAnimationGraphResource(arg1)
```

Источник: [Lua, строка 2767](../../luasense_decompiled.lua#L2767). Имена `argN` — placeholders реконструкции.

Gradually revert an object back to its original animation graph with the standard transition time(0.2 seconds).

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are removing the graph of. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are removing the graph of."
    }
  },
  "@K[203]": "Gradually revert an object back to its original animation graph with the standard transition time(0.2 seconds)."
}
```

</details>

## GameScript.Game.RemoveAnimationGraphResourceOverTime

```lua
GameScript.Game.RemoveAnimationGraphResourceOverTime(arg1, arg2)
```

Источник: [Lua, строка 2770](../../luasense_decompiled.lua#L2770). Имена `argN` — placeholders реконструкции.

Gradually revert an object back to its original animation graph with a custom transition time.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are removing the graph of. |
| 2.0 | TransitionTime | Transition time(in seconds). |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are removing the graph of."
    },
    "2.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "Transition time(in seconds)."
    }
  },
  "@K[203]": "Gradually revert an object back to its original animation graph with a custom transition time."
}
```

</details>

## GameScript.Game.RemoveStatusEffect

```lua
GameScript.Game.RemoveStatusEffect(arg1, arg2)
```

Источник: [Lua, строка 2773](../../luasense_decompiled.lua#L2773). Имена `argN` — placeholders реконструкции.

Removes a status effect from an object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EffectObject | The object with the status to apple to the other object. |
| 2.0 | ObjectToAffect | The object have the status affect removed from. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EffectObject",
      "@K[211]": "The object with the status to apple to the other object."
    },
    "2.0": {
      "@K[209]": "ObjectToAffect",
      "@K[211]": "The object have the status affect removed from."
    }
  },
  "@K[203]": "Removes a status effect from an object."
}
```

</details>

## GameScript.Game.RestoreCheckpointAnimGraph

```lua
GameScript.Game.RestoreCheckpointAnimGraph(arg1, arg2, arg3)
```

Источник: [Lua, строка 2776](../../luasense_decompiled.lua#L2776). Имена `argN` — placeholders реконструкции.

Gradually revert an object back to its original animation graph with a custom transition time.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are removing the graph of. |
| 2.0 | RegisteredAnimGraphTextID | The name set for the registered animation graph resource. |
| 3.0 | TransitionTime | Transition time(in seconds). |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are removing the graph of."
    },
    "2.0": {
      "@K[209]": "RegisteredAnimGraphTextID",
      "@K[211]": "The name set for the registered animation graph resource."
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "Transition time(in seconds)."
    }
  },
  "@K[203]": "Gradually revert an object back to its original animation graph with a custom transition time."
}
```

</details>

## GameScript.Game.RippleWater

```lua
GameScript.Game.RippleWater(arg1, arg2)
```

Источник: [Lua, строка 2779](../../luasense_decompiled.lua#L2779). Имена `argN` — placeholders реконструкции.

Allows an object to cause ripples in a water object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | WaterObject | The water object containing a Rippling Water component. |
| 2.0 | RipplingObject | The object causing ripples in the water. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "WaterObject",
      "@K[211]": "The water object containing a Rippling Water component."
    },
    "2.0": {
      "@K[209]": "RipplingObject",
      "@K[211]": "The object causing ripples in the water."
    }
  },
  "@K[203]": "Allows an object to cause ripples in a water object."
}
```

</details>

## GameScript.Game.RippleWaterAtNode

```lua
GameScript.Game.RippleWaterAtNode(arg1, arg2, arg3)
```

Источник: [Lua, строка 2782](../../luasense_decompiled.lua#L2782). Имена `argN` — placeholders реконструкции.

Allows an object to cause ripples in a water object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | WaterObject | The water object containing a Rippling Water component. |
| 2.0 | RipplingObject | The object causing ripples in the water. |
| 3.0 | SceneNodeName | The scene node in the object causing the ripple |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "WaterObject",
      "@K[211]": "The water object containing a Rippling Water component."
    },
    "2.0": {
      "@K[209]": "RipplingObject",
      "@K[211]": "The object causing ripples in the water."
    },
    "3.0": {
      "@K[209]": "SceneNodeName",
      "@K[211]": "The scene node in the object causing the ripple"
    }
  },
  "@K[203]": "Allows an object to cause ripples in a water object."
}
```

</details>

## GameScript.Game.RunCutscene

```lua
GameScript.Game.RunCutscene(arg1, arg2, arg3)
```

Источник: [Lua, строка 2785](../../luasense_decompiled.lua#L2785). Имена `argN` — placeholders реконструкции.

Start a cutscene

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The EmpireObject that contains the CutsceneComponent we want to use |
| 2.0 | PrimaryIndex | Treat this player as Primary player in cutscene |
| 3.0 | SecondaryIndex | Treat this player as Secondary player in cutscene |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The EmpireObject that contains the CutsceneComponent we want to use"
    },
    "2.0": {
      "@K[209]": "PrimaryIndex",
      "@K[211]": "Treat this player as Primary player in cutscene"
    },
    "3.0": {
      "@K[209]": "SecondaryIndex",
      "@K[211]": "Treat this player as Secondary player in cutscene"
    }
  },
  "@K[203]": "Start a cutscene"
}
```

</details>

## GameScript.Game.SaveGame

```lua
GameScript.Game.SaveGame()
```

Источник: [Lua, строка 2788](../../luasense_decompiled.lua#L2788). Имена `argN` — placeholders реконструкции.

Saves the game in the current state, if possible

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Saves the game in the current state, if possible"
}
```

</details>

## GameScript.Game.SelectInventory

```lua
GameScript.Game.SelectInventory(arg1, arg2, arg3)
```

Источник: [Lua, строка 2791](../../luasense_decompiled.lua#L2791). Имена `argN` — placeholders реконструкции.

Select a specific group in a specific Inventory.  Negative group number to select the next group.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to switch inventory |
| 2.0 | InventoryType | The Inventory Component.  enum defined GameScript.InventoryType |
| 3.0 | GroupIndex | Index of the group to select. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to switch inventory"
    },
    "2.0": {
      "@K[209]": "InventoryType",
      "@K[211]": "The Inventory Component.  enum defined GameScript.InventoryType"
    },
    "3.0": {
      "@K[209]": "GroupIndex",
      "@K[211]": "Index of the group to select."
    }
  },
  "@K[203]": "Select a specific group in a specific Inventory.  Negative group number to select the next group."
}
```

</details>

## GameScript.Game.SendCutsceneStopLoopMessage

```lua
GameScript.Game.SendCutsceneStopLoopMessage(arg1)
```

Источник: [Lua, строка 2794](../../luasense_decompiled.lua#L2794). Имена `argN` — placeholders реконструкции.

Sends a message to a looping cutscene to continue to its end property time

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object containing CutsceneComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object containing CutsceneComponent"
    }
  },
  "@K[203]": "Sends a message to a looping cutscene to continue to its end property time"
}
```

</details>

## GameScript.Game.SendGameEventMessage

```lua
GameScript.Game.SendGameEventMessage(arg1, arg2, arg3)
```

Источник: [Lua, строка 2797](../../luasense_decompiled.lua#L2797). Имена `argN` — placeholders реконструкции.

Send a game event message to be shown on the HUD.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MessageStaticText | The static text id of the message to be send as a game event. |
| 2.0 | SubjectPlayerIndex | Index for player who is subject of game event text. |
| 3.0 | DirectObjectPlayerIndex | Index for player who is direct object of game event text. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MessageStaticText",
      "@K[211]": "The static text id of the message to be send as a game event."
    },
    "2.0": {
      "@K[209]": "SubjectPlayerIndex",
      "@K[211]": "Index for player who is subject of game event text."
    },
    "3.0": {
      "@K[209]": "DirectObjectPlayerIndex",
      "@K[211]": "Index for player who is direct object of game event text."
    }
  },
  "@K[203]": "Send a game event message to be shown on the HUD."
}
```

</details>

## GameScript.Game.SendKillMessage

```lua
GameScript.Game.SendKillMessage(arg1, arg2)
```

Источник: [Lua, строка 2800](../../luasense_decompiled.lua#L2800). Имена `argN` — placeholders реконструкции.

Send a message to kill the object with certain options.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are killing |
| 2.0 | KillType | How to kill, 0, delete instantly, 1 kill with destruction effects, 2 allow death 'prolog' |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are killing"
    },
    "2.0": {
      "@K[209]": "KillType",
      "@K[211]": "How to kill, 0, delete instantly, 1 kill with destruction effects, 2 allow death 'prolog'"
    }
  },
  "@K[203]": "Send a message to kill the object with certain options."
}
```

</details>

## GameScript.Game.SendMissionEventMessage

```lua
GameScript.Game.SendMissionEventMessage(arg1, arg2)
```

Источник: [Lua, строка 2803](../../luasense_decompiled.lua#L2803). Имена `argN` — placeholders реконструкции.

Send a mission-specific event message only to the target object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are sending the message to. |
| 2.0 | MessageText | The text ID of the message. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are sending the message to."
    },
    "2.0": {
      "@K[209]": "MessageText",
      "@K[211]": "The text ID of the message."
    }
  },
  "@K[203]": "Send a mission-specific event message only to the target object."
}
```

</details>

## GameScript.Game.SendTextMessage

```lua
GameScript.Game.SendTextMessage(arg1, arg2)
```

Источник: [Lua, строка 2806](../../luasense_decompiled.lua#L2806). Имена `argN` — placeholders реконструкции.

Send "MessageText" to the EmpireObject.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to which we are sending a text message. |
| 2.0 | MessageText | The text of the message for which we are send |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to which we are sending a text message."
    },
    "2.0": {
      "@K[209]": "MessageText",
      "@K[211]": "The text of the message for which we are send"
    }
  },
  "@K[203]": "Send \"MessageText\" to the EmpireObject."
}
```

</details>

## GameScript.Game.SetAnimGraphResource

```lua
GameScript.Game.SetAnimGraphResource(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2809](../../luasense_decompiled.lua#L2809). Имена `argN` — placeholders реконструкции.

Gradually transition an object to a new animation graph with the a transition time and specify if you want to save the graph resource settings when hitting a checkpoint, and restore them on checkpoint reload..

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are sending the resource to. |
| 2.0 | RegisteredAnimGraphTextID | The name set for the registered animation graph resource. |
| 3.0 | TransitionTime | Transition time(in seconds). |
| 4.0 | CheckpointEnable | Enable the graph to be save/load with checkpoints. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are sending the resource to."
    },
    "2.0": {
      "@K[209]": "RegisteredAnimGraphTextID",
      "@K[211]": "The name set for the registered animation graph resource."
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "Transition time(in seconds)."
    },
    "4.0": {
      "@K[209]": "CheckpointEnable",
      "@K[211]": "Enable the graph to be save/load with checkpoints."
    }
  },
  "@K[203]": "Gradually transition an object to a new animation graph with the a transition time and specify if you want to save the graph resource settings when hitting a checkpoint, and restore them on checkpoint reload.."
}
```

</details>

## GameScript.Game.SetAnimVarWeaponTypeFromInventory

```lua
GameScript.Game.SetAnimVarWeaponTypeFromInventory(arg1)
```

Источник: [Lua, строка 2812](../../luasense_decompiled.lua#L2812). Имена `argN` — placeholders реконструкции.

Set the owner of the object to the object specified via the OwnerObjectMessage.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we wish to query for Weapon Type and set the corresponding animation variable |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we wish to query for Weapon Type and set the corresponding animation variable"
    }
  },
  "@K[203]": "Set the owner of the object to the object specified via the OwnerObjectMessage."
}
```

</details>

## GameScript.Game.SetAnimationGraphResource

```lua
GameScript.Game.SetAnimationGraphResource(arg1, arg2)
```

Источник: [Lua, строка 2815](../../luasense_decompiled.lua#L2815). Имена `argN` — placeholders реконструкции.

Gradually transition an object to a new animation graph with the standard transition time(0.2 seconds). See also SetAnimGraphResource.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are sending the resource to. |
| 2.0 | RegisteredAnimGraphTextID | The name set for the registered animation graph resource. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are sending the resource to."
    },
    "2.0": {
      "@K[209]": "RegisteredAnimGraphTextID",
      "@K[211]": "The name set for the registered animation graph resource."
    }
  },
  "@K[203]": "Gradually transition an object to a new animation graph with the standard transition time(0.2 seconds). See also SetAnimGraphResource."
}
```

</details>

## GameScript.Game.SetAnimationGraphResourceOverTime

```lua
GameScript.Game.SetAnimationGraphResourceOverTime(arg1, arg2, arg3)
```

Источник: [Lua, строка 2818](../../luasense_decompiled.lua#L2818). Имена `argN` — placeholders реконструкции.

Gradually transition an object to a new animation graph with a custom transition time. See Also SetAnimGraphResource

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are sending the resource to. |
| 2.0 | RegisteredAnimGraphTextID | The name set for the registered animation graph resource. |
| 3.0 | TransitionTime | Transition time(in seconds). |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are sending the resource to."
    },
    "2.0": {
      "@K[209]": "RegisteredAnimGraphTextID",
      "@K[211]": "The name set for the registered animation graph resource."
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "Transition time(in seconds)."
    }
  },
  "@K[203]": "Gradually transition an object to a new animation graph with a custom transition time. See Also SetAnimGraphResource"
}
```

</details>

## GameScript.Game.SetAnimationVariable

```lua
GameScript.Game.SetAnimationVariable(arg1, arg2, arg3)
```

Источник: [Lua, строка 2821](../../luasense_decompiled.lua#L2821). Имена `argN` — placeholders реконструкции.

Set the value for an animation variable by name.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object for which we are setting a variable. |
| 2.0 | AnimationVariable | The name of the animation variable that we are setting. |
| 3.0 | AnimationValue | The value that we are setting for the animation variable. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object for which we are setting a variable."
    },
    "2.0": {
      "@K[209]": "AnimationVariable",
      "@K[211]": "The name of the animation variable that we are setting."
    },
    "3.0": {
      "@K[209]": "AnimationValue",
      "@K[211]": "The value that we are setting for the animation variable."
    }
  },
  "@K[203]": "Set the value for an animation variable by name."
}
```

</details>

## GameScript.Game.SetCurrentLevel

```lua
GameScript.Game.SetCurrentLevel(arg1)
```

Источник: [Lua, строка 2824](../../luasense_decompiled.lua#L2824). Имена `argN` — placeholders реконструкции.

Used by player profiles to determine what the player's current chapter is. Primarily used for restart chapter and resume game. This function must be called on both host and clients. See also: CompleteCurrentLevel()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CurrentLevel | (DEPRECATED) The mission progression order of the current level as set in the Level List Global Data component.  |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CurrentLevel",
      "@K[211]": "(DEPRECATED) The mission progression order of the current level as set in the Level List Global Data component. "
    }
  },
  "@K[203]": "Used by player profiles to determine what the player's current chapter is. Primarily used for restart chapter and resume game. This function must be called on both host and clients. See also: CompleteCurrentLevel()"
}
```

</details>

## GameScript.Game.SetCurrentLevelId

```lua
GameScript.Game.SetCurrentLevelId(arg1)
```

Источник: [Lua, строка 2827](../../luasense_decompiled.lua#L2827). Имена `argN` — placeholders реконструкции.

Used by player profiles to determine what the player's current chapter is. Primarily used for restart chapter and resume game. This function must be called on both host and clients. See also: CompleteCurrentLevel()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CurrentLevelEnum | The mission ID of the current level as set in the Level List Global Data component.  |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CurrentLevelEnum",
      "@K[211]": "The mission ID of the current level as set in the Level List Global Data component. "
    }
  },
  "@K[203]": "Used by player profiles to determine what the player's current chapter is. Primarily used for restart chapter and resume game. This function must be called on both host and clients. See also: CompleteCurrentLevel()"
}
```

</details>

## GameScript.Game.SetCurrentTotalAmmoPercent

```lua
GameScript.Game.SetCurrentTotalAmmoPercent(arg1, arg2)
```

Источник: [Lua, строка 2830](../../luasense_decompiled.lua#L2830). Имена `argN` — placeholders реконструкции.

Sets the ammo percent used by the passed in weapon.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are setting neutral |
| 2.0 | AmmoPercent | The ammo percent to set the weapon to. Must be between 0 - 1 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are setting neutral"
    },
    "2.0": {
      "@K[209]": "AmmoPercent",
      "@K[211]": "The ammo percent to set the weapon to. Must be between 0 - 1"
    }
  },
  "@K[203]": "Sets the ammo percent used by the passed in weapon."
}
```

</details>

## GameScript.Game.SetGameFailed

```lua
GameScript.Game.SetGameFailed()
```

Источник: [Lua, строка 2833](../../luasense_decompiled.lua#L2833). Имена `argN` — placeholders реконструкции.

Sends a game failed (or MP game over) message.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Sends a game failed (or MP game over) message."
}
```

</details>

## GameScript.Game.SetGameWon

```lua
GameScript.Game.SetGameWon()
```

Источник: [Lua, строка 2836](../../luasense_decompiled.lua#L2836). Имена `argN` — placeholders реконструкции.

Sends a game won (or MP game over) message.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Sends a game won (or MP game over) message."
}
```

</details>

## GameScript.Game.SetHitPointPercent

```lua
GameScript.Game.SetHitPointPercent(arg1, arg2)
```

Источник: [Lua, строка 2839](../../luasense_decompiled.lua#L2839). Имена `argN` — placeholders реконструкции.

Sets the health of an object to the specified percentage (given as a decimal in the range of 0 to 1). For objects with hit point controllers, it will overwrite all hit point values, filling up the lowest priority components first.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object whose health we are setting |
| 2.0 | Percent | The new percentage of the object's total health |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object whose health we are setting"
    },
    "2.0": {
      "@K[209]": "Percent",
      "@K[211]": "The new percentage of the object's total health"
    }
  },
  "@K[203]": "Sets the health of an object to the specified percentage (given as a decimal in the range of 0 to 1). For objects with hit point controllers, it will overwrite all hit point values, filling up the lowest priority components first."
}
```

</details>

## GameScript.Game.SetHitPointPriorityInvulnerable

```lua
GameScript.Game.SetHitPointPriorityInvulnerable(arg1, arg2, arg3)
```

Источник: [Lua, строка 2842](../../luasense_decompiled.lua#L2842). Имена `argN` — placeholders реконструкции.

Turn a single Hit Point component invulnerable as considered by the hit point controller

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are searching for a SetHitPointPriorityInvulnerable. |
| 2.0 | Priority | The slot number as defined in HitPointControllerComponent |
| 3.0 | Invulnerable | True - this level absorbs all damage while also not reducing in value |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are searching for a SetHitPointPriorityInvulnerable."
    },
    "2.0": {
      "@K[209]": "Priority",
      "@K[211]": "The slot number as defined in HitPointControllerComponent"
    },
    "3.0": {
      "@K[209]": "Invulnerable",
      "@K[211]": "True - this level absorbs all damage while also not reducing in value"
    }
  },
  "@K[203]": "Turn a single Hit Point component invulnerable as considered by the hit point controller"
}
```

</details>

## GameScript.Game.SetLookDirection

```lua
GameScript.Game.SetLookDirection(arg1, arg2)
```

Источник: [Lua, строка 2845](../../luasense_decompiled.lua#L2845). Имена `argN` — placeholders реконструкции.

Set the look direction of the object to the roll, pitch and heading specified.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are teleporting |
| 2.0 | RollPitchHeading | RollPitchHeading(degrees) for the object when teleported.This is a RPH vector, so it needs to be a table with an r, p, and h field. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are teleporting"
    },
    "2.0": {
      "@K[209]": "RollPitchHeading",
      "@K[211]": "RollPitchHeading(degrees) for the object when teleported.This is a RPH vector, so it needs to be a table with an r, p, and h field."
    }
  },
  "@K[203]": "Set the look direction of the object to the roll, pitch and heading specified."
}
```

</details>

## GameScript.Game.SetNeutral

```lua
GameScript.Game.SetNeutral(arg1, arg2)
```

Источник: [Lua, строка 2848](../../luasense_decompiled.lua#L2848). Имена `argN` — placeholders реконструкции.

Set the flag that makes an object neutral or not.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are setting neutral |
| 2.0 | bNeutral | Whether or not it will be neutral. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are setting neutral"
    },
    "2.0": {
      "@K[209]": "bNeutral",
      "@K[211]": "Whether or not it will be neutral."
    }
  },
  "@K[203]": "Set the flag that makes an object neutral or not."
}
```

</details>

## GameScript.Game.SetOwnerObject

```lua
GameScript.Game.SetOwnerObject(arg1, arg2, arg3)
```

Источник: [Lua, строка 2851](../../luasense_decompiled.lua#L2851). Имена `argN` — placeholders реконструкции.

Set the owner of the object to the object specified via the OwnerObjectMessage.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object owner |
| 2.0 | EmpireObject | The object to be owned |
| 3.0 | IsAI | Is the object owner a AI? |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object owner"
    },
    "2.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to be owned"
    },
    "3.0": {
      "@K[209]": "IsAI",
      "@K[211]": "Is the object owner a AI?"
    }
  },
  "@K[203]": "Set the owner of the object to the object specified via the OwnerObjectMessage."
}
```

</details>

## GameScript.Game.SetPersonMaxSpeed

```lua
GameScript.Game.SetPersonMaxSpeed(arg1, arg2)
```

Источник: [Lua, строка 2854](../../luasense_decompiled.lua#L2854). Имена `argN` — placeholders реконструкции.

Set the maximum type of speed that a character can move at (walk, run, sprints, etc...)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PersonObject | The object to limit the speed of |
| 2.0 | SpeedType | The speed at which to limit the person too (walk, run, sprint) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PersonObject",
      "@K[211]": "The object to limit the speed of"
    },
    "2.0": {
      "@K[209]": "SpeedType",
      "@K[211]": "The speed at which to limit the person too (walk, run, sprint)"
    }
  },
  "@K[203]": "Set the maximum type of speed that a character can move at (walk, run, sprints, etc...)"
}
```

</details>

## GameScript.Game.SetPlayerSpawnIndex

```lua
GameScript.Game.SetPlayerSpawnIndex(arg1, arg2)
```

Источник: [Lua, строка 2857](../../luasense_decompiled.lua#L2857). Имена `argN` — placeholders реконструкции.

Sets the spawn index of the given player

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | Index of the player whose spawn index we want to change |
| 2.0 | SpawnIndex | The new spawn index for the player |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "Index of the player whose spawn index we want to change"
    },
    "2.0": {
      "@K[209]": "SpawnIndex",
      "@K[211]": "The new spawn index for the player"
    }
  },
  "@K[203]": "Sets the spawn index of the given player"
}
```

</details>

## GameScript.Game.SetPlayersStartedLevel

```lua
GameScript.Game.SetPlayersStartedLevel()
```

Источник: [Lua, строка 2860](../../luasense_decompiled.lua#L2860). Имена `argN` — placeholders реконструкции.

Sets the "has started level" flag on all players. This function is NOT net-synced and needs to be called on both host and clients. This function should be called as soon as a level starts, or at least before the first checkpoint in a level

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Sets the \"has started level\" flag on all players. This function is NOT net-synced and needs to be called on both host and clients. This function should be called as soon as a level starts, or at least before the first checkpoint in a level"
}
```

</details>

## GameScript.Game.SetRegeneratingHPDelay

```lua
GameScript.Game.SetRegeneratingHPDelay(arg1, arg2)
```

Источник: [Lua, строка 2863](../../luasense_decompiled.lua#L2863). Имена `argN` — placeholders реконструкции.

Takes a component handle to an "IRegeneratingHitPointComponent" and overrides the current regen delay on it

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ComponentHandle | The handle to the component from RegisterComponentHandle() |
| 2.0 | Delay | Number of seconds until regen can restart |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ComponentHandle",
      "@K[211]": "The handle to the component from RegisterComponentHandle()"
    },
    "2.0": {
      "@K[209]": "Delay",
      "@K[211]": "Number of seconds until regen can restart"
    }
  },
  "@K[203]": "Takes a component handle to an \"IRegeneratingHitPointComponent\" and overrides the current regen delay on it"
}
```

</details>

## GameScript.Game.SetSprint

```lua
GameScript.Game.SetSprint(arg1, arg2)
```

Источник: [Lua, строка 2866](../../luasense_decompiled.lua#L2866). Имена `argN` — placeholders реконструкции.

Force sprint to turn on or off

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are cause to stop/start sprint |
| 2.0 | SprintEnabled | True means turn sprint on, false to turn off |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are cause to stop/start sprint"
    },
    "2.0": {
      "@K[209]": "SprintEnabled",
      "@K[211]": "True means turn sprint on, false to turn off"
    }
  },
  "@K[203]": "Force sprint to turn on or off"
}
```

</details>

## GameScript.Game.SetWorldsAsSavable

```lua
GameScript.Game.SetWorldsAsSavable(arg1)
```

Источник: [Lua, строка 2869](../../luasense_decompiled.lua#L2869). Имена `argN` — placeholders реконструкции.

Sets the given list of worlds as savable, meaning that their states will be saved if they are streamed out so they can be restored if streamed back in. Each call of this function will invalidate the previous world list.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireWorlds | The list of worlds to set as savable |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireWorlds",
      "@K[211]": "The list of worlds to set as savable"
    }
  },
  "@K[203]": "Sets the given list of worlds as savable, meaning that their states will be saved if they are streamed out so they can be restored if streamed back in. Each call of this function will invalidate the previous world list."
}
```

</details>

## GameScript.Game.ShowChallengeSummaryScreen

```lua
GameScript.Game.ShowChallengeSummaryScreen()
```

Источник: [Lua, строка 2890](../../luasense_decompiled.lua#L2890). Имена `argN` — placeholders реконструкции.

Displays the challenge summary screen. Returns true if the screen is displayed, else returns false.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Displays the challenge summary screen. Returns true if the screen is displayed, else returns false."
}
```

</details>

## GameScript.Game.ShowFullscreenMovie

```lua
GameScript.Game.ShowFullscreenMovie(arg1, arg2, arg3)
```

Источник: [Lua, строка 2893](../../luasense_decompiled.lua#L2893). Имена `argN` — placeholders реконструкции.

Plays a full-screen movie

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Movie | The script name of the movie resource |
| 2.0 | bSkippable | Whether or not this movie can be skipped |
| 3.0 | bPauseGame | Whether or not this movie should pause the game clock. WARNING: some systems will not update while the game clock is paused!!! |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Movie",
      "@K[211]": "The script name of the movie resource"
    },
    "2.0": {
      "@K[209]": "bSkippable",
      "@K[211]": "Whether or not this movie can be skipped"
    },
    "3.0": {
      "@K[209]": "bPauseGame",
      "@K[211]": "Whether or not this movie should pause the game clock. WARNING: some systems will not update while the game clock is paused!!!"
    }
  },
  "@K[203]": "Plays a full-screen movie"
}
```

</details>

## GameScript.Game.ShowFullscreenMovieWithMenu

```lua
GameScript.Game.ShowFullscreenMovieWithMenu(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2896](../../luasense_decompiled.lua#L2896). Имена `argN` — placeholders реконструкции.

Plays a full-screen movie

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Movie | The script name of the movie resource |
| 2.0 | bSkippable | Whether or not this movie can be skipped |
| 3.0 | bPauseGame | Whether or not this movie should pause the game clock. WARNING: some systems will not update while the game clock is paused!!! |
| 4.0 | Menu | The script name of the menu resource |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Movie",
      "@K[211]": "The script name of the movie resource"
    },
    "2.0": {
      "@K[209]": "bSkippable",
      "@K[211]": "Whether or not this movie can be skipped"
    },
    "3.0": {
      "@K[209]": "bPauseGame",
      "@K[211]": "Whether or not this movie should pause the game clock. WARNING: some systems will not update while the game clock is paused!!!"
    },
    "4.0": {
      "@K[209]": "Menu",
      "@K[211]": "The script name of the menu resource"
    }
  },
  "@K[203]": "Plays a full-screen movie"
}
```

</details>

## GameScript.Game.ShowFullscreenMovieWithMenuAndNode

```lua
GameScript.Game.ShowFullscreenMovieWithMenuAndNode(arg1, arg2, arg3, arg4, arg5)
```

Источник: [Lua, строка 2899](../../luasense_decompiled.lua#L2899). Имена `argN` — placeholders реконструкции.

Plays a full-screen movie using specified menu code

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Movie | The script name of the movie resource |
| 2.0 | bSkippable | Whether or not this movie can be skipped |
| 3.0 | bPauseGame | Whether or not this movie should pause the game clock. WARNING: some systems will not update while the game clock is paused!!! |
| 4.0 | Menu | The script name of the menu resource |
| 5.0 | Node | The name of the menu node as found in the dsMenuFlow file |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Movie",
      "@K[211]": "The script name of the movie resource"
    },
    "2.0": {
      "@K[209]": "bSkippable",
      "@K[211]": "Whether or not this movie can be skipped"
    },
    "3.0": {
      "@K[209]": "bPauseGame",
      "@K[211]": "Whether or not this movie should pause the game clock. WARNING: some systems will not update while the game clock is paused!!!"
    },
    "4.0": {
      "@K[209]": "Menu",
      "@K[211]": "The script name of the menu resource"
    },
    "5.0": {
      "@K[209]": "Node",
      "@K[211]": "The name of the menu node as found in the dsMenuFlow file"
    }
  },
  "@K[203]": "Plays a full-screen movie using specified menu code"
}
```

</details>

## GameScript.Game.ShowGenericMenuScreen

```lua
GameScript.Game.ShowGenericMenuScreen(arg1)
```

Источник: [Lua, строка 2902](../../luasense_decompiled.lua#L2902). Имена `argN` — placeholders реконструкции.

Displays the named menu screen. Returns true if the screen is displayed, else returns false.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Movie | The name of the movie resource |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Movie",
      "@K[211]": "The name of the movie resource"
    }
  },
  "@K[203]": "Displays the named menu screen. Returns true if the screen is displayed, else returns false."
}
```

</details>

## GameScript.Game.ShowIntroLoadingMovieAndStream

```lua
GameScript.Game.ShowIntroLoadingMovieAndStream(arg1)
```

Источник: [Lua, строка 2905](../../luasense_decompiled.lua#L2905). Имена `argN` — placeholders реконструкции.

Plays the intro movie and streams the worlds for a given mission.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MissionIndex | Progression order of the mission |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MissionIndex",
      "@K[211]": "Progression order of the mission"
    }
  },
  "@K[203]": "Plays the intro movie and streams the worlds for a given mission."
}
```

</details>

## GameScript.Game.ShowIntroLoadingMovieAndStreamWithMenu

```lua
GameScript.Game.ShowIntroLoadingMovieAndStreamWithMenu(arg1, arg2)
```

Источник: [Lua, строка 2908](../../luasense_decompiled.lua#L2908). Имена `argN` — placeholders реконструкции.

Plays the intro movie and streams the worlds for a given mission.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MissionIndex | Progression order of the mission |
| 2.0 | Menu | The script name of the menu resource |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MissionIndex",
      "@K[211]": "Progression order of the mission"
    },
    "2.0": {
      "@K[209]": "Menu",
      "@K[211]": "The script name of the menu resource"
    }
  },
  "@K[203]": "Plays the intro movie and streams the worlds for a given mission."
}
```

</details>

## GameScript.Game.ShowLoadingScreenMovie

```lua
GameScript.Game.ShowLoadingScreenMovie(arg1, arg2)
```

Источник: [Lua, строка 2911](../../luasense_decompiled.lua#L2911). Имена `argN` — placeholders реконструкции.

Plays a movie initialized by the loading screen. 0 = intro, 1 = outtro, 2 = wade movie.Assumes correct mission data has already been set on a previous call to SetCurrentMissionId()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MovieType | The type of movie to play. 0 = intro, 1 = outtro, 2 = wade movie. |
| 2.0 | MissionHint | Mission hint |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MovieType",
      "@K[211]": "The type of movie to play. 0 = intro, 1 = outtro, 2 = wade movie."
    },
    "2.0": {
      "@K[209]": "MissionHint",
      "@K[211]": "Mission hint"
    }
  },
  "@K[203]": "Plays a movie initialized by the loading screen. 0 = intro, 1 = outtro, 2 = wade movie.Assumes correct mission data has already been set on a previous call to SetCurrentMissionId()"
}
```

</details>

## GameScript.Game.ShowLoadingScreenMovieStreamHint

```lua
GameScript.Game.ShowLoadingScreenMovieStreamHint()
```

Источник: [Lua, строка 2914](../../luasense_decompiled.lua#L2914). Имена `argN` — placeholders реконструкции.

Plays a movie initialized by the loading screen. 0 = intro, 1 = outtro, 2 = wade movie.Assumes correct mission data has already been set on a previous call to SetCurrentMissionId()

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Plays a movie initialized by the loading screen. 0 = intro, 1 = outtro, 2 = wade movie.Assumes correct mission data has already been set on a previous call to SetCurrentMissionId()"
}
```

</details>

## GameScript.Game.ShowLoadingScreenMovieStreamHintWithMenu

```lua
GameScript.Game.ShowLoadingScreenMovieStreamHintWithMenu()
```

Источник: [Lua, строка 2917](../../luasense_decompiled.lua#L2917). Имена `argN` — placeholders реконструкции.

Plays a movie initialized by the loading screen. 0 = intro, 1 = outtro, 2 = wade movie.Assumes correct mission data has already been set on a previous call to SetCurrentMissionId()

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Plays a movie initialized by the loading screen. 0 = intro, 1 = outtro, 2 = wade movie.Assumes correct mission data has already been set on a previous call to SetCurrentMissionId()"
}
```

</details>

## GameScript.Game.ShowLoadingScreenMovieWithMenu

```lua
GameScript.Game.ShowLoadingScreenMovieWithMenu(arg1, arg2, arg3)
```

Источник: [Lua, строка 2920](../../luasense_decompiled.lua#L2920). Имена `argN` — placeholders реконструкции.

Plays a movie initialized by the loading screen. 0 = intro, 1 = outtro, 2 = wade movie.Assumes correct mission data has already been set on a previous call to SetCurrentMissionId()

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MovieType | The type of movie to play. 0 = intro, 1 = outtro, 2 = wade movie. |
| 2.0 | MissionHint | Mission hint |
| 3.0 | Menu | The script name of the menu resource |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MovieType",
      "@K[211]": "The type of movie to play. 0 = intro, 1 = outtro, 2 = wade movie."
    },
    "2.0": {
      "@K[209]": "MissionHint",
      "@K[211]": "Mission hint"
    },
    "3.0": {
      "@K[209]": "Menu",
      "@K[211]": "The script name of the menu resource"
    }
  },
  "@K[203]": "Plays a movie initialized by the loading screen. 0 = intro, 1 = outtro, 2 = wade movie.Assumes correct mission data has already been set on a previous call to SetCurrentMissionId()"
}
```

</details>

## GameScript.Game.ShowMissionSummaryScreen

```lua
GameScript.Game.ShowMissionSummaryScreen()
```

Источник: [Lua, строка 2923](../../luasense_decompiled.lua#L2923). Имена `argN` — placeholders реконструкции.

Displays the mission summary screen. Returns true if the screen is displayed, else returns false.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Displays the mission summary screen. Returns true if the screen is displayed, else returns false."
}
```

</details>

## GameScript.Game.ShowMissionSummaryScreenEx

```lua
GameScript.Game.ShowMissionSummaryScreenEx(arg1, arg2)
```

Источник: [Lua, строка 2926](../../luasense_decompiled.lua#L2926). Имена `argN` — placeholders реконструкции.

Displays the mission summary screen. Returns true if the screen is displayed, else returns false.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | MenuResource | The script name of the menu resource |
| 2.0 | PauseGame | Should the game pause while this menu is displayed? |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "MenuResource",
      "@K[211]": "The script name of the menu resource"
    },
    "2.0": {
      "@K[209]": "PauseGame",
      "@K[211]": "Should the game pause while this menu is displayed?"
    }
  },
  "@K[203]": "Displays the mission summary screen. Returns true if the screen is displayed, else returns false."
}
```

</details>

## GameScript.Game.ShowMissionSummaryScreenNoPause

```lua
GameScript.Game.ShowMissionSummaryScreenNoPause()
```

Источник: [Lua, строка 2929](../../luasense_decompiled.lua#L2929). Имена `argN` — placeholders реконструкции.

Displays the mission summary screen. Returns true if the screen is displayed, else returns false.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Displays the mission summary screen. Returns true if the screen is displayed, else returns false."
}
```

</details>

## GameScript.Game.ShowMovie

```lua
GameScript.Game.ShowMovie(arg1, arg2, arg3)
```

Источник: [Lua, строка 2932](../../luasense_decompiled.lua#L2932). Имена `argN` — placeholders реконструкции.

Plays a full-screen movie

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Movie | The script name of the movie resource |
| 2.0 | bSkippable | Whether or not this movie can be skipped |
| 3.0 | bPauseGame | Whether or not this movie should pause the game clock. WARNING: some systems will not update while the game clock is paused!!! |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Movie",
      "@K[211]": "The script name of the movie resource"
    },
    "2.0": {
      "@K[209]": "bSkippable",
      "@K[211]": "Whether or not this movie can be skipped"
    },
    "3.0": {
      "@K[209]": "bPauseGame",
      "@K[211]": "Whether or not this movie should pause the game clock. WARNING: some systems will not update while the game clock is paused!!!"
    }
  },
  "@K[203]": "Plays a full-screen movie"
}
```

</details>

## GameScript.Game.ShowPlayerView

```lua
GameScript.Game.ShowPlayerView()
```

Источник: [Lua, строка 2935](../../luasense_decompiled.lua#L2935). Имена `argN` — placeholders реконструкции.

Tells MenuMgr to remove the mask on the HUD that obstructs the player camera view

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Tells MenuMgr to remove the mask on the HUD that obstructs the player camera view"
}
```

</details>

## GameScript.Game.Spawn

```lua
GameScript.Game.Spawn(arg1, arg2)
```

Источник: [Lua, строка 2938](../../luasense_decompiled.lua#L2938). Имена `argN` — placeholders реконструкции.

Look up a name in the object template list of the script component for "EmpireObject", and spawn an object based on the listed template. Note this is the variable created in the "RegisterObjectTemplateVariable" call.  We set the position, but the orientation is always aligned to the world. The handle to the newly spawned object is returned so that it can be further adjusted or altered.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TemplateScriptName | The name in the ScriptComponent object template list that refers to the object we wish to spawn |
| 2.0 | Position | Position to which the object is spawned |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TemplateScriptName",
      "@K[211]": "The name in the ScriptComponent object template list that refers to the object we wish to spawn"
    },
    "2.0": {
      "@K[209]": "Position",
      "@K[211]": "Position to which the object is spawned"
    }
  },
  "@K[203]": "Look up a name in the object template list of the script component for \"EmpireObject\", and spawn an object based on the listed template. Note this is the variable created in the \"RegisterObjectTemplateVariable\" call.  We set the position, but the orientation is always aligned to the world. The handle to the newly spawned object is returned so that it can be further adjusted or altered."
}
```

</details>

## GameScript.Game.SpawnIntoInventory

```lua
GameScript.Game.SpawnIntoInventory(arg1, arg2, arg3, arg4, arg5)
```

Источник: [Lua, строка 2941](../../luasense_decompiled.lua#L2941). Имена `argN` — placeholders реконструкции.

Spawns the object with the specified script template name into another object's inventory of the given type. It will try to spawn into the designated group and slot, deleting any object currently occupying that slot. If no specific group is given (by passing in 0), then it will try to use the currently selected group. If no specific slot is given (by passing in 0), then it will spawn the object into the first available empty slot and return an error if there aren't any.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TemplateScriptName | The name in the Script Component's object template list that refers to the object we wish to spawn |
| 2.0 | InventoryObject | The object whose inventory we want to spawn into |
| 3.0 | InventoryType | The type of inventory we want to spawn into.<br>0 = All inventory lists<br>1 = Primary Weapon inventory lists<br>2 = Grenade inventory lists<br>3 = Augmentation inventory lists<br>4 = Rider inventory lists |
| 4.0 | InventoryGroup | The inventory group we want to spawn into, starting from group 1. Use 0 to spawn into the object's currently selected inventory group |
| 5.0 | InventorySlot | The inventory slot we want to spawn into, starting from slot 1. Use 0 to spawn into the first available (empty) slot. If a specific slot is specified, then any object currently in that slot will be deleted first |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TemplateScriptName",
      "@K[211]": "The name in the Script Component's object template list that refers to the object we wish to spawn"
    },
    "2.0": {
      "@K[209]": "InventoryObject",
      "@K[211]": "The object whose inventory we want to spawn into"
    },
    "3.0": {
      "@K[209]": "InventoryType",
      "@K[211]": "The type of inventory we want to spawn into.\n0 = All inventory lists\n1 = Primary Weapon inventory lists\n2 = Grenade inventory lists\n3 = Augmentation inventory lists\n4 = Rider inventory lists"
    },
    "4.0": {
      "@K[209]": "InventoryGroup",
      "@K[211]": "The inventory group we want to spawn into, starting from group 1. Use 0 to spawn into the object's currently selected inventory group"
    },
    "5.0": {
      "@K[209]": "InventorySlot",
      "@K[211]": "The inventory slot we want to spawn into, starting from slot 1. Use 0 to spawn into the first available (empty) slot. If a specific slot is specified, then any object currently in that slot will be deleted first"
    }
  },
  "@K[203]": "Spawns the object with the specified script template name into another object's inventory of the given type. It will try to spawn into the designated group and slot, deleting any object currently occupying that slot. If no specific group is given (by passing in 0), then it will try to use the currently selected group. If no specific slot is given (by passing in 0), then it will spawn the object into the first available empty slot and return an error if there aren't any."
}
```

</details>

## GameScript.Game.SpawnWithRotation

```lua
GameScript.Game.SpawnWithRotation(arg1, arg2, arg3)
```

Источник: [Lua, строка 2944](../../luasense_decompiled.lua#L2944). Имена `argN` — placeholders реконструкции.

Look up a name in the object template list of the script component for "EmpireObject", and spawn an object based on the listed template. Note this is the variable created in the "RegisterObjectTemplateVariable" call.  We set the position, but the orientation is always aligned to the world. The handle to the newly spawned object is returned so that it can be further adjusted or altered.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TemplateScriptName | The name in the ScriptComponent object template list that refers to the object we wish to spawn |
| 2.0 | Position | Position to which the object is spawned |
| 3.0 | Rotaion | A RollPitchHeadingVector for the orientaiton of the object spawn |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TemplateScriptName",
      "@K[211]": "The name in the ScriptComponent object template list that refers to the object we wish to spawn"
    },
    "2.0": {
      "@K[209]": "Position",
      "@K[211]": "Position to which the object is spawned"
    },
    "3.0": {
      "@K[209]": "Rotaion",
      "@K[211]": "A RollPitchHeadingVector for the orientaiton of the object spawn"
    }
  },
  "@K[203]": "Look up a name in the object template list of the script component for \"EmpireObject\", and spawn an object based on the listed template. Note this is the variable created in the \"RegisterObjectTemplateVariable\" call.  We set the position, but the orientation is always aligned to the world. The handle to the newly spawned object is returned so that it can be further adjusted or altered."
}
```

</details>

## GameScript.Game.SpawnerFinishedSpawning

```lua
GameScript.Game.SpawnerFinishedSpawning(arg1)
```

Источник: [Lua, строка 2947](../../luasense_decompiled.lua#L2947). Имена `argN` — placeholders реконструкции.

Check if "SpawnerObject" has a Spawner Component, and if so, check if it has completed spawning.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | SpawnerObject | The empireObject for which we are examining for a Spawner Component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "SpawnerObject",
      "@K[211]": "The empireObject for which we are examining for a Spawner Component"
    }
  },
  "@K[203]": "Check if \"SpawnerObject\" has a Spawner Component, and if so, check if it has completed spawning."
}
```

</details>

## GameScript.Game.StartInteraction

```lua
GameScript.Game.StartInteraction(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2950](../../luasense_decompiled.lua#L2950). Имена `argN` — placeholders реконструкции.

Starts an interaction between an initiator (e.g. a player avatar) and an interactive object (e.g. a lever or button). If either object is already involved in an interaction, or there is no interaction between the two, a red screen will appear

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | InteractionUser | The object that initiates the interaction (typically a player avatar) |
| 2.0 | InteractiveObject | The object that the user is interacting with (such as a lever or button) |
| 3.0 | Position | The position in the world where the interaction should occur |
| 4.0 | Orientation | The RPH of the interaction in the world, in degrees |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "InteractionUser",
      "@K[211]": "The object that initiates the interaction (typically a player avatar)"
    },
    "2.0": {
      "@K[209]": "InteractiveObject",
      "@K[211]": "The object that the user is interacting with (such as a lever or button)"
    },
    "3.0": {
      "@K[209]": "Position",
      "@K[211]": "The position in the world where the interaction should occur"
    },
    "4.0": {
      "@K[209]": "Orientation",
      "@K[211]": "The RPH of the interaction in the world, in degrees"
    }
  },
  "@K[203]": "Starts an interaction between an initiator (e.g. a player avatar) and an interactive object (e.g. a lever or button). If either object is already involved in an interaction, or there is no interaction between the two, a red screen will appear"
}
```

</details>

## GameScript.Game.StartMultiUserInteraction

```lua
GameScript.Game.StartMultiUserInteraction(arg1, arg2, arg3, arg4, arg5)
```

Источник: [Lua, строка 2953](../../luasense_decompiled.lua#L2953). Имена `argN` — placeholders реконструкции.

Starts an interaction between an initiator (e.g. levers or buttons) and two interactive objects (e.g. player avatars). If either object is already involved in an interaction, or there is no interaction between the two, a red screen will appear

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | InteractionUser | The object that initiates the interaction (in a multi user interaction this is usually the level or door) |
| 2.0 | InteractiveObjectA | The object that the user is interacting with (This is usually player 1) |
| 3.0 | InteractiveObjectB | The object that the user is interacting with (This is usually player 2) |
| 4.0 | Position | The position in the world where the interaction should occur |
| 5.0 | Orientation | The RPH of the interaction in the world, in degrees |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "InteractionUser",
      "@K[211]": "The object that initiates the interaction (in a multi user interaction this is usually the level or door)"
    },
    "2.0": {
      "@K[209]": "InteractiveObjectA",
      "@K[211]": "The object that the user is interacting with (This is usually player 1)"
    },
    "3.0": {
      "@K[209]": "InteractiveObjectB",
      "@K[211]": "The object that the user is interacting with (This is usually player 2)"
    },
    "4.0": {
      "@K[209]": "Position",
      "@K[211]": "The position in the world where the interaction should occur"
    },
    "5.0": {
      "@K[209]": "Orientation",
      "@K[211]": "The RPH of the interaction in the world, in degrees"
    }
  },
  "@K[203]": "Starts an interaction between an initiator (e.g. levers or buttons) and two interactive objects (e.g. player avatars). If either object is already involved in an interaction, or there is no interaction between the two, a red screen will appear"
}
```

</details>

## GameScript.Game.StartScriptEvent

```lua
GameScript.Game.StartScriptEvent(arg1, arg2)
```

Источник: [Lua, строка 2956](../../luasense_decompiled.lua#L2956). Имена `argN` — placeholders реконструкции.

Start a script event on the ScriptEvent component of an object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are sending the message to. |
| 2.0 | scriptEventID | The unique ID of the message defined in the object. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are sending the message to."
    },
    "2.0": {
      "@K[209]": "scriptEventID",
      "@K[211]": "The unique ID of the message defined in the object."
    }
  },
  "@K[203]": "Start a script event on the ScriptEvent component of an object"
}
```

</details>

## GameScript.Game.StartScriptEventTarget

```lua
GameScript.Game.StartScriptEventTarget(arg1, arg2, arg3)
```

Источник: [Lua, строка 2959](../../luasense_decompiled.lua#L2959). Имена `argN` — placeholders реконструкции.

Start a script event on the ScriptEvent component of an object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object we are sending the message to. |
| 2.0 | scriptEventID | The unique ID of the message defined in the object. |
| 3.0 | TargetObject | The object to operate on. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object we are sending the message to."
    },
    "2.0": {
      "@K[209]": "scriptEventID",
      "@K[211]": "The unique ID of the message defined in the object."
    },
    "3.0": {
      "@K[209]": "TargetObject",
      "@K[211]": "The object to operate on."
    }
  },
  "@K[203]": "Start a script event on the ScriptEvent component of an object"
}
```

</details>

## GameScript.Game.StopInteraction

```lua
GameScript.Game.StopInteraction(arg1, arg2)
```

Источник: [Lua, строка 2962](../../luasense_decompiled.lua#L2962). Имена `argN` — placeholders реконструкции.

Stops an interaction between an initiator (e.g. a player avatar) and an interactive object (e.g. a lever or button).

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | InteractionUser | The object that initiates the interaction (typically a player avatar) |
| 2.0 | InteractiveObject | The object that the user is interacting with (such as a lever or button) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "InteractionUser",
      "@K[211]": "The object that initiates the interaction (typically a player avatar)"
    },
    "2.0": {
      "@K[209]": "InteractiveObject",
      "@K[211]": "The object that the user is interacting with (such as a lever or button)"
    }
  },
  "@K[203]": "Stops an interaction between an initiator (e.g. a player avatar) and an interactive object (e.g. a lever or button)."
}
```

</details>

## GameScript.Game.StopMultiUserInteraction

```lua
GameScript.Game.StopMultiUserInteraction(arg1, arg2, arg3)
```

Источник: [Lua, строка 2965](../../luasense_decompiled.lua#L2965). Имена `argN` — placeholders реконструкции.

Stops an interaction between an initiator (e.g. lever, doors) and two interactive objects (e.g. players).

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | InteractionUser | The object is controlling the interaction (in a multi user interaction this is usually not the players.) |
| 2.0 | InteractiveObjectA | The object that the user is interacting with (Usually player 1) |
| 3.0 | InteractiveObjectB | The object that the user is interacting with (Usually player 2) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "InteractionUser",
      "@K[211]": "The object is controlling the interaction (in a multi user interaction this is usually not the players.)"
    },
    "2.0": {
      "@K[209]": "InteractiveObjectA",
      "@K[211]": "The object that the user is interacting with (Usually player 1)"
    },
    "3.0": {
      "@K[209]": "InteractiveObjectB",
      "@K[211]": "The object that the user is interacting with (Usually player 2)"
    }
  },
  "@K[203]": "Stops an interaction between an initiator (e.g. lever, doors) and two interactive objects (e.g. players)."
}
```

</details>

## GameScript.Game.StreamWorlds

```lua
GameScript.Game.StreamWorlds(arg1, arg2)
```

Источник: [Lua, строка 2968](../../luasense_decompiled.lua#L2968). Имена `argN` — placeholders реконструкции.

Stream in the lists of worlds if they are not already loaded. Each world is given by its resource path in a string. If a world is required by has not been fully loaded, then this function will cause the game to pause until that world is loaded. Required worlds will be given priority over desired worlds. If a world has been loaded but is not listed in either list when this function is called, then it will be streamed out.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DesiredWorlds | The list of worlds (by their script variable name) that we want to load at this time |
| 2.0 | RequiredWorlds | The list of worlds (by their script variable name) that MUST be loaded at this time |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DesiredWorlds",
      "@K[211]": "The list of worlds (by their script variable name) that we want to load at this time"
    },
    "2.0": {
      "@K[209]": "RequiredWorlds",
      "@K[211]": "The list of worlds (by their script variable name) that MUST be loaded at this time"
    }
  },
  "@K[203]": "Stream in the lists of worlds if they are not already loaded. Each world is given by its resource path in a string. If a world is required by has not been fully loaded, then this function will cause the game to pause until that world is loaded. Required worlds will be given priority over desired worlds. If a world has been loaded but is not listed in either list when this function is called, then it will be streamed out."
}
```

</details>

## GameScript.Game.StreamWorldsWithSaveOverride

```lua
GameScript.Game.StreamWorldsWithSaveOverride(arg1, arg2, arg3)
```

Источник: [Lua, строка 2971](../../luasense_decompiled.lua#L2971). Имена `argN` — placeholders реконструкции.

Stream in the lists of worlds if they are not already loaded. Each world is given by its resource path in a string. If a world is required by has not been fully loaded, then this function will cause the game to pause until that world is loaded. Required worlds will be given priority over desired worlds. If a world has been loaded but is not listed in either list when this function is called, then it will be streamed out.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | DesiredWorlds | The list of worlds (by their script variable name) that we want to load at this time |
| 2.0 | RequiredWorlds | The list of worlds (by their script variable name) that MUST be loaded at this time |
| 3.0 | AutoSave | Use 0 to disable auto saving, 1 to attempt an auto save. (Note does not work if autosave is off globally) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "DesiredWorlds",
      "@K[211]": "The list of worlds (by their script variable name) that we want to load at this time"
    },
    "2.0": {
      "@K[209]": "RequiredWorlds",
      "@K[211]": "The list of worlds (by their script variable name) that MUST be loaded at this time"
    },
    "3.0": {
      "@K[209]": "AutoSave",
      "@K[211]": "Use 0 to disable auto saving, 1 to attempt an auto save. (Note does not work if autosave is off globally)"
    }
  },
  "@K[203]": "Stream in the lists of worlds if they are not already loaded. Each world is given by its resource path in a string. If a world is required by has not been fully loaded, then this function will cause the game to pause until that world is loaded. Required worlds will be given priority over desired worlds. If a world has been loaded but is not listed in either list when this function is called, then it will be streamed out."
}
```

</details>

## GameScript.Game.TeleportObjectToPosition

```lua
GameScript.Game.TeleportObjectToPosition(arg1, arg2)
```

Источник: [Lua, строка 2974](../../luasense_decompiled.lua#L2974). Имена `argN` — placeholders реконструкции.

Send a message to teleport the object to this position while maintaining orientation.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are teleporting |
| 2.0 | Position | Position to which to teleport |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are teleporting"
    },
    "2.0": {
      "@K[209]": "Position",
      "@K[211]": "Position to which to teleport"
    }
  },
  "@K[203]": "Send a message to teleport the object to this position while maintaining orientation."
}
```

</details>

## GameScript.Game.TeleportObjectWithRotation

```lua
GameScript.Game.TeleportObjectWithRotation(arg1, arg2, arg3)
```

Источник: [Lua, строка 2977](../../luasense_decompiled.lua#L2977). Имена `argN` — placeholders реконструкции.

Send a message to teleport the object to this position with the roll, pitch and heading specified.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that we are teleporting |
| 2.0 | Position | Position to which to teleport |
| 3.0 | RollPitchHeading | RollPitchHeading(degrees) for the object when teleported.This is a RPH vector, so it needs to be a table with an r, p, and h field. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that we are teleporting"
    },
    "2.0": {
      "@K[209]": "Position",
      "@K[211]": "Position to which to teleport"
    },
    "3.0": {
      "@K[209]": "RollPitchHeading",
      "@K[211]": "RollPitchHeading(degrees) for the object when teleported.This is a RPH vector, so it needs to be a table with an r, p, and h field."
    }
  },
  "@K[203]": "Send a message to teleport the object to this position with the roll, pitch and heading specified."
}
```

</details>

## GameScript.Game.UnhideAllHUD

```lua
GameScript.Game.UnhideAllHUD()
```

Источник: [Lua, строка 2980](../../luasense_decompiled.lua#L2980). Имена `argN` — placeholders реконструкции.

Unhide all HUD.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Unhide all HUD."
}
```

</details>
