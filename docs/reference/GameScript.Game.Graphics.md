# GameScript.Game.Graphics

[Индекс](../API.md)

## GameScript.Game.Graphics.GetColor

```lua
GameScript.Game.Graphics.GetColor(arg1)
```

Источник: [Lua, строка 2157](../../luasense_decompiled.lua#L2157). Имена `argN` — placeholders реконструкции.

Get the object's hardware light's color.  Note only returns the color for the first light found Expressed as a table with values for "r", "g", "b", "a" values 0 to 255

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    }
  },
  "@K[203]": "Get the object's hardware light's color.  Note only returns the color for the first light found Expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 255"
}
```

</details>

## GameScript.Game.Graphics.GetEnvironmentLight

```lua
GameScript.Game.Graphics.GetEnvironmentLight()
```

Источник: [Lua, строка 2160](../../luasense_decompiled.lua#L2160). Имена `argN` — placeholders реконструкции.

Returns basic environment light information in a table with the following fields:
["red"] - the amount of red in the sun color, on a scale of [0, 255]
["green"] - the amount of green in the sun color, on a scale of [0, 255]
["blue"] - the amount of blue in the sun color, on a scale of [0, 255]
["alpha"] - the amount of alpha (multiplier) in the sun color, on a scale of [0, 255]
["theta"] - the direction where the sun comes from in degrees
["phi"] - the sun's angle from the horizon in degrees

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns basic environment light information in a table with the following fields:\n[\"red\"] - the amount of red in the sun color, on a scale of [0, 255]\n[\"green\"] - the amount of green in the sun color, on a scale of [0, 255]\n[\"blue\"] - the amount of blue in the sun color, on a scale of [0, 255]\n[\"alpha\"] - the amount of alpha (multiplier) in the sun color, on a scale of [0, 255]\n[\"theta\"] - the direction where the sun comes from in degrees\n[\"phi\"] - the sun's angle from the horizon in degrees"
}
```

</details>

## GameScript.Game.Graphics.GetPortalOpen

```lua
GameScript.Game.Graphics.GetPortalOpen(arg1)
```

Источник: [Lua, строка 2163](../../luasense_decompiled.lua#L2163). Имена `argN` — placeholders реконструкции.

Gets whether a portal is open or closed.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Object | The object with a portal |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Object",
      "@K[211]": "The object with a portal"
    }
  },
  "@K[203]": "Gets whether a portal is open or closed."
}
```

</details>

## GameScript.Game.Graphics.SetAlphaBlend

```lua
GameScript.Game.Graphics.SetAlphaBlend(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2166](../../luasense_decompiled.lua#L2166). Имена `argN` — placeholders реконструкции.

Sets the alpha for an object with an AlphaBlendComponent to the requested level, blending to that level in "BlendTime"

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object whose alpha we are changing |
| 2.0 | AlphaLevel | The alpha level to which we are setting. 0 is transparent, 1 is opaque |
| 3.0 | BlendTime | The time in seconds over which the blend occurs |
| 4.0 | IsAdditive | Whether or not to use an additive blend |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object whose alpha we are changing"
    },
    "2.0": {
      "@K[209]": "AlphaLevel",
      "@K[211]": "The alpha level to which we are setting. 0 is transparent, 1 is opaque"
    },
    "3.0": {
      "@K[209]": "BlendTime",
      "@K[211]": "The time in seconds over which the blend occurs"
    },
    "4.0": {
      "@K[209]": "IsAdditive",
      "@K[211]": "Whether or not to use an additive blend"
    }
  },
  "@K[203]": "Sets the alpha for an object with an AlphaBlendComponent to the requested level, blending to that level in \"BlendTime\""
}
```

</details>

## GameScript.Game.Graphics.SetAmbientLightIntensity

```lua
GameScript.Game.Graphics.SetAmbientLightIntensity(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2169](../../luasense_decompiled.lua#L2169). Имена `argN` — placeholders реконструкции.

Transitions the sun's intensity from its current values to the ones specified over a given time and transition curve.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | CurveName | The name in the ScriptComponent curve template list that refers to the transition curve |
| 3.0 | TransitionTime | The number of seconds needed to make the transition from the sun's current values to the ones specified |
| 4.0 | FinalIntensity | The sun's final intensity |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "CurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the transition curve"
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "The number of seconds needed to make the transition from the sun's current values to the ones specified"
    },
    "4.0": {
      "@K[209]": "FinalIntensity",
      "@K[211]": "The sun's final intensity"
    }
  },
  "@K[203]": "Transitions the sun's intensity from its current values to the ones specified over a given time and transition curve."
}
```

</details>

## GameScript.Game.Graphics.SetAmbientLightSpecularity

```lua
GameScript.Game.Graphics.SetAmbientLightSpecularity(arg1, arg2)
```

Источник: [Lua, строка 2172](../../luasense_decompiled.lua#L2172). Имена `argN` — placeholders реконструкции.

Changes the sun's specularity.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | FinalSpecularity | The sun's final specularity |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "FinalSpecularity",
      "@K[211]": "The sun's final specularity"
    }
  },
  "@K[203]": "Changes the sun's specularity."
}
```

