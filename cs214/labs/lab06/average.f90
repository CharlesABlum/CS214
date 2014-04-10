! average.f90 "test-drives" function Average.
! Dr. Adams, CS 214 at Calvin College.
! Precondition: theArray is an array of numbers.
! Output: the average of the numbers.

PROGRAM Avg

   IMPLICIT NONE


   PRINT*, "The average is ", Average(theArray, SIZE(theArray))
END PROGRAM


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Add sums the values in an array           !
! Receive: anArray, an array of numbers     !
! Return: the sum of the values in anArray. !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


