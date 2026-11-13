# Despair.Landscape.Worlds

[Индекс](../API.md)

## Despair.Landscape.Worlds.AddGroup

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, Adds a new group to the world.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ParentName | Name of the new group's parent item, often another group |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ParentName",
      "@K[211]": "Name of the new group's parent item, often another group"
    }
  },
  "@K[203]": "In the Worlds View, Adds a new group to the world."
}
```

</details>

## Despair.Landscape.Worlds.Copy

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, selects the item with the specified name and copies it.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ItemName | Name of the item to copy |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ItemName",
      "@K[211]": "Name of the item to copy"
    }
  },
  "@K[203]": "In the Worlds View, selects the item with the specified name and copies it."
}
```

</details>

## Despair.Landscape.Worlds.Cut

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, selects the item with the specified name and cuts it.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ItemName | Name of the item to cut |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ItemName",
      "@K[211]": "Name of the item to cut"
    }
  },
  "@K[203]": "In the Worlds View, selects the item with the specified name and cuts it."
}
```

</details>

## Despair.Landscape.Worlds.Delete

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, selects the item with the specified name and deletes it.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ItemName | Name of the item to delete |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ItemName",
      "@K[211]": "Name of the item to delete"
    }
  },
  "@K[203]": "In the Worlds View, selects the item with the specified name and deletes it."
}
```

</details>

## Despair.Landscape.Worlds.Expand

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Expands the currently selected tree item.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Expands the currently selected tree item."
}
```

</details>

## Despair.Landscape.Worlds.FoundLastItem

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Returns true if the last SelectItem call was sucessful.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns true if the last SelectItem call was sucessful."
}
```

</details>

## Despair.Landscape.Worlds.Freeze

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, selects the item with the specified name and sets whether it is frozen.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ItemName | Name of the item to alter |
| 2.0 | Freeze | True is Freeze, False is Unfreeze |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ItemName",
      "@K[211]": "Name of the item to alter"
    },
    "2.0": {
      "@K[209]": "Freeze",
      "@K[211]": "True is Freeze, False is Unfreeze"
    }
  },
  "@K[203]": "In the Worlds View, selects the item with the specified name and sets whether it is frozen."
}
```

</details>

## Despair.Landscape.Worlds.GetSelectedLabel

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Returns the label of the currently select tree item.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the label of the currently select tree item."
}
```

</details>

## Despair.Landscape.Worlds.Rename

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, Renames the specified item.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CurrentName | Current name of the item |
| 2.0 | CurrentName | New name of the item |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CurrentName",
      "@K[211]": "Current name of the item"
    },
    "2.0": {
      "@K[209]": "CurrentName",
      "@K[211]": "New name of the item"
    }
  },
  "@K[203]": "In the Worlds View, Renames the specified item."
}
```

</details>

## Despair.Landscape.Worlds.Select

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Unclear what this does.  Just calls WorldExploreBar::OnPopupSelectGroup().

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Unclear what this does.  Just calls WorldExploreBar::OnPopupSelectGroup()."
}
```

</details>

## Despair.Landscape.Worlds.SelectFirst

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Selects the first item in the tree.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Selects the first item in the tree."
}
```

</details>

## Despair.Landscape.Worlds.SelectGroupInWorld

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, Finds the specified world if it exists, then selects the first group with the specified name.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GroupName | Name of the group within the world. |
| 2.0 | WorldName | Name of the world. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GroupName",
      "@K[211]": "Name of the group within the world."
    },
    "2.0": {
      "@K[209]": "WorldName",
      "@K[211]": "Name of the world."
    }
  },
  "@K[203]": "In the Worlds View, Finds the specified world if it exists, then selects the first group with the specified name."
}
```

</details>

## Despair.Landscape.Worlds.SelectItem

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Select specified item named "Name" in the tree.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[209] | Resource path to the model to use for previews. |
| 2.0 | PartialMatch | Does Name only specify a subset of the name?  |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[209]",
      "@K[211]": "Resource path to the model to use for previews."
    },
    "2.0": {
      "@K[209]": "PartialMatch",
      "@K[211]": "Does Name only specify a subset of the name? "
    }
  },
  "@K[203]": "Select specified item named \"Name\" in the tree."
}
```

</details>

## Despair.Landscape.Worlds.SelectNext

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Selects the next item in the tree otherwise the root item is selected.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Selects the next item in the tree otherwise the root item is selected."
}
```

</details>

## Despair.Landscape.Worlds.SelectParent

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Selects the parent of the currently selected tree item otherwise the root item is selected.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Selects the parent of the currently selected tree item otherwise the root item is selected."
}
```

</details>

## Despair.Landscape.Worlds.SelectPrev

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Selects the previous item in the tree otherwise the root item is selected.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Selects the previous item in the tree otherwise the root item is selected."
}
```

</details>

## Despair.Landscape.Worlds.SelectTab

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Not Implemented

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Not Implemented"
}
```

</details>

## Despair.Landscape.Worlds.SelectWorld

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Not Implemented

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Not Implemented"
}
```

</details>

## Despair.Landscape.Worlds.SetAsDropPoint

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, selects the item with the specified name and sets it as the drop point.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ItemName | Name of the item to alter |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ItemName",
      "@K[211]": "Name of the item to alter"
    }
  },
  "@K[203]": "In the Worlds View, selects the item with the specified name and sets it as the drop point."
}
```

</details>

## Despair.Landscape.Worlds.SetFocus

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Sets the Input Focus to this view to handle keyboard / mouse input.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Sets the Input Focus to this view to handle keyboard / mouse input."
}
```

</details>

## Despair.Landscape.Worlds.Visible

Сигнатура не восстановлена: записи нет в Lua-заглушках.

In the Worlds View, selects the item with the specified name and sets whether it is visible.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ItemName | Name of the item to alter |
| 2.0 | Visible | True is Visible, False is Hidden |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ItemName",
      "@K[211]": "Name of the item to alter"
    },
    "2.0": {
      "@K[209]": "Visible",
      "@K[211]": "True is Visible, False is Hidden"
    }
  },
  "@K[203]": "In the Worlds View, selects the item with the specified name and sets whether it is visible."
}
```

</details>
