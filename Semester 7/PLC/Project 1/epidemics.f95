!   Author: Eric Pereira, epereira2015@my.fit.edu
!   Author: Gaetano Saltalamacchia, gsaltalamacc2014@my.fit.edu
!   Course: CSE 4250, Fall 2018
!   Project: Project #1, Spread of Epidemics

PROGRAM Project1
    REAL (KIND=16) :: n = 0.0, WFunction, a=0.0, gamma=0.0, fact=1, iterate=0.0
    REAL (KIND=16), DIMENSION (0:5000) :: someValue
    INTEGER (KIND = 8):: x=1, infected, percent, i=0, j = 0

    READ (*,*,IOSTAT=IOCHECK) someValue
    
    DO WHILE (j < 5000)
        n = someValue(j)
        a = someValue(j+1)
        j = j+2
        !READ(*,*) n, a
        iterate = 0
        fact = 1
        IF (n > 1 .AND. n .LE. 1000000000 .AND. a  .GE. 1 .AND. a < (n-1)) THEN
            DO i = 1,100000
                !BELOW IS OUR METHOD, MORE ACCURATE, MORE DIFFICULT TO IMPLEMENT
                IF (i .GT. 2) THEN
                fact = fact * (i-1)
                ENDIF   
                iterate = iterate + WFunction(i, fact, a)

            !BELOW IS DMITRIS METHOD, LESS ACCURATE EASIER TO IMPLEMENT
            !fact = fact * i
            !iterate = iterate + toIterate(i, fact, a)
            END DO
            gamma = 1 + (iterate/a)
            infected = gamma * n
            percent = (infected / n) * 100
            WRITE (*,*) "Case ", x, ": " , infected, " ", percent,"%"
            iterate = 0
            x = x+1
        ELSE 
            EXIT
        ENDIF
        
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
