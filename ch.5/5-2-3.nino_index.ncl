; filename : 5-2-3.nino_index.ncl

sst  = asciiread("../data/ONI.txt",(/792,3/),"float")
date = sst(:,0) + sst(:,1)/12.
enso = sst(:,2)

wks  = gsn_open_wks("x11","xy_plot2")
res  = True
res@vpHeightF = 0.3
res@vpWidthF  = 0.7

res@tiMainString      = "ENSO (Nino 3.4)"
res@tiMainFontHeightF = 0.025
res@tiXAxisString     = "Year"
res@tiYAxisString     = "Nino 3.4"

res@gsnYRefLine		  = 0.0
res@gsnAboveYRefLineColor = "red"
res@gsnBelowYRefLineColor = "Blue"

plt = gsn_csm_xy(wks, date(500:), enso(500:), res)
