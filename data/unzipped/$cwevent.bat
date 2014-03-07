FOR /F "tokens=* delims=" %%x in (../../Year.txt) DO C:\Retrosheet\common\programs\cwevent -f 0-96 -x 0-60 -y %%x %%x*.ev* > C:\Retrosheet\data\parsed\all%%x.csv
