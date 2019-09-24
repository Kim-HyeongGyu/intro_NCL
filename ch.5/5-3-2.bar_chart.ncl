; filename : 5-3-2.bar_chart.ncl

str	    = asciiread("../data/PRCP.txt",11,"string")
dum	    = str_split(str(1)," ")
seoul	= tofloat(dum(1:12))
dum	    = str_split(str(2)," ")
tokyo	= tofloat(dum(1:12))
dum	    = str_split(str(3)," ")
nyork	= tofloat(dum(1:12))
dum	    = str_split(str(7)," ")
paris	= tofloat(dum(1:12))
dum	    = str_split(str(10)," ")
shanghai= tofloat(dum(1:12))

x	= ispan(1,12,1)
wks = gsn_open_wks("x11","bar_plot2")
res = True
res@vpWidthF  = 0.7
res@vpHeightF = 0.4

res@gsnFrame  = False
res@gsnYRefLine	  = 0
res@gsnXYBarChart = True

res@trXMinF	= 0
res@trXMaxF	= 13
res@trYMinF	= 0
res@trYMaxF	= 430

res@tmXBMode   = "Explicit"
res@tmXBValues = x
res@tmXBLabels = x
res@tmXTOn     = False

res@gsnXYBarChartBarWidth = 0.15
res@gsnXYBarChartColors	  = "skyblue"

bres = res
bres@gsnLeftString  = "Precipitation Climatology"
bres@gsnRightString = "mm"
bres@tiXAxisString  = "Month"
bres@tiYAxisString  = "Precipitation"
plt = gsn_csm_xy(wks, x-0.30,    seoul, bres)

ares = res
ares@tmXBOn = False
ares@tmXTOn = False
ares@tmYLOn = False
ares@tmYROn = False
ares@tmXBBorderOn = False
ares@tmXTBorderOn = False
ares@tmYLBorderOn = False
ares@tmYRBorderOn = False
ares@gsnXYBarChartColors = "navy"
plt = gsn_csm_xy(wks, x-0.15,    tokyo, ares)

ares@gsnXYBarChartColors = "orange"
plt = gsn_csm_xy(wks, x     ,    nyork, ares)

ares@gsnXYBarChartColors = "red"
plt = gsn_csm_xy(wks, x+0.15,    paris, ares)

ares@gsnXYBarChartColors = "green"
plt = gsn_csm_xy(wks, x+0.30, shanghai, ares)

; add label
lbres = True
color = (/"skyblue", "navy", "orange", "red", "green"/)
label = (/"Seoul",  "Tokyo", "New York", "Paris", "shanghai"/)
lbres@vpWidthF  = 0.2
lbres@vpHeightF = 0.2
lbres@lbBoxMajorExtentF  = 0.5
lbres@lbFillColors       = color
lbres@lbMonoFillPattern  = True
lbres@lbLabelFontHeightF = 0.02
lbres@lbPerimOn          = False
gsn_labelbar_ndc(wks, 5, label, 0.22, 0.8, lbres)

frame(wks)
