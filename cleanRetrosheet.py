# This removes all tables that we can re-generate with our Elo*.r scripts
import sqlite3 as lite
con = lite.connect('retrosheet.db')
cur = con.cursor()

print('Would you like to remove all dates above 20150000 (Y/n)?')
if raw_input() == 'Y':
    with con:
        cur.execute('DELETE FROM EVENTS_ID WHERE Date >= 20150000')
        cur.execute('DELETE FROM games WHERE YEAR_ID = 2015')

# Get tables
with con:
    cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cur.fetchall()

# Now filter tables to find all Mu Sigma tables
for player in ['pitcher', 'batter', 'Pitcher', 'Batter', 'PIT', 'BAT']:
    for stat in ['Mu', 'Sigma', 'SOBB_HBPHit', 'SingleDoubleTripleHROut', '_hands', '_cum']:
        filtered_tables = filter(lambda x: x[0].find('{}{}'.format(player, stat)) != -1, tables)

        for table in filtered_tables:
            with con:
                print('Dropping {}'.format(table[0]))
                cur.execute("DROP TABLE {};".format(table[0]))
