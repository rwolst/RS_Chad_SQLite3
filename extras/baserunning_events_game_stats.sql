/*First do the runner table*/
/*Build the cumulative stats table */
Drop Table IF EXISTS baserunning_stats_runner;
Create Table baserunning_stats_runner as

SELECT
    *,
    (PA_1 + PA_2 + PA_3) as PA,
	(PO_1 + PO_2 + PO_3) as PO,
	(SB_1 + SB_2 + SB_3) as SB,
	(CS_1 + CS_2 + CS_3) as CS
    
FROM
(
SELECT
    t.ID as ID,
	Cast(t.Date as Integer) as Date,

    (SELECT Sum(r.PA_1) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_1,
	(SELECT Sum(r.PA_2) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_2,
	(SELECT Sum(r.PA_3) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_3,
	
    (SELECT Sum(r.PO_1) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_1,
	(SELECT Sum(r.PO_2) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_2,
	(SELECT Sum(r.PO_3) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_3,
	
    (SELECT Sum(r.SB_1) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_1,
	(SELECT Sum(r.SB_2) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_2,
	(SELECT Sum(r.SB_3) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_3,
	
    (SELECT Sum(r.CS_1) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_1,
	(SELECT Sum(r.CS_2) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_2,
	(SELECT Sum(r.CS_3) FROM baserunning_events_game_runner as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_3


FROM baserunning_events_game_runner as t

Group By t.ID, Cast(t.Date as Integer));

Create Index baserunning_stats_runner_idx ON baserunning_stats_runner (ID, Date);














/*Pitcher table*/
/*Build the cumulative stats table */
Drop Table IF EXISTS baserunning_stats_pitcher;
Create Table baserunning_stats_pitcher as

SELECT
    *,
    (PA_1 + PA_2 + PA_3) as PA,
	(PO_1 + PO_2 + PO_3) as PO,
	(SB_1 + SB_2 + SB_3) as SB,
	(CS_1 + CS_2 + CS_3) as CS
    
FROM
(
SELECT
    t.ID as ID,
	Cast(t.Date as Integer) as Date,

    (SELECT Sum(r.PA_1) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_1,
	(SELECT Sum(r.PA_2) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_2,
	(SELECT Sum(r.PA_3) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_3,
	
    (SELECT Sum(r.PO_1) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_1,
	(SELECT Sum(r.PO_2) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_2,
	(SELECT Sum(r.PO_3) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_3,
	
    (SELECT Sum(r.SB_1) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_1,
	(SELECT Sum(r.SB_2) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_2,
	(SELECT Sum(r.SB_3) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_3,
	
    (SELECT Sum(r.CS_1) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_1,
	(SELECT Sum(r.CS_2) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_2,
	(SELECT Sum(r.CS_3) FROM baserunning_events_game_pitcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_3


FROM baserunning_events_game_pitcher as t

Group By t.ID, Cast(t.Date as Integer));

Create Index baserunning_stats_pitcher_idx ON baserunning_stats_pitcher (ID, Date);














/*Catcher table*/
/*Build the cumulative stats table */
Drop Table IF EXISTS baserunning_stats_catcher;
Create Table baserunning_stats_catcher as

SELECT
    *,
    (PA_1 + PA_2 + PA_3) as PA,
	(PO_1 + PO_2 + PO_3) as PO,
	(SB_1 + SB_2 + SB_3) as SB,
	(CS_1 + CS_2 + CS_3) as CS
    
FROM
(
SELECT
    t.ID as ID,
	Cast(t.Date as Integer) as Date,

    (SELECT Sum(r.PA_1) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_1,
	(SELECT Sum(r.PA_2) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_2,
	(SELECT Sum(r.PA_3) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PA_3,
	
    (SELECT Sum(r.PO_1) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_1,
	(SELECT Sum(r.PO_2) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_2,
	(SELECT Sum(r.PO_3) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as PO_3,
	
    (SELECT Sum(r.SB_1) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_1,
	(SELECT Sum(r.SB_2) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_2,
	(SELECT Sum(r.SB_3) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as SB_3,
	
    (SELECT Sum(r.CS_1) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_1,
	(SELECT Sum(r.CS_2) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_2,
	(SELECT Sum(r.CS_3) FROM baserunning_events_game_catcher as r WHERE (Cast(r.Date as Integer) > Cast(Substr(t.Date, 1, 4) as Integer) AND Cast(r.Date as Integer) < Cast(t.Date as Integer)) AND r.ID = t.ID) as CS_3


FROM baserunning_events_game_catcher as t

Group By t.ID, Cast(t.Date as Integer));

Create Index baserunning_stats_catcher_idx ON baserunning_stats_catcher (ID, Date);
