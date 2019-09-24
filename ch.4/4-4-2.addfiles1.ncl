; filename : 4-4-2.addfiles1.ncl

dir   = "../data/"
flist = (/ "Tpl.201501.mon.grib", "Tpl.201502.mon.grib", \
           "Tpl.201503.mon.grib", "Tpl.201504.mon.grib", \
           "Tpl.201505.mon.grib", "Tpl.201506.mon.grib", \ 
           "Tpl.201507.mon.grib", "Tpl.201508.mon.grib", \
           "Tpl.201509.mon.grib", "Tpl.201510.mon.grib", \
           "Tpl.201511.mon.grib", "Tpl.201512.mon.grib" /)

; flist = systemfunc("ls -1 "+dir+"Tpl.2015*.mon.grib")  ; File list

file_data = addfiles(dir+flist, "r")    ; Read files
temperature = file_data[:]->T_GDS0_ISBL ; [variable] = [files][index]->[variable name]
printVarSummary(temperature)            ; Variable info

