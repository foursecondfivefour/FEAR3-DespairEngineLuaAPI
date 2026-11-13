# Despair.FontMaker.File

[Индекс](../API.md)

## Despair.FontMaker.File.Close

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Closes the currently selected file. Note: does not respect the Path parameter yet!

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path and filename of the font that should be closed. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename of the font that should be closed."
    }
  },
  "@K[203]": "Closes the currently selected file. Note: does not respect the Path parameter yet!"
}
```

</details>

## Despair.FontMaker.File.CloseAll

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

## Despair.FontMaker.File.New

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Creates a new font file.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Unused | This parameter is currently but is required. Please use "". |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Unused",
      "@K[211]": "This parameter is currently but is required. Please use \"\"."
    }
  },
  "@K[203]": "Creates a new font file."
}
```

</details>

## Despair.FontMaker.File.Open

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Opens the font specified by Path.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path to the font that should be opened. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path to the font that should be opened."
    }
  },
  "@K[203]": "Opens the font specified by Path."
}
```

</details>

## Despair.FontMaker.File.Save

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the currently selected file.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Unused | This parameter is currently but is required. Please use "". |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Unused",
      "@K[211]": "This parameter is currently but is required. Please use \"\"."
    }
  },
  "@K[203]": "Saves the currently selected file."
}
```

</details>

## Despair.FontMaker.File.SaveAs

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the currently selected file as the name specified.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Unused | This parameter is currently but is required. Please use "". |
| 2.0 | @K[249] | Path and filename that should be used for saving the font. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Unused",
      "@K[211]": "This parameter is currently but is required. Please use \"\"."
    },
    "2.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename that should be used for saving the font."
    }
  },
  "@K[203]": "Saves the currently selected file as the name specified."
}
```

</details>

## Despair.FontMaker.File.SaveBinary

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the currently selected file as a binary font using the name specified.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path and filename that should be used for saving the font. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename that should be used for saving the font."
    }
  },
  "@K[203]": "Saves the currently selected file as a binary font using the name specified."
}
```

</details>

## Despair.FontMaker.File.Validate

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
