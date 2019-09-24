; filename : 5-4-2.contour.ncl

dat	= asciiread("../data/CONT.txt",(/51,51/),"float")
wks	= gsn_open_wks("x11","contour3")
res	= True
res@cnFillOn  = True
res@cnLinesOn = False
res@lbLabelStride = 2
res@lbBoxLinesOn  = False
res@lbOrientation = "vertical"
plt	= gsn_csm_contour(wks, dat, res)
