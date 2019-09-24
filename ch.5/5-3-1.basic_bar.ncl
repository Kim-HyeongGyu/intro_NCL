; filename : 5-3-1.basic_bar.ncl

x     = (/1, 2, 3,  4,  5,  6/)
y     = (/1, 4, 9, 16, 25, 36/)
color = (/"SkyBlue", "Blue", "Navy", "Green", "orange", "red"/)

wks = gsn_open_wks("x11","bar_plot1")
res = True
res@vpHeightF = 0.3
res@vpWidthF  = 0.7

res@tiMainString  = "Bar chart exmaple"
res@tiXAxisString = "Category"
res@tiYAxisString = "Value"

res@gsnYRefLine	  = 0
res@gsnXYBarChart = True
res@gsnXYBarChartColors	  = color
res@gsnXYBarChartBarWidth = 0.7

; remove tick mark and axis
res@tmXBOn       = False ; X Bottom
res@tmXTOn       = False ; X top
res@tmYROn       = False ; Y Right
res@tmXTBorderOn = False
res@tmYRBorderOn = False

plt = gsn_csm_xy(wks, x, y, res)
