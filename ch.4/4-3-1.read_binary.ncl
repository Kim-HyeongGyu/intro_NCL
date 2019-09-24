; filename : 4-3-1.read_binary.ncl

; Read GrADS binary data
U = fbindirread("../data/Upl.201501.gdat", 0, (/8, 181, 360/), "float")
V = fbindirread("../data/Vpl.201501.gdat", 0, (/8, 181, 360/), "float")

printVarSummary(U)
printMinMax(U, False)

