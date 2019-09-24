; filename : 5-2-4.xy_scatter.ncl

sst = asciiread("../data/ONI.txt",(/792,3/),"float")
soi	= asciiread("../data/SOI.txt",(/792,3/),"float")
x   = sst(:,2)
y   = soi(:,2)

wks = gsn_open_wks("x11","xy_scatter")
res = True
res@trXMinF	= -3
res@trXMaxF	= 3
res@trYMinF	= -3
res@trYMaxF	= 3

res@tiMainString      = "Scatter plot example"
res@tiMainFontHeightF = 0.025
res@tiXAxisString	  = "Nino 3.4"
res@tiYAxisString	  = "Southern Oscillation"

res@xyMarkLineModes	= "Markers"
res@xyMarkerColors  = "purple"
res@xyMarkerSizes   = 10
res@xyMarkers 		= 3
res@xyMarkerThicknesses = 2

res@tmXMajorGrid = True
res@tmYMajorGrid = True
res@tmXMajorGridLineDashPattern	= 2
res@tmYMajorGridLineDashPattern	= 7
res@tmXMajorGridThicknessF = 0.3
res@tmYMajorGridThicknessF = 0.3

plt = gsn_csm_xy(wks, x, y, res)
