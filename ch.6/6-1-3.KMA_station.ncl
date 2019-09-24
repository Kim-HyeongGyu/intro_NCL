; filename : 6-1-3.KMA_station.ncl

; Get staton information : Lat, Lon
dir   = "../data/"
fname = "processed_KMA_ASOS_latlon.csv"
lstn  = asciiread(dir+fname, -1, "string")
info  = str_split_csv(lstn(1:),",",0) ; ignore header
slat  = tofloat(info(:,5))            ; ASOS slat
slon  = tofloat(info(:,6))            ; ASOS slon

; Draw map
wks = gsn_open_wks("x11", "KMA_station")
res = True
res@gsnFrame = False
res@gsnMaximize	= True
res@gsnMajorLonSpacing = 2.
res@gsnMajorLatSpacing = 2.

res@mpMinLonF = 123.5
res@mpMaxLonF = 131.5
res@mpMinLatF = 32. 
res@mpMaxLatF = 40. 
res@mpDataBaseVersion	= "MediumRes"
; res@mpDataBaseVersion	= "HighRes"
res@mpDataSetName       = "Earth..4"

res@tmXBMajorLengthF = -0.010
res@tmXBMinorLengthF = -0.005
res@tmYLMajorLengthF = -0.010
res@tmYLMinorLengthF = -0.005
res@tmXBLabelFontHeightF = 0.01
res@tmYLLabelFontHeightF = 0.01

res@tmXMajorGrid = True
res@tmYMajorGrid = True
res@tmXMajorGridLineColor       = 1
res@tmXMajorGridThicknessF      = 0.5
res@tmXMajorGridLineDashPattern = 2
res@tmYMajorGridLineColor      	= res@tmXMajorGridLineColor      
res@tmYMajorGridThicknessF      = res@tmXMajorGridThicknessF     
res@tmYMajorGridLineDashPattern	= res@tmXMajorGridLineDashPattern

res@mpOutlineOn = True
res@mpFillAreaSpecifiers  = "water" ; fill area
res@mpSpecifiedFillColors = "gray"  ; Fill color
res@mpMaskAreaSpecifiers  = "land"  ; No fill color
plt = gsn_csm_map_ce(wks, res)

; Draw marker
mkres = True
mkres@gsMarkerIndex	= 16
mkres@gsMarkerSizeF	= .005
mkres@gsMarkerColor	= "red"
mkres@gsMarkerThicknessF = 3
gsn_polymarker(wks, plt, slon, slat, mkres)

; Draw marker - Zonde
mkres@gsMarkerIndex = 5
mkres@gsMarkerSizeF = .015
mkres@gsMarkerColor = "blue"
mkres@gsMarkerThicknessF = 5
gsn_polymarker(wks, plt, 128.5, 37.5, mkres)
frame(wks)
