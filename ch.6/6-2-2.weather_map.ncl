; filename : 6-2-2.weather_map.ncl

;-- Open file
f1  = addfile("../data/Tpl.200508.grib","r")
f2  = addfile("../data/Zpl.200508.grib","r")
f3  = addfile("../data/Upl.200508.grib","r")
f4  = addfile("../data/Vpl.200508.grib","r")
f5  = addfile("../data/Qpl.200508.grib","r")

;-- Read file
temp = f1->T_GDS0_ISBL({850},:,:)
z    = f2->Z_GDS0_ISBL({850},:,:)
u    = f3->U_GDS0_ISBL({850},:,:)
v    = f4->V_GDS0_ISBL({850},:,:)
qq   = f5->Q_GDS0_ISBL({850},:,:)

;-- Change unit
tc = temp-273.15
z  = z/9.8
q  = qq*1000
copy_VarCoords(temp,tc)
copy_VarCoords(qq,q)

wspd = sqrt(u^2+v^2)
u    = where(wspd.gt.10, u, u@_FillValue)    
v    = where(wspd.gt.10, v, v@_FillValue)    
delete(u@long_name)
delete(u@units)
delete(z@long_name)
delete(z@units)

wks = gsn_open_wks("x11","weather_map")
res = True
res@gsnDraw        = False
res@gsnFrame       = False
res@gsnMaximize    = True

;-- Mixing ratio contour & map resources
qres = res
qres@gsnLeftString  = "850hPa GPH(m),Temp(C),Mixing Ratio(g/kg)"
qres@gsnRightString = "20050801"
qres@pmTickMarkDisplayMode = "Always"

qres@mpProjection = "LambertConformal"
qres@mpLambertParallel1F = 30.
qres@mpLambertParallel2F = 60.
qres@mpLambertMeridianF = 120.

qres@mpLimitMode = "LatLon"
qres@mpMinLatF   =  10
qres@mpMaxLatF   =  70
qres@mpMinLonF   =  90
qres@mpMaxLonF   = 160

qres@mpLimitMode       = "Corners"
qres@mpLeftCornerLatF  =  0
qres@mpLeftCornerLonF  = 90
qres@mpRightCornerLatF = 40
qres@mpRightCornerLonF = 200

qres@mpGridAndLimbOn = True
qres@mpGridLatSpacingF     = 10
qres@mpGridLonSpacingF     = 10
qres@mpGridLineDashPattern = 2
qres@mpGeophysicalLineThicknessF= 3.0

qres@tmXTOn = False
qres@tmYROn = False

qres@cnFillOn  = True
qres@cnLinesOn = False
qres@lbOrientation = "Vertical"
qres@cnFillPalette = "MPL_Greens"
qres@cnLevelSelectionMode = "ManualLevels"
qres@cnMinLevelValF  = 10
qres@cnMaxLevelValF  = 20
qres@cnLevelSpacingF = 2

;-- Temperature line resources
tcres = res
tcres@cnLineColor = "red"
tcres@cnLineThicknessF = 2
tcres@cnLineLabelFontColor = "red"
tcres@cnLineLabelPlacementMode = "constant"
tcres@cnInfoLabelOn  = False

;-- Geopotential height line resources
zres = res
zres@cnLineColor = "blue"
zres@cnLineThicknessF = 2
zres@cnLevelSelectionMode = "ManualLevels"
zres@cnMinLevelValF  = 1340
zres@cnMaxLevelValF  = 1620
zres@cnLevelSpacingF = 40
zres@cnLineLabelFontColor = "blue"
zres@cnLineLabelPlacementMode = "constant"
zres@cnInfoLabelOn = False

;-- Wind vector resources
vres = res
vres@vcGlyphStyle = "CurlyVector"
vres@vcLineArrowColor = "black"
vres@vcLineArrowThicknessF = 1.5
vres@vcMinDistanceF        = 0.01
vres@vcRefLengthF          = 0.02
vres@vcRefMagnitudeF       = 20.0 
vres@vcRefAnnoParallelPosF   = 0.999
vres@vcRefAnnoOrthogonalPosF = -0.203

q_contour   = gsn_csm_contour_map(wks, q, qres)
tc_contour  = gsn_csm_contour(wks, tc, tcres)
z_contour   = gsn_csm_contour(wks, z, zres)
vector      = gsn_csm_vector(wks, u, v, vres)

overlay(q_contour,tc_contour)
overlay(q_contour,z_contour)
overlay(q_contour,vector)

draw(q_contour)
frame(wks)

