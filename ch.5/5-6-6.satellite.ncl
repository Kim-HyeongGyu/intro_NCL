; filename : 5-6-6.satellite.ncl

fin = addfile("../data/Tpl.2018.mon.nc","r")
tmp = fin->T(0,{850},:,:) ; Jan / 850 hPa / Temperature
tmp = tmp - 273.15
tmp@units = "C"

wks = gsn_open_wks("x11","satellite")
res	= True
res@tiMainString = "Satellite"

res@mpProjection = "Satellite"
res@mpCenterLatF = 40.
res@mpCenterLonF = 130.
res@mpFillColors = (/"white", "deepskyblue", \
                     "lightyellow", "lightskyblue"/)
res@mpGridAndLimbOn	= True
res@mpGridLineDashPattern = 2
res@mpGridLineThicknessF  = 0.5
res@cnInfoLabelOn = False
res@mpPerimOn	  = False
plt = gsn_csm_contour_map(wks, tmp, res)
