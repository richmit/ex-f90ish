! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      overloading.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Function overloading fortran style.@EOL
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
! @todo      @EOL@EOL
! @warning   @EOL@EOL
! @bug       @EOL@EOL
! @filedetails   
!
!  Unlike C++ overloading, the Fortran method of specifying overloaded functions by name allows for external
!  linkage to libraries that already exist -- like the BLAS.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program overloading

  implicit none

  interface foobar
     function foobar_real(x)
       real, intent(in) :: x
       real             :: foobar_real
     end function foobar_real
     function foobar_int(x)
       integer, intent(in) :: x
       integer             :: foobar_int
     end function foobar_int
  end interface foobar

  integer  :: int_var  = 2
  real     :: real_var = 2.0

  print '(a,i10)',   'function=', foobar_int(int_var)
  print '(a,f10.3)', 'function=', foobar_real(real_var)
  print '(a,i10)',   'function=', foobar(4)
  print '(a,f10.3)', 'function=', foobar(4.0)

end program overloading

function foobar_int(x)
  integer, intent(in) :: x
  integer             :: foobar_int
  foobar_int = x * x
  return
end function foobar_int

function foobar_real(x)
  real, intent(in) :: x
  real             :: foobar_real
  foobar_real = x * x * x
  return
end function foobar_real
