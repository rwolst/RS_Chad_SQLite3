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
        with open('../data/parsed/games{0}.csv'.format(year), 'rb') as csvfile:
            spamreader = csv.reader(csvfile, delimiter=',', quotechar='"')
            data = [row for row in spamreader]

            con = lite.connect('../{}'.format(db))
            cur = con.cursor()
            
            SQL = """INSERT INTO games_bck (GAME_ID,
                        GAME_DT,
                        GAME_CT,
                        GAME_DY,
                        START_GAME_TM,
                        DH_FL,
                        DAYNIGHT_PARK_CD,
                        AWAY_TEAM_ID,
                        HOME_TEAM_ID,
                        PARK_ID,
                        AWAY_START_PIT_ID,
                        HOME_START_PIT_ID,
                        BASE4_UMP_ID,
                        BASE1_UMP_ID,
                        BASE2_UMP_ID,
                        BASE3_UMP_ID,
                        LF_UMP_ID,
                        RF_UMP_ID,
                        ATTEND_PARK_CT,
                        SCORER_RECORD_ID,
                        TRANSLATOR_RECORD_ID,
                        INPUTTER_RECORD_ID,
                        INPUT_RECORD_TS,
                        EDIT_RECORD_TS,
                        METHOD_RECORD_CD,
                        PITCHES_RECORD_CD,
                        TEMP_PARK_CT,
                        WIND_DIRECTION_PARK_CD,
                        WIND_SPEED_PARK_CT,
                        FIELD_PARK_CD,
                        PRECIP_PARK_CD,
                        SKY_PARK_CD,
                        MINUTES_GAME_CT,
                        INN_CT,
                        AWAY_SCORE_CT,
                        HOME_SCORE_CT,
                        AWAY_HITS_CT,
                        HOME_HITS_CT,
                        AWAY_ERR_CT,
                        HOME_ERR_CT,
                        AWAY_LOB_CT,
                        HOME_LOB_CT,
                        WIN_PIT_ID,
                        LOSE_PIT_ID,
                        SAVE_PIT_ID,
                        GWRBI_BAT_ID,
                        AWAY_LINEUP1_BAT_ID,
                        AWAY_LINEUP1_FLD_CD,
                        AWAY_LINEUP2_BAT_ID,
                        AWAY_LINEUP2_FLD_CD,
                        AWAY_LINEUP3_BAT_ID,
                        AWAY_LINEUP3_FLD_CD,
                        AWAY_LINEUP4_BAT_ID,
                        AWAY_LINEUP4_FLD_CD,
                        AWAY_LINEUP5_BAT_ID,
                        AWAY_LINEUP5_FLD_CD,
                        AWAY_LINEUP6_BAT_ID,
                        AWAY_LINEUP6_FLD_CD,
                        AWAY_LINEUP7_BAT_ID,
                        AWAY_LINEUP7_FLD_CD,
                        AWAY_LINEUP8_BAT_ID,
                        AWAY_LINEUP8_FLD_CD,
                        AWAY_LINEUP9_BAT_ID,
                        AWAY_LINEUP9_FLD_CD,
                        HOME_LINEUP1_BAT_ID,
                        HOME_LINEUP1_FLD_CD,
                        HOME_LINEUP2_BAT_ID,
                        HOME_LINEUP2_FLD_CD,
                        HOME_LINEUP3_BAT_ID,
                        HOME_LINEUP3_FLD_CD,
                        HOME_LINEUP4_BAT_ID,
                        HOME_LINEUP4_FLD_CD,
                        HOME_LINEUP5_BAT_ID,
                        HOME_LINEUP5_FLD_CD,
                        HOME_LINEUP6_BAT_ID,
                        HOME_LINEUP6_FLD_CD,
                        HOME_LINEUP7_BAT_ID,
                        HOME_LINEUP7_FLD_CD,
                        HOME_LINEUP8_BAT_ID,
                        HOME_LINEUP8_FLD_CD,
                        HOME_LINEUP9_BAT_ID,
                        HOME_LINEUP9_FLD_CD,
                        AWAY_FINISH_PIT_ID,
                        HOME_FINISH_PIT_ID)
                        VALUES ({})"""
            with con:   
                cur.executemany(SQL.format(','.join(['?' for i in range(len(data[0]))])), data)
            
