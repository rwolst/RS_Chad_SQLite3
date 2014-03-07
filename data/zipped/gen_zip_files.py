years = open('../../Year.txt').read()

f = open('./data/retrosheet_zip_files.txt', 'wb')
for year in years.split('\n'):
    f.write('http://www.retrosheet.org/events/{0}eve.zip\n'.format(year))

f.close()
