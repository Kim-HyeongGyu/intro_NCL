; filename : convTunit.ncl

; This function converts the unit 
;  of temperaturer from C to K

undef("convTunit")
function convTunit(val)
begin
    con_val = val+273.15
    return(con_val)
end
