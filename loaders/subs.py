import sqlite3 as lite
import csv

years = open('../Year.txt', 'rb').read()

for year in years.split('\r\n'):
    with open('../data/parsed/sub{0}.csv'.format(year), 'rb') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')

        con = lite.connect('../retrosheet.db')
        cur = con.cursor()
        
        SQL = """INSERT INTO subs ( GAME_ID,INN_CT,BAT_HOME_ID ,SUB_ID ,SUB_HOME_ID ,SUB_LINEUP_ID ,SUB_FLD_CD ,REMOVED_ID ,REMOVED_FLD_CD ,EVENT_ID )
                 VALUES {0}"""
        with con:   
            for row in spamreader:
                cur.execute(SQL.format(tuple(row)))
            
