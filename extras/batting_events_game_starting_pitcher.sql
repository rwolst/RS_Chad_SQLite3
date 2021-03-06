/*First do the right handed table*/
Drop Table IF EXISTS batting_events_game_right_hand_pitcher_starting_pitcher;

CREATE TEMP Table batting_events_game_right_hand_pitcher_starting_pitcher as

SELECT
    ID as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,
	
    Count(*) as PA,
    Sum(K) as K,
    Sum(NIBB) as NIBB,
    Sum(IBB) as IBB,
    Sum(HBP) as HBP,
	Sum(Sacrifice) as Sacrifice,

    Sum(Single) as Single,
    Sum(Double) as Double,
    Sum(Triple) as Triple,
    Sum(HR) as HR,
	Sum(OtherOut) as OtherOut,
	
    Sum(GB) as GB,
    Sum(FB) as FB,
    Sum(LD) as LD,
    Sum(Pop) as Pop,
    Sum(Bunt) as Bunt,
	
    Sum(GDP) as GDP,
    Sum(FDP) as FDP,
    Sum(LDP) as LDP,
    Sum(PDP) as PDP,
    Sum(BDP) as BDP,
	
    Sum(GBSingle) as GBSingle,
    Sum(GBDouble) as GBDouble,
    Sum(GBTriple) as GBTriple,
    Sum(GBHR) as GBHR,
    Sum(GBOut) as GBOut,
	
    Sum(FBSingle) as FBSingle,
    Sum(FBDouble) as FBDouble,
    Sum(FBTriple) as FBTriple,
    Sum(FBHR) as FBHR,
    Sum(FBOut) as FBOut,
	
    Sum(LDSingle) as LDSingle,
    Sum(LDDouble) as LDDouble,
    Sum(LDTriple) as LDTriple,
    Sum(LDHR) as LDHR,
    Sum(LDOut) as LDOut,
	
    Sum(PopSingle) as PopSingle,
    Sum(PopDouble) as PopDouble,
    Sum(PopTriple) as PopTriple,
    Sum(PopHR) as PopHR,
    Sum(PopOut) as PopOut,
	
    Sum(BuntSingle) as BuntSingle,
    Sum(BuntDouble) as BuntDouble,
    Sum(BuntTriple) as BuntTriple,
    Sum(BuntHR) as BuntHR,
    Sum(BuntOut) as BuntOut
	
FROM
batting_events
WHERE
PitcherHand = 'R'
AND
GameEnd = 'F'
AND
PitcherStarting = 'T'

Group By ID, Date, HomeTeam, GameNumber;

Create Index batting_events_game_right_hand_pitcher_starting_pitcher_idx ON batting_events_game_right_hand_pitcher_starting_pitcher (ID, Date, HomeTeam, GameNumber);

/*Now build the cumulative stats table */
Drop Table IF EXISTS batting_stats_right_hand_pitcher_starting_pitcher;

Create Table batting_stats_right_hand_pitcher_starting_pitcher as

SELECT
    *,

    (Single+Double + Triple + HR)*1.0/(PA-NIBB-IBB-HBP-Sacrifice) as Average,
    ((Single+Double + Triple + HR)+NIBB+IBB+HBP)*1.0/PA as OBP,
    (Single+2*Double+3*Triple+4*HR)*1.0/(PA-NIBB-IBB-HBP-Sacrifice) as Slugging,
    (Single+2*Double+3*Triple+4*HR)*1.0/(PA-NIBB-IBB-HBP-Sacrifice)+((Single+Double + Triple + HR)+NIBB+IBB+HBP)*1.0/PA as OPS
