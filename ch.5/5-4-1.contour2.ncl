; filename : 5-4-1.contour2.ncl

dat	= asciiread("../data/CONT.txt",(/51,51/),"float")
wks	= gsn_open_wks("x11","contour2")
res	= True

res@cnLevelSpacingF   = 4.
res@cnLineThicknessF  = 2
res@cnLineDashPattern = 0
res@cnLineColor       = "black"
res@cnLineLabelFontHeightF = 0.02
res@cnLineLabelFontColor   = "blue"
res@cnInfoLabelOn          = False
plt	= gsn_csm_contour(wks, dat, res)
