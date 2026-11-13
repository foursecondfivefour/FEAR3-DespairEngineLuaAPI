# GameScript.Game.MP

[Индекс](../API.md)

## GameScript.Game.MP.AddSpecialSpawnPlayer

```lua
GameScript.Game.MP.AddSpecialSpawnPlayer(arg1)
```

Источник: [Lua, строка 2320](../../luasense_decompiled.lua#L2320). Имена `argN` — placeholders реконструкции.

Adds the specified player to the special spawn list.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The player which which are adding as a special spawn player |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The player which which are adding as a special spawn player"
    }
  },
  "@K[203]": "Adds the specified player to the special spawn list."
}
```

</details>

## GameScript.Game.MP.AwardPlayerPoints

```lua
GameScript.Game.MP.AwardPlayerPoints(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2323](../../luasense_decompiled.lua#L2323). Имена `argN` — placeholders реконструкции.

Updates a player's points based on the type of award being given.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The player to which we are awarding points |
| 2.0 | AwardType | The type of award for which points are being given |
| 3.0 | PointsAwarded | If explicit points award, how many to give. |
| 4.0 | PointCategory | The point category to award points for. If an empty string is passed in and the "AwardType" is explicit points, then no points will be awarded for any category. If the "AwardType" is not explicit points, then the points will automatically be given for the correct category. If the category is not an empty string, then points will be assigned to the specified category regardless of the award type, if that category exists. Categories include "Kills", "Deaths", "Suicides", "Team Kills", "VIP Kills", "Multi-Kills", "Kill Assists", "Headshots", "Flag Captures", "Flag Retursn", "King Region", and user-defined types in the Multiplayer Global Data Component. Category strings are case-sensitive and must match exactly. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The player to which we are awarding points"
    },
    "2.0": {
      "@K[209]": "AwardType",
      "@K[211]": "The type of award for which points are being given"
    },
    "3.0": {
      "@K[209]": "PointsAwarded",
      "@K[211]": "If explicit points award, how many to give."
    },
    "4.0": {
      "@K[209]": "PointCategory",
      "@K[211]": "The point category to award points for. If an empty string is passed in and the \"AwardType\" is explicit points, then no points will be awarded for any category. If the \"AwardType\" is not explicit points, then the points will automatically be given for the correct category. If the category is not an empty string, then points will be assigned to the specified category regardless of the award type, if that category exists. Categories include \"Kills\", \"Deaths\", \"Suicides\", \"Team Kills\", \"VIP Kills\", \"Multi-Kills\", \"Kill Assists\", \"Headshots\", \"Flag Captures\", \"Flag Retursn\", \"King Region\", and user-defined types in the Multiplayer Global Data Component. Category strings are case-sensitive and must match exactly."
    }
  },
  "@K[203]": "Updates a player's points based on the type of award being given."
}
```

</details>

## GameScript.Game.MP.AwardTeamPoints

```lua
GameScript.Game.MP.AwardTeamPoints(arg1, arg2, arg3, arg4)
```

Источник: [Lua, строка 2326](../../luasense_decompiled.lua#L2326). Имена `argN` — placeholders реконструкции.

Updates a team's points based on the type of award being given. NOTE: This function CAN NOT award points for multi-kill bonuses.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TeamIndex | The team to which we are awarding points |
| 2.0 | AwardType | The type of award for which points are being given |
| 3.0 | PointsAwarded | If explicit points award, how many to give. |
| 4.0 | PointCategory | The point category to award points for. If an empty string is passed in and the "AwardType" is explicit points, then no points will be awarded for any category. If the "AwardType" is not explicit points, then the points will automatically be given for the correct category. If the category is not an empty string, then points will be assigned to the specified category regardless of the award type, if that category exists. Categories include "Kills", "Deaths", "Suicides", "Team Kills", "VIP Kills", "Multi-Kills", "Kill Assists", "Headshots", "Flag Captures", "Flag Retursn", "King Region", and user-defined types in the Multiplayer Global Data Component. Category strings are case-sensitive and must match exactly. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TeamIndex",
      "@K[211]": "The team to which we are awarding points"
    },
    "2.0": {
      "@K[209]": "AwardType",
      "@K[211]": "The type of award for which points are being given"
    },
    "3.0": {
      "@K[209]": "PointsAwarded",
      "@K[211]": "If explicit points award, how many to give."
    },
    "4.0": {
      "@K[209]": "PointCategory",
      "@K[211]": "The point category to award points for. If an empty string is passed in and the \"AwardType\" is explicit points, then no points will be awarded for any category. If the \"AwardType\" is not explicit points, then the points will automatically be given for the correct category. If the category is not an empty string, then points will be assigned to the specified category regardless of the award type, if that category exists. Categories include \"Kills\", \"Deaths\", \"Suicides\", \"Team Kills\", \"VIP Kills\", \"Multi-Kills\", \"Kill Assists\", \"Headshots\", \"Flag Captures\", \"Flag Retursn\", \"King Region\", and user-defined types in the Multiplayer Global Data Component. Category strings are case-sensitive and must match exactly."
    }
  },
  "@K[203]": "Updates a team's points based on the type of award being given. NOTE: This function CAN NOT award points for multi-kill bonuses."
}
```

