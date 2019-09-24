; filename : 4-2-2.readcsv.ncl

data  = asciiread("../data/example1.csv", -1, "string")
delim = ","
val   = str_split_csv(data, delim, 0)
print("Val: " + val)
