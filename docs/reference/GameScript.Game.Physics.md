# GameScript.Game.Physics

[Индекс](../API.md)

## GameScript.Game.Physics.ApplyAngularImpulse

```lua
GameScript.Game.Physics.ApplyAngularImpulse(arg1, arg2, arg3)
```

Источник: [Lua, строка 2434](../../luasense_decompiled.lua#L2434). Имена `argN` — placeholders реконструкции.

Apply angular force for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are applying angular force |
| 2.0 | RotationAxisVector | Axis around which we are rotating |
| 3.0 | Impulse | Force in newton to which the object is being subjected |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are applying angular force"
    },
    "2.0": {
      "@K[209]": "RotationAxisVector",
      "@K[211]": "Axis around which we are rotating"
    },
    "3.0": {
      "@K[209]": "Impulse",
      "@K[211]": "Force in newton to which the object is being subjected"
    }
  },
  "@K[203]": "Apply angular force for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component."
}
```

</details>

## GameScript.Game.Physics.ApplyAngularImpulseToRigidBody

```lua
GameScript.Game.Physics.ApplyAngularImpulseToRigidBody(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2437](../../luasense_decompiled.lua#L2437). Имена `argN` — placeholders реконструкции.

Apply angular force for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are applying angular force |
| 2.0 | RigidBodyName | The rigid body in the object that we are applying force. |
| 3.0 | RotationAxisVector | Axis around which we are rotating |
| 4.0 | Impulse | Force in newton to which the object is being subjected |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are applying angular force"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are applying force."
    },
    "3.0": {
      "@K[209]": "RotationAxisVector",
      "@K[211]": "Axis around which we are rotating"
    },
    "4.0": {
      "@K[209]": "Impulse",
      "@K[211]": "Force in newton to which the object is being subjected"
    }
  },
  "@K[203]": "Apply angular force for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component."
}
```

</details>

## GameScript.Game.Physics.ApplyImpulse

```lua
GameScript.Game.Physics.ApplyImpulse(arg1, arg2)
```

Источник: [Lua, строка 2440](../../luasense_decompiled.lua#L2440). Имена `argN` — placeholders реконструкции.

Apply force for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are applying force |
| 2.0 | Force | Force in Newtons to which the is being subjected |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are applying force"
    },
    "2.0": {
      "@K[209]": "Force",
      "@K[211]": "Force in Newtons to which the is being subjected"
    }
  },
  "@K[203]": "Apply force for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component."
}
```

</details>

## GameScript.Game.Physics.ApplyImpulseToCloth

```lua
GameScript.Game.Physics.ApplyImpulseToCloth(arg1, arg2)
```

Источник: [Lua, строка 2443](../../luasense_decompiled.lua#L2443). Имена `argN` — placeholders реконструкции.

Apply force to cloth.  An error message will be output if no Simulation Component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to which the impulse will be applied |
| 2.0 | Impulse | Force in Newtons to which the cloth is being subjected |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to which the impulse will be applied"
    },
    "2.0": {
      "@K[209]": "Impulse",
      "@K[211]": "Force in Newtons to which the cloth is being subjected"
    }
  },
  "@K[203]": "Apply force to cloth.  An error message will be output if no Simulation Component."
}
```

</details>

## GameScript.Game.Physics.ApplyImpulseToRigidBody

```lua
GameScript.Game.Physics.ApplyImpulseToRigidBody(arg1, arg2, arg3)
```

Источник: [Lua, строка 2446](../../luasense_decompiled.lua#L2446). Имена `argN` — placeholders реконструкции.

Apply force for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are applying force |
| 2.0 | RigidBodyName | The rigid body in the object that we are apply force. |
| 3.0 | Force | Force in Newtons to which the is being subjected |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are applying force"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are apply force."
    },
    "3.0": {
      "@K[209]": "Force",
      "@K[211]": "Force in Newtons to which the is being subjected"
    }
  },
  "@K[203]": "Apply force for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component."
}
```

</details>

## GameScript.Game.Physics.DoesHavePhysics

```lua
GameScript.Game.Physics.DoesHavePhysics(arg1)
```

