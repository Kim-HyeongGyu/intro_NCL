; filename : 6-6-2.Fig1b.composite_SIC.ncl

syr = 1979
eyr = 2012
tmon = (/11,12/)
nyrs = eyr - syr + 1
nmon = dimsizes(tmon)

tyear = (/1984, 1996, 2000, 2001, 2005, 2006, \
          2007, 2008, 2009, 2011, 2012/)

inf = addfile("../data/HadISST_ice.nc", "r")
lat = inf->latitude
lon = inf->longitude
nlat = dimsizes(lat)
nlon = dimsizes(lon)
time = cd_calendar(inf->time, 0)

sic = new((/nyrs,nmon,nlat,nlon/),"float")
do im = 0, nmon-1
    it = ind( (time(:,0).ge.syr) .and. \
              (time(:,0).le.eyr) .and. \
              (time(:,1).eq.tmon(im)) )
    sic(:,im,:,:) = inf->sic(it,:,:)
end do
sic = sic * 100    ; change unit to %
sic!0 = "time"
sic!1 = "mon"
sic!2 = "lat"
sic!3 = "lon"
sic&time = ispan(syr, eyr, 1)
sic&lat = lat
sic&lon = lon

; 2.seasonal mean
Ssic = dim_avg_n_Wrap(sic, 1)

; 3.Anomaly
clim = dim_avg_n_Wrap(Ssic, 0)
Ssic_ano = Ssic - conform(Ssic, clim, (/1,2/))
copy_VarCoords(Ssic, Ssic_ano)

; 4.Composite
idx_tyr = get1Dindex(Ssic_ano&time, tyear)
sic_comp = dim_avg_n_Wrap(Ssic_ano(idx_tyr,:,:), 0)

; 5.Hatch domain
hatch = sic_comp
hatch = sic_comp@_FillValue
hatch({68.5:82.5},{15.5:110.5}) = sic_comp({68.5:82.5},{15.5:110.5})

; 6.Plot
wks = gsn_open_wks("x11","Fig1b")
gsn_define_colormap(wks,"BlueDarkRed18")

res = True
; res@gsnDraw = False
; res@gsnFrame = False
res@gsnAddCyclic = True

res@gsnPolar = "NH"
res@gsnPolarLabelSpacing = 30.

res@mpPerimOn = True
res@mpFillOn = False
res@mpOutlineOn = True
res@mpCenterLonF = 180.
res@mpMinLatF = 60.
res@mpMaxLatF = 90.
res@mpGridLatSpacingF = 10.

res@cnFillOn = True
res@cnLinesOn = False
res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels = (/-36,-32,-28,-24,-20,-16,-12,-8,-4,4/)
res@cnFillColors = (/2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 11/)

res@gsnCenterString = "SIC for ND"
res@gsnCenterStringFontHeightF = 0.018

res@lbTitleOn = True
res@lbTitleString = "(%)"
res@lbTitlePosition = "bottom"
res@lbTitleFontHeightF = 0.013
res@pmLabelBarOrthogonalPosF = 0.013
res@pmLabelBarWidthF = 0.7
res@pmLabelBarHeightF = 0.1

res2 = True
; res2@gsnDraw = False
; res2@gsnFrame = False

; res2@lbLabelBarOn = False
res2@cnLinesOn = False
res2@cnFillOn = True
res2@cnInfoLabelOn = False
res2@cnMonoFillPattern = True
res2@cnFillPattern = 5
res2@cnMonoFillColor = True
res2@cnFillColor = "black"

plot = gsn_csm_contour_map_overlay(wks,sic_comp,hatch,res,res2)
; plot = gsn_csm_contour_map(wks, sic_comp, res)
; plot1 = gsn_csm_contour(wks, hatch, res2)

; overlay(plot, plot1)

; draw(plot)
; frame(wks)
