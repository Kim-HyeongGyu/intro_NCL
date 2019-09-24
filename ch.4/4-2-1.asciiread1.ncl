; filename : 4-2-1.asciiread1.ncl

filepath   = "../data/asc1.txt"
dimensions = 14		; if unknown dimension size, set `dimensions = -1`
datatype   = "integer"
value      = asciiread(filepath, dimensions, datatype)
print(value)