FROM
(
SELECT
    t.ID,
	t.Date,

    (SELECT Sum(r.PA) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PA,
    (SELECT Sum(r.K) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as K,
    (SELECT Sum(r.NIBB) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as NIBB,
    (SELECT Sum(r.IBB) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as IBB,
    (SELECT Sum(r.HBP) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as HBP,
    (SELECT Sum(r.Sacrifice) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Sacrifice,

    (SELECT Sum(r.Single) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Single,
    (SELECT Sum(r.Double) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Double,
    (SELECT Sum(r.Triple) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Triple,
    (SELECT Sum(r.HR) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as HR,
    (SELECT Sum(r.OtherOut) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as OtherOut,

    (SELECT Sum(r.GB) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GB,
    (SELECT Sum(r.FB) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FB,
    (SELECT Sum(r.LD) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LD,
    (SELECT Sum(r.Pop) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Pop,
    (SELECT Sum(r.Bunt) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Bunt,

    (SELECT Sum(r.GDP) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GDP,
	(SELECT Sum(r.FDP) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FDP,
	(SELECT Sum(r.LDP) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDP,
	(SELECT Sum(r.PDP) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PDP,
	(SELECT Sum(r.BDP) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BDP,
	
    (SELECT Sum(r.GBSingle) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBSingle,
    (SELECT Sum(r.GBDouble) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBDouble,
    (SELECT Sum(r.GBTriple) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBTriple,
    (SELECT Sum(r.GBHR) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBHR,
    (SELECT Sum(r.GBOut) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBOut,

    (SELECT Sum(r.FBSingle) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBSingle,
    (SELECT Sum(r.FBDouble) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBDouble,
    (SELECT Sum(r.FBTriple) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBTriple,
    (SELECT Sum(r.FBHR) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBHR,
    (SELECT Sum(r.FBOut) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBOut,

    (SELECT Sum(r.LDSingle) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDSingle,
    (SELECT Sum(r.LDDouble) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDDouble,
    (SELECT Sum(r.LDTriple) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDTriple,
    (SELECT Sum(r.LDHR) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDHR,
    (SELECT Sum(r.LDOut) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDOut,

    (SELECT Sum(r.PopSingle) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopSingle,
    (SELECT Sum(r.PopDouble) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopDouble,
    (SELECT Sum(r.PopTriple) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopTriple,
    (SELECT Sum(r.PopHR) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopHR,
    (SELECT Sum(r.PopOut) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopOut,

    (SELECT Sum(r.BuntSingle) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntSingle,
    (SELECT Sum(r.BuntDouble) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntDouble,
    (SELECT Sum(r.BuntTriple) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntTriple,
    (SELECT Sum(r.BuntHR) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntHR,
    (SELECT Sum(r.BuntOut) FROM batting_events_game_right_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntOut

FROM batting_events_game_right_hand_pitcher_starting_pitcher as t

Group By t.ID, t.Date);

Create Index batting_stats_right_hand_pitcher_starting_pitcher_idx ON batting_stats_right_hand_pitcher_starting_pitcher (ID, Date);

/*Drop the temp table*/
DROP TABLE batting_events_game_right_hand_pitcher_starting_pitcher;


/*Now do the left handed table*/
Drop Table IF EXISTS batting_events_game_left_hand_pitcher_starting_pitcher;

CREATE TEMP Table batting_events_game_left_hand_pitcher_starting_pitcher as

SELECT
    ID as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,
	
    Count(*) as PA,
    Sum(K) as K,
    Sum(NIBB) as NIBB,
    Sum(IBB) as IBB,
    Sum(HBP) as HBP,
	Sum(Sacrifice) as Sacrifice,

    Sum(Single) as Single,
    Sum(Double) as Double,
    Sum(Triple) as Triple,
    Sum(HR) as HR,
	Sum(OtherOut) as OtherOut,
	
    Sum(GB) as GB,
    Sum(FB) as FB,
    Sum(LD) as LD,
    Sum(Pop) as Pop,
    Sum(Bunt) as Bunt,
	
    Sum(GDP) as GDP,
    Sum(FDP) as FDP,
    Sum(LDP) as LDP,
    Sum(PDP) as PDP,
    Sum(BDP) as BDP,
	
    Sum(GBSingle) as GBSingle,
    Sum(GBDouble) as GBDouble,
    Sum(GBTriple) as GBTriple,
    Sum(GBHR) as GBHR,
    Sum(GBOut) as GBOut,
	
    Sum(FBSingle) as FBSingle,
    Sum(FBDouble) as FBDouble,
    Sum(FBTriple) as FBTriple,
    Sum(FBHR) as FBHR,
    Sum(FBOut) as FBOut,
	
    Sum(LDSingle) as LDSingle,
    Sum(LDDouble) as LDDouble,
    Sum(LDTriple) as LDTriple,
    Sum(LDHR) as LDHR,
    Sum(LDOut) as LDOut,
	
    Sum(PopSingle) as PopSingle,
    Sum(PopDouble) as PopDouble,
    Sum(PopTriple) as PopTriple,
    Sum(PopHR) as PopHR,
    Sum(PopOut) as PopOut,
	
    Sum(BuntSingle) as BuntSingle,
    Sum(BuntDouble) as BuntDouble,
    Sum(BuntTriple) as BuntTriple,
    Sum(BuntHR) as BuntHR,
    Sum(BuntOut) as BuntOut
	
FROM
batting_events
WHERE
PitcherHand = 'L'
AND
GameEnd = 'F'
AND
PitcherStarting = 'T'

Group By ID, Date, HomeTeam, GameNumber;

Create Index batting_events_game_left_hand_pitcher_starting_pitcher_idx ON batting_events_game_left_hand_pitcher_starting_pitcher (ID, Date, HomeTeam, GameNumber);

/*Now build the cumulative stats table */
Drop Table IF EXISTS batting_stats_left_hand_pitcher_starting_pitcher;

Create Table batting_stats_left_hand_pitcher_starting_pitcher as

SELECT
    *,

    (Single+Double + Triple + HR)*1.0/(PA-NIBB-IBB-HBP-Sacrifice) as Average,
    ((Single+Double + Triple + HR)+NIBB+IBB+HBP)*1.0/PA as OBP,
    (Single+2*Double+3*Triple+4*HR)*1.0/(PA-NIBB-IBB-HBP-Sacrifice) as Slugging,
    (Single+2*Double+3*Triple+4*HR)*1.0/(PA-NIBB-IBB-HBP-Sacrifice)+((Single+Double + Triple + HR)+NIBB+IBB+HBP)*1.0/PA as OPS
FROM
(
SELECT
    t.ID,
	t.Date,

    (SELECT Sum(r.PA) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PA,
    (SELECT Sum(r.K) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as K,
    (SELECT Sum(r.NIBB) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as NIBB,
    (SELECT Sum(r.IBB) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as IBB,
    (SELECT Sum(r.HBP) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as HBP,
    (SELECT Sum(r.Sacrifice) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Sacrifice,

    (SELECT Sum(r.Single) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Single,
    (SELECT Sum(r.Double) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Double,
    (SELECT Sum(r.Triple) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Triple,
    (SELECT Sum(r.HR) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as HR,
    (SELECT Sum(r.OtherOut) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as OtherOut,

    (SELECT Sum(r.GB) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GB,
    (SELECT Sum(r.FB) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FB,
    (SELECT Sum(r.LD) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LD,
    (SELECT Sum(r.Pop) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Pop,
    (SELECT Sum(r.Bunt) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as Bunt,

    (SELECT Sum(r.GDP) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GDP,
	(SELECT Sum(r.FDP) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FDP,
	(SELECT Sum(r.LDP) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDP,
	(SELECT Sum(r.PDP) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PDP,
	(SELECT Sum(r.BDP) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BDP,
	
    (SELECT Sum(r.GBSingle) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBSingle,
    (SELECT Sum(r.GBDouble) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBDouble,
    (SELECT Sum(r.GBTriple) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBTriple,
    (SELECT Sum(r.GBHR) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBHR,
    (SELECT Sum(r.GBOut) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as GBOut,

    (SELECT Sum(r.FBSingle) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBSingle,
    (SELECT Sum(r.FBDouble) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBDouble,
    (SELECT Sum(r.FBTriple) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBTriple,
    (SELECT Sum(r.FBHR) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBHR,
    (SELECT Sum(r.FBOut) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as FBOut,

    (SELECT Sum(r.LDSingle) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDSingle,
    (SELECT Sum(r.LDDouble) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDDouble,
    (SELECT Sum(r.LDTriple) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDTriple,
    (SELECT Sum(r.LDHR) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDHR,
    (SELECT Sum(r.LDOut) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as LDOut,

    (SELECT Sum(r.PopSingle) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopSingle,
    (SELECT Sum(r.PopDouble) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopDouble,
    (SELECT Sum(r.PopTriple) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopTriple,
    (SELECT Sum(r.PopHR) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopHR,
    (SELECT Sum(r.PopOut) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as PopOut,

    (SELECT Sum(r.BuntSingle) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntSingle,
    (SELECT Sum(r.BuntDouble) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntDouble,
    (SELECT Sum(r.BuntTriple) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntTriple,
    (SELECT Sum(r.BuntHR) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntHR,
    (SELECT Sum(r.BuntOut) FROM batting_events_game_left_hand_pitcher_starting_pitcher as r WHERE (r.Date Between SUBSTR(t.Date, 1, 4) AND t.Date) AND r.ID = t.ID) as BuntOut

FROM batting_events_game_left_hand_pitcher_starting_pitcher as t

Group By t.ID, t.Date);

Create Index batting_stats_left_hand_pitcher_starting_pitcher_idx ON batting_stats_left_hand_pitcher_starting_pitcher (ID, Date);

/*Drop the temp table*/
DROP TABLE batting_events_game_left_hand_pitcher_starting_pitcher;