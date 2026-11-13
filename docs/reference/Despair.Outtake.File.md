# Despair.Outtake.File

[Индекс](../API.md)

## Despair.Outtake.File.Close

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Closes the currently selected file. Note: does not respect the Path parameter yet!

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path and filename of the cinema that should be closed. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename of the cinema that should be closed."
    }
  },
  "@K[203]": "Closes the currently selected file. Note: does not respect the Path parameter yet!"
}
```

</details>

## Despair.Outtake.File.CloseAll

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

## Despair.Outtake.File.New

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Creates a new cinema file.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Creates a new cinema file."
}
```

</details>

## Despair.Outtake.File.Open

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Opens the cinema specified by Path.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path to the cinema that should be opened. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path to the cinema that should be opened."
    }
  },
  "@K[203]": "Opens the cinema specified by Path."
}
```

</details>

## Despair.Outtake.File.Save

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the currently selected file as the name specified. Note: yes this is exactly the same as SaveAs... (but shouldn't be)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[249] | Path and filename that should be used for saving the cinema. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename that should be used for saving the cinema."
    }
  },
  "@K[203]": "Saves the currently selected file as the name specified. Note: yes this is exactly the same as SaveAs... (but shouldn't be)"
}
```

</details>

## Despair.Outtake.File.SaveAs

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Saves the currently selected file as the name specified.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | @K[75] | File is supposed to refer to the window the suer wants to save, however it currently does nothing. |
| 2.0 | @K[249] | Path and filename that should be used for saving the cinema. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "@K[75]",
      "@K[211]": "File is supposed to refer to the window the suer wants to save, however it currently does nothing."
    },
    "2.0": {
      "@K[209]": "@K[249]",
      "@K[211]": "Path and filename that should be used for saving the cinema."
    }
  },
  "@K[203]": "Saves the currently selected file as the name specified."
}
```

</details>

## Despair.Outtake.File.Validate

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
