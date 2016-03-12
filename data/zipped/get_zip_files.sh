wget -i ./data/retrosheet_zip_files.txt
for f in *.zip; do
    unzip $f -d ../unzipped;
done
