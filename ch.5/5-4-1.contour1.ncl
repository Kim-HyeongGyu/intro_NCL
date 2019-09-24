; filename : 5-4-1.contour1.ncl

dat	= asciiread("../data/CONT.txt",(/51,51/),"float")
wks	= gsn_open_wks("x11","contour1")
res	= True
res@cnLevelSelectionMode = "ManualLevels"
res@cnLevelSpacingF = 4.
res@cnMinLevelValF  = 0.
res@cnMaxLevelValF  = 20.
plt	= gsn_csm_contour(wks, dat, res)
