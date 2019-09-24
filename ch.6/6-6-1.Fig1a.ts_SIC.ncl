; filename : 6-6-1.Fig1a.ts_SIC.ncl

syr = 1979
eyr = 2012
tmon = (/11,12/)
nyrs = eyr - syr + 1
nmon = dimsizes(tmon)
year = ispan(syr, eyr, 1)

inf = addfile("../data/HadISST_ice.nc","r")
lat = inf->latitude
lon = inf->longitude
nlat = dimsizes(lat)
nlon = dimsizes(lon)
time = cd_calendar(inf->time,0)

sic = new((/nyrs, nmon, nlat, nlon/), "float")
do im = 0, nmon-1
    it = ind( (time(:,0).ge.syr) .and. \
              (time(:,0).le.eyr) .and. \
              (time(:,1).eq.tmon(im)) )
    sic(:,im,:,:) = inf->sic(it,:,:)
end do
sic = sic * 100
sic!0 = "time"
sic!1 = "mon"
sic!2 = "lat"
sic!3 = "lon"
sic&lat = lat
sic&lon = lon

Ssic = dim_avg_n_Wrap(sic, 1)

rad = 4.0*atan(1.0)/180.0
clat = cos(lat*rad)
clat!0	= "lat"
clat&lat = lat

bk_sic = wgt_areaave_Wrap(Ssic(:,{68.5:82.5},{15.5:110.5}), \ 
                          clat({68.5:82.5}), 1.0, 0)
ao_sic = wgt_areaave_Wrap(Ssic(:,{69.5:89.5},{:}), \
                          clat({69.5:89.5}), 1.0, 0)

; year which bk_sic < 50%
ind_sic50 = ind(bk_sic.lt.50.0)
bk_sic50 = bk_sic
bk_sic50 = bk_sic@_FillValue
bk_sic50(ind_sic50) = bk_sic(ind_sic50)

wks = gsn_open_wks("x11","Fig1a")
res = True
res@gsnFrame = False
res@gsnDraw = False

res@trYMinF = 20.0
res@trYMaxF = 90.0
res@trXMinF = syr - 0.5
res@trXMaxF = eyr + 0.5

res@gsnCenterString = "SIC time_series for ND"
res@gsnCenterStringFontHeightF = 0.018
res@tiYAxisString = "Sea-ice concentration (%)"
res@tiXAxisString = "Time (year)"
res@tiYAxisFontHeightF = 0.018
res@tiXAxisFontHeightF = 0.018

res@tmYROn = False
res@tmXTOn = False
res@tmYLMinorOn = False
res@tmXBMode = "Manual"
res@tmXBTickStartF = 1975
res@tmXBTickEndF = 2015
res@tmXBTickSpacingF = 5
res@tmXBMinorOn = False
res@tmYLLabelFontHeightF = 0.018
res@tmXBLabelFontHeightF = 0.018

res@gsnYRefLine = 50.
res@gsnYRefLineDashPattern = 2

res@xyMarkLineMode = "Lines"
res@xyLineColor = "black"
res@xyLineThicknessF = 3
res@xyDashPattern = 0
plot = gsn_csm_xy(wks, year, bk_sic, res)

res@xyDashPattern = 12
plot1 = gsn_csm_xy(wks, year, ao_sic, res)
overlay(plot,plot1)

; Legend
gres = True
gres@YPosPercent = 15.
gres@XPosPercent =  5.

lres = True
lres@lgLineColors = (/"black","black"/)
lres@lgDashIndexes = (/12,0/)
lres@lgLineThicknesses = res@xyLineThicknessF
lres@LineLengthPercent = 11.

tres = True
tres@lgLabels = (/"Arctic Ocean","Barents-Kara seas"/)
tres@lgLabelFontHeightF = 0.03
plot = simple_legend(wks, plot, gres, lres, tres)

; red dots
rds = True
rds@gsnFrame = False
rds@gsnDraw = False

rds@xyMarkLineMode = "Markers"
rds@xyMarker = 16
rds@xyMarkerColor = "red"
rds@xyMarkerSizeF = 0.015
plot2 = gsn_csm_xy(wks, year, bk_sic50, rds)
overlay(plot,plot2)

draw(plot)
frame(wks)
