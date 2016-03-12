Drop Table IF EXISTS batting_events;

CREATE Table batting_events as

SELECT
	PIT_HAND_CD as PitcherHand,
	
    BAT_ID as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,
	PlayNumber as PlayNumber,
    
	CASE WHEN (event_cd = 3) THEN 1 ELSE 0 END as K,
	CASE WHEN (event_cd = 14) THEN 1 ELSE 0 END as NIBB,
	CASE WHEN (event_cd = 15) THEN 1 ELSE 0 END as IBB,
	CASE WHEN (event_cd = 16) THEN 1 ELSE 0 END as HBP,
	CASE WHEN (SH_FL = 'T' OR SF_FL = 'T') THEN 1 ELSE 0 END as Sacrifice,
	
	CASE WHEN (event_cd = 20) THEN 1 ELSE 0 END as Single,
	CASE WHEN (event_cd = 21) THEN 1 ELSE 0 END as Double,
	CASE WHEN (event_cd = 22) THEN 1 ELSE 0 END as Triple,
	CASE WHEN (event_cd = 23) THEN 1 ELSE 0 END as HR,
	CASE WHEN (event_cd = 2 or event_cd = 19) THEN 1 ELSE 0 END as OtherOut,
	
	CASE WHEN (BATTEDBALL_CD = 'G' AND BUNT_FL = 'F') THEN 1 ELSE 0 END as GB,
	CASE WHEN (BATTEDBALL_CD = 'F' AND BUNT_FL = 'F') THEN 1 ELSE 0 END as FB,
	CASE WHEN (BATTEDBALL_CD = 'L' AND BUNT_FL = 'F') THEN 1 ELSE 0 END as LD,
	CASE WHEN (BATTEDBALL_CD = 'P' AND BUNT_FL = 'F') THEN 1 ELSE 0 END as Pop,	
	CASE WHEN (BUNT_FL = 'T') THEN 1 ELSE 0 END as Bunt,

    CASE WHEN (DP_FL = 'T' AND BATTEDBALL_CD = 'G' AND BUNT_FL = 'F') THEN 1 ELSE 0 END as GDP,
	CASE WHEN (DP_FL = 'T' AND BATTEDBALL_CD = 'F' AND BUNT_FL = 'F') THEN 1 ELSE 0 END as FDP,
	CASE WHEN (DP_FL = 'T' AND BATTEDBALL_CD = 'L' AND BUNT_FL = 'F') THEN 1 ELSE 0 END as LDP,
	CASE WHEN (DP_FL = 'T' AND BATTEDBALL_CD = 'P' AND BUNT_FL = 'F') THEN 1 ELSE 0 END as PDP,
	CASE WHEN (DP_FL = 'T' AND BUNT_FL = 'T') THEN 1 ELSE 0 END as BDP,


    CASE WHEN (BATTEDBALL_CD = 'G' AND BUNT_FL = 'F' AND event_cd = 20) THEN 1 ELSE 0 END as GBSingle,
    CASE WHEN (BATTEDBALL_CD = 'G' AND BUNT_FL = 'F' AND event_cd = 21) THEN 1 ELSE 0 END as GBDouble,
    CASE WHEN (BATTEDBALL_CD = 'G' AND BUNT_FL = 'F' AND event_cd = 22) THEN 1 ELSE 0 END as GBTriple,
    CASE WHEN (BATTEDBALL_CD = 'G' AND BUNT_FL = 'F' AND event_cd = 23) THEN 1 ELSE 0 END as GBHR,
    CASE WHEN (BATTEDBALL_CD = 'G' AND BUNT_FL = 'F' AND (event_cd = 2 OR event_cd = 19)) THEN 1 ELSE 0 END as GBOut,

    CASE WHEN (BATTEDBALL_CD = 'F' AND BUNT_FL = 'F' AND event_cd = 20) THEN 1 ELSE 0 END as FBSingle,
    CASE WHEN (BATTEDBALL_CD = 'F' AND BUNT_FL = 'F' AND event_cd = 21) THEN 1 ELSE 0 END as FBDouble,
    CASE WHEN (BATTEDBALL_CD = 'F' AND BUNT_FL = 'F' AND event_cd = 22) THEN 1 ELSE 0 END as FBTriple,
    CASE WHEN (BATTEDBALL_CD = 'F' AND BUNT_FL = 'F' AND event_cd = 23) THEN 1 ELSE 0 END as FBHR,
    CASE WHEN (BATTEDBALL_CD = 'F' AND BUNT_FL = 'F' AND (event_cd = 2 OR event_cd = 19)) THEN 1 ELSE 0 END as FBOut,

    CASE WHEN (BATTEDBALL_CD = 'L' AND BUNT_FL = 'F' AND event_cd = 20) THEN 1 ELSE 0 END as LDSingle,
    CASE WHEN (BATTEDBALL_CD = 'L' AND BUNT_FL = 'F' AND event_cd = 21) THEN 1 ELSE 0 END as LDDouble,
    CASE WHEN (BATTEDBALL_CD = 'L' AND BUNT_FL = 'F' AND event_cd = 22) THEN 1 ELSE 0 END as LDTriple,
    CASE WHEN (BATTEDBALL_CD = 'L' AND BUNT_FL = 'F' AND event_cd = 23) THEN 1 ELSE 0 END as LDHR,
    CASE WHEN (BATTEDBALL_CD = 'L' AND BUNT_FL = 'F' AND (event_cd = 2 OR event_cd = 19)) THEN 1 ELSE 0 END as LDOut,

    CASE WHEN (BATTEDBALL_CD = 'P' AND BUNT_FL = 'F' AND event_cd = 20) THEN 1 ELSE 0 END as PopSingle,
    CASE WHEN (BATTEDBALL_CD = 'P' AND BUNT_FL = 'F' AND event_cd = 21) THEN 1 ELSE 0 END as PopDouble,
    CASE WHEN (BATTEDBALL_CD = 'P' AND BUNT_FL = 'F' AND event_cd = 22) THEN 1 ELSE 0 END as PopTriple,
    CASE WHEN (BATTEDBALL_CD = 'P' AND BUNT_FL = 'F' AND event_cd = 23) THEN 1 ELSE 0 END as PopHR,
    CASE WHEN (BATTEDBALL_CD = 'P' AND BUNT_FL = 'F' AND (event_cd = 2 OR event_cd = 19)) THEN 1 ELSE 0 END as PopOut,

    CASE WHEN (BUNT_FL = 'T' AND event_cd = 20) THEN 1 ELSE 0 END as BuntSingle,
    CASE WHEN (BUNT_FL = 'T' AND event_cd = 21) THEN 1 ELSE 0 END as BuntDouble,
    CASE WHEN (BUNT_FL = 'T' AND event_cd = 22) THEN 1 ELSE 0 END as BuntTriple,
    CASE WHEN (BUNT_FL = 'T' AND event_cd = 23) THEN 1 ELSE 0 END as BuntHR,
    CASE WHEN (BUNT_FL = 'T' AND (event_cd = 2 OR event_cd = 19)) THEN 1 ELSE 0 END as BuntOut,
	
	GAME_END_FL as GameEnd,
	PIT_START_FL as PitcherStarting

FROM events_ID
WHERE
BAT_EVENT_FL = 'T';

Create Index batting_events_idx ON batting_events (Date, HomeTeam, GameNumber, PlayNumber);