</details>

## GameScript.Game.Graphics.SetCastsShadows

```lua
GameScript.Game.Graphics.SetCastsShadows(arg1, arg2)
```

Источник: [Lua, строка 2175](../../luasense_decompiled.lua#L2175). Имена `argN` — placeholders реконструкции.

Enable(or disable) shadows from a hardware light

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | Enable | If true, shadows are enabled, if false, they are diabled |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "Enable",
      "@K[211]": "If true, shadows are enabled, if false, they are diabled"
    }
  },
  "@K[203]": "Enable(or disable) shadows from a hardware light"
}
```

</details>

## GameScript.Game.Graphics.SetColor

```lua
GameScript.Game.Graphics.SetColor(arg1, arg2)
```

Источник: [Lua, строка 2178](../../luasense_decompiled.lua#L2178). Имена `argN` — placeholders реконструкции.

Transitions the object's hardware light's color and direction from its current values to the ones specified over a given time and transition curve.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | Color | The hardware light's final color, expressed as a table with values for "r", "g", "b", "a" values 0 to 255 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "Color",
      "@K[211]": "The hardware light's final color, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 255"
    }
  },
  "@K[203]": "Transitions the object's hardware light's color and direction from its current values to the ones specified over a given time and transition curve."
}
```

</details>

## GameScript.Game.Graphics.SetContractionsFogColors

```lua
GameScript.Game.Graphics.SetContractionsFogColors(arg1, arg2, arg3, arg4, arg5)
```

