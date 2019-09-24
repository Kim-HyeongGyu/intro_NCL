; filename : 7-5-2.pi.ncl

pi  = 4 * atan(1)
x   = fspan(-20,20,41) / (2*pi)
y   = sin(x)

wks = gsn_open_wks("x11", "pi")
res = True
res@gsnYRefLine  = 0.0
res@tmXBMode     = "Explicit"
res@tmXBValues   = (/-pi, 0, pi/)
res@tmXBLabels   = (/"-~F33~p", "0", "~F33~p"/)
res@tiMainString = "Sine function"
plot = gsn_csm_xy(wks, x, y, res)
