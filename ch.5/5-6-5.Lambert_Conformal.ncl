; filename : 5-6-5.Lambert_Conformal.ncl

fin = addfile("../data/Tpl.2018.mon.nc","r")
tmp = fin->T(0,{850},:,:) ; Jan / 850 hPa / Temperature
tmp = tmp - 273.15
tmp@units = "C"

wks = gsn_open_wks("x11","lambert_conformal")
res	= True
res@tiMainString  = "Lambert Conformal"
res@cnFillOn      = True
res@lbOrientation = "vertical"

res@mpProjection  = "LambertConformal"
res@mpLambertParallel1F	= 30.
res@mpLambertParallel2F	= 60.
res@mpLambertMeridianF	= 120.

res@mpLimitMode	= "Corners"
res@mpLeftCornerLatF  = 5
res@mpLeftCornerLonF  = 80
res@mpRightCornerLatF = 40
res@mpRightCornerLonF = 220

;[Grid line]
res@mpGridAndLimbOn	= True
res@mpGridLineDashPattern = 2
res@mpGridLineThicknessF  = 0.5
res@pmTickMarkDisplayMode = "Always"
plt	= gsn_csm_contour_map(wks, tmp, res)
