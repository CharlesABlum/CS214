! logTable.f90 prints a table of logarithms
!
! Input: start, stop and increment, three reals.
! PRE: start < stop .AND. increment > 0.
! Output: A table of logarithms, beginning at start,
!          ending at stop, with increment as the step value.
!
! Begun by: Dr. Adams, for CS 214 at Calvin College.
! Completed by:
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PROGRAM logTable

   IMPLICIT NONE
   REAL :: start, stop, increment

   PRINT*, "To display a table of logarithms,"
   PRINT*, " enter the start, stop and increment values."
   READ*, start, stop, increment

END PROGRAM