</details>

## GameScript.Game.MP.ClearNetworkSaveData

```lua
GameScript.Game.MP.ClearNetworkSaveData()
```

Источник: [Lua, строка 2329](../../luasense_decompiled.lua#L2329). Имена `argN` — placeholders реконструкции.

Clears out the network save from the bulk transfer directory.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Clears out the network save from the bulk transfer directory."
}
```

</details>

## GameScript.Game.MP.DisableMPManagerMatchTimeLimit

```lua
GameScript.Game.MP.DisableMPManagerMatchTimeLimit()
```

Источник: [Lua, строка 2332](../../luasense_decompiled.lua#L2332). Имена `argN` — placeholders реконструкции.

Turns off the MP manager time limit code to keep it from ending a match after the time limit is up.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Turns off the MP manager time limit code to keep it from ending a match after the time limit is up."
}
```

</details>

## GameScript.Game.MP.GetCurrentPlayerStatistic

```lua
GameScript.Game.MP.GetCurrentPlayerStatistic(arg1, arg2)
```

Источник: [Lua, строка 2335](../../luasense_decompiled.lua#L2335). Имена `argN` — placeholders реконструкции.

Returns the statistic of the specified player for their current lifetime.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player whose stat we are getting |
| 2.0 | PlayerStatistic | The statistic we are getting.  Valid stats are:<br>PlayerStatistic.kDeaths<br>PlayerStatistic.kSuicides<br>PlayerStatistic.kTimesKilled<br>PlayerStatistic.kKills<br>PlayerStatistic.kKillAssists<br>PlayerStatistic.kTeamKills<br>PlayerStatistic.kVIPKills<br>PlayerStatistic.kKilledByAI<br>PlayerStatistic.kPoints<br>PlayerStatistic.kShotsFired<br>PlayerStatistic.kEnemyHits<br>PlayerStatistic.kSecondsInKingRegion<br>PlayerStatistic.kFlagCaptures<br>PlayerStatistic.kFlagReturns<br>PlayerStatistic.kLethality<br>PlayerStatistic.kTotalLifeTime<br>PlayerStatistic.kAvgLifeTime<br>PlayerStatistic.kFavoriteWeapon<br>PlayerStatistic.kHeadshots<br>PlayerStatistic.kAccuracy<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player whose stat we are getting"
    },
    "2.0": {
      "@K[209]": "PlayerStatistic",
      "@K[211]": "The statistic we are getting.  Valid stats are:\nPlayerStatistic.kDeaths\nPlayerStatistic.kSuicides\nPlayerStatistic.kTimesKilled\nPlayerStatistic.kKills\nPlayerStatistic.kKillAssists\nPlayerStatistic.kTeamKills\nPlayerStatistic.kVIPKills\nPlayerStatistic.kKilledByAI\nPlayerStatistic.kPoints\nPlayerStatistic.kShotsFired\nPlayerStatistic.kEnemyHits\nPlayerStatistic.kSecondsInKingRegion\nPlayerStatistic.kFlagCaptures\nPlayerStatistic.kFlagReturns\nPlayerStatistic.kLethality\nPlayerStatistic.kTotalLifeTime\nPlayerStatistic.kAvgLifeTime\nPlayerStatistic.kFavoriteWeapon\nPlayerStatistic.kHeadshots\nPlayerStatistic.kAccuracy\n"
    }
  },
  "@K[203]": "Returns the statistic of the specified player for their current lifetime."
}
```

</details>

## GameScript.Game.MP.GetDifficultyLevel

```lua
GameScript.Game.MP.GetDifficultyLevel()
```

Источник: [Lua, строка 2338](../../luasense_decompiled.lua#L2338). Имена `argN` — placeholders реконструкции.

Returns the difficulty level.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the difficulty level."
}
```

