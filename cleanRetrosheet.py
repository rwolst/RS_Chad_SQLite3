# This removes all tables that we can re-generate with our Elo*.r scripts
import sqlite3 as lite
con = lite.connect('retrosheet.db')
cur = con.cursor()

# Get tables
with con:
    cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cur.fetchall()

# Now filter tables to find all Mu Sigma tables
for player in ['pitcher', 'batter', 'Pitcher', 'Batter']:
    for stat in ['Mu', 'Sigma', 'SOBB_HBPHit', 'SingleDoubleTripleHROut', '_hands']:
        filtered_tables = filter(lambda x: x[0].find('{}{}'.format(player, stat)) != -1, tables)

        for table in filtered_tables:
            with con:
                print('Dropping {}'.format(table[0]))
                cur.execute("DROP TABLE {};".format(table[0]))
