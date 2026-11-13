# Despair.Outtake.Perforce

[Индекс](../API.md)

## Despair.Outtake.Perforce.Checkin

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Checks in the files listed in File List. The Changelist Description is applied to the changelist generated for this check in.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FileList | Comma separated list of filenames to checkin. |
| 2.0 | ChangelistDescription | Description to use for the change list being checked in. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FileList",
      "@K[211]": "Comma separated list of filenames to checkin."
    },
    "2.0": {
      "@K[209]": "ChangelistDescription",
      "@K[211]": "Description to use for the change list being checked in."
    }
  },
  "@K[203]": "Checks in the files listed in File List. The Changelist Description is applied to the changelist generated for this check in."
}
```

</details>

## Despair.Outtake.Perforce.Checkout

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Checks out the filename specified from the perforce depot. Returns true is successful.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Filename | Name of the file to check out |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Filename",
      "@K[211]": "Name of the file to check out"
    }
  },
  "@K[203]": "Checks out the filename specified from the perforce depot. Returns true is successful."
}
```

</details>

## Despair.Outtake.Perforce.IsCheckedOut

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Returns true if perforce state shows the file to be currently checked out, false otherwise.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Filename | Name of the file to get checked out state for |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Filename",
      "@K[211]": "Name of the file to get checked out state for"
    }
  },
  "@K[203]": "Returns true if perforce state shows the file to be currently checked out, false otherwise."
}
```

</details>

## Despair.Outtake.Perforce.Revert

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Reverts the file specified. Returns true is successful.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Filename | Name of the file to revert |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Filename",
      "@K[211]": "Name of the file to revert"
    }
  },
  "@K[203]": "Reverts the file specified. Returns true is successful."
}
```

</details>

## Despair.Outtake.Perforce.Sync

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Syncs the filename specified from the perforce depot. Returns true is successful.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Filename | Name of the file to sync |
| 2.0 | Revision | Revision number to sync too. Use -1 for current head revision |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Filename",
      "@K[211]": "Name of the file to sync"
    },
    "2.0": {
      "@K[209]": "Revision",
      "@K[211]": "Revision number to sync too. Use -1 for current head revision"
    }
  },
  "@K[203]": "Syncs the filename specified from the perforce depot. Returns true is successful."
}
```

</details>