</details>

## GameScript.Game.MP.GetGameMode

```lua
GameScript.Game.MP.GetGameMode()
```

Источник: [Lua, строка 2341](../../luasense_decompiled.lua#L2341). Имена `argN` — placeholders реконструкции.

Returns the GameMode type set in MPGlobalData. Valid values are:
MPGameMode.kAssault
MPGameMode.kSlaughter
MPGameMode.kBrothersVersusOthers
MPGameMode.kDeathMatch
MPGameMode.kTeamDeathMatch
MPGameMode.kCoop
MPGameMode.kGameType7
MPGameMode.kGameType8
MPGameMode.kGameType9
MPGameMode.kGameType10
MPGameMode.kGameType11
MPGameMode.kGameType12
MPGameMode.kGameType13
MPGameMode.kGameType14
MPGameMode.kGameType15
MPGameMode.kGameType16


<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the GameMode type set in MPGlobalData. Valid values are:\nMPGameMode.kAssault\nMPGameMode.kSlaughter\nMPGameMode.kBrothersVersusOthers\nMPGameMode.kDeathMatch\nMPGameMode.kTeamDeathMatch\nMPGameMode.kCoop\nMPGameMode.kGameType7\nMPGameMode.kGameType8\nMPGameMode.kGameType9\nMPGameMode.kGameType10\nMPGameMode.kGameType11\nMPGameMode.kGameType12\nMPGameMode.kGameType13\nMPGameMode.kGameType14\nMPGameMode.kGameType15\nMPGameMode.kGameType16\n"
}
```

</details>

## GameScript.Game.MP.GetGameTypeFlag

```lua
GameScript.Game.MP.GetGameTypeFlag(arg1)
```

Источник: [Lua, строка 2344](../../luasense_decompiled.lua#L2344). Имена `argN` — placeholders реконструкции.

Returns the value (true/false) of the given game type flag.
0 = Competitive Multiplayer Type
1 = Team-based game
2 = "Points While Contested" (King-of-the-Hill game types)
3 = "Force Of Numbers" (King-of-the-Hill game types)
4 = CTF Classic Rules
5 = King regions can move (King-of-the-Hill game types)
6 = Auto-balance teams
7 = Allow team changing
8 = Augs on map
9 = Private Match


Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Flag | The game type flag whose value we want to retrieve |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Flag",
      "@K[211]": "The game type flag whose value we want to retrieve"
    }
  },
  "@K[203]": "Returns the value (true/false) of the given game type flag.\n0 = Competitive Multiplayer Type\n1 = Team-based game\n2 = \"Points While Contested\" (King-of-the-Hill game types)\n3 = \"Force Of Numbers\" (King-of-the-Hill game types)\n4 = CTF Classic Rules\n5 = King regions can move (King-of-the-Hill game types)\n6 = Auto-balance teams\n7 = Allow team changing\n8 = Augs on map\n9 = Private Match\n"
}
```

</details>

## GameScript.Game.MP.GetMultiplayerTime

```lua
GameScript.Game.MP.GetMultiplayerTime()
```

Источник: [Lua, строка 2347](../../luasense_decompiled.lua#L2347). Имена `argN` — placeholders реконструкции.

Returns the currently synced network multiplayer time.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the currently synced network multiplayer time."
}
```

</details>

## GameScript.Game.MP.GetNetworkLookRotForward

```lua
GameScript.Game.MP.GetNetworkLookRotForward(arg1)
```

Источник: [Lua, строка 2350](../../luasense_decompiled.lua#L2350). Имена `argN` — placeholders реконструкции.

Returns the forward vector of the LookRot for the object as stored in the network sync handler.  This is not refreshed at a guaranteed rate, and there may be some interpolation involved, but it should reflect a reasonable approximation of where the object was looking recently.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | EmpireObject | The object which we are checking for a lookRot |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "EmpireObject",
      "@K[211]": "The object which we are checking for a lookRot"
    }
  },
  "@K[203]": "Returns the forward vector of the LookRot for the object as stored in the network sync handler.  This is not refreshed at a guaranteed rate, and there may be some interpolation involved, but it should reflect a reasonable approximation of where the object was looking recently."
}
```

