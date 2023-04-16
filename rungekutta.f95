program rungekutta
    ! Nicholas Maynard
    ! CSI 501
    ! Homework 11
    ! 04/19/2023
    ! This program performs a rungekutta's method for solving.
  
    ! Clear out the memory
    implicit none
  
    ! Declare our Variables
    character*50 :: OutFile
    real :: k1, k2, k3, k4, y, fprime, t
    real :: tlower = 0.0
    real :: tupper = 5.0
    real :: h = 0.05
    integer :: n, i
 
    ! Ask user for output file
    print*, 'Enter name of output file: '
    read(*,*) OutFile
    open(13,file=OutFile)

    ! Ask user for initial y guess
    print*, 'Enter value for y: '
    read(*,*) y

    ! Generate our Range for t
    n = int((tupper-tlower) / h)

    ! Perform our Runge Kutta method.
    do i=1, n
        t = i*h
        k1 = fprime(y, t)
        k2 = fprime((y + ((h/2) * k1)), t+(h/2))
        k3 = fprime((y + ((h/2) * k2)), t+(h/2))
        k4 = fprime(y+ h*k3, t+h)
        y = y + (h/6)*(k1 + 2*k2 + 2*k3 + k4)
        write(13, *) t, y
    enddo



end program rungekutta

function fprime(t, y) result(res)
    ! Clear memory
    implicit none

    ! Declare our variables
    real :: t, y, res

    ! Compute Function
    res = y**2 - (y**3 / 5) - t
end function fprime