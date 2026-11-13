# GameScript.Game.Camera

[Индекс](../API.md)

## GameScript.Game.Camera.AddCameraFilterGroupByNameToPlayer

```lua
GameScript.Game.Camera.AddCameraFilterGroupByNameToPlayer(arg1, arg2)
```

Источник: [Lua, строка 1821](../../luasense_decompiled.lua#L1821). Имена `argN` — placeholders реконструкции.

Create a filter set object from  "TemplateObjectKey" and attach to camera for player "globalPlayerIndex"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global index of the player to which filters should be added |
| 2.0 | TemplateObjectKey | Object Template Path |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global index of the player to which filters should be added"
    },
    "2.0": {
      "@K[209]": "TemplateObjectKey",
      "@K[211]": "Object Template Path"
    }
  },
  "@K[203]": "Create a filter set object from  \"TemplateObjectKey\" and attach to camera for player \"globalPlayerIndex\""
}
```

</details>

## GameScript.Game.Camera.DoesFilterSetHaveCameraComponent

```lua
GameScript.Game.Camera.DoesFilterSetHaveCameraComponent(arg1, arg2)
```

Источник: [Lua, строка 1824](../../luasense_decompiled.lua#L1824). Имена `argN` — placeholders реконструкции.

Return if the camera filter set of index 'SetIndex', used by the player with index 'globalPlayerIndex' actually has a camera component attached.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |
| 2.0 | SetIndex | Which index we are using from the PlayerCameraFilterComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    },
    "2.0": {
      "@K[209]": "SetIndex",
      "@K[211]": "Which index we are using from the PlayerCameraFilterComponent"
    }
  },
  "@K[203]": "Return if the camera filter set of index 'SetIndex', used by the player with index 'globalPlayerIndex' actually has a camera component attached."
}
```

</details>

## GameScript.Game.Camera.GetCameraFOV

```lua
GameScript.Game.Camera.GetCameraFOV(arg1)
```

Источник: [Lua, строка 1827](../../luasense_decompiled.lua#L1827). Имена `argN` — placeholders реконструкции.

Get the current FOV in degrees from camera object "CameraObject"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CameraObject | The camera object whose FOV should be returned. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CameraObject",
      "@K[211]": "The camera object whose FOV should be returned."
    }
  },
  "@K[203]": "Get the current FOV in degrees from camera object \"CameraObject\""
}
```

</details>

## GameScript.Game.Camera.GetCameraFarDist

```lua
GameScript.Game.Camera.GetCameraFarDist(arg1)
```

Источник: [Lua, строка 1830](../../luasense_decompiled.lua#L1830). Имена `argN` — placeholders реконструкции.

Get the current far plane distance from camera object "CameraObject"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CameraObject | The camera object whose far distance should be returned. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CameraObject",
      "@K[211]": "The camera object whose far distance should be returned."
    }
  },
  "@K[203]": "Get the current far plane distance from camera object \"CameraObject\""
}
```

</details>

## GameScript.Game.Camera.GetCameraNearDist

```lua
GameScript.Game.Camera.GetCameraNearDist(arg1)
```

Источник: [Lua, строка 1833](../../luasense_decompiled.lua#L1833). Имена `argN` — placeholders реконструкции.

Get the current near plane distance for camera object "CameraObject"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CameraObject | The camera object whose near distance should be returned. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CameraObject",
      "@K[211]": "The camera object whose near distance should be returned."
    }
  },
  "@K[203]": "Get the current near plane distance for camera object \"CameraObject\""
}
```

</details>

## GameScript.Game.Camera.GetCameraObjectForPlayer

```lua
GameScript.Game.Camera.GetCameraObjectForPlayer(arg1)
```

Источник: [Lua, строка 1836](../../luasense_decompiled.lua#L1836). Имена `argN` — placeholders реконструкции.

Return the camera object for the player 'GlobalPlayerIndex'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The player for which you want to get the camera object |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The player for which you want to get the camera object"
    }
  },
  "@K[203]": "Return the camera object for the player 'GlobalPlayerIndex'."
}
```

</details>

## GameScript.Game.Camera.GetCameraViewportAspectRatio

```lua
GameScript.Game.Camera.GetCameraViewportAspectRatio(arg1)
```

