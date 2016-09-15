# This removes duplicate ids from retrosheet and merges them all together into one
import sqlite3 as lite
import sys

ENTER_INFO = True
db_retro = '/cygdrive/c/Retrosheet/retrosheet.db'
espn_id_index = 14
PlayerIds_columns = 30

con = lite.connect(db_retro)
cur = con.cursor()
SQL = 'SELECT espn_id FROM (SELECT *, COUNT(*) as count_number FROM PlayerIDS GROUP BY espn_Id) WHERE count_number>1;'
with con:
    cur.execute(SQL)
    data = cur.fetchall()

# Now look through our data and any rows with an integer espn_id and multiple records merge into 1 record as best we can
for row in data:
    if not ENTER_INFO:
        print('\nPress Enter for next player')
        raw_input()
    try:
        int(row[0])

        try:
            SQL = 'SELECT * FROM PlayerIDs WHERE ESPN_ID = ?'
            with con:
                cur.execute(SQL, (row[0],))
                player_data = cur.fetchall()

            new_record = [None for i in range(PlayerIds_columns)]
            for record in player_data:
                for i in range(len(record)):
                    entry = record[i]
                    if entry != None and entry != '':
                        # Try to enter the data into our new_record
                        if new_record[i] != None and new_record[i] != '':
                            if entry.lower().replace('-', ' ') != new_record[i].lower().replace('-', ' '):
                                print('Not entering entry {} as we already have it in our new_record {}'.format(entry, new_record[i]))
                        else:
                            new_record[i] = entry

            if ENTER_INFO:
                with con:
                    cur.execute('Delete FROM PlayerIds WHERE ESPN_ID = ?', (row[0],))
                    cur.execute('INSERT INTO PlayerIds Values ({})'.format(','.join('?' for i in range(len(new_record)))), new_record)
            else:
                print('Would have entered \n{}'.format(new_record))
        except:
            sys.exit(-1)
    except:
        print('{} not an integer player'.format(row[0]))
