; filename : 5-5-2.streamline.ncl

f1  = addfile("../data/UVpl.2018.mon.nc","r")
u   = f1->U(0,{850},:,:)
v   = f1->V(0,{850},:,:)
 
wks = gsn_open_wks("x11","streamline")
res = True
res@vpWidthF  = 0.7
res@vpHeightF = 0.4
res@tiMainString = "Streamline example"

res@stMinArrowSpacingF = 0.2         
res@stArrowLengthF     = 0.005       
res@stLineThicknessF   = 1.5         
res@stLineColor        = "blue"  
plot = gsn_csm_streamline(wks, u, v, res)

