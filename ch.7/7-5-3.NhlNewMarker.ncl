; filename : 7-5-3.NhlNewMarker.ncl

wks = gsn_open_wks("x11","NhlNewMarker")
res = True
res@gsnFrame = False

res@mpProjection = "LambertConformal"
res@mpLambertParallel1F = 30.
res@mpLambertParallel2F = 60.
res@mpLambertMeridianF  = 120.

res@mpLimitMode = "corners"
res@mpLeftCornerLatF  = 0
res@mpLeftCornerLonF  = 90
res@mpRightCornerLatF = 40
res@mpRightCornerLonF = 200

res@mpGridAndLimbOn = True
res@mpGridLineDashPattern = 2
res@mpGridLineThicknessF  = 0.5
plt = gsn_csm_map(wks, res)

; add track (polyline) ---------
x	= (/160, 150, 140, 130, 125, \ ; lon
        125, 130, 140 ,150, 160/)
y	= (/  5,  10,  15,  22,  25, \ ; lat
         30,  35,  38,  42,  45/)
prs = (/990, 980, 975, 970, 973, \ ; pressure
        980, 985, 985, 990, 990/)

lnres = True
lnres@gsLineColor      = "skyblue"
lnres@gsLineThicknessF = 6
gsn_polyline(wks, plt, x, y, lnres)

; add typhoon marker
mstring = "p"
fontnum = 37
xoffset = 0.0
yoffset = 0.0
ratio   = 1.0
size    = 1.0
angle   = 0.
cyc_id = NhlNewMarker(wks, mstring, fontnum, \
                           xoffset, yoffset, \
                         ratio, size, angle)

mkres1  = True
mkres1@gsMarkerIndex = cyc_id
gsn_polymarker(wks, plt, x, y, mkres1)

; add values (text) ------------
txres = True
txres@txFontColor   = "blue"
txres@txFontHeightF	= 0.01
gsn_text(wks, plt, prs+" hPa", \
           x,   y, txres)

; cities (polymarker) ---------
cx   = (/ 127.0, 116.4,	\ ; lon
          139.6, 121.5, 105.9 /)
cy   = (/  37.6,  39.9,	\ ; lat
           35.7,  25.0,  21.0 /)
city = (/"seoul", "Beijing", \ ; city
         "Tokyo",  "Taipei", "Hanoi"/)

mkres2 = True
mkres2@gsMarkerSizeF = 0.01
mkres2@gsMarkerColor = "Black"
mkres2@gsMarkerIndex = 5
mkres2@gsMarkerThicknessF = 3
gsn_polymarker(wks, plt, cx, cy, mkres2)

txres2 = True
txres2@txFontHeightF = 0.01
txpos  = (/ 3, 3, -3, -3, 3/)	;for position of city name
gsn_text(wks, plt, city, \
          cx, cy+txpos, txres2)

; box or shape (polygon) ------
pgres = True
pgres@gsEdgesOn   = True
pgres@gsFillColor = -1	; "transparent"
bx	= (/ 90, 150, 150, 90 /)
by	= (/ 15,  15,  60, 60 /)
gsn_polygon(wks, plt, bx, by, pgres)
frame(wks)
