! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      int_kind_c.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     How to use ISO_C_BINDING to declare fixed size integers.@EOL
! @std       F2003
! @see       int_kind_2008.f90 int_kind_c.f90 int_kind.f90
! @copyright 
!  @parblock
!  Copyright (c) 2024, Mitchell Jay Richling <http://www.mitchr.me/> All
!  rights reserved.
!
!  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following
!  conditions are met:
!
!  1. Redistributions of source code must retain the above copyright notice, this list of conditions, and the following
!     disclaimer.
!
!  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions, and the following
!     disclaimer in the documentation and/or other materials provided with the distribution.
!
!  3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products
!     derived from this software without specific prior written permission.
!
!  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
!  BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
!  SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
!  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
!  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
!  TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
!  POSSIBILITY OF SUCH DAMAGE.
!  @endparblock
! @filedetails   
!
!  The iso_c_binding module contains parameters specifying integer kinds that are compatable with C types.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program int_kind_c
  use, intrinsic:: iso_c_binding, only: c_int8_t, c_int16_t, c_int32_t, c_int64_t
  implicit none

  integer(kind=c_int8_t)  :: i8
  integer(kind=c_int16_t) :: i16
  integer(kind=c_int32_t) :: i32
  integer(kind=c_int64_t) :: i64

  print *, 'kind=c_int8_t'
  print *, '  Number of significant digits', digits(i8)      
  print *, '  Largest number              ', huge(i8)        
  print *, '  Base of the model           ', radix(i8)       
  print *, '  Decimal exponent range      ', range(i8)       

  print *, 'kind=c_int16_t'
  print *, '  Number of significant digits', digits(i16)         
  print *, '  Largest number              ', huge(i16)       
  print *, '  Base of the model           ', radix(i16)      
  print *, '  Decimal exponent range      ', range(i16)      

  print *, 'kind=c_int32_t'
  print *, '  Number of significant digits', digits(i32)         
  print *, '  Largest number              ', huge(i32)       
  print *, '  Base of the model           ', radix(i32)      
  print *, '  Decimal exponent range      ', range(i32)      

  print *, 'kind=c_int64_t'
  print *, '  Number of significant digits', digits(i64)         
  print *, '  Largest number              ', huge(i64)       
  print *, '  Base of the model           ', radix(i64)      
  print *, '  Decimal exponent range      ', range(i64)      

end program int_kind_c