</details>

## GameScript.Game.MP.GetNumberOfActivePlayers

```lua
GameScript.Game.MP.GetNumberOfActivePlayers()
```

Источник: [Lua, строка 2353](../../luasense_decompiled.lua#L2353). Имена `argN` — placeholders реконструкции.

Returns the number of active players in the multiplayer session.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the number of active players in the multiplayer session."
}
```

</details>

## GameScript.Game.MP.GetNumberOfRounds

```lua
GameScript.Game.MP.GetNumberOfRounds()
```

Источник: [Lua, строка 2356](../../luasense_decompiled.lua#L2356). Имена `argN` — placeholders реконструкции.

Returns the number of rounds for this match.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the number of rounds for this match."
}
```

</details>

## GameScript.Game.MP.GetNumberOfRoundsInAContinuousSession

```lua
GameScript.Game.MP.GetNumberOfRoundsInAContinuousSession()
```

Источник: [Lua, строка 2359](../../luasense_decompiled.lua#L2359). Имена `argN` — placeholders реконструкции.

Returns the number of rounds for a continuous session.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the number of rounds for a continuous session."
}
```

</details>

## GameScript.Game.MP.GetPlayerName

```lua
GameScript.Game.MP.GetPlayerName()
```

Источник: [Lua, строка 2362](../../luasense_decompiled.lua#L2362). Имена `argN` — placeholders реконструкции.

Returns the gamer tag name of the supplied player ID.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the gamer tag name of the supplied player ID."
}
```

</details>

## GameScript.Game.MP.GetPointAward

```lua
GameScript.Game.MP.GetPointAward(arg1)
```

Источник: [Lua, строка 2365](../../luasense_decompiled.lua#L2365). Имена `argN` — placeholders реконструкции.

Returns the number of points awarded for the given award type.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | AwardType | The type of award. Valid values are:<br>MPAwardType.kKill<br>MPAwardType.kDeath<br>MPAwardType.kTeamKill<br>MPAwardType.kSuicide<br>MPAwardType.kInKingRegion<br>MPAwardType.kFlagCapture<br>MPAwardType.kFlagReturn<br>MPAwardType.kVIPKill<br>MPAwardType.kKillAssist<br>MPAwardType.kHeadshot<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "AwardType",
      "@K[211]": "The type of award. Valid values are:\nMPAwardType.kKill\nMPAwardType.kDeath\nMPAwardType.kTeamKill\nMPAwardType.kSuicide\nMPAwardType.kInKingRegion\nMPAwardType.kFlagCapture\nMPAwardType.kFlagReturn\nMPAwardType.kVIPKill\nMPAwardType.kKillAssist\nMPAwardType.kHeadshot\n"
    }
  },
  "@K[203]": "Returns the number of points awarded for the given award type."
}
```

</details>

## GameScript.Game.MP.GetTeamForPlayer

```lua
GameScript.Game.MP.GetTeamForPlayer(arg1)
```

Источник: [Lua, строка 2368](../../luasense_decompiled.lua#L2368). Имена `argN` — placeholders реконструкции.

Returns the team of the player of the specified index.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The player index for which we are retrieving their team. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The player index for which we are retrieving their team."
    }
  },
  "@K[203]": "Returns the team of the player of the specified index."
}
```

</details>

## GameScript.Game.MP.GetTeamStatistic

```lua
GameScript.Game.MP.GetTeamStatistic(arg1, arg2)
```