Источник: [Lua, строка 2449](../../luasense_decompiled.lua#L2449). Имена `argN` — placeholders реконструкции.

Returns whether or not the EmpireObject has physics.

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
  "@K[203]": "Returns whether or not the EmpireObject has physics."
}
```

</details>

## GameScript.Game.Physics.DoesRigidBodyExist

```lua
GameScript.Game.Physics.DoesRigidBodyExist(arg1, arg2)
```

Источник: [Lua, строка 2452](../../luasense_decompiled.lua#L2452). Имена `argN` — placeholders реконструкции.

Returns if a scene node named "RigidBodyName" exists in this object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are checking |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are checking"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking."
    }
  },
  "@K[203]": "Returns if a scene node named \"RigidBodyName\" exists in this object."
}
```

</details>

## GameScript.Game.Physics.GetAABB

```lua
GameScript.Game.Physics.GetAABB(arg1)
```

Источник: [Lua, строка 2455](../../luasense_decompiled.lua#L2455). Имена `argN` — placeholders реконструкции.

Returns the AABB of the physics for an object in a table with minX,minY,minZ,maxX,maxY,maxZ

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
  "@K[203]": "Returns the AABB of the physics for an object in a table with minX,minY,minZ,maxX,maxY,maxZ"
}
```

</details>

## GameScript.Game.Physics.GetAngularVelocity

```lua
GameScript.Game.Physics.GetAngularVelocity(arg1)
```

Источник: [Lua, строка 2458](../../luasense_decompiled.lua#L2458). Имена `argN` — placeholders реконструкции.

Get the angular velocity of an object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are getting it's angular velocity |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are getting it's angular velocity"
    }
  },
  "@K[203]": "Get the angular velocity of an object."
}
```

</details>

## GameScript.Game.Physics.GetCollisionGroup

```lua
GameScript.Game.Physics.GetCollisionGroup(arg1)
```

Источник: [Lua, строка 2461](../../luasense_decompiled.lua#L2461). Имена `argN` — placeholders реконструкции.

Returns collision group of the object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting the collision group |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting the collision group"
    }
  },
  "@K[203]": "Returns collision group of the object"
}
```

</details>

## GameScript.Game.Physics.GetLinearVelocity

```lua
GameScript.Game.Physics.GetLinearVelocity(arg1)
```

Источник: [Lua, строка 2464](../../luasense_decompiled.lua#L2464). Имена `argN` — placeholders реконструкции.

Get the linear velocity of an object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are getting it's linear velocity |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are getting it's linear velocity"
    }
  },
  "@K[203]": "Get the linear velocity of an object."
}
```

</details>

## GameScript.Game.Physics.GetMass

```lua
GameScript.Game.Physics.GetMass(arg1)
```

Источник: [Lua, строка 2467](../../luasense_decompiled.lua#L2467). Имена `argN` — placeholders реконструкции.

Get mass of object if it has a physics component.

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
  "@K[203]": "Get mass of object if it has a physics component."
}
```

</details>

## GameScript.Game.Physics.GetRigidBodyFriction

```lua
GameScript.Game.Physics.GetRigidBodyFriction(arg1, arg2)
```

Источник: [Lua, строка 2470](../../luasense_decompiled.lua#L2470). Имена `argN` — placeholders реконструкции.

Returns friction of the rigid body of the object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting friction |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting friction"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Returns friction of the rigid body of the object"
}
```

</details>

## GameScript.Game.Physics.GetRigidBodyMass

```lua
GameScript.Game.Physics.GetRigidBodyMass(arg1, arg2)
```

Источник: [Lua, строка 2473](../../luasense_decompiled.lua#L2473). Имена `argN` — placeholders реконструкции.

Returns mass of the rigid body of the object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting mass |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting mass"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Returns mass of the rigid body of the object"
}
```

</details>

## GameScript.Game.Physics.GetRigidBodyPosition

```lua
GameScript.Game.Physics.GetRigidBodyPosition(arg1, arg2)
```

Источник: [Lua, строка 2476](../../luasense_decompiled.lua#L2476). Имена `argN` — placeholders реконструкции.

Returns vector3D with position of the rigid body of the object in fields x,y,z of the table, if no position exists, there will be all zeros 

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting position |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting position"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Returns vector3D with position of the rigid body of the object in fields x,y,z of the table, if no position exists, there will be all zeros "
}
```

</details>

## GameScript.Game.Physics.GetRigidBodyRestitution

