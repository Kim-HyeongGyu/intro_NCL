; filename : 4-2-2.asciiread2.ncl

filepath   = "../data/asc2.txt"
dimensions = (/17,2/)
datatype   = "float"
value      = asciiread(filepath, dimensions, datatype)
print(value)
