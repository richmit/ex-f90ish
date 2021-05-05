!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  @file      loop_forall.f95
!  @Author    Mitch Richling<https://www.mitchr.me>
!  @Copyright Copyright 2012 by Mitch Richling.  All rights reserved.
!  @brief     The forall loop.@EOL
!  @Std       F95

PROGRAM loop_forall

  REAL, DIMENSION(5)   :: x = (/1,2,3,4,5/)
  REAL, DIMENSION(3)   :: y = (/1,2,3/)
  REAL, DIMENSION(3,2) :: A = 0
  INTEGER              :: i

  ! FORALL loops are special in that the body iterations are evaluated
  ! in no particular order -- everything could even happen
  ! concurrently.  This allows for optimization.
  WRITE (*,*) 'FORALL Example 1'
  WRITE (*,*) ' BEFORE X=', x
  WRITE (*,*) ' BEFORE Y=', y
  FORALL(i=2:4) x(i)=x(i)+y(i-1)
  WRITE (*,*) '  AFTER X=', x

  ! A "block" version also exists:
  WRITE (*,*) 'FORALL Example 2'
  WRITE (*,*) ' BEFORE X=', x
  FORALL(i=2:4)
     x(i)=x(i)+y(i-1)
  END FORALL
  WRITE (*,*) ' BEFORE X=', x

  ! Multiple indexes are OK
  WRITE (*,*) 'FORALL Example 3'
  WRITE (*,*) ' BEFORE A=', A
  FORALL(i=1:3, j=1:2)
     a(i,j) = x(j) + y(i)
  end FORALL
  WRITE (*,*) '  AFTER A=', A

END PROGRAM loop_forall
