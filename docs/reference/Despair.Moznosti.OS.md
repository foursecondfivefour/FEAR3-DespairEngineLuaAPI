# Despair.Moznosti.OS

[Индекс](../API.md)

## Despair.Moznosti.OS.CmdExec

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Executes an application from the command line. For Day 1 tools the alias "day1:tool name" can be used, and for non Day 1 tools the fully qualified path can be used. Note: will not work with built-in commands (i.e. dir, type, etc...)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Execuable | Day 1 Tool executable alias or full path to executable to launch. |
| 2.0 | Parameters | Parameters that should be passed to the executable. |
| 3.0 | Timeout | Amount of time in milliseconds to wait for the operation to complete. Use 0 for infinite. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Execuable",
      "@K[211]": "Day 1 Tool executable alias or full path to executable to launch."
    },
    "2.0": {
      "@K[209]": "Parameters",
      "@K[211]": "Parameters that should be passed to the executable."
    },
    "3.0": {
      "@K[209]": "Timeout",
      "@K[211]": "Amount of time in milliseconds to wait for the operation to complete. Use 0 for infinite."
    }
  },
  "@K[203]": "Executes an application from the command line. For Day 1 tools the alias \"day1:tool name\" can be used, and for non Day 1 tools the fully qualified path can be used. Note: will not work with built-in commands (i.e. dir, type, etc...)"
}
```

</details>

## Despair.Moznosti.OS.GetInstallLocation

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Queries the registry for the install location of the specified product and returns the resulting path as a string

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ProductName | Name of the product to locate. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ProductName",
      "@K[211]": "Name of the product to locate."
    }
  },
  "@K[203]": "Queries the registry for the install location of the specified product and returns the resulting path as a string"
}
```

</details>

## Despair.Moznosti.OS.GetProjectName

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Queries the registry for the name of the current project and returns the result as a string

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Queries the registry for the name of the current project and returns the result as a string"
}
```

</details>

## Despair.Moznosti.OS.GetResourceDepotLocation

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Queries the registry for the install location of the specified project's resource depot and returns the resulting path as a string

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | ProjectName | Name of the project whose resource depot to locate. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "ProjectName",
      "@K[211]": "Name of the project whose resource depot to locate."
    }
  },
  "@K[203]": "Queries the registry for the install location of the specified project's resource depot and returns the resulting path as a string"
}
```

</details>

## Despair.Moznosti.OS.ShellExec

Сигнатура не восстановлена: записи нет в Lua-заглушках.

Performs an OS shell execute. 

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Operation | Verb that specifies the action to be performed. The set of available verbs depends on the particular file or folder. Generally, the actions available from an object's shortcut menu are available verbs. For more information about verbs and their availability, see the MSDN docs for ShellExecute. The following verbs are commonly used.<br>"edit"<br>Launches an editor and opens the document for editing. If File is not a document file, the function will fail.<br>"explore"<br>Explores the folder specified by File.<br>"find"<br>Initiates a search starting from the specified directory.<br>"open"<br>Opens the file specified by the File parameter. The file can be an executable file, a document file, or a folder.<br>"print"<br>Prints the document file specified by File. If File is not a document file, the function will fail.<br> |
| 2.0 | @K[75] | String that specifies the file or object on which to execute the specified verb. To specify a Shell namespace object, pass the fully qualified parse name. Note that not all verbs are supported on all objects. For example, not all document types support the "print" verb. |
| 3.0 | Parameters | If the File parameter specifies an executable file, Parameters is a string that specifies the parameters to be passed to the application. The format of this string is determined by the verb that is to be invoked. If File specifies a document file, Parameters should be empty.  |
| 4.0 | Directory | String that specifies the default directory. |
| 5.0 | Show | Show this call show the application being used to perform the verb specified? |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Operation",
      "@K[211]": "Verb that specifies the action to be performed. The set of available verbs depends on the particular file or folder. Generally, the actions available from an object's shortcut menu are available verbs. For more information about verbs and their availability, see the MSDN docs for ShellExecute. The following verbs are commonly used.\n\"edit\"\nLaunches an editor and opens the document for editing. If File is not a document file, the function will fail.\n\"explore\"\nExplores the folder specified by File.\n\"find\"\nInitiates a search starting from the specified directory.\n\"open\"\nOpens the file specified by the File parameter. The file can be an executable file, a document file, or a folder.\n\"print\"\nPrints the document file specified by File. If File is not a document file, the function will fail.\n"
    },
    "2.0": {
      "@K[209]": "@K[75]",
      "@K[211]": "String that specifies the file or object on which to execute the specified verb. To specify a Shell namespace object, pass the fully qualified parse name. Note that not all verbs are supported on all objects. For example, not all document types support the \"print\" verb."
    },
    "3.0": {
      "@K[209]": "Parameters",
      "@K[211]": "If the File parameter specifies an executable file, Parameters is a string that specifies the parameters to be passed to the application. The format of this string is determined by the verb that is to be invoked. If File specifies a document file, Parameters should be empty. "
    },
    "4.0": {
      "@K[209]": "Directory",
      "@K[211]": "String that specifies the default directory."
    },
    "5.0": {
      "@K[209]": "Show",
      "@K[211]": "Show this call show the application being used to perform the verb specified?"
    }
  },
  "@K[203]": "Performs an OS shell execute. "
}
```

</details>
