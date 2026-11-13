# Despair.Moznosti.File

[Индекс](../API.md)

## Despair.Moznosti.File.Close

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Closes the file.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Closes the file."
}
```

</details>

## Despair.Moznosti.File.New

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Creates a new menu tree.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Creates a new menu tree."
}
```

</details>

## Despair.Moznosti.File.Open

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Opens the effect specified by Path.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path to the menu tree that should be opened. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path to the menu tree that should be opened."
    }
  },
  "@K[203]": "Opens the effect specified by Path."
}
```

</details>

## Despair.Moznosti.File.Save

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the currently selected file.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Saves the currently selected file."
}
```

</details>

## Despair.Moznosti.File.SaveAs

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the file with the name specified.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | CurrentName | Path and filename that is currently being used. used to identify the tab to save. |
| 2.0 | @K[249] | Path and filename that should be used for saving the menu tree. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "CurrentName",
      "@K[211]": "Path and filename that is currently being used. used to identify the tab to save."
    },
    "2.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename that should be used for saving the menu tree."
    }
  },
  "@K[203]": "Saves the file with the name specified."
}
```

</details>
