! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      int_kind_2008.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Better ways to select integer KINDs in fortran 2008.@EOL
! @std       F2008
! @see       int_kind_c.f90 int_kind.f90
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
!  ISO_FORTRAN_ENV has handy kinds for integer kinds.  Note that ISO_C_BINDING has similar types for C compatibility.
!  GNU Extension: INT128
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program int_kind_2008
  use, intrinsic:: iso_fortran_env, only: int8, int16, int32, int64
  implicit none

  integer(kind=int8)  :: i8
  integer(kind=int16) :: i16
  integer(kind=int32) :: i32
  integer(kind=int64) :: i64

  ! A type is supported if it is non-negative (Fortran 2008)
  if (int8 < 0) then
    print *, 'ERROR: INT8 Not supported!'
  end if

  print *, 'KIND=INT8'
  print *, '  Number of significant digits', digits(i8)
  print *, '  LARGEST NUMBER              ', huge(i8)
  print *, '  BASE OF THE MODEL           ', radix(i8)
  print *, '  DECIMAL EXPONENT RANGE      ', range(i8)

  print *, 'KIND=INT16'
  print *, '  NUMBER OF SIGNIFICANT DIGITS', digits(i16)
  print *, '  LARGEST NUMBER              ', huge(i16)
  print *, '  BASE OF THE MODEL           ', radix(i16)
  print *, '  DECIMAL EXPONENT RANGE      ', range(i16)

  print *, 'KIND=INT32'
  print *, '  NUMBER OF SIGNIFICANT DIGITS', digits(i32)
  print *, '  LARGEST NUMBER              ', huge(i32)
  print *, '  BASE OF THE MODEL           ', radix(i32)
  print *, '  DECIMAL EXPONENT RANGE      ', range(i32)

  print *, 'KIND=INT64'
  print *, '  NUMBER OF SIGNIFICANT DIGITS', digits(i64)
  print *, '  LARGEST NUMBER              ', huge(i64)
  print *, '  BASE OF THE MODEL           ', radix(i64)
  print *, '  DECIMAL EXPONENT RANGE      ', range(i64)

end program int_kind_2008
