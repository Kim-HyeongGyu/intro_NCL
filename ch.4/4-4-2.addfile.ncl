; filename : 4-4-2.addfile.ncl

file_data = addfile("../data/T.nc", "r") ; Read file
print(file_data)                         ; File info

; temperature = file_data->T             ; [variable] = [file]->[variable name]
; printVarSummary(temperature)           ; Variable info

