; filename : 6-2-1.overlay.ncl

f1	= addfile("../data/Upl.201501.mon.grib","r")
f2	= addfile("../data/Vpl.201501.mon.grib","r")
f3	= addfile("../data/Zpl.201501.mon.grib","r")
uu	= f1->U_GDS0_ISBL	; [lev, lat, lon]
vv	= f2->V_GDS0_ISBL	; [lev, lat, lon]
zz	= f3->Z_GDS0_ISBL	; [lev, lat, lon]

z	= zz / 9.8    ; geopotential -> geopotential height
copy_VarCoords(zz, z)

u	= uu({850},{10:70:5},{90:160:5})
v	= vv({850},{10:70:5},{90:160:5})
z  :=  z({850},:,:)

wks	= gsn_open_wks("x11","overlay")
res = True
res@gsnFrame = False
res@gsnDraw  = False

vres = res
vres@vcGlyphStyle = "CurlyVector"
vres@vcLineArrowColor = "Blue"
vres@vcLineArrowThicknessF = 3

vres@vcRefLengthF     = 0.05
vres@vcRefMagnitudeF  = 10
vres@vcRefAnnoFontColor	= "Blue"
plt1 = gsn_csm_vector(wks, u, v, vres)

cres = res	
cres@cnFillOn  = True
cres@cnLinesOn = False

cres@mpMinLatF = 00
cres@mpMaxLatF = 80
cres@mpMinLonF = 80
cres@mpMaxLonF = 170
plt2 = gsn_csm_contour_map(wks, z, cres)

overlay(plt2, plt1)	; add plt1 to plt2
draw(plt2)
frame(wks)
