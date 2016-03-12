SELECT
                HomeTeam,
                Date,
                GameNumber,
                PlayNumber,
                1 AS StartingPitcher,

                INN_PA_CT - OUTS_CT as InningMenOn,
                GAME_PA_CT as PA,
                INN_CT as Innings,
                CASE WHEN (OUTS_CT = 0) THEN 1 ELSE 0 END as Out0,
                CASE WHEN (OUTS_CT = 1) THEN 1 ELSE 0 END as Out1,

                OUTS_CT as Outs
                FROM events_ID t

                WHERE
                    PIT_START_FL = 'T'
                    AND
                    CAST(t.Date AS INTEGER) > 20130900
					
UNION ALL					
SELECT
                HomeTeam,
                Date,
                GameNumber,
                PlayNumber,
                0 AS StartingPitcher,

                INN_PA_CT - OUTS_CT as InningMenOn,
                GAME_PA_CT as PA,
                INN_CT as Innings,
                CASE WHEN (OUTS_CT = 0) THEN 1 ELSE 0 END as Out0,
                CASE WHEN (OUTS_CT = 1) THEN 1 ELSE 0 END as Out1,

                OUTS_CT as Outs
                FROM events_ID t

                WHERE
                    CAST(t.Date AS INTEGER) > 20130900
                    AND
					(
                    (
                    PlayNumber = (SELECT Min(PlayNumber) FROM EVENTS_ID WHERE
                              HomeTeam = t.HomeTeam AND
                              Date = t.Date AND
                              GameNumber = t.GameNumber AND
                              BAT_TEAM_ID = HomeTeam AND
                              PIT_START_FL = 'F')
                    )
                    OR
                    (
                    PlayNumber = (SELECT Min(PlayNumber) FROM EVENTS_ID WHERE
                              HomeTeam = t.HomeTeam AND
                              Date = t.Date AND
                              GameNumber = t.GameNumber AND
                              BAT_TEAM_ID != HomeTeam  AND
                              PIT_START_FL = 'F')
                    )
					)
					
ORDER BY DATE, HomeTeam, GameNumber, PlayNumber;