Источник: [Lua, строка 1839](../../luasense_decompiled.lua#L1839). Имена `argN` — placeholders реконструкции.

Get the current viewport aspect ratio from camera object "CameraObject"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CameraObject | The camera object whose aspect ratio should be returned. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CameraObject",
      "@K[211]": "The camera object whose aspect ratio should be returned."
    }
  },
  "@K[203]": "Get the current viewport aspect ratio from camera object \"CameraObject\""
}
```

</details>

## GameScript.Game.Camera.GetFilterGroupForPlayer

```lua
GameScript.Game.Camera.GetFilterGroupForPlayer(arg1, arg2)
```

Источник: [Lua, строка 1842](../../luasense_decompiled.lua#L1842). Имена `argN` — placeholders реконструкции.

Return the filter group object for the player 'globalPlayerIndex'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global player for which you want to get the filter group |
| 2.0 | categoryIndex | The desired filter group category.  Typically should be 0. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global player for which you want to get the filter group"
    },
    "2.0": {
      "@K[209]": "categoryIndex",
      "@K[211]": "The desired filter group category.  Typically should be 0."
    }
  },
  "@K[203]": "Return the filter group object for the player 'globalPlayerIndex'."
}
```

</details>

## GameScript.Game.Camera.GetNumPlayerCameraFilterSet

```lua
GameScript.Game.Camera.GetNumPlayerCameraFilterSet(arg1)
```

Источник: [Lua, строка 1845](../../luasense_decompiled.lua#L1845). Имена `argN` — placeholders реконструкции.

Return the number of camera filter sets used by the player with index 'globalPlayerIndex'.

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
  "@K[203]": "Return the number of camera filter sets used by the player with index 'globalPlayerIndex'."
}
```

</details>

## GameScript.Game.Camera.GetPlayerCameraFilterSetAlpha

```lua
GameScript.Game.Camera.GetPlayerCameraFilterSetAlpha(arg1, arg2)
```

Источник: [Lua, строка 1848](../../luasense_decompiled.lua#L1848). Имена `argN` — placeholders реконструкции.

Return the alpha of the camera filter set of index 'SetIndex', used by the player with index 'globalPlayerIndex'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The empireObject for 'globalPlayerIndex' global index |
| 2.0 | SetIndex | Which index we are using from the PlayerCameraFilterComponent |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The empireObject for 'globalPlayerIndex' global index"
    },
    "2.0": {
      "@K[209]": "SetIndex",
      "@K[211]": "Which index we are using from the PlayerCameraFilterComponent"
    }
  },
  "@K[203]": "Return the alpha of the camera filter set of index 'SetIndex', used by the player with index 'globalPlayerIndex'."
}
```

</details>

## GameScript.Game.Camera.GetPlayerIndexFromCameraId

```lua
GameScript.Game.Camera.GetPlayerIndexFromCameraId(arg1)
```

Источник: [Lua, строка 1851](../../luasense_decompiled.lua#L1851). Имена `argN` — placeholders реконструкции.

Return the index of the global player index current controlling the camera with the index 'cameraId'.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | cameraId | The camera id for which you want to get the controlling player index |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "cameraId",
      "@K[211]": "The camera id for which you want to get the controlling player index"
    }
  },
  "@K[203]": "Return the index of the global player index current controlling the camera with the index 'cameraId'."
}
```

</details>

## GameScript.Game.Camera.GetUnadjustedCameraFOV

```lua
GameScript.Game.Camera.GetUnadjustedCameraFOV(arg1)
```

Источник: [Lua, строка 1854](../../luasense_decompiled.lua#L1854). Имена `argN` — placeholders реконструкции.

Get the current FOV in degrees from camera object "CameraObject".  This value is not adjusted for split screen.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CameraObject | The camera object whose FOV should be returned. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CameraObject",
      "@K[211]": "The camera object whose FOV should be returned."
    }
  },
  "@K[203]": "Get the current FOV in degrees from camera object \"CameraObject\".  This value is not adjusted for split screen."
}
```

</details>

## GameScript.Game.Camera.IsInPlayerCameraView

```lua
GameScript.Game.Camera.IsInPlayerCameraView(arg1, arg2)
```

