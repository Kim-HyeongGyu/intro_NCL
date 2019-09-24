; filename : 5-2-5.xy_plot_label.ncl
    
x   = (/1,  2,  3,  4,  5/)
y1  = (/1,  4,  9, 16, 25/)
y2  = (/8, 10, 14, 16, 17/)

wks = gsn_open_wks("x11","xy_plot_label")
res = True
res@vpWidthF  = 0.7
res@vpHeightF = 0.3

res@trXMinF = 0
res@trXMaxF = 6
res@trYMinF = -5
res@trYMaxF = 30

res@tiMainString      = "XY plot example"
res@tiMainFontHeightF = 0.02
res@tiXAxisString     = "X axis"
res@tiYAxisString     = "Y axis"

res@xyLineThicknesses   = (/5,5/)
res@xyLineColors        = (/"red", "forestgreen"/)
res@xyDashPatterns      = (/0,0/)
res@xyMarkLineModes     = (/"MarkLines", "MarkLines"/)
res@xyMarkers           = (/4,16/)
res@xyMarkerSizes       = (/20,15/)
res@xyMarkerThicknesses = (/5,5/)
res@xyMarkerColors      = (/"red", "forestgreen"/)

res@tmXMajorGrid = True
res@tmYMajorGrid = True
res@tmXMajorGridThicknessF = 0.5
res@tmYMajorGridThicknessF = 0.5
res@tmXMajorGridLineDashPattern	= 2
res@tmYMajorGridLineDashPattern	= 2

res@pmLegendDisplayMode    = True
res@pmLegendSide           = "Top"
res@pmLegendParallelPosF   = 0.07
res@pmLegendOrthogonalPosF = -0.45
res@pmLegendWidthF         = 0.07
res@pmLegendHeightF        = 0.07
res@lgLabelFontHeightF     = 0.01
res@xyExplicitLegendLabels = (/"data 1","data 2"/)

plt  = gsn_csm_xy(wks, x, (/y1, y2/), res)

