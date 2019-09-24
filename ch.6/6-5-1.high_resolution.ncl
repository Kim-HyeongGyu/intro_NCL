; filename : 6-5-1.high_resolution.ncl

wks = gsn_open_wks("x11", "map_example")
res = True
res@mpOutlineOn = True
; res@mpDataBaseVersion = "Ncarg4_0"    ; Low resolution
; res@mpDataBaseVersion = "Ncarg4_1"    ; Medium resolution
; res@mpDataBaseVersion = "RANGS_GSHHS" ; High resolution

; res@mpDataBaseVersion = "LowRes"      ; Low resolution   
; res@mpDataBaseVersion = "MediumRes"   ; Medium resolution
res@mpDataBaseVersion  = "HighRes"      ; High resolution  

res@gsnMaximize = True
res@mpMaxLatF = 45
res@mpMinLatF = 30
res@mpMinLonF = 120
res@mpMaxLonF = 135
plot = gsn_csm_map(wks, res)
