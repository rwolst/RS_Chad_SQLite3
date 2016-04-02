import sqlite3 as lite
import csv
import argparse

parser = argparse.ArgumentParser(description = "Run a baseball model and output performance")
parser.add_argument('--databaseName', nargs='?', type=str, help='Name of the database you wish to enter data into [default=retrosheet.db]', default='retrosheet.db')

NS = parser.parse_args()
db = NS.databaseName

years = open('../Year.txt', 'rb').read()

for year in years.split('\r\n'):
    if year != '':
        with open('../data/parsed/sub{0}.csv'.format(year), 'rb') as csvfile:
            spamreader = csv.reader(csvfile, delimiter=',', quotechar='"')
            data = [row for row in spamreader]

            con = lite.connect('../{}'.format(db))
            cur = con.cursor()
            
            SQL = """INSERT INTO subs ( GAME_ID,INN_CT,BAT_HOME_ID ,SUB_ID ,SUB_HOME_ID ,SUB_LINEUP_ID ,SUB_FLD_CD ,REMOVED_ID ,REMOVED_FLD_CD ,EVENT_ID )
                     VALUES ({})"""
            with con:   
                cur.executemany(SQL.format(','.join(['?' for i in range(len(data[0]))])), data)
                
