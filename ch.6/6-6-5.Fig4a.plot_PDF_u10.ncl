; filename : 6-6-5.Fig4a.plot_PDF_u10.ncl

inf1 = addfile("../data/zm_u10_total_latewinter.nc","r")
inf2 = addfile("../data/zm_u10_BKsic_latewinter.nc","r")
u10_tot = inf1->zm_u10
u10_bks = inf2->zm_u10

u10_tot_1d = ndtooned(u10_tot)
u10_bks_1d = ndtooned(u10_bks)

bins = fspan(min(u10_bks),max(u10_bks),24)
nbins = dimsizes(bins)+1

binres = True
binres@bin_min = min(u10_bks)
binres@bin_max = max(u10_bks)
binres@v510 = True

pdf_tot = pdfx(u10_tot, nbins, binres)
pdf_bks = pdfx(u10_bks, nbins, binres)

run_pdf_tot = runave(pdf_tot, 5, 0)
run_pdf_bks = runave(pdf_bks, 5, 0)

wks = gsn_open_wks("x11","Fig4a")
res = True
res@gsnFrame = False
res@gsnDraw = False

res@vpHeightF = 0.4
res@vpWidthF = 0.7

res@trYMinF = 0.0
res@trYMaxF = 0.14
res@trXMinF = -40.0
res@trXMaxF =  80.0

res@tmYLMode = "Manual"
res@tmYLTickSpacingF = 0.02
res@tmYLMinorPerMajor = 4
res@tmYLLabelFontHeightF = 0.016
res@tmYLMajorOutwardLengthF = -0.01
res@tmYLMajorLengthF = -0.01
res@tmYLMinorOutwardLengthF = -0.005
res@tmYLMinorLengthF = -0.005
res@tmXBMode = "Manual"
res@tmXBTickSpacingF = 20
res@tmXBMinorPerMajor = 3
res@tmXBLabelFontHeightF = 0.016
res@tmXBMajorOutwardLengthF = -0.01
res@tmXBMajorLengthF = -0.01
res@tmXBMinorOutwardLengthF = -0.005
res@tmXBMinorLengthF = -0.005

res@tiYAxisString = "Density"
res@tiXAxisString = "U (ms~S~-1~N~)"
res@tiYAxisFontHeightF = 0.016
res@tiXAxisFontHeightF = 0.016

res@xyMonoDashPattern = True

res@gsnXYBarChart = True
res@gsnXYBarChartOutlineOnly = False
res@gsnXYBarChartFillOpacityF = 0.5

res@gsnCenterString = "PDF of 10hPa zonal wind"
res@gsnCenterStringFontHeightF = 0.018

res@xyLineColor = "darkorange1"
res@gsnXYBarChartColors = "olivedrab4"
plot = gsn_csm_xy(wks, pdf_bks@bin_center, pdf_bks, res)
res@gsnXYBarChartColors = "yellow"
plot1 = gsn_csm_xy(wks, pdf_tot@bin_center, pdf_tot, res)
overlay(plot,plot1)

res2 = res 
res2@gsnXYBarChart = False
res2@xyLineThicknessF = 3.0
res2@xyLineColor = "darkgreen"
plot2 = gsn_csm_xy(wks, pdf_bks@bin_center, run_pdf_bks, res2)
res2@xyLineColor = "goldenrod1"
plot3 = gsn_csm_xy(wks, pdf_tot@bin_center, run_pdf_tot, res2)
overlay(plot, plot2)
overlay(plot, plot3)

;; barchart's legend
lbres = True
lbres@vpWidthF = 0.15
lbres@vpHeightF = 0.07
lbres@lbBoxLinesOn = False
lbres@lbBoxMajorExtentF = 0.35  ; box-height
lbres@lbBoxMinorExtentF = 0.10  ; box-width
lbres@lbFillColors = (/"olivedrab4","yellow"/)
lbres@lbMonoFillPattern = True
lbres@lbLabelFontHeightF = 0.015
lbres@lbLabelJust = "CenterLeft"
lbres@lbPerimOn = False
lbres@lbPerimColor = "white"
labels = (/"B/K SIC<50%","Total"/)
gsn_labelbar_ndc(wks, dimsizes(labels), labels, 0.7, 0.78, lbres)

draw(plot)
frame(wks)
