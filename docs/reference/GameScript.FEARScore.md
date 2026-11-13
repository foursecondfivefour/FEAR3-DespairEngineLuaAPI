# GameScript.FEARScore

[Индекс](../API.md)

## GameScript.FEARScore.AwardBoostRequirement

```lua
GameScript.FEARScore.AwardBoostRequirement()
```

Источник: [Lua, строка 1678](../../luasense_decompiled.lua#L1678). Имена `argN` — placeholders реконструкции.

<details><summary>Исходная структура call-tip</summary>

```json
{}
```

</details>

## GameScript.FEARScore.AwardChallengeRequirement

```lua
GameScript.FEARScore.AwardChallengeRequirement(arg1, arg2, arg3)
```

Источник: [Lua, строка 1681](../../luasense_decompiled.lua#L1681). Имена `argN` — placeholders реконструкции.

Add a number of requirements towards the goal, for instance if there is 1 new kill in a kill 30 enemies requirement, we add 1, e.g. for an additional melee kill: Score.AwardBoostRequirement(killerIndex,GameScript.BoostChallenge.Melee,1);

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player that will receive points |
| 2.0 | BoostChallengeIndex | The index of the boost challenge that we are progressing towards, from the table GameScript.BoostChallenge |
| 3.0 | NumRequirements | The number of requirements that will be added |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player that will receive points"
    },
    "2.0": {
      "@K[209]": "BoostChallengeIndex",
      "@K[211]": "The index of the boost challenge that we are progressing towards, from the table GameScript.BoostChallenge"
    },
    "3.0": {
      "@K[209]": "NumRequirements",
      "@K[211]": "The number of requirements that will be added"
    }
  },
  "@K[203]": "Add a number of requirements towards the goal, for instance if there is 1 new kill in a kill 30 enemies requirement, we add 1, e.g. for an additional melee kill: Score.AwardBoostRequirement(killerIndex,GameScript.BoostChallenge.Melee,1);"
}
```

</details>

## GameScript.FEARScore.AwardMissionPointOccurences

```lua
GameScript.FEARScore.AwardMissionPointOccurences(arg1, arg2, arg3)
```

Источник: [Lua, строка 1684](../../luasense_decompiled.lua#L1684). Имена `argN` — placeholders реконструкции.

Add occurrences of Mission points to player identified by GlobalPlayerIndex to their current total in the requested category. e.g. Score.AwardMissionPointOccurrences(killerIndex, GameScript.MissionScoreCategory.MeleeKill, 1)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player that will receive points |
| 2.0 | MissionCategoryIndex | The index of the category that will receive points, from the table GameScript.MissionScoreCategory |
| 3.0 | NumOccurrences | The number of times the player has fulfilled the mission point action |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player that will receive points"
    },
    "2.0": {
      "@K[209]": "MissionCategoryIndex",
      "@K[211]": "The index of the category that will receive points, from the table GameScript.MissionScoreCategory"
    },
    "3.0": {
      "@K[209]": "NumOccurrences",
      "@K[211]": "The number of times the player has fulfilled the mission point action"
    }
  },
  "@K[203]": "Add occurrences of Mission points to player identified by GlobalPlayerIndex to their current total in the requested category. e.g. Score.AwardMissionPointOccurrences(killerIndex, GameScript.MissionScoreCategory.MeleeKill, 1)"
}
```

</details>

## GameScript.FEARScore.AwardMissionPoints

```lua
GameScript.FEARScore.AwardMissionPoints(arg1, arg2, arg3)
```