```lua
GameScript.Game.Physics.GetRigidBodyRestitution(arg1, arg2)
```

Источник: [Lua, строка 2479](../../luasense_decompiled.lua#L2479). Имена `argN` — placeholders реконструкции.

Returns restitution of the rigid body of the object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting restitution |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting restitution"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Returns restitution of the rigid body of the object"
}
```

</details>

## GameScript.Game.Physics.GetRigidBodyRotation

```lua
GameScript.Game.Physics.GetRigidBodyRotation(arg1, arg2)
```

Источник: [Lua, строка 2482](../../luasense_decompiled.lua#L2482). Имена `argN` — placeholders реконструкции.

Returns vectorRPH with r=roll,p=pitch,h=heading, if no rph exists, there will be all zeros. Reference vectorRPH values with vectorRPH["r"], etc

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting roll, pitch and heading vector |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting roll, pitch and heading vector"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Returns vectorRPH with r=roll,p=pitch,h=heading, if no rph exists, there will be all zeros. Reference vectorRPH values with vectorRPH[\"r\"], etc"
}
```

</details>

## GameScript.Game.Physics.IsClothWindEnabled

```lua
GameScript.Game.Physics.IsClothWindEnabled(arg1)
```

Источник: [Lua, строка 2485](../../luasense_decompiled.lua#L2485). Имена `argN` — placeholders реконструкции.

Returns true of the given object has a Simulation Component that has the wind setting enabled.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | An object with a Simulation Component |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "An object with a Simulation Component"
    }
  },
  "@K[203]": "Returns true of the given object has a Simulation Component that has the wind setting enabled."
}
```

</details>

## GameScript.Game.Physics.IsDynamic

```lua
GameScript.Game.Physics.IsDynamic(arg1)
```

Источник: [Lua, строка 2488](../../luasense_decompiled.lua#L2488). Имена `argN` — placeholders реконструкции.

Check if the object has a dynamic physics .

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
  "@K[203]": "Check if the object has a dynamic physics ."
}
```

</details>

## GameScript.Game.Physics.IsKeyframed

```lua
GameScript.Game.Physics.IsKeyframed(arg1)
```

Источник: [Lua, строка 2491](../../luasense_decompiled.lua#L2491). Имена `argN` — placeholders реконструкции.

Check if the object has a keyframed physics.

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
  "@K[203]": "Check if the object has a keyframed physics."
}
```

</details>

## GameScript.Game.Physics.IsRigidBodyDynamic

```lua
GameScript.Game.Physics.IsRigidBodyDynamic(arg1, arg2)
```

Источник: [Lua, строка 2494](../../luasense_decompiled.lua#L2494). Имена `argN` — placeholders реконструкции.

Check if the rigid body of the object has a dynamic physics

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are checking |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are checking"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Check if the rigid body of the object has a dynamic physics"
}
```

</details>

## GameScript.Game.Physics.IsRigidBodyKeyframed

```lua
GameScript.Game.Physics.IsRigidBodyKeyframed(arg1, arg2)
```

Источник: [Lua, строка 2497](../../luasense_decompiled.lua#L2497). Имена `argN` — placeholders реконструкции.

Check if the rigid body of the object has a keyframed physics

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are checking |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are checking"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Check if the rigid body of the object has a keyframed physics"
}
```

</details>

## GameScript.Game.Physics.IsRigidBodyStatic

```lua
GameScript.Game.Physics.IsRigidBodyStatic(arg1, arg2)
```

Источник: [Lua, строка 2500](../../luasense_decompiled.lua#L2500). Имена `argN` — placeholders реконструкции.

Check if the rigid body of the object has a static physics

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are checking |
| 2.0 | RigidBodyName | The rigid body in the object that we are checking.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are checking"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are checking.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Check if the rigid body of the object has a static physics"
}
```

</details>

## GameScript.Game.Physics.IsStatic

```lua
GameScript.Game.Physics.IsStatic(arg1)
```

