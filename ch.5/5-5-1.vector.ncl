; filename : 5-5-1.vector.ncl

f1	= addfile("../data/Upl.201501.mon.grib","r")
f2	= addfile("../data/Vpl.201501.mon.grib","r")
uu	= f1->U_GDS0_ISBL	; [lev, lat, lon]
vv	= f2->V_GDS0_ISBL	; [lev, lat, lon]

u5	= uu({850},{10:70:5},{90:160:5})
v5	= vv({850},{10:70:5},{90:160:5})

wks	= gsn_open_wks("x11","vector")
res	= True
res@vcRefLengthF	= 0.05
res@vcRefMagnitudeF	= 10
res@vcLineArrowThicknessF = 3

res@vcGlyphStyle = "LineArrow"
; res@vcLineArrowColor   = "Blue"
; res@vcRefAnnoFontColor = "Blue"

; res@vcGlyphStyle = "WindBarb"
; res@vcGlyphStyle = "CurlyVector"
plt	= gsn_csm_vector(wks, u5, v5, res)
