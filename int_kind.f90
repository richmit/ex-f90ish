! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      int_kind.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Typical ways to select integer KINDs.@EOL
! @std       F95 
! @see       int_kind_2008.f90 int_kind_c.f90
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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program int_kind
  implicit none
                                                        ! | typical C    | C99     | bytes |    N=largest number |     log_10(N) |
                                                        ! |--------------+---------+-------+---------------------+---------------|
  integer, parameter :: int8  = selected_int_kind(r=2)  ! | signed char  | int8_t  |     1 |                 127 | 2.10380372096 |
  integer, parameter :: int16 = selected_int_kind(r=4)  ! | signed short | int16_t |     2 |               32767 | 4.51543668114 |
  integer, parameter :: int32 = selected_int_kind(r=9)  ! | signed int   | int32_t |     4 |          2147483647 | 9.33192986538 |
  integer, parameter :: int64 = selected_int_kind(r=18) ! | signed long  | int64_t |     8 | 9223372036854775807 | 18.9648897268 |

  integer(kind=int8)  :: i8
  integer(kind=int16) :: i16
  integer(kind=int32) :: i32
  integer(kind=int64) :: i64

  print *, 'kind=int8                     ', int8
  print *, '  Number of significant digits', digits(i8)      
  print *, '  Largest number              ', huge(i8)        
  print *, '  Base of the model           ', radix(i8)       
  print *, '  Decimal exponent range      ', range(i8)       

  print *, 'kind=int16                    ', int16
  print *, '  Number of significant digits', digits(i16)         
  print *, '  Largest number              ', huge(i16)       
  print *, '  Base of the model           ', radix(i16)      
  print *, '  Decimal exponent range      ', range(i16)      

  print *, 'kind=int32                    ', int32
  print *, '  Number of significant digits', digits(i32)         
  print *, '  Largest number              ', huge(i32)       
  print *, '  Base of the model           ', radix(i32)      
  print *, '  Decimal exponent range      ', range(i32)      

  print *, 'kind=int8'
  print *, '  Number of significant digits', digits(i64)         
  print *, '  Largest number              ', huge(i64)       
  print *, '  Base of the model           ', radix(i64)      
  print *, '  Decimal exponent range      ', range(i64)      

end program int_kind