Источник: [Lua, строка 1857](../../luasense_decompiled.lua#L1857). Имена `argN` — placeholders реконструкции.

Returns whether or not the target object is in the specified player's camera view.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | Index for player's camera being tested for target in view. |
| 2.0 | TargetObject | The empireObject for which we are checking in player view |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "Index for player's camera being tested for target in view."
    },
    "2.0": {
      "@K[209]": "TargetObject",
      "@K[211]": "The empireObject for which we are checking in player view"
    }
  },
  "@K[203]": "Returns whether or not the target object is in the specified player's camera view."
}
```

</details>

## GameScript.Game.Camera.IsInPlayerCameraViewRange

```lua
GameScript.Game.Camera.IsInPlayerCameraViewRange(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 1860](../../luasense_decompiled.lua#L1860). Имена `argN` — placeholders реконструкции.

Returns whether or not the target object is in the specified player's camera view.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | Index for player's camera being tested for target in view. |
| 2.0 | TargetObject | The empireObject for which we are checking in player view |
| 3.0 | MinAngle | The minimum angle between the camera forward and object position |
| 4.0 | MaxAngle | The maximum angle between the camera forward and object position |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "Index for player's camera being tested for target in view."
    },
    "2.0": {
      "@K[209]": "TargetObject",
      "@K[211]": "The empireObject for which we are checking in player view"
    },
    "3.0": {
      "@K[209]": "MinAngle",
      "@K[211]": "The minimum angle between the camera forward and object position"
    },
    "4.0": {
      "@K[209]": "MaxAngle",
      "@K[211]": "The maximum angle between the camera forward and object position"
    }
  },
  "@K[203]": "Returns whether or not the target object is in the specified player's camera view."
}
```

</details>

## GameScript.Game.Camera.IsPointInPlayerCameraView

```lua
GameScript.Game.Camera.IsPointInPlayerCameraView(arg1, arg2)
```

Источник: [Lua, строка 1863](../../luasense_decompiled.lua#L1863). Имена `argN` — placeholders реконструкции.

Returns whether or not the target object is in the specified player's camera view.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | Index for player's camera being tested for target in view. |
| 2.0 | PointPosition | The position that we are checking, table containing x,y,z |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "Index for player's camera being tested for target in view."
    },
    "2.0": {
      "@K[209]": "PointPosition",
      "@K[211]": "The position that we are checking, table containing x,y,z"
    }
  },
  "@K[203]": "Returns whether or not the target object is in the specified player's camera view."
}
```

</details>

## GameScript.Game.Camera.RemoveCameraFilterGroupByNameFromPlayer

```lua
GameScript.Game.Camera.RemoveCameraFilterGroupByNameFromPlayer(arg1, arg2)
```

Источник: [Lua, строка 1866](../../luasense_decompiled.lua#L1866). Имена `argN` — placeholders реконструкции.

Remove filter set object "TemplateObjectKey" from player "PlayerIndex"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player from which the filter should be removed |
| 2.0 | TemplateObjectKey | Object Template Path |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player from which the filter should be removed"
    },
    "2.0": {
      "@K[209]": "TemplateObjectKey",
      "@K[211]": "Object Template Path"
    }
  },
  "@K[203]": "Remove filter set object \"TemplateObjectKey\" from player \"PlayerIndex\""
}
```

</details>

## GameScript.Game.Camera.SetAdjustedCameraFOV

```lua
GameScript.Game.Camera.SetAdjustedCameraFOV(arg1, arg2)
```

Источник: [Lua, строка 1869](../../luasense_decompiled.lua#L1869). Имена `argN` — placeholders реконструкции.

Adjust the current field of view on camera object "CameraObject"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CameraObject | The camera object whose FOV we want to adjust. |
| 2.0 | FOV | The new FOV to set on "CameraObject" |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CameraObject",
      "@K[211]": "The camera object whose FOV we want to adjust."
    },
    "2.0": {
      "@K[209]": "FOV",
      "@K[211]": "The new FOV to set on \"CameraObject\""
    }
  },
  "@K[203]": "Adjust the current field of view on camera object \"CameraObject\""
}
```

</details>

## GameScript.Game.Camera.SetCameraFilterColor

```lua
GameScript.Game.Camera.SetCameraFilterColor(arg1, arg2, arg3)
```

