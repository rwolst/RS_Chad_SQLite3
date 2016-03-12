import sqlite3 as lite

con = lite.connect('retrosheet.db')
cur = con.cursor()

with con:
  # Firstly select the unique identifier for the games
  SQL = "SELECT GAME_ID, EVENT_ID FROM EVENTS_ID"
  cur.execute(SQL)

  data = cur.fetchall()

  # Now for each for in data, update the HomeTeam, Date, GameNumber, PlayNumber fields
  for row in data:
    if row[0] != None and row[1] != None:
      homeTeam = row[0][:3]
      date = row[0][3:11]
      gameNumber = row[0][11]
      playNumber = row[1]
      cur.execute("UPDATE EVENTS_ID SET HomeTeam = ?, Date = ?, GameNumber = ?, PlayNumber = ? WHERE GAME_ID = ? AND EVENT_ID = ?", (homeTeam, date, gameNumber, playNumber, row[0], row[1]))
