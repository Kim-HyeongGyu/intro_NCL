; filename : 3-7-1.function2.ncl

undef("operator_result")
function operator_result(val1, val2)
local add_val, sub_val, mul_val
begin
    add_val = val1 + val2
    sub_val = val1 - val2
    mul_val = val1 * val2
    return [/ add_val, sub_val, mul_val /]
end

value1 = 2
value2 = 5
result = operator_result(value1,value2)
add = result[0]
sub = result[1]
mul = result[2]
print(value1+" + "+value2+" = "+add)
print(value1+" - "+value2+" = "+sub)
print(value1+" x "+value2+" = "+mul)
