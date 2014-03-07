FOR /F "tokens=* delims=" %%x in (../../Year.txt) DO C:\Retrosheet\common\programs\cwgame -f 0-83 -y %%x %%x*.ev* > C:\Retrosheet\data\parsed\games%%x.csv
