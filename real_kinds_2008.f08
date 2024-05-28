! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      real_kinds_2008.f08
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Fortran 2008 has nice ways to specify single, double, & quad precision reals.@EOL
! @keywords  real kind iso_fortran_env iso_c_binding double single 2003 2018
! @std       F2008 
! @see       real_kinds.f95 real_kinds_ieee.f95
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
!  ISO_FORTRAN_ENV has well named constants for real kinds that make it easy and portable to specify single, double, and quad
!  precision.  Note that Note that if C compatibility is important, ISO_C_BINDING has similar kinds that work just as well.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program real_kinds_2008
  use, intrinsic:: iso_fortran_env, only: real32, real64, real128
  implicit none

  ! Standard ways to get reals:
  real(kind=real32)    :: re32  ! Single
  real(kind=real64)    :: re64  ! Double
  real(kind=real128)   :: re128 ! Quad

  print *, 'Kind re32= ', kind(re32)
  print *, 'Kind re64= ', kind(re64)
  print *, 'Kind re128=', kind(re128)

  print *, ''
  print *, 'Real (re32) Info'
  print *, '   Number of significant digits       ', digits(re32)         
  print *, '   Almost negligible compared to one  ', epsilon(re32)    
  print *, '   Largest number                     ', huge(re32)       
  print *, '   Maximum model exponent             ', maxexponent(re32) 
  print *, '   Minimum model exponent             ', minexponent(re32) 
  print *, '   Decimal precision                  ', precision(re32)  
  print *, '   Base of the model                  ', radix(re32)      
  print *, '   Decimal exponent range             ', range(re32)      
  print *, '   Smallest positive number           ', tiny(re32)       

  print *, ''
  print *, 'Double (re64) Info'
  print *, '   Number of significant digits       ', digits(re64)         
  print *, '   Almost negligible compared to one  ', epsilon(re64)    
  print *, '   Largest number                     ', huge(re64)       
  print *, '   Maximum model exponent             ', maxexponent(re64) 
  print *, '   Minimum model exponent             ', minexponent(re64) 
  print *, '   Decimal precision                  ', precision(re64)  
  print *, '   Base of the model                  ', radix(re64)      
  print *, '   Decimal exponent range             ', range(re64)      
  print *, '   Smallest positive number           ', tiny(re64)       

  print *, ''
  print *, 'Double (re128) Info'
  print *, '   Number of significant digits       ', digits(re128)         
  print *, '   Almost negligible compared to one  ', epsilon(re128)    
  print *, '   Largest number                     ', huge(re128)       
  print *, '   Maximum model exponent             ', maxexponent(re128) 
  print *, '   Minimum model exponent             ', minexponent(re128) 
  print *, '   Decimal precision                  ', precision(re128)  
  print *, '   Base of the model                  ', radix(re128)      
  print *, '   Decimal exponent range             ', range(re128)      
  print *, '   Smallest positive number           ', tiny(re128)       

end program real_kinds_2008