Источник: [Lua, строка 1687](../../luasense_decompiled.lua#L1687). Имена `argN` — placeholders реконструкции.

Add Mission points to player identified by GlobalPlayerIndex to their current total in the requested category (e.g. Score.AwardMissionPoints(killerIndex,GameScript.MissionScoreCategory.MeleeKill,meleeMissionPoints). If GameScript.PlayerIndex.kNotAGlobalPlayer is passed in, then it will award points only to the team score and not to any individual player's score.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player that will receive points. Use GameScript.PlayerIndex.kNotAGlobalPlayer to only award points to team score instead of any individual player. |
| 2.0 | MissionCategoryIndex | The index of the category that will receive points, from the table GameScript.MissionScoreCategory |
| 3.0 | NumPoints | The number of Combat Experience Points (CP) added to the player |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player that will receive points. Use GameScript.PlayerIndex.kNotAGlobalPlayer to only award points to team score instead of any individual player."
    },
    "2.0": {
      "@K[209]": "MissionCategoryIndex",
      "@K[211]": "The index of the category that will receive points, from the table GameScript.MissionScoreCategory"
    },
    "3.0": {
      "@K[209]": "NumPoints",
      "@K[211]": "The number of Combat Experience Points (CP) added to the player"
    }
  },
  "@K[203]": "Add Mission points to player identified by GlobalPlayerIndex to their current total in the requested category (e.g. Score.AwardMissionPoints(killerIndex,GameScript.MissionScoreCategory.MeleeKill,meleeMissionPoints). If GameScript.PlayerIndex.kNotAGlobalPlayer is passed in, then it will award points only to the team score and not to any individual player's score."
}
```

</details>

## GameScript.FEARScore.CalculateMissionScore

```lua
GameScript.FEARScore.CalculateMissionScore()
```

Источник: [Lua, строка 1690](../../luasense_decompiled.lua#L1690). Имена `argN` — placeholders реконструкции.

Calculates the total mission score and updates profiles accordingly. This should be called at the very end of a mission

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Calculates the total mission score and updates profiles accordingly. This should be called at the very end of a mission"
}
```

</details>

## GameScript.FEARScore.GetCumulativeMissionScore

```lua
GameScript.FEARScore.GetCumulativeMissionScore(arg1)
```

Источник: [Lua, строка 1693](../../luasense_decompiled.lua#L1693). Имена `argN` — placeholders реконструкции.

Gets the cumulative mission score for the given player, returning 0 if the player does not exist. Note that if a player loads a checkpoint with a different co-op player than who they saved it with, the cumulative mission scores will be reset to 0 for BOTH players.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player whose cumulative score we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player whose cumulative score we are checking"
    }
  },
  "@K[203]": "Gets the cumulative mission score for the given player, returning 0 if the player does not exist. Note that if a player loads a checkpoint with a different co-op player than who they saved it with, the cumulative mission scores will be reset to 0 for BOTH players."
}
```

</details>

## GameScript.FEARScore.GetCurrentMissionPoints

```lua
GameScript.FEARScore.GetCurrentMissionPoints(arg1, arg2)
```

Источник: [Lua, строка 1696](../../luasense_decompiled.lua#L1696). Имена `argN` — placeholders реконструкции.

Queries Mission points from player identified by GlobalPlayerIndex of the requested category. e.g. Score.GetCurrentMissionPoints(killerIndex, GameScript.MissionScoreCategory.MeleeKill)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player we are checking the points of |
| 2.0 | MissionCategoryIndex | The index of the category that of points, from the table GameScript.MissionScoreCategory |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player we are checking the points of"
    },
    "2.0": {
      "@K[209]": "MissionCategoryIndex",
      "@K[211]": "The index of the category that of points, from the table GameScript.MissionScoreCategory"
    }
  },
  "@K[203]": "Queries Mission points from player identified by GlobalPlayerIndex of the requested category. e.g. Score.GetCurrentMissionPoints(killerIndex, GameScript.MissionScoreCategory.MeleeKill)"
}
```

</details>

## GameScript.FEARScore.GetCurrentRoundPoints

```lua
GameScript.FEARScore.GetCurrentRoundPoints(arg1, arg2)
```

Источник: [Lua, строка 1699](../../luasense_decompiled.lua#L1699). Имена `argN` — placeholders реконструкции.

Queries Round points from player identified by GlobalPlayerIndex of the requested category. e.g. Score.GetCurrentRoundPoints(killerIndex, GameScript.MissionScoreCategory.MeleeKill)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player we are checking the points of |
| 2.0 | MissionCategoryIndex | The index of the category that of points, from the table GameScript.MissionScoreCategory |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player we are checking the points of"
    },
    "2.0": {
      "@K[209]": "MissionCategoryIndex",
      "@K[211]": "The index of the category that of points, from the table GameScript.MissionScoreCategory"
    }
  },
  "@K[203]": "Queries Round points from player identified by GlobalPlayerIndex of the requested category. e.g. Score.GetCurrentRoundPoints(killerIndex, GameScript.MissionScoreCategory.MeleeKill)"
}
```

</details>

## GameScript.FEARScore.GetGameLoadedSinceMissionStarted

```lua
GameScript.FEARScore.GetGameLoadedSinceMissionStarted()
```

Источник: [Lua, строка 1702](../../luasense_decompiled.lua#L1702). Имена `argN` — placeholders реконструкции.

Returns whether or not we have loaded the game since the mission started. You must call ResetMissionPoints to clear this flag at the start of a level.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns whether or not we have loaded the game since the mission started. You must call ResetMissionPoints to clear this flag at the start of a level."
}
```