Источник: [Lua, строка 2503](../../luasense_decompiled.lua#L2503). Имена `argN` — placeholders реконструкции.

Check if the object has a static physics.

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
  "@K[203]": "Check if the object has a static physics."
}
```

</details>

## GameScript.Game.Physics.OverRideConstraintMaxSpeed

```lua
GameScript.Game.Physics.OverRideConstraintMaxSpeed(arg1, arg2)
```

Источник: [Lua, строка 2506](../../luasense_decompiled.lua#L2506). Имена `argN` — placeholders реконструкции.

OverRide the max speed for all constraints on the input object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to set the constraint max speed for |
| 2.0 | ConstraintSpeed | The new constraint max speed m/sec if prismatic, degrees/sec if hinge |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to set the constraint max speed for"
    },
    "2.0": {
      "@K[209]": "ConstraintSpeed",
      "@K[211]": "The new constraint max speed m/sec if prismatic, degrees/sec if hinge"
    }
  },
  "@K[203]": "OverRide the max speed for all constraints on the input object."
}
```

</details>

## GameScript.Game.Physics.RestoreConstraintMaxSpeed

```lua
GameScript.Game.Physics.RestoreConstraintMaxSpeed(arg1)
```

Источник: [Lua, строка 2509](../../luasense_decompiled.lua#L2509). Имена `argN` — placeholders реконструкции.

Restore the max speed for all constraints on the input object, assuming it has been overRiding by 'OverRideConstraintMaxSpeed' or some other method.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to restore the constraint max speed for |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to restore the constraint max speed for"
    }
  },
  "@K[203]": "Restore the max speed for all constraints on the input object, assuming it has been overRiding by 'OverRideConstraintMaxSpeed' or some other method."
}
```

</details>

## GameScript.Game.Physics.SetAngularVelocity

```lua
GameScript.Game.Physics.SetAngularVelocity(arg1, arg2, arg3)
```

Источник: [Lua, строка 2512](../../luasense_decompiled.lua#L2512). Имена `argN` — placeholders реконструкции.

Set angular velocity for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are setting angular velocity |
| 2.0 | RotationAxisVector | Axis around which we are rotating |
| 3.0 | Speed | Speed in degrees/sec to which the object is being set |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are setting angular velocity"
    },
    "2.0": {
      "@K[209]": "RotationAxisVector",
      "@K[211]": "Axis around which we are rotating"
    },
    "3.0": {
      "@K[209]": "Speed",
      "@K[211]": "Speed in degrees/sec to which the object is being set"
    }
  },
  "@K[203]": "Set angular velocity for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component."
}
```

</details>

## GameScript.Game.Physics.SetClothWindDirection

```lua
GameScript.Game.Physics.SetClothWindDirection(arg1, arg2)
```

Источник: [Lua, строка 2515](../../luasense_decompiled.lua#L2515). Имена `argN` — placeholders реконструкции.

Set the direction that the wind should blow

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | An object with a Simulation Component |
| 2.0 | Direction | The direction in world space |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "An object with a Simulation Component"
    },
    "2.0": {
      "@K[209]": "Direction",
      "@K[211]": "The direction in world space"
    }
  },
  "@K[203]": "Set the direction that the wind should blow"
}
```

</details>

## GameScript.Game.Physics.SetClothWindEnabled

```lua
GameScript.Game.Physics.SetClothWindEnabled(arg1, arg2)
```

Источник: [Lua, строка 2518](../../luasense_decompiled.lua#L2518). Имена `argN` — placeholders реконструкции.

Enables or disables the wind forces on a cloth object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | An object with a Simulation Component |
| 2.0 | Enabled | True or False |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "An object with a Simulation Component"
    },
    "2.0": {
      "@K[209]": "Enabled",
      "@K[211]": "True or False"
    }
  },
  "@K[203]": "Enables or disables the wind forces on a cloth object"
}
```

</details>

## GameScript.Game.Physics.SetClothWindInterval

```lua
GameScript.Game.Physics.SetClothWindInterval(arg1, arg2)
```