Источник: [Lua, строка 2181](../../luasense_decompiled.lua#L2181). Имена `argN` — placeholders реконструкции.

Set the fog color with a transition over time

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | CurveName | The name in the ScriptComponent curve template list that refers to the transition curve |
| 3.0 | TransitionTime | The number of seconds needed to make the transition from the fog's current values to the ones specified |
| 4.0 | DepthFogColor | The depth fog's color, expressed as a table with values for "r", "g", "b", "a" values 0 to 1 |
| 5.0 | HeightFogColor | The height fog's color, expressed as a table with values for "r", "g", "b", "a" values 0 to 1 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "CurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the transition curve"
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "The number of seconds needed to make the transition from the fog's current values to the ones specified"
    },
    "4.0": {
      "@K[209]": "DepthFogColor",
      "@K[211]": "The depth fog's color, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 1"
    },
    "5.0": {
      "@K[209]": "HeightFogColor",
      "@K[211]": "The height fog's color, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 1"
    }
  },
  "@K[203]": "Set the fog color with a transition over time"
}
```

</details>

## GameScript.Game.Graphics.SetContractionsFogValues

```lua
GameScript.Game.Graphics.SetContractionsFogValues(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2184](../../luasense_decompiled.lua#L2184). Имена `argN` — placeholders реконструкции.

Set the fog to a new set of values with a transition over time

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | CurveName | The name in the ScriptComponent curve template list that refers to the transition curve |
| 3.0 | TransitionTime | The number of seconds needed to make the transition from the fog's current values to the ones specified |
| 4.0 | FogValues | The fog's values and direction, expressed as a table with values for "depthNear", "depthFar", "depthMax", "heightNear", "heightFar", "heightTop", "heightBottom", and "heightMax" |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "CurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the transition curve"
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "The number of seconds needed to make the transition from the fog's current values to the ones specified"
    },
    "4.0": {
      "@K[209]": "FogValues",
      "@K[211]": "The fog's values and direction, expressed as a table with values for \"depthNear\", \"depthFar\", \"depthMax\", \"heightNear\", \"heightFar\", \"heightTop\", \"heightBottom\", and \"heightMax\""
    }
  },
  "@K[203]": "Set the fog to a new set of values with a transition over time"
}
```

</details>

## GameScript.Game.Graphics.SetDiffuseAmbientCubeMap

```lua
GameScript.Game.Graphics.SetDiffuseAmbientCubeMap(arg1, arg2)
```

Источник: [Lua, строка 2187](../../luasense_decompiled.lua#L2187). Имена `argN` — placeholders реконструкции.

Changes the diffuse ambient cube map to use the texture of the specified variable.  NOTE: This must be called by script again when reloading a checkpoint, as the Environmental Light component cannot safely save this resource-based change.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | TextureName | The name of the texture variable defined in the script |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "TextureName",
      "@K[211]": "The name of the texture variable defined in the script"
    }
  },
  "@K[203]": "Changes the diffuse ambient cube map to use the texture of the specified variable.  NOTE: This must be called by script again when reloading a checkpoint, as the Environmental Light component cannot safely save this resource-based change."
}
```

</details>

## GameScript.Game.Graphics.SetDistantObjectsShadowed

```lua
GameScript.Game.Graphics.SetDistantObjectsShadowed(arg1, arg2)
```

Источник: [Lua, строка 2190](../../luasense_decompiled.lua#L2190). Имена `argN` — placeholders реконструкции.

Should objects beyond the outer shadow distance be shadowed?

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | Shadowed | Should objects beyond the outer shadow distance be shadowed? |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "Shadowed",
      "@K[211]": "Should objects beyond the outer shadow distance be shadowed?"
    }
  },
  "@K[203]": "Should objects beyond the outer shadow distance be shadowed?"
}
```

</details>

## GameScript.Game.Graphics.SetEnvironmentLight

```lua
GameScript.Game.Graphics.SetEnvironmentLight(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2193](../../luasense_decompiled.lua#L2193). Имена `argN` — placeholders реконструкции.

Transitions the sun's color and direction from its current values to the ones specified over a given time and transition curve.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | CurveName | The name in the ScriptComponent curve template list that refers to the transition curve |
| 3.0 | TransitionTime | The number of seconds needed to make the transition from the sun's current values to the ones specified |
| 4.0 | EnvLightValues | The sun's final color and direction, expressed as a table with values for "red", "green", "blue", "alpha", "theta" (direction, in degrees), and "phi" (angle from the horizon, in degrees) |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "CurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the transition curve"
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "The number of seconds needed to make the transition from the sun's current values to the ones specified"
    },
    "4.0": {
      "@K[209]": "EnvLightValues",
      "@K[211]": "The sun's final color and direction, expressed as a table with values for \"red\", \"green\", \"blue\", \"alpha\", \"theta\" (direction, in degrees), and \"phi\" (angle from the horizon, in degrees)"
    }
  },
  "@K[203]": "Transitions the sun's color and direction from its current values to the ones specified over a given time and transition curve."
}
```

</details>

## GameScript.Game.Graphics.SetFogColor

```lua
GameScript.Game.Graphics.SetFogColor(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2196](../../luasense_decompiled.lua#L2196). Имена `argN` — placeholders реконструкции.

Set the fog color with a transition over time

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | CurveName | The name in the ScriptComponent curve template list that refers to the transition curve |
| 3.0 | TransitionTime | The number of seconds needed to make the transition from the fog's current values to the ones specified |
| 4.0 | FogColor | The fog's color, expressed as a table with values for "r", "g", "b", "a" values 0 to 1 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "CurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the transition curve"
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "The number of seconds needed to make the transition from the fog's current values to the ones specified"
    },
    "4.0": {
      "@K[209]": "FogColor",
      "@K[211]": "The fog's color, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 1"
    }
  },
  "@K[203]": "Set the fog color with a transition over time"
}
```

</details>

## GameScript.Game.Graphics.SetFogCubeMap

```lua
GameScript.Game.Graphics.SetFogCubeMap(arg1, arg2)
```

Источник: [Lua, строка 2199](../../luasense_decompiled.lua#L2199). Имена `argN` — placeholders реконструкции.

Set the fog cube map to a new texture.  NOTE: This must be called by script again when reloading a checkpoint, as the Environmental Light/Fog component cannot safely save this resource-based change.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | TextureName | The name in the ScriptComponent texture list that refers to the new fog cube map texture |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "TextureName",
      "@K[211]": "The name in the ScriptComponent texture list that refers to the new fog cube map texture"
    }
  },
  "@K[203]": "Set the fog cube map to a new texture.  NOTE: This must be called by script again when reloading a checkpoint, as the Environmental Light/Fog component cannot safely save this resource-based change."
}
```

