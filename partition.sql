UPDATE games_bck
SET YEAR_ID = SUBSTR(GAME_ID,4,4);

UPDATE events_bck
SET YEAR_ID = SUBSTR(GAME_ID,4,4);

INSERT INTO games
SELECT * from games_bck;

INSERT INTO events
SELECT * from events_bck;