Drop Table IF EXISTS baserunning_events_1;

CREATE Table baserunning_events_1 as

SELECT
    PIT_ID as Pitcher,
	POS2_FLD_ID as Catcher,
    BASE1_RUN_ID as Runner,

    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,
	PlayNumber as PlayNumber,
	
	CASE WHEN (RUN1_PK_FL = 'T') THEN 1 ELSE 0 END AS PO_1,
	CASE WHEN (RUN1_SB_FL = 'T') THEN 1 ELSE 0 END AS SB_1,
	CASE WHEN (RUN1_CS_FL = 'T') THEN 1 ELSE 0 END AS CS_1,
	
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 0) THEN 1 ELSE 0 END as S1000,
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 1) THEN 1 ELSE 0 END as S1001,
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 2) THEN 1 ELSE 0 END as S1002,
	
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 0 AND RUN1_SB_FL = 'T') THEN 1 ELSE 0 END as SB1000_1,
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 1 AND RUN1_SB_FL = 'T') THEN 1 ELSE 0 END as SB1001_1,
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 2 AND RUN1_SB_FL = 'T') THEN 1 ELSE 0 END as SB1002_1,
	
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 0 AND RUN1_SB_FL = 'F') THEN 1 ELSE 0 END as CS1000_1,
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 1 AND RUN1_SB_FL = 'F') THEN 1 ELSE 0 END as CS1001_1,
	CASE WHEN (START_BASES_CD = 1 AND OUTS_CT = 2 AND RUN1_SB_FL = 'F') THEN 1 ELSE 0 END as CS1002_1,
	
	CASE WHEN (BASE1_RUN_ID != '' AND EVENT_CD = 20 AND RUN1_DEST_ID = 3) THEN 1 ELSE 0 END as SINGLE1_3,
	CASE WHEN (BASE1_RUN_ID != '' AND EVENT_CD = 20 AND RUN1_DEST_ID = 2) THEN 1 ELSE 0 END as SINGLE1_2,
	
	CASE WHEN (BASE1_RUN_ID != '' AND EVENT_CD = 21 AND RUN1_DEST_ID = 3) THEN 1 ELSE 0 END as DOUBLE1_3,
	CASE WHEN (BASE1_RUN_ID != '' AND EVENT_CD = 21 AND (RUN1_DEST_ID = 4 OR RUN1_DEST_ID = 5 OR RUN1_DEST_ID = 6)) THEN 1 ELSE 0 END as DOUBLE1_H,
	
	GAME_END_FL as GameEnd,
	PIT_START_FL as PitcherStarting

FROM events_ID
WHERE Runner != '';

Create Index baserunning_events_1_idx ON baserunning_events_1 (Date, HomeTeam, GameNumber, PlayNumber);



Drop Table IF EXISTS baserunning_events_2;

CREATE Table baserunning_events_2 as

SELECT
    PIT_ID as Pitcher,
	POS2_FLD_ID as Catcher,
    BASE2_RUN_ID as Runner,

    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,
	PlayNumber as PlayNumber,
	
	CASE WHEN (RUN2_PK_FL = 'T') THEN 1 ELSE 0 END AS PO_2,
	CASE WHEN (RUN2_SB_FL = 'T') THEN 1 ELSE 0 END AS SB_2,
	CASE WHEN (RUN2_CS_FL = 'T') THEN 1 ELSE 0 END AS CS_2,
	
	CASE WHEN (BASE1_RUN_ID != '' AND EVENT_CD = 20 AND RUN1_DEST_ID = 3) THEN 1 ELSE 0 END as SINGLE2_3,
	CASE WHEN (BASE1_RUN_ID != '' AND EVENT_CD = 20 AND (RUN1_DEST_ID = 4 OR RUN1_DEST_ID = 5 OR RUN1_DEST_ID = 6)) THEN 1 ELSE 0 END as SINGLE2_H,
	
	GAME_END_FL as GameEnd,
	PIT_START_FL as PitcherStarting

FROM events_ID
WHERE Runner != '';

Create Index baserunning_events_2_idx ON baserunning_events_2 (Date, HomeTeam, GameNumber, PlayNumber);


Drop Table IF EXISTS baserunning_events_3;

CREATE Table baserunning_events_3 as

SELECT
    PIT_ID as Pitcher,
	POS2_FLD_ID as Catcher,
    BASE3_RUN_ID as Runner,

    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,
	PlayNumber as PlayNumber,
	
	CASE WHEN (RUN3_PK_FL = 'T') THEN 1 ELSE 0 END AS PO_3,
	CASE WHEN (RUN3_SB_FL = 'T') THEN 1 ELSE 0 END AS SB_3,
	CASE WHEN (RUN3_CS_FL = 'T') THEN 1 ELSE 0 END AS CS_3,
	
	GAME_END_FL as GameEnd,
	PIT_START_FL as PitcherStarting

FROM events_ID
WHERE Runner != '';

Create Index baserunning_events_3_idx ON baserunning_events_3 (Date, HomeTeam, GameNumber, PlayNumber);


	
