; filename : 3-6-1.if_statement.ncl

x = 7
if ( x .eq. -5 ) then
    print( "x == -5" )                    ; x는 -5와 같다.
else if ((x.gt.0) .and. (x.lt.5) ) then
    print( "0 <= x < 5" )                 ; x는 -5가 아니며 0보다 크고 5보다 작다.
else if ( x .lt. 0 ) then
    print( "x < 0 (x != -5)" )            ; x는 -5가 아니며 0보다 작다.
else
    print( "x >= 5" )                     ; x는 5보다 크거나 같다.
end if
end if
end if
