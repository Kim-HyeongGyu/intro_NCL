; filename : 5-6-2.Cylindrical_Equidistant.ncl

fin = addfile("../data/Tpl.2018.mon.nc","r")
tmp = fin->T(0,{850},:,:)
tmp = tmp - 273.15
tmp@units = "C"

wks = gsn_open_wks("x11","latlon")
res = True
res@tiMainString  = "Cylindrical Equidistant"
res@cnFillOn      = True
res@lbOrientation = "vertical"

res@mpLimitMode = "LatLon"
res@mpMinLatF = 10
res@mpMaxLatF = 80
res@mpMinLonF = 80
res@mpMaxLonF = 180
plt = gsn_csm_contour_map(wks, tmp, res)
; plt = gsn_csm_contour_map_ce(wks, tmp, res)
