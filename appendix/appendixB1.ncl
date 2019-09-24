; file_name : appendixB1.ncl

load "./convTunit.ncl"
temp_C = (/36, 23, 27.5, 18.5, 39.3, -1.2, -273.15/)
temp_K = convTunit(temp_C)

print(temp_C+" + 273.15 = "+temp_K)

