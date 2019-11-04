import csv

CSV_FILE_NAME = 'ItemDB.csv'
LUA_FILE_NAME = '../db.lua'

DATA_TYPES    = [ 'string', 'bool', 'u int', 'int', 'u float', 'float' ]

file_in  = open( CSV_FILE_NAME , 'r' )
file_out = open( LUA_FILE_NAME , 'w' )
#csv_reader = csv.DictReader( file_in )
csv_reader = csv.reader( file_in )
row_no = 0
col_types  = []
col_titles = []

file_out.write( 'local DB_Items = {\n' )

for row in csv_reader:
    if row_no == 0 :
        col_types = row
        for col in row:
            if not col in DATA_TYPES :
                print( 'INVALID DATATYPE [' + col + ']' )
                file_in.close()
                file_out.close()
                raise SystemExit
    if row_no == 1 :
        col_titles = row
        col_no = 0
        for col in col_titles :
            if col == '' :
                print( 'EMPTY COLUMN TITLE [' + str( col_no ) + ']' )
                file_in.close()
                file_out.close()
                raise SystemExit
            col_titles[ col_no ] = col.lower()
            col_no = col_no + 1
    if row_no  > 1 :
        file_out.write( '   {\n' )
        col_no = 0
        for col in row:
            file_out.write( '       ' + col_titles[ col_no ] + ' '*(16-len(col_titles[ col_no ])) + ' = ' + '\'' + col + '\',\n' )
            print( col )
            col_no = col_no + 1
        file_out.write( '   },\n' )
    row_no = row_no + 1

file_out.write( '}' )

file_in.close()
file_out.close()