</details>

## GameScript.Game.Graphics.SetFogValues

```lua
GameScript.Game.Graphics.SetFogValues(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2202](../../luasense_decompiled.lua#L2202). Имена `argN` — placeholders реконструкции.

Set the fog to a new set of values with a transition over time

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | CurveName | The name in the ScriptComponent curve template list that refers to the transition curve |
| 3.0 | TransitionTime | The number of seconds needed to make the transition from the fog's current values to the ones specified |
| 4.0 | FogValues | The fog's values and direction, expressed as a table with values for "near", "far", "max", "top", "bottom" and "type" which is 0=NoFog, 1=DepthFog, 2=HeightFog  and "source" which is 0=constant, 1 = cubeMap  |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "CurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the transition curve"
    },
    "3.0": {
      "@K[209]": "TransitionTime",
      "@K[211]": "The number of seconds needed to make the transition from the fog's current values to the ones specified"
    },
    "4.0": {
      "@K[209]": "FogValues",
      "@K[211]": "The fog's values and direction, expressed as a table with values for \"near\", \"far\", \"max\", \"top\", \"bottom\" and \"type\" which is 0=NoFog, 1=DepthFog, 2=HeightFog  and \"source\" which is 0=constant, 1 = cubeMap "
    }
  },
  "@K[203]": "Set the fog to a new set of values with a transition over time"
}
```

</details>

## GameScript.Game.Graphics.SetGlobalSunDirection

```lua
GameScript.Game.Graphics.SetGlobalSunDirection()
```

