; filename : 3-7-1.function1.ncl

undef("my_pi")
function my_pi()
local val_pi
begin
    val_pi = 4*atan(1)
    val_pi@name = "Value of pi"
    return(val_pi)
end

x = my_pi()
print(x)

