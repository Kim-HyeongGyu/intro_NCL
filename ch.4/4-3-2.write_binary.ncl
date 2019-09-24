; filename : 4-3-2.write_binary.ncl

; Read GrADS binary data
U = fbindirread("../data/Upl.201501.gdat", 0, (/8, 181, 360/), "float")
V = fbindirread("../data/Vpl.201501.gdat", 0, (/8, 181, 360/), "float")

printVarSummary(U)
printMinMax(U, False)
wsp = sqrt(U^2 + V^2)             ; Calculate wind speed

outfile = "WSP.201501.gdat"       ; Output file name
if (isfilepresent(outfile)) then  ; If file exist, delete file
    system("rm -rf "+outfile)
end if

fbindirwrite(outfile, wsp)        ; Make binary file


