!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  @file      real_ieee.f95
!  @Author    Mitch Richling<https://www.mitchr.me>
!  @Copyright Copyright 2012 by Mitch Richling.  All rights reserved.
!  @brief     Declaring IEEE-like variables.@EOL
!  @Std       F95
!
!             These techniques won't guarantee IEEE types, but they will get whatever the platform has to offer.

PROGRAM real_ieee
  IMPLICIT NONE

  ! On machines with IEEE floating point types, the following will generally produce kinds corresponding to the standard IEEE
  ! floating types.  For the quad precision type, we set P=16 to get whatever is bigger than a double precision type on the current
  ! platform -- that might be a 80bit or a 128bit type for example.
  

  INTEGER, PARAMETER :: ieee_sp = SELECTED_REAL_KIND(p=6,r=37)     ! IEEE Single Precision (32-bit)
  INTEGER, PARAMETER :: ieee_dp = SELECTED_REAL_KIND(p=15,r=307)   ! IEEE Double Precision (64-bit)
  INTEGER, PARAMETER :: ieee_qp = SELECTED_REAL_KIND(p=16)         ! IEEE Quad Precision   (128-bit or 80-bit)

  REAL(KIND=ieee_sp) :: a_sp
  REAL(KIND=ieee_dp) :: a_dp
  REAL(KIND=ieee_qp) :: a_qp

  WRITE (*,*)
  WRITE (*,*) 'Kind for single                       ', ieee_sp
  WRITE (*,*) '   Number of significant digits       ', DIGITS(a_sp)         
  WRITE (*,*) '   Almost negligible compared to one  ', EPSILON(a_sp)    
  WRITE (*,*) '   Largest number                     ', HUGE(a_sp)       
  WRITE (*,*) '   Maximum model exponent             ', MAXEXPONENT(a_sp) 
  WRITE (*,*) '   Minimum model exponent             ', MINEXPONENT(a_sp) 
  WRITE (*,*) '   Decimal precision                  ', PRECISION(a_sp)  
  WRITE (*,*) '   Base of the model                  ', RADIX(a_sp)      
  WRITE (*,*) '   Decimal exponent range             ', RANGE(a_sp)      
  WRITE (*,*) '   Smallest positive number           ', TINY(a_sp)       

  WRITE (*,*)
  WRITE (*,*) 'Kind for double                       ', ieee_dp
  WRITE (*,*) '   Number of significant digits       ', DIGITS(a_dp)         
  WRITE (*,*) '   Almost negligible compared to one  ', EPSILON(a_dp)    
  WRITE (*,*) '   Largest number                     ', HUGE(a_dp)       
  WRITE (*,*) '   Maximum model exponent             ', MAXEXPONENT(a_dp) 
  WRITE (*,*) '   Minimum model exponent             ', MINEXPONENT(a_dp) 
  WRITE (*,*) '   Decimal precision                  ', PRECISION(a_dp)  
  WRITE (*,*) '   Base of the model                  ', RADIX(a_dp)      
  WRITE (*,*) '   Decimal exponent range             ', RANGE(a_dp)      
  WRITE (*,*) '   Smallest positive number           ', TINY(a_dp)       

  WRITE (*,*)
  WRITE (*,*) 'Kind for single                       ', ieee_qp
  WRITE (*,*) '   Number of significant digits       ', DIGITS(a_qp)         
  WRITE (*,*) '   Almost negligible compared to one  ', EPSILON(a_qp)    
  WRITE (*,*) '   Largest number                     ', HUGE(a_qp)       
  WRITE (*,*) '   Maximum model exponent             ', MAXEXPONENT(a_qp) 
  WRITE (*,*) '   Minimum model exponent             ', MINEXPONENT(a_qp) 
  WRITE (*,*) '   Decimal precision                  ', PRECISION(a_qp)  
  WRITE (*,*) '   Base of the model                  ', RADIX(a_qp)      
  WRITE (*,*) '   Decimal exponent range             ', RANGE(a_qp)      
  WRITE (*,*) '   Smallest positive number           ', TINY(a_qp)       

END PROGRAM real_ieee
