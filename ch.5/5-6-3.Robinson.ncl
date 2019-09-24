; filename : 5-6-3.Robinson.ncl

fin = addfile("../data/Tpl.2018.mon.nc","r")
tmp = fin->T(0,{850},:,:)
tmp = tmp - 273.15
tmp@units = "C"

wks = gsn_open_wks("x11","robinson")
res = True
res@tiMainString  = "Robinson"
res@cnFillOn      = True
res@lbOrientation = "vertical"

res@mpProjection = "Robinson"
res@mpPerimOn	 = False
res@cnFillOn	 = True
plt = gsn_csm_contour_map(wks, tmp, res)
