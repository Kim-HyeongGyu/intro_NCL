! filename : calc_quadratic.f90

subroutine calc_quadratic(a, b, c, x1, x2)

    implicit none
    real, intent(in) :: a, b, c
    real, intent(out):: x1, x2
    real             :: D   ! D = disciminant
    
    D = b*b -4*a*c
    if (D < 0) then
        print *, "Note! Discriminant < 0"
        stop
    end if

    x1 = (-b - sqrt(D)) / (2*a)
    x2 = (-b + sqrt(D)) / (2*a)

end subroutine calc_quadratic
