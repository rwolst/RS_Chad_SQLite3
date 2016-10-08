# Loop through each year
while read p; do
    # Remove whitespace
    year="$(echo -e "${p}" | tr -d '[[:space:]]')"

    # Extract using our chadwick tool
    ../../common/programs/cwsub -f 0-9 -y "${year}" ${year}*.EV* > "../parsed/sub${year}.csv"
done < ../../Year.txt
