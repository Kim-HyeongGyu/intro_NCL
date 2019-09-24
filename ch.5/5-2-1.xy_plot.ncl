; filename : 5-2-1.xy_plot.ncl

x   = (/1,  2,  3,  4,  5/)
y1  = (/1,  4,  9, 16, 25/)
y2  = (/8, 10, 14, 16, 17/)

wks = gsn_open_wks("x11","xy_plot1")
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

plt = gsn_csm_xy(wks, x, (/y1, y2/), res)
