; filename : 4-2-3.asciiwrite2.ncl

data = (/ (/ 1, 2, 3, 4, 5  /), \
          (/ 6, 7, 8, 9, 10 /)  /)

lines = sprinti( "%03i", data) + " " + sprintf("%8.2f", data)
asciiwrite("output2.txt", lines)