Источник: [Lua, строка 2521](../../luasense_decompiled.lua#L2521). Имена `argN` — placeholders реконструкции.

The time it takes (in seconds) for the wind force to cycle from minimum strength to maximum strength and back

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | An object with a Simulation Component |
| 2.0 | Interval | The time to cycle through weak->strong->weak |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "An object with a Simulation Component"
    },
    "2.0": {
      "@K[209]": "Interval",
      "@K[211]": "The time to cycle through weak->strong->weak"
    }
  },
  "@K[203]": "The time it takes (in seconds) for the wind force to cycle from minimum strength to maximum strength and back"
}
```

</details>

## GameScript.Game.Physics.SetClothWindStrength

```lua
GameScript.Game.Physics.SetClothWindStrength(arg1, arg2, arg3)
```

Источник: [Lua, строка 2524](../../luasense_decompiled.lua#L2524). Имена `argN` — placeholders реконструкции.

Set the min and max strength of the wind

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | An object with a Simulation Component |
| 2.0 | MinForce | The minimum strength of the wind |
| 3.0 | MaxForce | The maximum strength of the wind |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "An object with a Simulation Component"
    },
    "2.0": {
      "@K[209]": "MinForce",
      "@K[211]": "The minimum strength of the wind"
    },
    "3.0": {
      "@K[209]": "MaxForce",
      "@K[211]": "The maximum strength of the wind"
    }
  },
  "@K[203]": "Set the min and max strength of the wind"
}
```

</details>

## GameScript.Game.Physics.SetCollisionGroup

```lua
GameScript.Game.Physics.SetCollisionGroup(arg1, arg2)
```

Источник: [Lua, строка 2527](../../luasense_decompiled.lua#L2527). Имена `argN` — placeholders реконструкции.

Sets the collision group for the specified object

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The empireObject for which we are requesting the collision group |
| 2.0 | CollisionGroup | The collision group to set for this object |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The empireObject for which we are requesting the collision group"
    },
    "2.0": {
      "@K[209]": "CollisionGroup",
      "@K[211]": "The collision group to set for this object"
    }
  },
  "@K[203]": "Sets the collision group for the specified object"
}
```

</details>

## GameScript.Game.Physics.SetConstraintPosition

```lua
GameScript.Game.Physics.SetConstraintPosition(arg1, arg2)
```

Источник: [Lua, строка 2530](../../luasense_decompiled.lua#L2530). Имена `argN` — placeholders реконструкции.

Sets the position for all constraints on the input object.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object to set the constraint position of |
| 2.0 | ConstraintPosition | The new constraint position as a percentage of the total range, 0 to 1 |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object to set the constraint position of"
    },
    "2.0": {
      "@K[209]": "ConstraintPosition",
      "@K[211]": "The new constraint position as a percentage of the total range, 0 to 1"
    }
  },
  "@K[203]": "Sets the position for all constraints on the input object."
}
```

</details>

## GameScript.Game.Physics.SetLinearVelocityOfRigidBody

```lua
GameScript.Game.Physics.SetLinearVelocityOfRigidBody(arg1, arg2, arg3)
```

Источник: [Lua, строка 2533](../../luasense_decompiled.lua#L2533). Имена `argN` — placeholders реконструкции.

Set the linear velocity for a specific rigid body works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are setting velocity |
| 2.0 | RigidBodyName | The rigid body in the object that we setting velocity. |
| 3.0 | Velocity | Velocity in m/s to which the rigid body is being set |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are setting velocity"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we setting velocity."
    },
    "3.0": {
      "@K[209]": "Velocity",
      "@K[211]": "Velocity in m/s to which the rigid body is being set"
    }
  },
  "@K[203]": "Set the linear velocity for a specific rigid body works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component."
}
```

</details>

## GameScript.Game.Physics.SetRigidBodyFriction

```lua
GameScript.Game.Physics.SetRigidBodyFriction(arg1, arg2, arg3)
```

Источник: [Lua, строка 2536](../../luasense_decompiled.lua#L2536). Имена `argN` — placeholders реконструкции.

Take an object that has a physics component "EmpireObject" and a rigid body named  "RigidBodyName", and set its friction to a new value.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the rigid body |
| 2.0 | RigidBodyName | The rigid body in the object that we are changing.If an empty string "" is passed in the root rigid body will be used |
| 3.0 | Friction | The new value for the rigid body |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the rigid body"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are changing.If an empty string \"\" is passed in the root rigid body will be used"
    },
    "3.0": {
      "@K[209]": "Friction",
      "@K[211]": "The new value for the rigid body"
    }
  },
  "@K[203]": "Take an object that has a physics component \"EmpireObject\" and a rigid body named  \"RigidBodyName\", and set its friction to a new value."
}
```

</details>

## GameScript.Game.Physics.SetRigidBodyMass

```lua
GameScript.Game.Physics.SetRigidBodyMass(arg1, arg2, arg3)
```

