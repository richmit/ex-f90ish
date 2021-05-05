!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  @file      array_elemental.f95
!  @Author    Mitch Richling<https://www.mitchr.me>
!  @Copyright Copyright 2012 by Mitch Richling.  All rights reserved.
!  @brief     Demo elemental subroutines and functions.@EOL
!  @Std       F95

PROGRAM array_elemental

  IMPLICIT NONE

  INTEGER, DIMENSION(4) :: i = (/ 1, -2, 3, -4 /) 
  INTEGER, DIMENSION(4) :: j = (/ 4,  3, 2,  1 /) 

  PRINT *
  PRINT '(a,4i4)', '        i=', i
  PRINT '(a,4i4)', '        j=', j
  CALL swap(i, j)                            ! swap is a home grown elemental subroutine
  PRINT *
  PRINT '(a,4i4)', '        i=', i
  PRINT '(a,4i4)', '        j=', j
  PRINT *
  PRINT '(a,4i4)', 'square(i)=', square(i)   ! square is a home grown elemental function
  PRINT '(a,4i4)', '        i=', i
  PRINT *
  PRINT '(a,4i4)', '  IABS(j)=', IABS(j)     ! IABS is a built in, "intrinsic" in Fortran speak, elemental function
  PRINT '(a,4i4)', '        j=', j

CONTAINS

  ELEMENTAL SUBROUTINE swap(a, b)
    INTEGER, INTENT(INOUT) :: a, b
    INTEGER                :: tmp
    tmp = a
    a = b
    b = tmp
  END SUBROUTINE swap

  ELEMENTAL FUNCTION square(a)
    INTEGER, INTENT(IN) :: a
    INTEGER             :: square
    square = a*a
  END FUNCTION square

END PROGRAM array_elemental
