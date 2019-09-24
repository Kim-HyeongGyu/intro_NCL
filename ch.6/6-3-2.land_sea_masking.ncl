; filename : 6-3-2.land_sea_masking.ncl

fin = addfile("../data/Tpl.2018.mon.nc","r")
tmp = fin->T(0,{1000},:,:) ; temperautre
tmp = tmp - 273.15

; 0=Ocean, 1=Land, 2=Lake, 3=Small Island, 4=Ice Shelf
a    = addfile("../data/landsea.nc","r")
lsdata = a->LSMASK
lsm  = landsea_mask(lsdata,tmp&lat,tmp&lon)
tmp_ocean = mask(tmp, lsm.eq.0, True)
tmp_land  = mask(tmp, lsm.eq.1, True)
copy_VarCoords(tmp, tmp_ocean)
copy_VarCoords(tmp, tmp_land)

wks = gsn_open_wks("x11","landsea")
res	= True
res@cnFillOn = True
res@mpGridAndLimbOn	= True
res@mpGridLineDashPattern = 2
res@mpGridLineThicknessF  = 0.5
res@gsnLeftString  = "Temperature (1000 hPa)"
res@gsnRightString = "C"
plt = gsn_csm_contour_map(wks, tmp_ocean, res)
plt = gsn_csm_contour_map(wks, tmp_land, res)
