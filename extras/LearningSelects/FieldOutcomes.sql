SELECT
    HomeTeam,
	BAT_HAND_CD,
    SUM(Single) * 1.0 / (SUM(Single) + SUM(Double) + SUM(Triple) + SUM(HR) + SUM(Out)) as Single,
	SUM(Double) * 1.0 / (SUM(Single) + SUM(Double) + SUM(Triple) + SUM(HR) + SUM(Out)) as Double,
	SUM(Triple) * 1.0 / (SUM(Single) + SUM(Double) + SUM(Triple) + SUM(HR) + SUM(Out)) as Triple,
	SUM(HR) * 1.0 / (SUM(Single) + SUM(Double) + SUM(Triple) + SUM(HR) + SUM(Out)) as HR,
	SUM(Out) * 1.0 / (SUM(Single) + SUM(Double) + SUM(Triple) + SUM(HR) + SUM(Out)) as Out
FROM
(
    SELECT
	    HomeTeam,
		BAT_HAND_CD,
	    CASE WHEN Event_CD = 20 THEN 1 ELSE 0 END as Single,
		CASE WHEN Event_CD = 21 THEN 1 ELSE 0 END as Double,
		CASE WHEN Event_CD = 22 THEN 1 ELSE 0 END as Triple,
		CASE WHEN Event_CD = 23 THEN 1 ELSE 0 END as HR,
		CASE WHEN Event_CD = 2 THEN 1 ELSE 0 END as Out
	FROM EVENTS_ID
	WHERE 
	BATTEDBALL_CD = 'F'
)
Group by HomeTeam, BAT_HAND_CD;
	