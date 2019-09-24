; filename : 3-1.script.ncl

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "../appendix/convTunit.ncl"

f   = addfile("../data/sst.nc", "r")

sst = f->sst

wks = gsn_open_wks("x11", "plot_6_step")

res = True
res@cnFillOn = True
res@cnFillPalette = "BlueWhiteOrangeRed"
res@tiMainString  = "NCL plot in 6 step"

plt = gsn_csm_contour_map(wks, sst, res) 
