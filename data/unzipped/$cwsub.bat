FOR /F "tokens=* delims=" %%x in (../../Year.txt) DO C:\Retrosheet\common\programs\cwsub -f 0-9 -y %%x %%x*.ev* > C:\Retrosheet\data\parsed\sub%%x.csv
