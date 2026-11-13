# Despair.Landscape.Document.Worlds

[Индекс](../API.md)

## Despair.Landscape.Document.Worlds.AddObject

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Add Object to a world, returns object name - AddObject(MyWorld, MyGroup/MyGroup, /Objects/GameObjects/MyObject.dsObject)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | worldName | The desired world to add the object |
| 2.0 | groupPath | The desired group to add the object |
| 3.0 | objectPath | The object to add into the world |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "worldName",
      "@K[211]": "The desired world to add the object"
    },
    "2.0": {
      "@K[209]": "groupPath",
      "@K[211]": "The desired group to add the object"
    },
    "3.0": {
      "@K[209]": "objectPath",
      "@K[211]": "The object to add into the world"
    }
  },
  "@K[203]": "Add Object to a world, returns object name - AddObject(MyWorld, MyGroup/MyGroup, /Objects/GameObjects/MyObject.dsObject)"
}
```

</details>

## Despair.Landscape.Document.Worlds.AddObjectSelectedGroup

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Add Object to a world, returns object name - AddObject(/Objects/GameObjects/MyObject.dsObject)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | objectPath | The object to add into the world |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "objectPath",
      "@K[211]": "The object to add into the world"
    }
  },
  "@K[203]": "Add Object to a world, returns object name - AddObject(/Objects/GameObjects/MyObject.dsObject)"
}
```

</details>

## Despair.Landscape.Document.Worlds.GetWorlds

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Get all loaded world names

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Get all loaded world names"
}
```

</details>
