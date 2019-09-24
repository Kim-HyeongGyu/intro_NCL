; filename : appendixD1.ncl
; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

color1 = "grads_rainbow"
color2 = "CBR_wet"

wks = gsn_open_wks("x11", "colormap")
gsn_define_colormap(wks, color1)
; gsn_reverse_colormap(wks)
; gsn_merge_colormaps(wks, color1, color2)
gsn_draw_colormap(wks)
