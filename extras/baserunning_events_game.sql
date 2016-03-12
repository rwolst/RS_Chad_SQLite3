/*Create temporary baserunning tables for runners*/
DROP TABLE IF EXISTS x_1;
CREATE TEMP TABLE x_1 as

SELECT
    Runner as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_1) as PA_1,
	Sum(PO_1) as PO_1,
	Sum(SB_1) as SB_1,
	Sum(CS_1) as CS_1

FROM baserunning_events_1
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create temporary baserunning tables*/
DROP TABLE IF EXISTS x_2;
CREATE TEMP TABLE x_2 as

SELECT
    Runner as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_2) as PA_2,
	Sum(PO_2) as PO_2,
	Sum(SB_2) as SB_2,
	Sum(CS_2) as CS_2

FROM baserunning_events_2
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create temporary baserunning tables*/
DROP TABLE IF EXISTS x_3;
CREATE TEMP TABLE x_3 as

SELECT
    Runner as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_3) as PA_3,
	Sum(PO_3) as PO_3,
	Sum(SB_3) as SB_3,
	Sum(CS_3) as CS_3

FROM baserunning_events_3
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create union of these tables*/
DROP TABLE IF EXISTS tblel;
CREATE TEMP TABLE tblel as

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
     
FROM x_1 
LEFT JOIN x_2
ON (x_1.ID = x_2.ID AND x_1.HomeTeam = x_2.HomeTeam AND x_1.Date = x_2.Date AND x_1.GameNumber = x_2.GameNumber)
LEFT JOIN x_3
ON (x_1.ID = x_3.ID AND x_1.HomeTeam = x_3.HomeTeam AND x_1.Date = x_3.Date AND x_1.GameNumber = x_3.GameNumber)

UNION

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
    
    
FROM x_2 
LEFT JOIN x_1
ON (x_1.ID = x_2.ID AND x_1.HomeTeam = x_2.HomeTeam AND x_1.Date = x_2.Date AND x_1.GameNumber = x_2.GameNumber)
LEFT JOIN x_3
ON (x_2.ID = x_3.ID AND x_2.HomeTeam = x_3.HomeTeam AND x_2.Date = x_3.Date AND x_2.GameNumber = x_3.GameNumber)

UNION

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
    
    
FROM x_3 
LEFT JOIN x_1
ON (x_1.ID = x_3.ID AND x_1.HomeTeam = x_3.HomeTeam AND x_1.Date = x_3.Date AND x_1.GameNumber = x_3.GameNumber)
LEFT JOIN x_2
ON (x_2.ID = x_3.ID AND x_2.HomeTeam = x_3.HomeTeam AND x_2.Date = x_3.Date AND x_2.GameNumber = x_3.GameNumber);




/*Normalise the ID, Date, HomeTeam, GameNumber*/
Drop Table IF EXISTS baserunning_events_game_runner;
CREATE Table baserunning_events_game_runner as

SELECT
    IFNULL(ID_1, IFNULL(ID_2, ID_3)) as ID,
    IFNULL(Date_1, IFNULL(Date_2, Date_3)) as Date,
    
    IFNULL(PA_1, 0) as PA_1,
    IFNULL(PO_1, 0) as PO_1,
    IFNULL(SB_1, 0) as SB_1,
    IFNULL(CS_1, 0) as CS_1,
    
    IFNULL(PA_2, 0) as PA_2,
    IFNULL(PO_2, 0) as PO_2,
    IFNULL(SB_2, 0) as SB_2,
    IFNULL(CS_2, 0) as CS_2,
	
    IFNULL(PA_3, 0) as PA_3,
    IFNULL(PO_3, 0) as PO_3,
    IFNULL(SB_3, 0) as SB_3,
    IFNULL(CS_3, 0) as CS_3
    
FROM tblel
Group by ID, Date;

Create Index baserunning_events_game_runner_idx ON baserunning_events_game_runner (ID, Date);

DROP TABLE IF EXISTS x_1;
DROP TABLE IF EXISTS x_2;
DROP TABLE IF EXISTS x_3;
DROP TABLE IF EXISTS tblel;

















/*Now do pitchers*/
DROP TABLE IF EXISTS x_1;
CREATE TEMP TABLE x_1 as

SELECT
    Pitcher	as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_1) as PA_1,
	Sum(PO_1) as PO_1,
	Sum(SB_1) as SB_1,
	Sum(CS_1) as CS_1