Источник: [Lua, строка 2205](../../luasense_decompiled.lua#L2205). Имена `argN` — placeholders реконструкции.

Sets  the direction of the global shadow map used for multiple LightProbeRegionComponents.
["theta"] - theta angle of the shadow direction
["phi"] - phi angle of the shadow direction


<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Sets  the direction of the global shadow map used for multiple LightProbeRegionComponents.\n[\"theta\"] - theta angle of the shadow direction\n[\"phi\"] - phi angle of the shadow direction\n"
}
```

</details>

## GameScript.Game.Graphics.SetLightControl

```lua
GameScript.Game.Graphics.SetLightControl(arg1, arg2, arg3)
```

Источник: [Lua, строка 2208](../../luasense_decompiled.lua#L2208). Имена `argN` — placeholders реконструкции.

Change the light control component's color values.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | ColorA | ColorA for the Light Control Component, expressed as a table with values for "r", "g", "b", "a" values 0 to 255 |
| 3.0 | ColorB | ColorB for the Light Control Component, expressed as a table with values for "r", "g", "b", "a" values 0 to 255 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "ColorA",
      "@K[211]": "ColorA for the Light Control Component, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 255"
    },
    "3.0": {
      "@K[209]": "ColorB",
      "@K[211]": "ColorB for the Light Control Component, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 255"
    }
  },
  "@K[203]": "Change the light control component's color values."
}
```

</details>

## GameScript.Game.Graphics.SetLightControlAndCurve

```lua
GameScript.Game.Graphics.SetLightControlAndCurve(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2211](../../luasense_decompiled.lua#L2211). Имена `argN` — placeholders реконструкции.

Change the light control component's color values and timed curve.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | ColorA | ColorA for the Light Control Component, expressed as a table with values for "r", "g", "b", "a" values 0 to 255 |
| 3.0 | ColorB | ColorB for the Light Control Component, expressed as a table with values for "r", "g", "b", "a" values 0 to 255 |
| 4.0 | CurveName | The name in the ScriptComponent curve template list that refers to the transition curve |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "ColorA",
      "@K[211]": "ColorA for the Light Control Component, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 255"
    },
    "3.0": {
      "@K[209]": "ColorB",
      "@K[211]": "ColorB for the Light Control Component, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 255"
    },
    "4.0": {
      "@K[209]": "CurveName",
      "@K[211]": "The name in the ScriptComponent curve template list that refers to the transition curve"
    }
  },
  "@K[203]": "Change the light control component's color values and timed curve."
}
```

</details>

## GameScript.Game.Graphics.SetLightIntensity

```lua
GameScript.Game.Graphics.SetLightIntensity(arg1, arg2)
```

Источник: [Lua, строка 2214](../../luasense_decompiled.lua#L2214). Имена `argN` — placeholders реконструкции.

Set the intensity of the light.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The light holder object |
| 2.0 | Intensity | The light's intensity, 0 to 1 is normal range |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The light holder object"
    },
    "2.0": {
      "@K[209]": "Intensity",
      "@K[211]": "The light's intensity, 0 to 1 is normal range"
    }
  },
  "@K[203]": "Set the intensity of the light."
}
```

</details>

## GameScript.Game.Graphics.SetLightProbeRegionAmbientColor

```lua
GameScript.Game.Graphics.SetLightProbeRegionAmbientColor(arg1, arg2)
```

Источник: [Lua, строка 2217](../../luasense_decompiled.lua#L2217). Имена `argN` — placeholders реконструкции.

Set the ambient contribution of a light probe region.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a light probe region |
| 2.0 | Color | The light probe region's ambient contribution, expressed as a table with values for "r", "g", "b", "a" values 0 to 255 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a light probe region"
    },
    "2.0": {
      "@K[209]": "Color",
      "@K[211]": "The light probe region's ambient contribution, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 255"
    }
  },
  "@K[203]": "Set the ambient contribution of a light probe region."
}
```

</details>

## GameScript.Game.Graphics.SetLightRadius

```lua
GameScript.Game.Graphics.SetLightRadius(arg1, arg2, arg3)
```

Источник: [Lua, строка 2220](../../luasense_decompiled.lua#L2220). Имена `argN` — placeholders реконструкции.

Set the inner and outer radius of an object with a hardware light.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | InnerRadius | Inner radius in meters of the light |
| 3.0 | OuterRadius | Outer radius in meters of the light |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "InnerRadius",
      "@K[211]": "Inner radius in meters of the light"
    },
    "3.0": {
      "@K[209]": "OuterRadius",
      "@K[211]": "Outer radius in meters of the light"
    }
  },
  "@K[203]": "Set the inner and outer radius of an object with a hardware light."
}
```

</details>

## GameScript.Game.Graphics.SetMaterialSortMode

```lua
GameScript.Game.Graphics.SetMaterialSortMode(arg1, arg2)
```

Источник: [Lua, строка 2223](../../luasense_decompiled.lua#L2223). Имена `argN` — placeholders реконструкции.

Set this object materials to the specified sort mode

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object whose material we are changing |
| 2.0 | SortMode | The SortMode we are changing to. SORT_NOTSPECIFIED = 0, SORT_DEPTH = 1, SORT_DECAL = 2, SORT_SKY = 3, SORT_SHADOW = 4, SORT_LAST = 5 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object whose material we are changing"
    },
    "2.0": {
      "@K[209]": "SortMode",
      "@K[211]": "The SortMode we are changing to. SORT_NOTSPECIFIED = 0, SORT_DEPTH = 1, SORT_DECAL = 2, SORT_SKY = 3, SORT_SHADOW = 4, SORT_LAST = 5"
    }
  },
  "@K[203]": "Set this object materials to the specified sort mode"
}
```

