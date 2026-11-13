# Despair.Landscape.File

[Индекс](../API.md)

## Despair.Landscape.File.ClearModified

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Clear Modified flag of current world.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Clear Modified flag of current world."
}
```

</details>

## Despair.Landscape.File.Close

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Closes the world specified by Path

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path and filename of the world that should be closed. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename of the world that should be closed."
    }
  },
  "@K[203]": "Closes the world specified by Path"
}
```

</details>

## Despair.Landscape.File.CloseAll

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Closes all the currently opened files.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Closes all the currently opened files."
}
```

</details>

## Despair.Landscape.File.New

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Creates a new world.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Elements | Comma separated list of elements that should included in this new world. Valid values are:<br>	Navmap<br>	Lighting |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Elements",
      "@K[211]": "Comma separated list of elements that should included in this new world. Valid values are:\n\tNavmap\n\tLighting"
    }
  },
  "@K[203]": "Creates a new world."
}
```

</details>

## Despair.Landscape.File.Open

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Opens the world specified by Path.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path to the world that should be opened. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path to the world that should be opened."
    }
  },
  "@K[203]": "Opens the world specified by Path."
}
```

</details>

## Despair.Landscape.File.Save

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the currently selected file as the name specified. Note: yes this is exactly the same as SaveAs... (but shouldn't be)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path and filename that should be used for saving the world. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename that should be used for saving the world."
    }
  },
  "@K[203]": "Saves the currently selected file as the name specified. Note: yes this is exactly the same as SaveAs... (but shouldn't be)"
}
```

</details>

## Despair.Landscape.File.SaveAs

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the currently selected file as the name specified.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path and filename that should be used for saving the world. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename that should be used for saving the world."
    }
  },
  "@K[203]": "Saves the currently selected file as the name specified."
}
```

</details>

## Despair.Landscape.File.Validate

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Validate the currently selected file.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Validate the currently selected file."
}
```

</details>
