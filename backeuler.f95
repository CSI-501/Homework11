program backeuler
    ! Nicholas Maynard
    ! CSI 501
    ! Homework 11
    ! 04/19/2023
    ! This program performs a backware Eulers Method.
  
    ! Clear out the memory
    implicit none
  
    ! Declare our Variables
    character*50 :: OutFile
    real :: y, y2, fprime, t
    real :: tlower = 0.0
    real :: tupper = 5.0
    real :: h = 0.05
    real*8 :: Tol = 1.0d-14
    integer :: n, i

    ! Ask user for output file
    print*, 'Enter name of output file: '
    read(*,*) OutFile
    open(13,file=OutFile)

    ! Ask user for initial y guess
    print*, 'Enter value for y: '
    read(*,*) y

    ! Generate our Range for t
    n = int((tupper - tlower) / h)

    ! Perform our Backward Euler
    do i=1, n
        t = i*h
        y2 = y
        do
            y2 = y + h * fprime(t+h, y2)
            if (abs(y2 - y) .lt. Tol) exit
            y = y2
        enddo
        y = y2
        write(13, *) t, y
    enddo
  
end program backeuler

function fprime(t, y) result(res)
    ! Clear memory
    implicit none

    ! Declare our variables
    real :: t, y, res

    ! Compute Function
    res = y**2 - (y**3 / 5) - t
end function fprime