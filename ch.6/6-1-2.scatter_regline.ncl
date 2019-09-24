; filename : 6-1-2.scatter_regline.ncl

sst = asciiread("../data/ONI.txt",(/792,3/),"float")
soi	= asciiread("../data/SOI.txt",(/792,3/),"float")
x	= sst(:,2)
y	= soi(:,2)

rc = regline(x,y)
print(rc)
yReg = rc*x + rc@yintercept   

wks = gsn_open_wks("x11","scatter_regline")
res	= True
res@gsnFrame  = False

res@trXMinF = -3
res@trXMaxF = 3
res@trYMinF = -3
res@trYMaxF = 3

res@tiMainString      = "Scatter plot with regression"
res@tiMainFontHeightF = 0.025
res@tiXAxisString     = "Nino 3.4"
res@tiYAxisString     = "Southern Oscillation"

res@xyMarkLineModes	= "Markers"
res@xyMarkerColors  = "purple"
res@xyMarkerSizes   = 10
res@xyMarkers 		= 3
res@xyMarkerThicknesses = 2

res@tmXMajorGrid = True
res@tmYMajorGrid = True
res@tmXMajorGridLineDashPattern = 2
res@tmYMajorGridLineDashPattern = 7
res@tmXMajorGridThicknessF = 0.3
res@tmYMajorGridThicknessF = 0.3
plt = gsn_csm_xy(wks, x, y, res)

lnres = True
lnres@gsLineThicknessF = 4
gsn_polyline(wks, plt, x, yReg, lnres)
frame(wks)
