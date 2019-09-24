; filename : 5-2-2.log_pressure.ncl

dat = asciiread("../data/TMP.txt",(/37,3/),"float")
prs = dat(:,0)
equ = dat(:,1)
mid = dat(:,2)

wks = gsn_open_wks("x11","xy_logp")
res = True
res@tiXAxisString  = "Temperature"
res@tiYAxisString  = "Pressure"
res@gsnLeftString  = "Vertical temperature profile"
res@gsnRightString = "K"

res@xyLineThicknesses = (/5,5/) 
res@xyYStyle   = "Log"
res@trYReverse = True
res@trYMinF	   = 1

res@tmYLMode   = "Explicit"
res@tmYLValues = (/1000,500,200,100,50,20,10,5,2,1/)
res@tmYLLabels = res@tmYLValues 

plt = gsn_csm_xy(wks, (/equ, mid/), prs, res)
