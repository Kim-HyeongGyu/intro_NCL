; filename : 5-5-3.contour_jet.ncl

f = addfile("../data/UVpl.2018.mon.nc","r")
u = f->U(0,{200},:,:)
v = f->V(0,{200},:,:)

wspd = wind_speed(u,v)

wks = gsn_open_wks("x11","vector_jet")
res = True
res@gsnLeftString = "Jet Stream"
res@gsnRightString = "> 25m/s"
res@mpCenterLonF = 180

res@cnFillOn = True
res@cnLinesOn = False
res@cnLevelSelectionMode = "ManualLevels"
res@cnMinLevelValF = 25
res@cnMaxLevelValF = 80
res@cnLevelSpacingF = 5
res@cnFillPalette = "WhiteBlueGreenYellowRed"

plot = gsn_csm_contour_map(wks,wspd,res)

