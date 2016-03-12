SELECT
    CASE 
	    WHEN t.RUN1_SB_FL = 'T' THEN 1
        WHEN t.RUN2_SB_FL = 'T' THEN 2
        WHEN t.RUN3_SB_FL = 'T' THEN 3

        WHEN t.RUN1_CS_FL = 'T' THEN 4
        WHEN t.RUN2_CS_FL = 'T' THEN 5
        WHEN t.RUN3_CS_FL = 'T' THEN 6

        WHEN t.RUN1_PK_FL = 'T' THEN 7
        WHEN t.RUN2_PK_FL = 'T' THEN 8
        WHEN t.RUN3_PK_FL = 'T' THEN 9
		
		ELSE 0 END,

    IFNULL(c.PO_1 * 1.0/c.PA_1, 0),
    IFNULL(c.PO_2 * 1.0/c.PA_2, 0),
    IFNULL(c.PO_3 * 1.0/c.PA_3, 0),
    IFNULL(c.SB_1 * 1.0/c.CS_1, 0),
    IFNULL(c.SB_2 * 1.0/c.CS_2, 0),
    IFNULL(c.SB_3 * 1.0/c.CS_3, 0),

    IFNULL(p.PO_1 * 1.0/p.PA_1, 0),
    IFNULL(p.PO_2 * 1.0/p.PA_2, 0),
    IFNULL(p.PO_3 * 1.0/p.PA_3, 0),
    IFNULL(p.SB_1 * 1.0/p.CS_1, 0),
    IFNULL(p.SB_2 * 1.0/p.CS_2, 0),
    IFNULL(p.SB_3 * 1.0/p.CS_3, 0),

    IFNULL(r1.PO_1 * 1.0/r1.PA_1, 0),
    IFNULL(r2.PO_2 * 1.0/r2.PA_2, 0),
    IFNULL(r3.PO_3 * 1.0/r3.PA_3, 0),

    IFNULL(r1.SB_1 * 1.0/r1.CS_1, 0),
    IFNULL(r2.SB_2 * 1.0/r2.CS_2, 0),
    IFNULL(r3.SB_3 * 1.0/r3.CS_3, 0),
    
    CASE WHEN START_BASES_CD = 0 THEN 1 ELSE 0 END,
    CASE WHEN START_BASES_CD = 1 THEN 1 ELSE 0 END,
    CASE WHEN START_BASES_CD = 2 THEN 1 ELSE 0 END,
    CASE WHEN START_BASES_CD = 3 THEN 1 ELSE 0 END,
    CASE WHEN START_BASES_CD = 4 THEN 1 ELSE 0 END,
    CASE WHEN START_BASES_CD = 5 THEN 1 ELSE 0 END,
    CASE WHEN START_BASES_CD = 6 THEN 1 ELSE 0 END,
    CASE WHEN START_BASES_CD = 7 THEN 1 ELSE 0 END,
    
    CASE WHEN OUTS_CT = 0 THEN 1 ELSE 0 END,
    CASE WHEN OUTS_CT = 1 THEN 1 ELSE 0 END,
    CASE WHEN OUTS_CT = 2 THEN 1 ELSE 0 END


FROM events_ID as t

LEFT JOIN baserunning_stats_catcher as c
ON
(c.ID = t.POS2_FLD_ID AND c.Date = (SELECT max(Date)
FROM baserunning_stats_catcher WHERE Date < t.Date AND baserunning_stats_catcher.ID = t.POS2_FLD_ID))

LEFT JOIN baserunning_stats_pitcher as p
ON
(p.ID = t.PIT_ID AND p.Date = (SELECT max(Date)
FROM baserunning_stats_pitcher WHERE Date < t.Date AND baserunning_stats_pitcher.ID = t.PIT_ID))

LEFT JOIN baserunning_stats_runner as r1
ON
(r1.ID = t.BASE1_RUN_ID AND r1.Date = (SELECT max(Date)
FROM baserunning_stats_runner WHERE Date < t.Date AND baserunning_stats_runner.ID = t.BASE1_RUN_ID))

LEFT JOIN baserunning_stats_runner as r2
ON
(r2.ID = t.BASE2_RUN_ID AND r2.Date = (SELECT max(Date)
FROM baserunning_stats_runner WHERE Date < t.Date AND baserunning_stats_runner.ID = t.BASE2_RUN_ID))

LEFT JOIN baserunning_stats_runner as r3
ON
(r3.ID = t.BASE3_RUN_ID AND r3.Date = (SELECT max(Date)
FROM baserunning_stats_runner WHERE Date < t.Date AND baserunning_stats_runner.ID = t.BASE3_RUN_ID))

WHERE
PIT_START_FL = 'T'
AND
GAME_END_FL = 'F'