Источник: [Lua, строка 2539](../../luasense_decompiled.lua#L2539). Имена `argN` — placeholders реконструкции.

Take an object that has a physics component "EmpireObject" and a rigid body named  "RigidBodyName", and set its mass to a new value.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the rigid body |
| 2.0 | RigidBodyName | The rigid body in the object that we are changing.If an empty string "" is passed in the root rigid body will be used |
| 3.0 | Mass | The new value for the rigid body |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the rigid body"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are changing.If an empty string \"\" is passed in the root rigid body will be used"
    },
    "3.0": {
      "@K[209]": "Mass",
      "@K[211]": "The new value for the rigid body"
    }
  },
  "@K[203]": "Take an object that has a physics component \"EmpireObject\" and a rigid body named  \"RigidBodyName\", and set its mass to a new value."
}
```

</details>

## GameScript.Game.Physics.SetRigidBodyRestitution

```lua
GameScript.Game.Physics.SetRigidBodyRestitution(arg1, arg2, arg3)
```

Источник: [Lua, строка 2542](../../luasense_decompiled.lua#L2542). Имена `argN` — placeholders реконструкции.

Take an object that has a physics component "EmpireObject" and a rigid body named  "RigidBodyName", and set its restitution to a new value.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the rigid body |
| 2.0 | RigidBodyName | The rigid body in the object that we are changing.If an empty string "" is passed in the root rigid body will be used |
| 3.0 | Restitution | The new value for the rigid body |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the rigid body"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are changing.If an empty string \"\" is passed in the root rigid body will be used"
    },
    "3.0": {
      "@K[209]": "Restitution",
      "@K[211]": "The new value for the rigid body"
    }
  },
  "@K[203]": "Take an object that has a physics component \"EmpireObject\" and a rigid body named  \"RigidBodyName\", and set its restitution to a new value."
}
```

</details>

## GameScript.Game.Physics.SetRigidBodyToDynamic

```lua
GameScript.Game.Physics.SetRigidBodyToDynamic(arg1, arg2)
```

Источник: [Lua, строка 2545](../../luasense_decompiled.lua#L2545). Имена `argN` — placeholders реконструкции.

Take an object that has a physics component "EmpireObject" and a rigid body named  "RigidBodyName", and make it dynamic, as opposed to keyframed or static.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the rigid body |
| 2.0 | RigidBodyName | The rigid body in the object that we are changing.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the rigid body"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are changing.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Take an object that has a physics component \"EmpireObject\" and a rigid body named  \"RigidBodyName\", and make it dynamic, as opposed to keyframed or static."
}
```

</details>

## GameScript.Game.Physics.SetRigidBodyToStatic

```lua
GameScript.Game.Physics.SetRigidBodyToStatic(arg1, arg2)
```

Источник: [Lua, строка 2548](../../luasense_decompiled.lua#L2548). Имена `argN` — placeholders реконструкции.

Take an object that has a physics component "EmpireObject" and a rigid body named  "RigidBodyName", and make it static, as opposed to keyframed or dynamic.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the rigid body |
| 2.0 | RigidBodyName | The rigid body in the object that we are changing.If an empty string "" is passed in the root rigid body will be used |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the rigid body"
    },
    "2.0": {
      "@K[209]": "RigidBodyName",
      "@K[211]": "The rigid body in the object that we are changing.If an empty string \"\" is passed in the root rigid body will be used"
    }
  },
  "@K[203]": "Take an object that has a physics component \"EmpireObject\" and a rigid body named  \"RigidBodyName\", and make it static, as opposed to keyframed or dynamic."
}
```

</details>

## GameScript.Game.Physics.SetSurfaceVelocityAccelerationScale

```lua
GameScript.Game.Physics.SetSurfaceVelocityAccelerationScale(arg1, arg2)
```

