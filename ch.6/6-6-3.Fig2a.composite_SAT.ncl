; filename : 6-6-3.Fig2a.composite_SAT.ncl

syr = 1979
eyr = 2012
tmon = (/11,12/)
nyrs = eyr - syr + 1
nmon = dimsizes(tmon)

tyear = (/1984, 1996, 2000, 2001, 2005, 2006, \
          2007, 2008, 2009, 2011, 2012/)

inf = addfile("../data/ERAinterim_t2m_mon.nc", "r")
lat = inf->latitude
lon = inf->longitude
nlat = dimsizes(lat)
nlon = dimsizes(lon)
time = cd_calendar(inf->time,0)

sat = new((/nyrs,nmon,nlat,nlon/),"float")
do im = 0, nmon-1
    it = ind( (time(:,0).ge.syr) .and. \
              (time(:,0).le.eyr) .and. \
              (time(:,1).eq.tmon(im)) )
    sat(:,im,:,:) = inf->t2m(it,:,:)
end do 

sat!0 = "time"
sat!1 = "mon"
sat!2 = "lat"
sat!3 = "lon"
sat&time = ispan(syr, eyr, 1)
sat&lat = lat
sat&lon = lon

Ssat = dim_avg_n_Wrap(sat, 1)

clim = dim_avg_n_Wrap(Ssat, 0)
Ssat_ano = Ssat - conform(Ssat, clim, (/1,2/))
copy_VarCoords(Ssat, Ssat_ano)

idx_tyr = get1Dindex(Ssat_ano&time, tyear)
sat_comp = dim_avg_n_Wrap(Ssat_ano(idx_tyr,:,:), 0)

wks = gsn_open_wks("x11","Fig2a")
gsn_define_colormap(wks,"BlueDarkRed18")

res = True
res@gsnFrame = True
res@gsnDraw = True

res@gsnPolar = "NH"
res@gsnPolarLabelSpacing = 30.

res@mpPerimOn = True
res@mpFillOn = False
res@mpOutlineOn = True
res@mpCenterLonF = 180.
res@mpMinLatF = 30.
res@mpMaxLatF = 90.
res@mpGridLatSpacingF = 10.

res@cnFillOn = True
res@cnLinesOn = False
res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels = (/-1.5, -1.2, -0.9, -0.6, -0.3, \
                  0.3,  0.6,  0.9,  1.2,  1.5, 1.8, 2.1, 2.4, 2.7/)
res@cnFillColors = (/ 6,  7,  8,  9, 10,  0,   \
                     11, 12, 13, 14, 15, 16, 17, 18, 19/)

res@gsnCenterString = "~F33~D~F25~SAT for ND. composite"
res@gsnCenterStringFontHeightF = 0.018

res@lbTitleOn = True
res@lbOrientation = "Vertical"
res@lbTitleString = "      (~S~o~N~C)"
res@lbTitlePosition = "Top"
res@lbTitleOffsetF = 0.01
res@lbTitleExtentF = 0.02
res@lbTitleFontHeightF = 0.013
res@pmLabelBarOrthogonalPosF = 0.10
res@pmLabelBarParallelPosF = 0.5
res@pmLabelBarWidthF = 0.1
res@pmLabelBarHeightF = 0.7

res2 = True
res2@cnFillOn = False
res2@cnLinesOn = True
res2@cnInfoLabelOn = False
res2@cnLevelSelectionMode = "ManualLevels"
res2@cnMinLevelValF = -4.2
res2@cnMaxLevelValF =  4.2
res2@cnLevelSpacingF = 0.6
res2@gsnContourNegLineDashPattern = 1
plot = gsn_csm_contour_map_overlay(wks,sat_comp,sat_comp,res,res2)