</details>

## GameScript.Game.Graphics.SetNamedMaterialColor

```lua
GameScript.Game.Graphics.SetNamedMaterialColor(arg1, arg2, arg3)
```

Источник: [Lua, строка 2226](../../luasense_decompiled.lua#L2226). Имена `argN` — placeholders реконструкции.

Sets the color of the first named parameter with name <ParameterName> inside a material in the given object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object whose material we are changing |
| 2.0 | ParameterName | The name of the material parameter we are changing |
| 3.0 | Color | The new color for the variable, expressed as a table with fields "r", "g", "b", and "a", each are 0->255 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object whose material we are changing"
    },
    "2.0": {
      "@K[209]": "ParameterName",
      "@K[211]": "The name of the material parameter we are changing"
    },
    "3.0": {
      "@K[209]": "Color",
      "@K[211]": "The new color for the variable, expressed as a table with fields \"r\", \"g\", \"b\", and \"a\", each are 0->255"
    }
  },
  "@K[203]": "Sets the color of the first named parameter with name <ParameterName> inside a material in the given object"
}
```

</details>

## GameScript.Game.Graphics.SetNamedMaterialScalar

```lua
GameScript.Game.Graphics.SetNamedMaterialScalar(arg1, arg2, arg3)
```

Источник: [Lua, строка 2229](../../luasense_decompiled.lua#L2229). Имена `argN` — placeholders реконструкции.

Sets the value of the first named parameter with name <ParameterName> inside a material in the given object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object whose alpha blend we are adjusting. |
| 2.0 | ParameterName | The name of the material parameter we are changing |
| 3.0 | Value | The new value for the variable |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object whose alpha blend we are adjusting."
    },
    "2.0": {
      "@K[209]": "ParameterName",
      "@K[211]": "The name of the material parameter we are changing"
    },
    "3.0": {
      "@K[209]": "Value",
      "@K[211]": "The new value for the variable"
    }
  },
  "@K[203]": "Sets the value of the first named parameter with name <ParameterName> inside a material in the given object"
}
```

</details>

## GameScript.Game.Graphics.SetParticleAmbientColor

```lua
GameScript.Game.Graphics.SetParticleAmbientColor(arg1, arg2)
```

Источник: [Lua, строка 2231](../../luasense_decompiled.lua#L2231). Имена `argN` — placeholders реконструкции.

@K[219]

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | Color | The ambient particle's final color, expressed as a table with values for "r", "g", "b", "a" values 0 to 255 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "Color",
      "@K[211]": "The ambient particle's final color, expressed as a table with values for \"r\", \"g\", \"b\", \"a\" values 0 to 255"
    }
  },
  "@K[203]": "@K[219]"
}
```

</details>

## GameScript.Game.Graphics.SetPortalOpen

```lua
GameScript.Game.Graphics.SetPortalOpen(arg1, arg2)
```

Источник: [Lua, строка 2234](../../luasense_decompiled.lua#L2234). Имена `argN` — placeholders реконструкции.

Sets whether a portal is open or closed.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Object | The object with a portal |
| 2.0 | @K[77] | Whether this portal should be open |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Object",
      "@K[211]": "The object with a portal"
    },
    "2.0": {
      "@K[209]": "@K[77]",
      "@K[211]": "Whether this portal should be open"
    }
  },
  "@K[203]": "Sets whether a portal is open or closed."
}
```

</details>

## GameScript.Game.Graphics.SetShadowDistances

```lua
GameScript.Game.Graphics.SetShadowDistances(arg1, arg2, arg3)
```

