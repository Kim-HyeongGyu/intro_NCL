; filename : run.ncl

external CALL "./call.so"

a = 1.
b = 4.
c = 4.
x1 = 0. ; defined data type :: Real
x2 = 0.

CALL::calc_quadratic(a, b, c, x1, x2)

print("Equation : "+a+"X**2 + "+b+"X + "+c+" = 0")
print("X1 = "+x1)
print("X2 = "+x2)
