; filename : 4-4-2.addfiles2.ncl

dir   = "../data/"
fname = "Tpl.*.mon.grib"
flist = systemfunc("ls -1 "+dir+fname)   ; File list

file_data  = addfiles(dir+flist, "r")    ; Read files
ListSetType(file_data, "cat")
; ListSetType(file_data, "join")
temperature = file_data[:]->T_GDS0_ISBL  ; [variable] = [files][index]->[variable name]
printVarSummary(temperature)             ; Variable info
