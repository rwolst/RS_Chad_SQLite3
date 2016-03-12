DROP TABLE IF EXISTS ID_Split;

CREATE TEMP TABLE ID_Split AS
SELECT seq_events AS seq_events,
    substr(GAME_ID, 1, 3) AS HomeTeam,
    CAST(substr(GAME_ID, 4, 8) AS INT) AS Date,
    substr(GAME_ID, 12, 1) AS GameNumber,
    event_ID as PlayNumber 
FROM events
;

DROP TABLE IF EXISTS events_ID;

CREATE TABLE events_ID AS
SELECT 
    t.*,
	s.HomeTeam,
	s.Date,
	s.GameNumber,
	s.PlayNumber
FROM events t 
INNER JOIN ID_Split s ON
(s.seq_events = t.seq_events);

CREATE INDEX events_id_gameid_idx ON events_ID (`GAME_ID`);
CREATE UNIQUE INDEX events_id_HomeTeamDateGameNumberPlayNumber_idx ON events_ID (HomeTeam, Date, GameNumber, PlayNumber);

DROP TABLE events;