FROM baserunning_events_1
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create temporary baserunning tables*/
DROP TABLE IF EXISTS x_2;
CREATE TEMP TABLE x_2 as

SELECT
    Pitcher as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_2) as PA_2,
	Sum(PO_2) as PO_2,
	Sum(SB_2) as SB_2,
	Sum(CS_2) as CS_2

FROM baserunning_events_2
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create temporary baserunning tables*/
DROP TABLE IF EXISTS x_3;
CREATE TEMP TABLE x_3 as

SELECT
    Pitcher as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_3) as PA_3,
	Sum(PO_3) as PO_3,
	Sum(SB_3) as SB_3,
	Sum(CS_3) as CS_3

FROM baserunning_events_3
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create union of these tables*/
DROP TABLE IF EXISTS tblel;
CREATE TEMP TABLE tblel as

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
     
FROM x_1 
LEFT JOIN x_2
ON (x_1.ID = x_2.ID AND x_1.HomeTeam = x_2.HomeTeam AND x_1.Date = x_2.Date AND x_1.GameNumber = x_2.GameNumber)
LEFT JOIN x_3
ON (x_1.ID = x_3.ID AND x_1.HomeTeam = x_3.HomeTeam AND x_1.Date = x_3.Date AND x_1.GameNumber = x_3.GameNumber)

UNION

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
    
    
FROM x_2 
LEFT JOIN x_1
ON (x_1.ID = x_2.ID AND x_1.HomeTeam = x_2.HomeTeam AND x_1.Date = x_2.Date AND x_1.GameNumber = x_2.GameNumber)
LEFT JOIN x_3
ON (x_2.ID = x_3.ID AND x_2.HomeTeam = x_3.HomeTeam AND x_2.Date = x_3.Date AND x_2.GameNumber = x_3.GameNumber)

UNION

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
    
    
FROM x_3 
LEFT JOIN x_1
ON (x_1.ID = x_3.ID AND x_1.HomeTeam = x_3.HomeTeam AND x_1.Date = x_3.Date AND x_1.GameNumber = x_3.GameNumber)
LEFT JOIN x_2
ON (x_2.ID = x_3.ID AND x_2.HomeTeam = x_3.HomeTeam AND x_2.Date = x_3.Date AND x_2.GameNumber = x_3.GameNumber);




/*Normalise the ID, Date, HomeTeam, GameNumber*/
Drop Table IF EXISTS baserunning_events_game_pitcher;
CREATE Table baserunning_events_game_pitcher as

SELECT
    IFNULL(ID_1, IFNULL(ID_2, ID_3)) as ID,
    IFNULL(Date_1, IFNULL(Date_2, Date_3)) as Date,
    
    IFNULL(PA_1, 0) as PA_1,
    IFNULL(PO_1, 0) as PO_1,
    IFNULL(SB_1, 0) as SB_1,
    IFNULL(CS_1, 0) as CS_1,
    
    IFNULL(PA_2, 0) as PA_2,
    IFNULL(PO_2, 0) as PO_2,
    IFNULL(SB_2, 0) as SB_2,
    IFNULL(CS_2, 0) as CS_2,
	
    IFNULL(PA_3, 0) as PA_3,
    IFNULL(PO_3, 0) as PO_3,
    IFNULL(SB_3, 0) as SB_3,
    IFNULL(CS_3, 0) as CS_3
    
FROM tblel
Group by ID, Date;

Create Index baserunning_events_game_pitcher_idx ON baserunning_events_game_pitcher (ID, Date);

DROP TABLE IF EXISTS x_1;
DROP TABLE IF EXISTS x_2;
DROP TABLE IF EXISTS x_3;
DROP TABLE IF EXISTS tblel;









/*Now do catchers*/
DROP TABLE IF EXISTS x_1;
CREATE TEMP TABLE x_1 as

SELECT
    Catcher	as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_1) as PA_1,
	Sum(PO_1) as PO_1,
	Sum(SB_1) as SB_1,
	Sum(CS_1) as CS_1

FROM baserunning_events_1
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create temporary baserunning tables*/
DROP TABLE IF EXISTS x_2;
CREATE TEMP TABLE x_2 as

SELECT
    Catcher as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_2) as PA_2,
	Sum(PO_2) as PO_2,
	Sum(SB_2) as SB_2,
	Sum(CS_2) as CS_2

FROM baserunning_events_2
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create temporary baserunning tables*/
DROP TABLE IF EXISTS x_3;
CREATE TEMP TABLE x_3 as

