!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  @file      real_kinds.f95
!  @Author    Mitch Richling<https://www.mitchr.me>
!  @Copyright Copyright 2012 by Mitch Richling.  All rights reserved.
!  @brief     Typical way to declare single,  double, & quad precision reals in fortran 95. @EOL
!  @Std       F95
!
!             These techniques are commonly seen in older (f95) fortran programs.  Fortran 
!             2003 & 2008 have better ways to do this stuff -- see real_kinds_2008.f08

PROGRAM real_kinds
  IMPLICIT NONE

  ! Standard ways to get reals:
  INTEGER, PARAMETER :: rek1 = KIND(0.0E0) 
  REAL(KIND=rek1)    :: re1
  REAL               :: re2
  INTEGER, PARAMETER :: rek3 = SELECTED_REAL_KIND(  6,  37)
  REAL(KIND=rek3)    :: re3

  ! Standard ways to get real doubles:
  INTEGER, PARAMETER :: dpk1 = KIND(1.0D0)
  REAL(KIND=dpk1)    :: dp1
  DOUBLE PRECISION   :: dp2
  INTEGER, PARAMETER :: dpk3 = SELECTED_REAL_KIND( 15, 307)
  REAL(KIND=dpk3)    :: dp3

  ! Standard ways to get real quads:
  INTEGER, PARAMETER :: qpk1 = SELECTED_REAL_KIND( 30, 291)
  REAL(KIND=qpk1)    :: qp1

  WRITE (*,*) 'Kind re1=', KIND(re1)
  WRITE (*,*) 'Kind re2=', KIND(re2)
  WRITE (*,*) 'Kind re3=', KIND(re3)

  WRITE (*,*)
  WRITE (*,*) 'Kind dp1=', KIND(dp1)
  WRITE (*,*) 'Kind dp2=', KIND(dp2)
  WRITE (*,*) 'Kind dp3=', KIND(dp3)

  WRITE (*,*)
  WRITE (*,*) 'Kind qp1=', KIND(qp1)

  WRITE (*,*)
  WRITE (*,*) 'Real (re1) Info'
  WRITE (*,*) '   Number of significant digits       ', DIGITS(re1)         
  WRITE (*,*) '   Almost negligible compared to one  ', EPSILON(re1)    
  WRITE (*,*) '   Largest number                     ', HUGE(re1)       
  WRITE (*,*) '   Maximum model exponent             ', MAXEXPONENT(re1) 
  WRITE (*,*) '   Minimum model exponent             ', MINEXPONENT(re1) 
  WRITE (*,*) '   Decimal precision                  ', PRECISION(re1)  
  WRITE (*,*) '   Base of the model                  ', RADIX(re1)      
  WRITE (*,*) '   Decimal exponent range             ', RANGE(re1)      
  WRITE (*,*) '   Smallest positive number           ', TINY(re1)       

  WRITE (*,*)
  WRITE (*,*) 'Double (dp1) Info'
  WRITE (*,*) '   Number of significant digits       ', DIGITS(dp1)         
  WRITE (*,*) '   Almost negligible compared to one  ', EPSILON(dp1)    
  WRITE (*,*) '   Largest number                     ', HUGE(dp1)       
  WRITE (*,*) '   Maximum model exponent             ', MAXEXPONENT(dp1) 
  WRITE (*,*) '   Minimum model exponent             ', MINEXPONENT(dp1) 
  WRITE (*,*) '   Decimal precision                  ', PRECISION(dp1)  
  WRITE (*,*) '   Base of the model                  ', RADIX(dp1)      
  WRITE (*,*) '   Decimal exponent range             ', RANGE(dp1)      
  WRITE (*,*) '   Smallest positive number           ', TINY(dp1)       

  WRITE (*,*)
  WRITE (*,*) 'Double (qp1) Info'
  WRITE (*,*) '   Number of significant digits       ', DIGITS(qp1)         
  WRITE (*,*) '   Almost negligible compared to one  ', EPSILON(qp1)    
  WRITE (*,*) '   Largest number                     ', HUGE(qp1)       
  WRITE (*,*) '   Maximum model exponent             ', MAXEXPONENT(qp1) 
  WRITE (*,*) '   Minimum model exponent             ', MINEXPONENT(qp1) 
  WRITE (*,*) '   Decimal precision                  ', PRECISION(qp1)  
  WRITE (*,*) '   Base of the model                  ', RADIX(qp1)      
  WRITE (*,*) '   Decimal exponent range             ', RANGE(qp1)      
  WRITE (*,*) '   Smallest positive number           ', TINY(qp1)       

END PROGRAM real_kinds
