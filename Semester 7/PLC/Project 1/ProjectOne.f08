!   Author: Eric Pereira, epereira2015@my.fit.edu
!   Author: Gaetano Saltalamacchia, gsaltalamacc2014@my.fit.edu
!   Course: CSE 4250, Fall 2018
!   Project: Project #1, Spread of Epidemics

program Project1
    ! WRITE (*,*) "Hello World!";
    use, intrinsic :: iso_fortran_env
    integer, parameter :: qp = REAL128
    REAL (KIND=qp) :: n = 0.0, WFunction, a=0.0, gamma=0.0, fact=1, w=0.0, iterate=0.0
    INTEGER (KIND = 8):: x=1, infected, percent, i=0

    
    DO WHILE (.TRUE.)
        READ(*,*) n, a
        iterate = 0
        fact = 1
        
        DO i = 1,1000000
            !BELOW IS OUR METHOD, MORE ACCURATE, MORE DIFFICULT TO IMPLEMENT
             IF (i .GT. 2) THEN
             fact = fact * (i-1)
             ENDIF   
             iterate = iterate + WFunction(i, fact, a)

            !BELOW IS DMITRIS METHOD, LESS ACCURATE EASIER TO IMPLEMENT
            !fact = fact * i
            !iterate = iterate + toIterate(i, fact, a)
        END DO
        WRITE (*,*) iterate
        gamma = 1 + (iterate/a)
        WRITE (*,*) gamma
        infected = gamma * n
        percent = (infected / n) * 100
        WRITE (*,*) "Case ", x, ": " , infected, " ", percent,"%"
        iterate = 0
        
    END DO

end program Project1

!BELOW GOES WITH OUR METHOD
REAL (KIND = 16) FUNCTION WFunction(i, fact, a)
INTEGER (KIND=8), INTENT(IN) :: i
REAL (KIND = 16), INTENT(IN) :: fact, a
REAL (KIND = 16) :: numerator, denominator, z

numerator = (((-1)**(i-1))*(i**(i-2)))
denominator = fact 
z = (((-a)*EXP(-a))**i)

WFunction = (numerator / denominator) *  z

END FUNCTION

!BELOW GOES WITH DMITRI'S METHOD
! REAL (KIND = 16) FUNCTION toIterate(i, fact, a)
! INTEGER (KIND=8), INTENT(IN) :: i
! REAL (KIND = 16), INTENT(IN) :: fact, a
! REAL (KIND = 16) :: numerator, denominator, z

! numerator = ((-i)**(i-1))
! denominator = fact 
! z = (((-a)*EXP(-a))**i)
! toIterate = (numerator / denominator) *  z

! END FUNCTION