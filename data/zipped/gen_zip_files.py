years = open('../../Year.txt').read()

f = open('./data/retrosheet_zip_files.txt', 'wb')
for year in years.split('\n'):
    year = year.strip('\r')
    if year != '':
        f.write('http://www.retrosheet.org/events/{0}eve.zip\n'.format(int(year)))

f.close()
