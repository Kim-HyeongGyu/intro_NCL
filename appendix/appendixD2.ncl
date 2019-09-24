; filename : appendixD2.ncl

;      (/ R,  G,  B /)
cm = (/(/256,256,256/), \  ; foreground color
       (/  0,  0,  0/), \  ; background color
       (/158,  1, 66/), \
       (/213, 62, 79/), \
       (/244,109, 67/), \
       (/253,174, 97/), \
       (/254,224,139/), \
       (/255,255,191/), \
       (/230,245,152/), \
       (/171,221,164/), \
       (/102,194,165/), \
       (/ 50,136,189/), \
       (/ 94, 79,162/) /)

cmap = cm/256.

wks = gsn_open_wks("x11","colormap")
gsn_define_colormap(wks,cmap)
gsn_draw_colormap(wks)