Источник: [Lua, строка 2551](../../luasense_decompiled.lua#L2551). Имена `argN` — placeholders реконструкции.

Takes an object with a "Surface Velocity Modifier" component and scales the acceleration, the current speed will change to match the desired based on the acceleration

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the "Surface Velocity Modifier" component |
| 2.0 | AccelerationScale | Amount to scale the acceleration for how quickly to move from current to desired |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the \"Surface Velocity Modifier\" component"
    },
    "2.0": {
      "@K[209]": "AccelerationScale",
      "@K[211]": "Amount to scale the acceleration for how quickly to move from current to desired"
    }
  },
  "@K[203]": "Takes an object with a \"Surface Velocity Modifier\" component and scales the acceleration, the current speed will change to match the desired based on the acceleration"
}
```

</details>

## GameScript.Game.Physics.SetSurfaceVelocityDesiredScale

```lua
GameScript.Game.Physics.SetSurfaceVelocityDesiredScale(arg1, arg2)
```

Источник: [Lua, строка 2554](../../luasense_decompiled.lua#L2554). Имена `argN` — placeholders реконструкции.

Takes an object with a "Surface Velocity Modifier" component and scales the desired speed of the surface velocity, the current speed will change to match the desired based on the acceleration in the component

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the "Surface Velocity Modifier" component |
| 2.0 | VelocityScale | Amount to scale the desired velocity, if negative will reverse the direction |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the \"Surface Velocity Modifier\" component"
    },
    "2.0": {
      "@K[209]": "VelocityScale",
      "@K[211]": "Amount to scale the desired velocity, if negative will reverse the direction"
    }
  },
  "@K[203]": "Takes an object with a \"Surface Velocity Modifier\" component and scales the desired speed of the surface velocity, the current speed will change to match the desired based on the acceleration in the component"
}
```

</details>

## GameScript.Game.Physics.SetSurfaceVelocityScale

```lua
GameScript.Game.Physics.SetSurfaceVelocityScale(arg1, arg2)
```

Источник: [Lua, строка 2557](../../luasense_decompiled.lua#L2557). Имена `argN` — placeholders реконструкции.

Takes an object with a "Surface Velocity Modifier" component and scales the current speed of the surface velocity, the current speed will change to match the desired based on the acceleration in the component

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the "Surface Velocity Modifier" component |
| 2.0 | VelocityScale | Amount to scale the velocity, if negative will reverse the direction |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the \"Surface Velocity Modifier\" component"
    },
    "2.0": {
      "@K[209]": "VelocityScale",
      "@K[211]": "Amount to scale the velocity, if negative will reverse the direction"
    }
  },
  "@K[203]": "Takes an object with a \"Surface Velocity Modifier\" component and scales the current speed of the surface velocity, the current speed will change to match the desired based on the acceleration in the component"
}
```

</details>

## GameScript.Game.Physics.SetToDynamic

```lua
GameScript.Game.Physics.SetToDynamic(arg1)
```

Источник: [Lua, строка 2560](../../luasense_decompiled.lua#L2560). Имена `argN` — placeholders реконструкции.

Take an object that has a physics component "EmpireObject" and make it dynamic, as opposed to static or keyframed.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the rigid body |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the rigid body"
    }
  },
  "@K[203]": "Take an object that has a physics component \"EmpireObject\" and make it dynamic, as opposed to static or keyframed."
}
```

</details>

## GameScript.Game.Physics.SetToStatic

```lua
GameScript.Game.Physics.SetToStatic(arg1)
```

Источник: [Lua, строка 2563](../../luasense_decompiled.lua#L2563). Имена `argN` — placeholders реконструкции.

Take an object that has a physics component "EmpireObject" and make it static, as opposed to keyframed or dynamic.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object with the rigid body |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object with the rigid body"
    }
  },
  "@K[203]": "Take an object that has a physics component \"EmpireObject\" and make it static, as opposed to keyframed or dynamic."
}
```

</details>

## GameScript.Game.Physics.SetVelocity

```lua
GameScript.Game.Physics.SetVelocity(arg1, arg2)
```

Источник: [Lua, строка 2566](../../luasense_decompiled.lua#L2566). Имена `argN` — placeholders реконструкции.

Set a velocity for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object that for which we are setting velocity |
| 2.0 | Velocity | Velocity in meters/sec to which the object is being set |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object that for which we are setting velocity"
    },
    "2.0": {
      "@K[209]": "Velocity",
      "@K[211]": "Velocity in meters/sec to which the object is being set"
    }
  },
  "@K[203]": "Set a velocity for an object, note that currently this only works for objects with standard physics components, other things such as people or AnimatedPhysics set the velocity every frame, so this will be ignored.An error message will be output if not physics component."
}
```

</details>