Источник: [Lua, строка 1872](../../luasense_decompiled.lua#L1872). Имена `argN` — placeholders реконструкции.

Set a color into the camera filter material for the specified player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player whose camera filter we are affecting. If the player is not local, then this function will do nothing. |
| 2.0 | MaterialVariable | The name of the color material variable that we are setting. |
| 3.0 | TextureResourceName | The color to set in the filter material, with fields "r", "g", "b", and "a" |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player whose camera filter we are affecting. If the player is not local, then this function will do nothing."
    },
    "2.0": {
      "@K[209]": "MaterialVariable",
      "@K[211]": "The name of the color material variable that we are setting."
    },
    "3.0": {
      "@K[209]": "TextureResourceName",
      "@K[211]": "The color to set in the filter material, with fields \"r\", \"g\", \"b\", and \"a\""
    }
  },
  "@K[203]": "Set a color into the camera filter material for the specified player."
}
```

</details>

## GameScript.Game.Camera.SetCameraFilterNamedTexture

```lua
GameScript.Game.Camera.SetCameraFilterNamedTexture(arg1, arg2, arg3)
```

Источник: [Lua, строка 1875](../../luasense_decompiled.lua#L1875). Имена `argN` — placeholders реконструкции.

Set a named texture into the camera filter material for the specified player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player whose camera filter we are affecting. If the player is not local, then this function will do nothing. |
| 2.0 | MaterialVariable | The name of the texture material variable that we are setting. |
| 3.0 | TextureResourceName | The name of the texture resource to set in the filter material |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player whose camera filter we are affecting. If the player is not local, then this function will do nothing."
    },
    "2.0": {
      "@K[209]": "MaterialVariable",
      "@K[211]": "The name of the texture material variable that we are setting."
    },
    "3.0": {
      "@K[209]": "TextureResourceName",
      "@K[211]": "The name of the texture resource to set in the filter material"
    }
  },
  "@K[203]": "Set a named texture into the camera filter material for the specified player."
}
```

</details>

## GameScript.Game.Camera.SetCameraFilterScalar

```lua
GameScript.Game.Camera.SetCameraFilterScalar(arg1, arg2, arg3)
```

Источник: [Lua, строка 1878](../../luasense_decompiled.lua#L1878). Имена `argN` — placeholders реконструкции.

Set the value for a named scalar material variable by name inside all camera filters of the given player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player whose camera filter we are affecting. If the player is not local, then this function will do nothing. |
| 2.0 | MaterialVariable | The name of the scalar material variable that we are setting. |
| 3.0 | ScalarValue | The value that we are setting for the scalar material variable. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player whose camera filter we are affecting. If the player is not local, then this function will do nothing."
    },
    "2.0": {
      "@K[209]": "MaterialVariable",
      "@K[211]": "The name of the scalar material variable that we are setting."
    },
    "3.0": {
      "@K[209]": "ScalarValue",
      "@K[211]": "The value that we are setting for the scalar material variable."
    }
  },
  "@K[203]": "Set the value for a named scalar material variable by name inside all camera filters of the given player."
}
```

</details>

## GameScript.Game.Camera.SetCameraMotionBlurEnabled

```lua
GameScript.Game.Camera.SetCameraMotionBlurEnabled(arg1, arg2)
```

Источник: [Lua, строка 1881](../../luasense_decompiled.lua#L1881). Имена `argN` — placeholders реконструкции.

Enable or disable motion blur on the camera for player "globalPlayerIndex"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | globalPlayerIndex | The global index of the player whose motion blur filter should be changed |
| 2.0 | enabled | Whether or not the motion blur should be enabled |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "globalPlayerIndex",
      "@K[211]": "The global index of the player whose motion blur filter should be changed"
    },
    "2.0": {
      "@K[209]": "enabled",
      "@K[211]": "Whether or not the motion blur should be enabled"
    }
  },
  "@K[203]": "Enable or disable motion blur on the camera for player \"globalPlayerIndex\""
}
```

</details>

## GameScript.Game.Camera.SetPlayerCameraFilterSet

```lua
GameScript.Game.Camera.SetPlayerCameraFilterSet(arg1, arg2)
```

Источник: [Lua, строка 1884](../../luasense_decompiled.lua#L1884). Имена `argN` — placeholders реконструкции.

Transitions the current camera filter set for the given player.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The global player index of the player whose camera filter we are affecting. If the player is not local, then this function will do nothing. |
| 2.0 | FilterValues | The new filter values, described in a table with the following fields:<br>"newSet" - integer - the new set group to transition to<br>"alpha" - float - the alpha value of the new filter set in the range [0, 1]. Not all filters use alpha values.<br>"transitionTime" - float - how many seconds the transition takes<br>"turnAllOff" - bool - whether we turn off all other filters before transitioning to the new set<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The global player index of the player whose camera filter we are affecting. If the player is not local, then this function will do nothing."
    },
    "2.0": {
      "@K[209]": "FilterValues",
      "@K[211]": "The new filter values, described in a table with the following fields:\n\"newSet\" - integer - the new set group to transition to\n\"alpha\" - float - the alpha value of the new filter set in the range [0, 1]. Not all filters use alpha values.\n\"transitionTime\" - float - how many seconds the transition takes\n\"turnAllOff\" - bool - whether we turn off all other filters before transitioning to the new set\n"
    }
  },
  "@K[203]": "Transitions the current camera filter set for the given player."
}
```

</details>