</details>

## GameScript.FEARScore.GetLowestDifficultyUsed

```lua
GameScript.FEARScore.GetLowestDifficultyUsed()
```

Источник: [Lua, строка 1705](../../luasense_decompiled.lua#L1705). Имена `argN` — placeholders реконструкции.

Returns the lowest difficulty setting used to play this mission, starting from 1. The value is initially set when ResetMissionPoints is called, and is re-evaluated when a checkpoint finishes loading. Returns 0 if ResetMissionPoints was never called or there is no Difficulty Component in the Global Data object.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the lowest difficulty setting used to play this mission, starting from 1. The value is initially set when ResetMissionPoints is called, and is re-evaluated when a checkpoint finishes loading. Returns 0 if ResetMissionPoints was never called or there is no Difficulty Component in the Global Data object."
}
```

</details>

## GameScript.FEARScore.GetMissionPointOccurences

```lua
GameScript.FEARScore.GetMissionPointOccurences(arg1, arg2)
```

Источник: [Lua, строка 1708](../../luasense_decompiled.lua#L1708). Имена `argN` — placeholders реконструкции.

Queries Mission points from player identified by GlobalPlayerIndex of the requested category. e.g. Score.GetCurrentMissionPointOccurrences(killerIndex, GameScript.MissionScoreCategory.MeleeKill)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player we are checking the points of |
| 2.0 | MissionCategoryIndex | The index of the category that of points, from the table GameScript.GetCurrentMissionPointOccurrences |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player we are checking the points of"
    },
    "2.0": {
      "@K[209]": "MissionCategoryIndex",
      "@K[211]": "The index of the category that of points, from the table GameScript.GetCurrentMissionPointOccurrences"
    }
  },
  "@K[203]": "Queries Mission points from player identified by GlobalPlayerIndex of the requested category. e.g. Score.GetCurrentMissionPointOccurrences(killerIndex, GameScript.MissionScoreCategory.MeleeKill)"
}
```

</details>

## GameScript.FEARScore.GetMissionTime

```lua
GameScript.FEARScore.GetMissionTime()
```

Источник: [Lua, строка 1711](../../luasense_decompiled.lua#L1711). Имена `argN` — placeholders реконструкции.

Returns the current mission time in seconds

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the current mission time in seconds"
}
```

</details>

## GameScript.FEARScore.GetParTime

```lua
GameScript.FEARScore.GetParTime()
```

Источник: [Lua, строка 1714](../../luasense_decompiled.lua#L1714). Имена `argN` — placeholders реконструкции.

Returns the par time of the current mission in seconds. Use SetParTime() to set the par time for the mission, value stays until the next SetParTime call.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the par time of the current mission in seconds. Use SetParTime() to set the par time for the mission, value stays until the next SetParTime call."
}
```

</details>

## GameScript.FEARScore.GetPlayerRank

```lua
GameScript.FEARScore.GetPlayerRank(arg1)
```

Источник: [Lua, строка 1717](../../luasense_decompiled.lua#L1717). Имена `argN` — placeholders реконструкции.

Returns the rank of the given player. Returns 0 if the player isn't found

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player whose rank we are retrieving |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player whose rank we are retrieving"
    }
  },
  "@K[203]": "Returns the rank of the given player. Returns 0 if the player isn't found"
}
```

</details>

## GameScript.FEARScore.GetScoreMultiplier

```lua
GameScript.FEARScore.GetScoreMultiplier()
```

Источник: [Lua, строка 1720](../../luasense_decompiled.lua#L1720). Имена `argN` — placeholders реконструкции.

Returns the current score multiplier. DO NOT USE THIS FOR SCORE CALCULATIONS. The score system already applies the multiplier as points are awarded. This is really only to be used for our script-based announcement system which doesn't know about that math going on behind its back.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the current score multiplier. DO NOT USE THIS FOR SCORE CALCULATIONS. The score system already applies the multiplier as points are awarded. This is really only to be used for our script-based announcement system which doesn't know about that math going on behind its back."
}
```

</details>

