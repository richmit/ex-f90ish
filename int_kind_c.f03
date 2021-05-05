!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!  @file      int_kind_c.f03
!  @Author    Mitch Richling<https://www.mitchr.me>
!  @Copyright Copyright 2012 by Mitch Richling.  All rights reserved.
!  @brief     How to use ISO_C_BINDING to declare fixed size integers@EOL
!  @Std       F2003

PROGRAM int_kind_c
  USE ISO_C_BINDING

  IMPLICIT NONE

  INTEGER(KIND=C_INT8_T)  :: i8
  INTEGER(KIND=C_INT16_T) :: i16
  INTEGER(KIND=C_INT32_T) :: i32
  INTEGER(KIND=C_INT64_T) :: i64

  WRITE (*,*) 'KIND=C_INT8_T'
  WRITE (*,*) '  Number of significant digits', DIGITS(i8)      
  WRITE (*,*) '  Largest number              ', HUGE(i8)        
  WRITE (*,*) '  Base of the model           ', RADIX(i8)       
  WRITE (*,*) '  Decimal exponent range      ', RANGE(i8)       

  WRITE (*,*) 'KIND=C_INT16_T'
  WRITE (*,*) '  Number of significant digits', DIGITS(i16)         
  WRITE (*,*) '  Largest number              ', HUGE(i16)       
  WRITE (*,*) '  Base of the model           ', RADIX(i16)      
  WRITE (*,*) '  Decimal exponent range      ', RANGE(i16)      

  WRITE (*,*) 'KIND=C_INT32_T'
  WRITE (*,*) '  Number of significant digits', DIGITS(i32)         
  WRITE (*,*) '  Largest number              ', HUGE(i32)       
  WRITE (*,*) '  Base of the model           ', RADIX(i32)      
  WRITE (*,*) '  Decimal exponent range      ', RANGE(i32)      

  WRITE (*,*) 'KIND=C_INT64_T'
  WRITE (*,*) '  Number of significant digits', DIGITS(i64)         
  WRITE (*,*) '  Largest number              ', HUGE(i64)       
  WRITE (*,*) '  Base of the model           ', RADIX(i64)      
  WRITE (*,*) '  Decimal exponent range      ', RANGE(i64)      

END PROGRAM int_kind_c
