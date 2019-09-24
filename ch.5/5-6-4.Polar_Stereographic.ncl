; filename : 5-6-4.Polar_Stereographic.ncl

fin = addfile("../data/Tpl.2018.mon.nc","r")
tmp = fin->T(0,{850},:,:)
tmp = tmp - 273.15
tmp@units = "C"

wks = gsn_open_wks("x11","polar")
res = True
res@tiMainString  = "Polar Stereographic"
res@cnFillOn      = True

res@mpProjection = "Stereographic"
res@mpLimitMode	 = "LatLon"
res@mpCenterLonF = 130
res@mpCenterLatF = 90
res@mpMaxLatF	 = 90
res@mpMinLatF	 = 10
plt	= gsn_csm_contour_map(wks, tmp, res)

; res@gsnPolar = "NH" ; North Hemisphere, "SH" : South Hemisphere
; plt = gsn_csm_contour_map_polar(wks, tmp, res)
