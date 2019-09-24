; filename : 5-4-3.h_lat.ncl

f1 = addfile("../data/UVpl.2018.mon.nc","r")
u  = f1->U(0,:,:,{120})

wks = gsn_open_wks("x11","h_lat")
res = True
res@cnFillOn       = True
res@cnLineLabelsOn = True
res@cnFillPalette  = "temp_diff_18lev"

res@cnLevelSelectionMode = "ManualLevels"
res@cnMinLevelValF  = -50.
res@cnMaxLevelValF  =  50.
res@cnLevelSpacingF = 5.0
plt = gsn_csm_pres_hgt(wks, u, res)

res@cnFillOn = False
res@gsnContourZeroLineThicknessF = 3
res@gsnContourNegLineDashPattern = 1
plt = gsn_csm_pres_hgt(wks, u, res)
