! split.f90 splits a string into two substrings.
! Dr. Adams, CS 214 at Calvin College.
!
! Input: aString, a string;
!        pos, an integer.
! PRE: 0 <= pos < aString.length().
! Output: The substrings aString(0, pos-1) and aString(pos, length()-1).


PROGRAM splitString

  INTEGER, PARAMETER :: STRING_MAX = 80
  CHARACTER(STRING_MAX) :: aString, part1, part2
  INTEGER pos

  PRINT*, "To split a string, enter the string: "
  READ *, aString

  PRINT*, "Enter the split position: "
  READ *, pos

  CALL Split(aString, pos, part1, part2);

  PRINT*, "The first part is ", part1
  PRINT*, " and the second part is ", part2
  PRINT*
END PROGRAM

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 ! Split() splits a string in two.                !
 ! Receive: theString, the string to be split,    !
 !          position, the split index.            !
 ! PRE: 0 <= position < theString.length().        !
 ! Passback: firstPart - the first substring,     !
 !           lastPart - the second substring.     !
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