## GameScript.FEARScore.GetTotalChallengeCategoryPoints

```lua
GameScript.FEARScore.GetTotalChallengeCategoryPoints(arg1, arg2)
```

Источник: [Lua, строка 1723](../../luasense_decompiled.lua#L1723). Имена `argN` — placeholders реконструкции.

Returns the number of points a player has earned over their entire game session in a particular challenge category. This value gets reset if a player starts a new game, restarts a chapter, or is joined by a friend who was not in the last checkpoint save.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player we are checking |
| 2.0 | ChallengeCategory | The challenge category index that we are checking |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player we are checking"
    },
    "2.0": {
      "@K[209]": "ChallengeCategory",
      "@K[211]": "The challenge category index that we are checking"
    }
  },
  "@K[203]": "Returns the number of points a player has earned over their entire game session in a particular challenge category. This value gets reset if a player starts a new game, restarts a chapter, or is joined by a friend who was not in the last checkpoint save."
}
```

</details>

## GameScript.FEARScore.HasPlayerAchievedChallenge

```lua
GameScript.FEARScore.HasPlayerAchievedChallenge(arg1, arg2)
```

Источник: [Lua, строка 1726](../../luasense_decompiled.lua#L1726). Имена `argN` — placeholders реконструкции.

Returns whether the given player has achieved the specified challenge

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player we are checking |
| 2.0 | ChallengeIndex | The index of the challenge that we are checking, from the table GameScript.BoostChallenge |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player we are checking"
    },
    "2.0": {
      "@K[209]": "ChallengeIndex",
      "@K[211]": "The index of the challenge that we are checking, from the table GameScript.BoostChallenge"
    }
  },
  "@K[203]": "Returns whether the given player has achieved the specified challenge"
}
```

</details>

## GameScript.FEARScore.RegisterForDeath

```lua
GameScript.FEARScore.RegisterForDeath(arg1)
```

Источник: [Lua, строка 1729](../../luasense_decompiled.lua#L1729). Имена `argN` — placeholders реконструкции.

Register for a callback for when ever an "Actor" is killed.  The callback has a table argument that consists of fields: deathType,killerPlayerIndex,mostDamagingPlayerIndex.  If you suspect this documentation is out of date try function OnDeath(argTable) Debug.PrintTable(argTable) end to see contents. The death type is matched up to the types in GameScript.ScoreDeathType.Unspecific,Melee,Headshot,Grenade

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | FunctionName | The name of the callback function. The only function argument is the object that received the message. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "FunctionName",
      "@K[211]": "The name of the callback function. The only function argument is the object that received the message."
    }
  },
  "@K[203]": "Register for a callback for when ever an \"Actor\" is killed.  The callback has a table argument that consists of fields: deathType,killerPlayerIndex,mostDamagingPlayerIndex.  If you suspect this documentation is out of date try function OnDeath(argTable) Debug.PrintTable(argTable) end to see contents. The death type is matched up to the types in GameScript.ScoreDeathType.Unspecific,Melee,Headshot,Grenade"
}
```

</details>

## GameScript.FEARScore.ResetBoostProgress

```lua
GameScript.FEARScore.ResetBoostProgress()
```

Источник: [Lua, строка 1731](../../luasense_decompiled.lua#L1731). Имена `argN` — placeholders реконструкции.

<details><summary>Исходная структура call-tip</summary>

```json
{}
```

</details>

## GameScript.FEARScore.ResetChallengeProgress

```lua
GameScript.FEARScore.ResetChallengeProgress(arg1, arg2)
```

Источник: [Lua, строка 1734](../../luasense_decompiled.lua#L1734). Имена `argN` — placeholders реконструкции.

Resets a player's progress towards a specific challenge

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player whose boost progress will be reset |
| 2.0 | BoostChallengeIndex | The index of the boost challenge that we are resetting, from the table GameScript.BoostChallenge |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player whose boost progress will be reset"
    },
    "2.0": {
      "@K[209]": "BoostChallengeIndex",
      "@K[211]": "The index of the boost challenge that we are resetting, from the table GameScript.BoostChallenge"
    }
  },
  "@K[203]": "Resets a player's progress towards a specific challenge"
}
```

</details>

## GameScript.FEARScore.ResetMissionPoints

```lua
GameScript.FEARScore.ResetMissionPoints()
```

