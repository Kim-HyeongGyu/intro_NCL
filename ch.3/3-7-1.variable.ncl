; filename : 3-7-1.variable.ncl

dum = 0     ; Global variable
print(dum)

undef("foo")
procedure foo()
local dum   ; Local variable
begin
    dum = "Local variable"
    print(dum)
end

foo()

