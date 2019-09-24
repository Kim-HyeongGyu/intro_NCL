; filename : 6-5-2.shapefile.ncl

dir       = "../data/gadm/"
filenames = "gadm36_KOR_" + ispan(0,2,1) + ".shp"
nfiles    = dimsizes(filenames)

wks = gsn_open_wks("x11","shapefiles")
res               = True
res@gsnMaximize   = True
res@gsnDraw       = False
res@gsnFrame      = False

res@mpOutlineOn   = False   ; Use outlines from shapefile
res@mpFillOn      = False
res@mpLimitMode   = "LatLon"
res@mpMinLatF     = 32
res@mpMaxLatF     = 40
res@mpMinLonF     = 124
res@mpMaxLonF     = 132

res@pmTickMarkDisplayMode = "Always" ;---Turn on fancier tickmark labels.

res@tiMainString  = "South Korea (Nations)"
map = gsn_csm_map(wks,res)
lnres             = True
lnres@gsLineColor = "slategray"
poly0 = gsn_add_shapefile_polylines(wks, map, dir+filenames(0), lnres)
draw(map)
frame(wks)

res@tiMainString  = "South Korea (Province)"
map = gsn_csm_map(wks,res)
lnres@gsLineColor = "black"
poly1 = gsn_add_shapefile_polylines(wks, map, dir+filenames(1), lnres)
draw(map)
frame(wks)

res@tiMainString  = "South Korea (City & county)"
map = gsn_csm_map(wks,res)
lnres@gsLineColor = "blue"
poly2 = gsn_add_shapefile_polylines(wks, map, dir+filenames(2), lnres)
draw(map)
frame(wks)
