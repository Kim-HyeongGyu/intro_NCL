; filename : 4-2-3.write_matrix.ncl

data = (/ (/  4.35,  4.36,  9.73,  4.91,  1.77, -0.63, -4.29 /), \
          (/  4.39,  4.66, -5.84,  4.59,  3.68, -1.12,  0.07 /), \
          (/  0.27,  3.77,  0.89, -3.09,  5.08, -2.51,  5.85 /), \
          (/ -3.35, -1.66,  8.46,  7.55,  0.14,  1.76,  0.87 /), \
          (/ -6.90,  4.06, 10.39,  4.56, -5.63, -1.43,  8.65 /) /)

option        = True
option@title  = "Header : random values"  ; Header
option@tspace = 2                         ; Num of space
option@row    = False                     ; Set row number
option@fout   = "output3.txt"             ; Output file name

write_matrix(data, "7f7.2", option)

