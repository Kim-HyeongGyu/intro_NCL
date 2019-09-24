; filename : 5-5-1.vector_map.ncl

f1	= addfile("../data/Upl.201501.mon.grib","r")
f2	= addfile("../data/Vpl.201501.mon.grib","r")
uu	= f1->U_GDS0_ISBL	; [lev, lat, lon]
vv	= f2->V_GDS0_ISBL	; [lev, lat, lon]

u500	= uu({500},{::20},{::20})
v500	= vv({500},{::20},{::20})

wks	= gsn_open_wks("x11","vector")
res	= True
res@vcRefLengthF      = 0.03
res@vcRefMagnitudeF   = 10
res@vcLineArrowThicknessF = 3
res@vcLineArrowColor  = "Blue"
res@vcRefAnnoFontColor= "Blue"
res@vcGlyphStyle      = "CurlyVector"

; res@gsnAddCyclic = False
; res@mpMinLatF = 10
; res@mpMaxLatF = 70
; res@mpMinLonF = 90
; res@mpMaxLonF = 160
plt	= gsn_csm_vector_map(wks, u500, v500, res)
