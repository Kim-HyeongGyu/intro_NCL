; filename : 4-4-3.makenc.ncl

infile_name  = "../data/T.nc"
outfile_name = "CtoK_temp.nc"

fin = addfile(infile_name, "r")
tC  = fin->T
tK  = tC               ; Copy Value and meta data
tK  = tC + 273.15      ; Change unit : Celcius -> Kelvin
; copy_VarMeta(tC, tK)
tK@units = "Kelvin"    ; Change attribute
printVarSummary(tK)

fout    = addfile(outfile_name, "c")   ; Make file
fout->T = tK