Источник: [Lua, строка 2371](../../luasense_decompiled.lua#L2371). Имена `argN` — placeholders реконструкции.

Returns the statistic for the specified team.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | TeamIndex | The index of the team whose stat we are getting |
| 2.0 | PlayerStatistic | The statistic we are getting.  Valid stats are:<br>PlayerStatistic.kDeaths<br>PlayerStatistic.kSuicides<br>PlayerStatistic.kTimesKilled<br>PlayerStatistic.kKills<br>PlayerStatistic.kKillAssists<br>PlayerStatistic.kTeamKills<br>PlayerStatistic.kVIPKills<br>PlayerStatistic.kKilledByAI<br>PlayerStatistic.kPoints<br>PlayerStatistic.kShotsFired<br>PlayerStatistic.kEnemyHits<br>PlayerStatistic.kSecondsInKingRegion<br>PlayerStatistic.kFlagCaptures<br>PlayerStatistic.kFlagReturns<br>PlayerStatistic.kFavoriteWeapon<br>PlayerStatistic.kHeadshots<br>PlayerStatistic.kAccuracy<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "TeamIndex",
      "@K[211]": "The index of the team whose stat we are getting"
    },
    "2.0": {
      "@K[209]": "PlayerStatistic",
      "@K[211]": "The statistic we are getting.  Valid stats are:\nPlayerStatistic.kDeaths\nPlayerStatistic.kSuicides\nPlayerStatistic.kTimesKilled\nPlayerStatistic.kKills\nPlayerStatistic.kKillAssists\nPlayerStatistic.kTeamKills\nPlayerStatistic.kVIPKills\nPlayerStatistic.kKilledByAI\nPlayerStatistic.kPoints\nPlayerStatistic.kShotsFired\nPlayerStatistic.kEnemyHits\nPlayerStatistic.kSecondsInKingRegion\nPlayerStatistic.kFlagCaptures\nPlayerStatistic.kFlagReturns\nPlayerStatistic.kFavoriteWeapon\nPlayerStatistic.kHeadshots\nPlayerStatistic.kAccuracy\n"
    }
  },
  "@K[203]": "Returns the statistic for the specified team."
}
```

</details>

## GameScript.Game.MP.GetTimeElapsed

```lua
GameScript.Game.MP.GetTimeElapsed()
```

Источник: [Lua, строка 2374](../../luasense_decompiled.lua#L2374). Имена `argN` — placeholders реконструкции.

Returns the amount of time elapsed in the current multiplayer round, in seconds.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the amount of time elapsed in the current multiplayer round, in seconds."
}
```

</details>

## GameScript.Game.MP.GetTimeLimit

```lua
GameScript.Game.MP.GetTimeLimit()
```

Источник: [Lua, строка 2377](../../luasense_decompiled.lua#L2377). Имена `argN` — placeholders реконструкции.

Returns the time limit for this match.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the time limit for this match."
}
```

</details>

## GameScript.Game.MP.GetTimeRemaining

```lua
GameScript.Game.MP.GetTimeRemaining()
```

Источник: [Lua, строка 2380](../../luasense_decompiled.lua#L2380). Имена `argN` — placeholders реконструкции.

Returns the amount of time remaining in the current multiplayer round, in seconds.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns the amount of time remaining in the current multiplayer round, in seconds."
}
```

</details>

## GameScript.Game.MP.GetTotalPlayerStatistic

```lua
GameScript.Game.MP.GetTotalPlayerStatistic(arg1, arg2)
```

