SELECT
    HomeTeam,
	BAT_HAND_CD,
	SUM(BB) * 1.0 / (SUM(BB) + SUM(SO) + SUM(GB) + SUM(FB) + SUM(LD) + SUM(Pop)) as BB,
    SUM(SO) * 1.0 / (SUM(BB) + SUM(SO) + SUM(GB) + SUM(FB) + SUM(LD) + SUM(Pop)) as SO,
    SUM(GB) * 1.0 / (SUM(BB) + SUM(SO) + SUM(GB) + SUM(FB) + SUM(LD) + SUM(Pop)) as GB,
	SUM(FB) * 1.0 / (SUM(BB) + SUM(SO) + SUM(GB) + SUM(FB) + SUM(LD) + SUM(Pop)) as FB,
	SUM(LD) * 1.0 / (SUM(BB) + SUM(SO) + SUM(GB) + SUM(FB) + SUM(LD) + SUM(Pop)) as LD,
	SUM(Pop) * 1.0 / (SUM(BB) + SUM(SO) + SUM(GB) + SUM(FB) + SUM(LD) + SUM(Pop)) as Pop
FROM
(
    SELECT
	    HomeTeam,
		BAT_HAND_CD,
		CASE WHEN (EVENT_CD = 14 OR EVENT_CD = 16) THEN 1 ELSE 0 END as BB,
		CASE WHEN EVENT_CD = 3 THEN 1 ELSE 0 END as SO,
	    CASE WHEN BATTEDBALL_CD = 'G' THEN 1 ELSE 0 END as GB,
		CASE WHEN BATTEDBALL_CD = 'F' THEN 1 ELSE 0 END as FB,
		CASE WHEN BATTEDBALL_CD = 'L' THEN 1 ELSE 0 END as LD,
		CASE WHEN BATTEDBALL_CD = 'P' THEN 1 ELSE 0 END as Pop
	FROM EVENTS_ID
	/*WHERE
	BAT_HOME_ID = 0*/ /*We use away teams to evaluate parks to reduce  a good/bad home team bias*/

)
Group by HomeTeam, BAT_HAND_CD;
	