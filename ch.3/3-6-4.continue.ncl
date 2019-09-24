; filename : 3-6-4.continue.ncl

k = 1
do while ( k .le. 10 )
    print(""+k)
    k = k + 1
    continue
    print("skip")
end do