Источник: [Lua, строка 2383](../../luasense_decompiled.lua#L2383). Имена `argN` — placeholders реконструкции.

Returns the statistic of the specified player for the current MP game.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The index of the player whose stat we are getting |
| 2.0 | PlayerStatistic | The statistic we are getting.  Valid stats are:<br>PlayerStatistic.kDeaths<br>PlayerStatistic.kSuicides<br>PlayerStatistic.kTimesKilled<br>PlayerStatistic.kKills<br>PlayerStatistic.kKillAssists<br>PlayerStatistic.kTeamKills<br>PlayerStatistic.kVIPKills<br>PlayerStatistic.kKilledByAI<br>PlayerStatistic.kPoints<br>PlayerStatistic.kShotsFired<br>PlayerStatistic.kEnemyHits<br>PlayerStatistic.kSecondsInKingRegion<br>PlayerStatistic.kFlagCaptures<br>PlayerStatistic.kFlagReturns<br>PlayerStatistic.kLethality<br>PlayerStatistic.kTotalLifeTime<br>PlayerStatistic.kAvgLifeTime<br>PlayerStatistic.kFavoriteWeapon<br>PlayerStatistic.kHeadshots<br>PlayerStatistic.kAccuracy<br> |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The index of the player whose stat we are getting"
    },
    "2.0": {
      "@K[209]": "PlayerStatistic",
      "@K[211]": "The statistic we are getting.  Valid stats are:\nPlayerStatistic.kDeaths\nPlayerStatistic.kSuicides\nPlayerStatistic.kTimesKilled\nPlayerStatistic.kKills\nPlayerStatistic.kKillAssists\nPlayerStatistic.kTeamKills\nPlayerStatistic.kVIPKills\nPlayerStatistic.kKilledByAI\nPlayerStatistic.kPoints\nPlayerStatistic.kShotsFired\nPlayerStatistic.kEnemyHits\nPlayerStatistic.kSecondsInKingRegion\nPlayerStatistic.kFlagCaptures\nPlayerStatistic.kFlagReturns\nPlayerStatistic.kLethality\nPlayerStatistic.kTotalLifeTime\nPlayerStatistic.kAvgLifeTime\nPlayerStatistic.kFavoriteWeapon\nPlayerStatistic.kHeadshots\nPlayerStatistic.kAccuracy\n"
    }
  },
  "@K[203]": "Returns the statistic of the specified player for the current MP game."
}
```

</details>

## GameScript.Game.MP.IsClient

```lua
GameScript.Game.MP.IsClient()
```

Источник: [Lua, строка 2386](../../luasense_decompiled.lua#L2386). Имена `argN` — placeholders реконструкции.

Returns whether or not the script is currently running on a client object.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns whether or not the script is currently running on a client object."
}
```

</details>

## GameScript.Game.MP.IsNetworkGame

```lua
GameScript.Game.MP.IsNetworkGame()
```

Источник: [Lua, строка 2389](../../luasense_decompiled.lua#L2389). Имена `argN` — placeholders реконструкции.

Returns whether or not the script is currently running on a machine that is actively networked to another machine.

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Returns whether or not the script is currently running on a machine that is actively networked to another machine."
}
```

</details>

## GameScript.Game.MP.IsRemoteScript

```lua
GameScript.Game.MP.IsRemoteScript()
```

Источник: [Lua, строка 2392](../../luasense_decompiled.lua#L2392). Имена `argN` — placeholders реконструкции.

Check if the script that we are currently running is in an object that is owned by a remote machine

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {},
  "@K[203]": "Check if the script that we are currently running is in an object that is owned by a remote machine"
}
```

</details>

## GameScript.Game.MP.ModifyTimeRemaining

```lua
GameScript.Game.MP.ModifyTimeRemaining(arg1)
```

Источник: [Lua, строка 2395](../../luasense_decompiled.lua#L2395). Имена `argN` — placeholders реконструкции.

Modifies the amount of time remaining in the current multiplayer round, in seconds.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | Seconds | The amount of time in seconds to modify the remaining time by. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "Seconds",
      "@K[211]": "The amount of time in seconds to modify the remaining time by."
    }
  },
  "@K[203]": "Modifies the amount of time remaining in the current multiplayer round, in seconds."
}
```

</details>

## GameScript.Game.MP.SetTeamForPlayer

```lua
GameScript.Game.MP.SetTeamForPlayer(arg1, arg2)
```

Источник: [Lua, строка 2398](../../luasense_decompiled.lua#L2398). Имена `argN` — placeholders реконструкции.

Sets the given player's team number.

Поля параметров call-tip (интерпретация структуры, не восстановленные типы):

| № | Имя (`@K[209]`) | Описание (`@K[211]`) |
| --- | --- | --- |
| 1.0 | PlayerIndex | The player index for which we are setting their team. |
| 2.0 | Team | The team number we are setting. |

<details><summary>Исходная структура call-tip</summary>

```json
{
  "@K[202]": {
    "1.0": {
      "@K[209]": "PlayerIndex",
      "@K[211]": "The player index for which we are setting their team."
    },
    "2.0": {
      "@K[209]": "Team",
      "@K[211]": "The team number we are setting."
    }
  },
  "@K[203]": "Sets the given player's team number."
}
```

</details>
