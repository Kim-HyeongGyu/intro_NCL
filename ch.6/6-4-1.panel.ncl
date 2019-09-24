; filename : 6-4-1.panel.ncl

fin = addfile("../data/Tpl.2018.mon.nc","r")
tmp = fin->T(0::3,{1000},:,:) ; Jan/Apr/Jul/Oct 1000 hPa temperature
temp = tmp - 273.15           ; unit : K -> C
temp@units = "C"              ; Celcius
copy_VarCoords(tmp, temp)

plt = new(4, graphic)
season = (/ "Jan", "Apr", "Jul", "Oct"/)
wks = gsn_open_wks("x11","landsea")
gsn_define_colormap(wks, "wgne15")

res = True
res@gsnFrame = False
res@gsnDraw  = False

res@cnFillOn = True
res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels = ispan(-30, 35, 5)

res@mpGridAndLimbOn = True
res@mpGridLineDashPattern = 2
res@mpGridLineThicknessF  = 0.5

do i = 0, 3
    res@gsnLeftString =  "1000 hPa Temperature ("+season(i)+")"
    plt(i) = gsn_csm_contour_map(wks, temp(i,:,:), res)
end do

res_panel = True
row = 2
col = 2
gsn_panel(wks, plt, (/row,col/), res_panel)
; res_panel@gsnPanelRowSpec = True
; gsn_panel(wks, plt, (/1,2,1/), res_panel)

