; filename : 6-6-4.Fig2c.composite_PCH.ncl

load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/time_axis_labels.ncl"

inf	= addfile("../data/PCH_ano_composite.nc","r")
lev	= inf->lev
	
com_pch = inf->pch
com_pch!0 = "time"
com_pch!1 = "lev"
com_pch&time = ispan(1,151,1)
com_pch&lev = lev

wks = gsn_open_wks("x11","Fig2c")
gsn_define_colormap(wks,"BlueDarkRed18")

res = True
res@gsnFrame = False
res@gsnDraw = False
res@gsnSpreadColors = True

res@vpHeightF = 0.20
res@vpWidthF = 0.78
res@vpXF = 0.12

res@tmXTOn = False
res@tmYROn = False

res@cnFillOn = True
res@cnLinesOn = False
res@cnLineLabelsOn = False
res@cnLevelSelectionMode = "ExplicitLevels"
res@cnLevels = (/-0.9, -0.75, -0.6, -0.45, -0.3, -0.15, \ 
                 0.15,   0.3, 0.45,   0.6, 0.75,   0.9, 1.05, 1.2/)
res@cnFillColors = (/ 5,  6,  7,  8,  9, 10,  0, \
                     11, 12, 13, 14, 15, 16, 17, 18, 19/)
res@lbLabelBarOn = True
res@lbOrientation = "Vertical"
res@lbLabelFontHeightF = 0.010
res@pmLabelBarOrthogonalPosF = 0.005
res@pmLabelBarWidthF = 0.05
res@pmLabelBarHeightF = 0.20

res@tmYLMode = "Explicit"
res@tmYLValues = (/10, 20, 50, 100, 200, 500, 1000/)
res@tmYLLabels = res@tmYLValues

res@tmXBMode = "Explicit"
res@tmXBValues = (/1, 16, 32, 47, 63, 78, 91, 106, 122, 137/)
res@tmXBLabels = (/"1NOV", "16NOV",  "1DEC", "16DEC",  "1JAN", \
                  "16JAN",  "1FEB", "16FEB",  "1MAR", "16MAR"/)
res@tiYAxisString = "Pressure (hPa)"
res@tiXAxisString = "Time (day)"
res@tiYAxisFontHeightF = 0.015
res@tiXAxisFontHeightF = 0.015

res@gsnCenterString = "~F33~D~F25~PCH, composite"
res@gsnCenterStringFontHeightF = 0.016

res2 = True
res2@gsnFrame = False
res2@gsnDraw = False

res2@cnFillOn = False
res2@cnLinesOn = True
res2@cnInfoLabelOn = False
res2@cnLevelSelectionMode = "ExplicitLevels"
res2@cnLevels = (/-1.2,-0.9,-0.6,-0.3,0.3,0.6,0.9,1.2,1.5,1.8/)
res2@cnLineLabelFontHeightF = 0.007
res2@cnLineLabelInterval = 1
res2@gsnContourNegLineDashPattern = 1

plot  = gsn_csm_pres_hgt(wks, com_pch(lev|:,time|:), res)
plot1 = gsn_csm_pres_hgt(wks, com_pch(lev|:,time|:), res2)

;; delete YR from plot
getvalues plot@contour
    "pmAnnoManagers"        : am_ids
end getvalues

index = ind(NhlName(am_ids).eq."right_axis")
if ( .not. ismissing(index) ) then
    NhlRemoveAnnotation(plot@contour, am_ids(index))
end if

;; delete YR from plot2
getvalues plot1@contour
    "pmAnnoManagers"        : am_ids1
end getvalues

index1 = ind(NhlName(am_ids1).eq."right_axis")
if ( .not. ismissing(index1) ) then
    NhlRemoveAnnotation(plot1@contour, am_ids1(index1))
end if

overlay(plot,plot1)

draw(plot)
frame(wks)