Источник: [Lua, строка 1737](../../luasense_decompiled.lua#L1737). Имена `argN` — placeholders реконструкции.

Resets all points and occurrences for all players across all Mission Point categories. Call this function at the start of each level.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Resets all points and occurrences for all players across all Mission Point categories. Call this function at the start of each level."
}
```

</details>

## GameScript.FEARScore.ResetMissionTimer

```lua
GameScript.FEARScore.ResetMissionTimer()
```

Источник: [Lua, строка 1740](../../luasense_decompiled.lua#L1740). Имена `argN` — placeholders реконструкции.

Resets the Mission Timer. Will cause a warning if the timer is currently running. This should be called at the very beginning of a level, just before calling StartMissionTimer()

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Resets the Mission Timer. Will cause a warning if the timer is currently running. This should be called at the very beginning of a level, just before calling StartMissionTimer()"
}
```

</details>

## GameScript.FEARScore.ResetRoundPoints

```lua
GameScript.FEARScore.ResetRoundPoints()
```

Источник: [Lua, строка 1743](../../luasense_decompiled.lua#L1743). Имена `argN` — placeholders реконструкции.

Resets all points for all players for the current round. This does not affect their mission score, or accumulated totals for any mission score category. Call this function at the beginning of each round in an MP game.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Resets all points for all players for the current round. This does not affect their mission score, or accumulated totals for any mission score category. Call this function at the beginning of each round in an MP game."
}
```

</details>

## GameScript.FEARScore.SetParTime

```lua
GameScript.FEARScore.SetParTime()
```

Источник: [Lua, строка 1746](../../luasense_decompiled.lua#L1746). Имена `argN` — placeholders реконструкции.

Sets the par time of the current mission in seconds. Value stays until the next SetParTime() call

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Sets the par time of the current mission in seconds. Value stays until the next SetParTime() call"
}
```

</details>

## GameScript.FEARScore.StartMissionTimer

```lua
GameScript.FEARScore.StartMissionTimer()
```

Источник: [Lua, строка 1749](../../luasense_decompiled.lua#L1749). Имена `argN` — placeholders реконструкции.

Starts the Mission Timer. Will cause a red screen if the timer has already been started. This should be called at the very beginning of a level, right after calling ResetMissionTimer()

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Starts the Mission Timer. Will cause a red screen if the timer has already been started. This should be called at the very beginning of a level, right after calling ResetMissionTimer()"
}
```

</details>

## GameScript.FEARScore.StopMissionTimer

```lua
GameScript.FEARScore.StopMissionTimer()
```

Источник: [Lua, строка 1752](../../luasense_decompiled.lua#L1752). Имена `argN` — placeholders реконструкции.

Stops the Mission Timer. Will cause a red screen if the timer has already stopped. This should be called at the very end of a level, just before calling CalculateMissionScore()

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Stops the Mission Timer. Will cause a red screen if the timer has already stopped. This should be called at the very end of a level, just before calling CalculateMissionScore()"
}
```

</details>

## GameScript.FEARScore.SubtractMissionPoints

```lua
GameScript.FEARScore.SubtractMissionPoints(arg1, arg2, arg3)
```

Источник: [Lua, строка 1755](../../luasense_decompiled.lua#L1755). Имена `argN` — placeholders реконструкции.

Subtract Mission points to player identified by GlobalPlayerIndex to their current total in the requested category. e.g. Score.SubtractMissionPoints(killerIndex,GameScript.MissionScoreCategory.MeleeKill,meleeMissionPoints)

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | GlobalPlayerIndex | The index of the player that will subtract points |
| 2.0 | MissionCategoryIndex | The index of the category that will subtract points, from the table GameScript.MissionScoreCategory |
| 3.0 | NumPoints | The number of Combat Experience Points (CP) subtracted from the player |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "GlobalPlayerIndex",
      "@K[211]": "The index of the player that will subtract points"
    },
    "2.0": {
      "@K[209]": "MissionCategoryIndex",
      "@K[211]": "The index of the category that will subtract points, from the table GameScript.MissionScoreCategory"
    },
    "3.0": {
      "@K[209]": "NumPoints",
      "@K[211]": "The number of Combat Experience Points (CP) subtracted from the player"
    }
  },
  "@K[203]": "Subtract Mission points to player identified by GlobalPlayerIndex to their current total in the requested category. e.g. Score.SubtractMissionPoints(killerIndex,GameScript.MissionScoreCategory.MeleeKill,meleeMissionPoints)"
}
```

</details>