Источник: [Lua, строка 2237](../../luasense_decompiled.lua#L2237). Имена `argN` — placeholders реконструкции.

Adjust the shadow near and far planes.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | InnerDistance | Inner shadow distance, any shadows that are this distance from the camera or less will use the highest resolution |
| 3.0 | OuterDistance | Outer shadow distance, any shadows that are this distance from the camera or greater will use the lowest resolution. This value should be tunes as small as possible, but large enough to cover all important shadows in view. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "InnerDistance",
      "@K[211]": "Inner shadow distance, any shadows that are this distance from the camera or less will use the highest resolution"
    },
    "3.0": {
      "@K[209]": "OuterDistance",
      "@K[211]": "Outer shadow distance, any shadows that are this distance from the camera or greater will use the lowest resolution. This value should be tunes as small as possible, but large enough to cover all important shadows in view."
    }
  },
  "@K[203]": "Adjust the shadow near and far planes."
}
```

</details>

## GameScript.Game.Graphics.SetShadowQuality

```lua
GameScript.Game.Graphics.SetShadowQuality(arg1)
```

Источник: [Lua, строка 2240](../../luasense_decompiled.lua#L2240). Имена `argN` — placeholders реконструкции.

Sets the quality level for shadows.  Low quality shadows are a little faster on the GPU and 20-30% faster on the CPU.  However, they may consume more memory than high quality shadows. Low quality shadows should use a larger inner shadow distance (typically 2-3 times larger than high quality shadows).

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ShadowQuality | Shadow quality. 0 = High. 1 = Low. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ShadowQuality",
      "@K[211]": "Shadow quality. 0 = High. 1 = Low."
    }
  },
  "@K[203]": "Sets the quality level for shadows.  Low quality shadows are a little faster on the GPU and 20-30% faster on the CPU.  However, they may consume more memory than high quality shadows. Low quality shadows should use a larger inner shadow distance (typically 2-3 times larger than high quality shadows)."
}
```

</details>

## GameScript.Game.Graphics.SetSpecularAmbientCubeMap

```lua
GameScript.Game.Graphics.SetSpecularAmbientCubeMap(arg1, arg2)
```

Источник: [Lua, строка 2243](../../luasense_decompiled.lua#L2243). Имена `argN` — placeholders реконструкции.

Changes the specular ambient cube map to use the texture of the specified variable.  NOTE: This must be called by script again when reloading a checkpoint, as the Environmental Light component cannot safely save this resource-based change.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The Environmental Light object |
| 2.0 | TextureName | The name of the texture variable defined in the script |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The Environmental Light object"
    },
    "2.0": {
      "@K[209]": "TextureName",
      "@K[211]": "The name of the texture variable defined in the script"
    }
  },
  "@K[203]": "Changes the specular ambient cube map to use the texture of the specified variable.  NOTE: This must be called by script again when reloading a checkpoint, as the Environmental Light component cannot safely save this resource-based change."
}
```

</details>

## GameScript.Game.Graphics.SetSpotLight

```lua
GameScript.Game.Graphics.SetSpotLight(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2246](../../luasense_decompiled.lua#L2246). Имена `argN` — placeholders реконструкции.

Change the spotlight characteristics of the hardware light.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | LightObject | The object with a hardware light |
| 2.0 | InnerAngle | Inner angle in degrees of the spotLight |
| 3.0 | OuterAngle | Outer angle in degrees of the spotLight |
| 4.0 | AspectRatio | Aspect ratio of the spotLight |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "LightObject",
      "@K[211]": "The object with a hardware light"
    },
    "2.0": {
      "@K[209]": "InnerAngle",
      "@K[211]": "Inner angle in degrees of the spotLight"
    },
    "3.0": {
      "@K[209]": "OuterAngle",
      "@K[211]": "Outer angle in degrees of the spotLight"
    },
    "4.0": {
      "@K[209]": "AspectRatio",
      "@K[211]": "Aspect ratio of the spotLight"
    }
  },
  "@K[203]": "Change the spotlight characteristics of the hardware light."
}
```

</details>