SELECT
    Catcher as ID,
    HomeTeam as HomeTeam,
    Date as Date,
    GameNumber as GameNumber,

    Count(PO_3) as PA_3,
	Sum(PO_3) as PO_3,
	Sum(SB_3) as SB_3,
	Sum(CS_3) as CS_3

FROM baserunning_events_3
WHERE 
GameEnd = 'F'
Group By ID, Date, HomeTeam, GameNumber;

/*Create union of these tables*/
DROP TABLE IF EXISTS tblel;
CREATE TEMP TABLE tblel as

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
     
FROM x_1 
LEFT JOIN x_2
ON (x_1.ID = x_2.ID AND x_1.HomeTeam = x_2.HomeTeam AND x_1.Date = x_2.Date AND x_1.GameNumber = x_2.GameNumber)
LEFT JOIN x_3
ON (x_1.ID = x_3.ID AND x_1.HomeTeam = x_3.HomeTeam AND x_1.Date = x_3.Date AND x_1.GameNumber = x_3.GameNumber)

UNION

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
    
    
FROM x_2 
LEFT JOIN x_1
ON (x_1.ID = x_2.ID AND x_1.HomeTeam = x_2.HomeTeam AND x_1.Date = x_2.Date AND x_1.GameNumber = x_2.GameNumber)
LEFT JOIN x_3
ON (x_2.ID = x_3.ID AND x_2.HomeTeam = x_3.HomeTeam AND x_2.Date = x_3.Date AND x_2.GameNumber = x_3.GameNumber)

UNION

SELECT
    x_1.ID as ID_1,
    x_1.HomeTeam as HomeTeam_1,
    x_1.Date as Date_1,
    x_1.GameNumber as GameNumber_1,
    x_1.PA_1 as PA_1,
    x_1.PO_1 as PO_1,
    x_1.SB_1 as SB_1,
    x_1.CS_1 as CS_1,
    
    x_2.ID as ID_2,
    x_2.HomeTeam as HomeTeam_2,
    x_2.Date as Date_2,
    x_2.GameNumber as GameNumber_2,
    x_2.PA_2 as PA_2,
    x_2.PO_2 as PO_2,
    x_2.SB_2 as SB_2,
    x_2.CS_2 as CS_2,
	
    x_3.ID as ID_3,
    x_3.HomeTeam as HomeTeam_3,
    x_3.Date as Date_3,
    x_3.GameNumber as GameNumber_3,
    x_3.PA_3 as PA_3,
    x_3.PO_3 as PO_3,
    x_3.SB_3 as SB_3,
    x_3.CS_3 as CS_3
    
    
FROM x_3 
LEFT JOIN x_1
ON (x_1.ID = x_3.ID AND x_1.HomeTeam = x_3.HomeTeam AND x_1.Date = x_3.Date AND x_1.GameNumber = x_3.GameNumber)
LEFT JOIN x_2
ON (x_2.ID = x_3.ID AND x_2.HomeTeam = x_3.HomeTeam AND x_2.Date = x_3.Date AND x_2.GameNumber = x_3.GameNumber);




/*Normalise the ID, Date, HomeTeam, GameNumber*/
Drop Table IF EXISTS baserunning_events_game_catcher;
CREATE Table baserunning_events_game_catcher as

SELECT
    IFNULL(ID_1, IFNULL(ID_2, ID_3)) as ID,
    IFNULL(Date_1, IFNULL(Date_2, Date_3)) as Date,
    
    IFNULL(PA_1, 0) as PA_1,
    IFNULL(PO_1, 0) as PO_1,
    IFNULL(SB_1, 0) as SB_1,
    IFNULL(CS_1, 0) as CS_1,
    
    IFNULL(PA_2, 0) as PA_2,
    IFNULL(PO_2, 0) as PO_2,
    IFNULL(SB_2, 0) as SB_2,
    IFNULL(CS_2, 0) as CS_2,
	
    IFNULL(PA_3, 0) as PA_3,
    IFNULL(PO_3, 0) as PO_3,
    IFNULL(SB_3, 0) as SB_3,
    IFNULL(CS_3, 0) as CS_3
    
FROM tblel
Group by ID, Date;

Create Index baserunning_events_game_catcher_idx ON baserunning_events_game_catcher (ID, Date);

DROP TABLE IF EXISTS x_1;
DROP TABLE IF EXISTS x_2;
DROP TABLE IF EXISTS x_3;
DROP TABLE IF EXISTS tblel;




