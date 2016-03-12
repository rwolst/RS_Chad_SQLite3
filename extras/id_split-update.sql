DROP TABLE IF EXISTS ID_Split;

CREATE TEMP TABLE ID_Split AS
SELECT seq_events AS seq_events,
    substr(GAME_ID, 1, 3) AS HomeTeam,
    substr(GAME_ID, 4, 8) AS Date,
    substr(GAME_ID, 12, 1) AS GameNumber,
    event_ID as PlayNumber 
FROM events_bck;

DROP INDEX events_id_gameid_idx;
DROP INDEX events_id_HomeTeamDateGameNumberPlayNumber_idx;

INSERT INTO events_ID
SELECT 
    t.*,
	s.HomeTeam,
	s.Date,
	s.GameNumber,
	s.PlayNumber
FROM events_bck t 
INNER JOIN ID_Split s ON
(s.seq_events = t.seq_events);

CREATE INDEX events_id_gameid_idx ON events_ID (`GAME_ID`);
CREATE UNIQUE INDEX events_id_HomeTeamDateGameNumberPlayNumber_idx ON events_ID (HomeTeam, Date, GameNumber, PlayNumber);
