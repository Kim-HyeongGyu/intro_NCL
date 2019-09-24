; filename : 7-4-3.myscript_env.ncl

year  = toint(getenv("YEAR"))
mon   = toint(getenv("MONTH"))
area  = getenv("AREA")

print("Year : "+ year +", month : "+ mon +"  "+ area +" university")

