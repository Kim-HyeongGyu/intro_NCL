; filename : 3-7-1.procedure.ncl

undef("convK2C")    ;-- convK2C: convert data from Kelvin to Celsius
procedure convK2C(var)
begin
    var = var - 273.15
    var@units = "C"
end

temp       = 288.
temp@units = "K"
print("Temperaure : "+temp+" ["+temp@units+"]")
convK2C(temp)
print("Temperaure : "+temp+" ["+temp@units+"]")
