; filename : 6-3-1.masking.ncl

f1  = addfile("../data/Tpl.2018.mon.nc","r")
tc  = f1->T(7,36,:,:)
lat = f1->lat
lon = f1->lon

tc  = tc-273.15
mtc = mask(tc, (tc.ge.20), True)
copy_VarCoords(tc,mtc)

wks = gsn_open_wks("x11","range_only")
gsn_define_colormap(wks,"cmp_b2r")
res = True
res@cnFillOn  = True
res@cnLinesOn = False

res@cnLevelSelectionMode = "ManualLevels"
res@cnMinLevelValF  = -10
res@cnMaxLevelValF  = 50
res@cnLevelSpacingF = 3

res@lbOrientation   = "vertical"
res@mpLandFillColor = "white"
res@tiMainString    = "Range Only"
res@gsnLeftString   = "Temperature (>= 20)"
res@gsnRightString  = "C"
plot = gsn_csm_contour_map(wks, mtc, res)
