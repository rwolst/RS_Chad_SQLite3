import wget
import sqlite3 as lite
import os
import csv

con = lite.connect('./retrosheet.db')
cur = con.cursor()

# Download the latest team csv file
URL = 'http://crunchtimebaseball.com/master.csv'
wget.download(URL, out='CurrentNames.csv')

with con:
    cur.execute('DROP TABLE IF EXISTS PlayerIDs')

# Now import
os.system('sqlite3 retrosheet.db ".read extras/playerIds.sql"')
os.remove('CurrentNames.csv')
