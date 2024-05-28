! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      real_kinds.f95
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Typical way to declare single,  double, & quad precision reals in fortran 95. @EOL
! @keywords  real kind iso_fortran_env iso_c_binding double single 2003 2018
! @std       F95 
! @see       real_kinds_ieee.f95 real_kinds_2008.f08
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
!  Before the ISO_FORTRAN_ENV module, Fortran programmers used a variety of ways to specify single, double, and quad floating
!  point variables.  This program demonstrates a few of the most common methods.  For a more modern way see real_kinds_2008.f08
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program real_kinds
  implicit none

  ! standard ways to get reals:
  integer, parameter :: rek1 = kind(0.0e0) 
  real(kind=rek1)    :: re1
  real               :: re2
  integer, parameter :: rek3 = selected_real_kind(  6,  37)
  real(kind=rek3)    :: re3

  ! standard ways to get real doubles:
  integer, parameter :: dpk1 = kind(1.0d0)
  real(kind=dpk1)    :: dp1
  double precision   :: dp2
  integer, parameter :: dpk3 = selected_real_kind( 15, 307)
  real(kind=dpk3)    :: dp3

  ! standard ways to get real quads:
  integer, parameter :: qpk1 = selected_real_kind( 30, 291)
  real(kind=qpk1)    :: qp1

  print *, 'Kind re1=', kind(re1)
  print *, 'kind re2=', kind(re2)
  print *, 'kind re3=', kind(re3)

  print *, ''
  print *, 'kind dp1=', kind(dp1)
  print *, 'kind dp2=', kind(dp2)
  print *, 'kind dp3=', kind(dp3)

  print *, ''
  print *, 'kind qp1=', kind(qp1)

  print *, ''
  print *, 'Real (re1) Info'
  print *, '   Number of significant digits       ', digits(re1)         
  print *, '   Almost negligible compared to one  ', epsilon(re1)    
  print *, '   Largest number                     ', huge(re1)       
  print *, '   Maximum model exponent             ', maxexponent(re1) 
  print *, '   Minimum model exponent             ', minexponent(re1) 
  print *, '   Decimal precision                  ', precision(re1)  
  print *, '   Base of the model                  ', radix(re1)      
  print *, '   Decimal exponent range             ', range(re1)      
  print *, '   Smallest positive number           ', tiny(re1)       

  print *, ''
  print *, 'Double (dp1) Info'
  print *, '   Number of significant digits       ', digits(dp1)         
  print *, '   Almost negligible compared to one  ', epsilon(dp1)    
  print *, '   Largest number                     ', huge(dp1)       
  print *, '   Maximum model exponent             ', maxexponent(dp1) 
  print *, '   Minimum model exponent             ', minexponent(dp1) 
  print *, '   Decimal precision                  ', precision(dp1)  
  print *, '   Base of the model                  ', radix(dp1)      
  print *, '   Decimal exponent range             ', range(dp1)      
  print *, '   Smallest positive number           ', tiny(dp1)       

  print *, ''
  print *, 'Double (qp1) Info'
  print *, '   Number of significant digits       ', digits(qp1)         
  print *, '   Almost negligible compared to one  ', epsilon(qp1)    
  print *, '   Largest number                     ', huge(qp1)       
  print *, '   Maximum model exponent             ', maxexponent(qp1) 
  print *, '   Minimum model exponent             ', minexponent(qp1) 
  print *, '   Decimal precision                  ', precision(qp1)  
  print *, '   Base of the model                  ', radix(qp1)      
  print *, '   Decimal exponent range             ', range(qp1)      
  print *, '   Smallest positive number           ', tiny(qp1)       

end program real_kinds
