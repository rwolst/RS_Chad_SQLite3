# Loop through each year
while read p; do
    # Remove whitespace
    year="$(echo -e "${p}" | tr -d '[[:space:]]')"

    # Extract using our chadwick tool
    ../../common/programs/cwgame -f 0-83 -y "${year}" ${year}*.EV* > "../parsed/games${year}.csv"
done < ../../Year.txt
