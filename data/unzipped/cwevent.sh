# Loop through each year
while read p; do
    # Remove whitespace
    year="$(echo -e "${p}" | tr -d '[[:space:]]')"

    # Extract using our chadwick tool
    ../../common/programs/cwevent -f 0-96 -x 0-60 -y "${year}" ${year}*.EV* > "../parsed/all${year}.csv"
done < ../../Year.txt
