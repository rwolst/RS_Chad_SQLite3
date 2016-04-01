import wget
import sqlite3 as lite
import os
import csv

con = lite.connect('./retrosheet.db')
cur = con.cursor()

# Download the latest team csv file
URL = 'http://www.retrosheet.org/CurrentNames.csv'
wget.download(URL, out='CurrentNames.csv')

# First create our database
SQL = """CREATE TABLE TeamIDs(ID_current TEXT,
                              ID_past TEXT,
                              League TEXT,
                              Division TEXT,
                              Location TEXT,
                              Nickname1 TEXT,
                              Nickname2 TEXT,
                              FirstGameDate DATE,
                              LastGameDate DATE,
                              City TEXT,
                              State TEXT)"""
with con:
    cur.execute('DROP TABLE IF EXISTS TeamIDs')
    cur.execute(SQL)

# Now we can read in our csv file
with open('CurrentNames.csv', 'rb') as f:
    data = [i for i in csv.reader(f, delimiter=',')]


SQL = """INSERT INTO TeamIDs(ID_current,
                                   ID_past, 
                                   League,
                                   Division,
                                   Location,
                                   Nickname1,
                                   Nickname2,
                                   FirstGameDate,
                                   LastGameDate,
                                   City,
                                   State) VALUES (?,?,?,?,?,?,?,?,?,?,?)"""

with con:
    cur.executemany(SQL, data)

os.remove('CurrentNames.csv')
