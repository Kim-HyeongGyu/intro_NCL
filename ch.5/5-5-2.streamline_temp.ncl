; filename : 5-5-2.streamline_temp.ncl

f1 = addfile("../data/UVpl.2018.mon.nc","r")
f2 = addfile("../data/Tpl.2018.mon.nc","r")
u  = f1->U(0,{850},:,:)
v  = f1->V(0,{850},:,:)
t  = f2->T(0,{850},:,:)

t  = t-273.15   ; Change unit : Kelvin -> Celcius

wks = gsn_open_wks("x11","streamline2")
gsn_define_colormap(wks,"cmp_b2r")

res = True
res@gsnLeftString  = "Wind & Temperature"
res@gsnRightString = "m/s, C"

res@stMinArrowSpacingF = 0.2     
res@stArrowLengthF     = 0.005     
res@stLineThicknessF   = 1.5        
; res@stLineColor        = "blue"      
plot = gsn_csm_streamline_scalar_map(wks, u, v, t, res)

