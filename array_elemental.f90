! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      array_elemental.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Demo elemental subroutines and functions.@EOL
! @std       F95 
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
program array_elemental

  implicit none

  integer, dimension(4) :: i = (/ 1, -2, 3, -4 /) 
  integer, dimension(4) :: j = (/ 4,  3, 2,  1 /) 

  print *, 'i & j initial values'
  print '(a,4i4)', '        i=', i
  print '(a,4i4)', '        j=', j
  call swap(i, j)                            ! swap is a home grown elemental subroutine
  print *, 'i & j after swap'
  print '(a,4i4)', '        i=', i
  print '(a,4i4)', '        j=', j
  print *, 'i squared'
  print '(a,4i4)', 'square(i)=', square(i)   ! square is a home grown elemental function
  print '(a,4i4)', '        i=', i
  print *, 'j elementwise absolute value'
  print '(a,4i4)', '  iabs(j)=', iabs(j)     ! IABS is a built in, "intrinsic" in Fortran speak, elemental function
  print '(a,4i4)', '        j=', j

contains

  elemental subroutine swap(a, b)
    integer, intent(inout) :: a, b
    integer                :: tmp
    tmp = a
    a = b
    b = tmp
  end subroutine swap

  elemental function square(a)
    integer, intent(in) :: a
    integer             :: square
    square = a*a
  end function square

end program array_elemental
