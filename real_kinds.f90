! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      real_kinds.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Typical way to declare single,  double, & quad precision reals in fortran 95. @EOL
! @keywords  real kind iso_fortran_env iso_c_binding double single 2003 2018
! @std       F95 
! @see       real_kinds_ieee.f90 real_kinds_2008.f90
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
!  Fortran 95 programmers used a variety of ways to specify single, double, and quad floating point variables.  This program
!  demonstrates a few of the most common methods.
!
!  Note that fortran 2003's ISO_C_BINDING & IEEE_ARITHMETIC added more, and fortran 2008's ISO_FORTRAN_ENV module added even
!  more.
!
!  On most compilers:
!    - spk1 and dpk1 usually correspond to fortran 2003's ISO_C_BINDING c_float & c_double.
!    - spk3, dpk3, & qpk3 are your best bet for IEEE types on fortran 95.
!
!  None of these methods guarantee IEEE types, but they will get whatever the platform has to offer.  On machines with IEEE
!  floating point types, the selected_real_kind calls used below (spk3, dpk3, & qpk3) are your best bet to get IEEE floating
!  types with fortran 95.  Note that for the quad precision type, we set P=16 to get whatever is bigger than a double precision
!  type on the current platform -- on typical platforms that will usually be an 80bit or a 128bit type.  
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program real_kinds
  implicit none

  ! standard ways to get single floats:
  integer, parameter :: spk1 = kind(0.0e0) 
  real(kind=spk1)    :: re1
  real               :: re2
  integer, parameter :: spk3 = selected_real_kind(  6,  37)
  real(kind=spk3)    :: re3

  ! standard ways to get real doubles:
  integer, parameter :: dpk1 = kind(1.0d0)
  real(kind=dpk1)    :: dp1
  double precision   :: dp2
  integer, parameter :: dpk3 = selected_real_kind( 15, 307)
  real(kind=dpk3)    :: dp3

  ! standard ways to get real quads:
  integer, parameter :: qpk3 = selected_real_kind( 30, 291)
  real(kind=qpk3)    :: qp3

  print *, 'Kind re1=', kind(re1)
  print *, 'kind re2=', kind(re2)
  print *, 'kind re3=', kind(re3)

  print *
  print *, 'kind dp1=', kind(dp1)
  print *, 'kind dp2=', kind(dp2)
  print *, 'kind dp3=', kind(dp3)

  print *
  print *, 'kind qp3=', kind(qp3)

  print *
  print *, 'Real (re3) Info'
  print *, '   Number of significant digits       ', digits(re3)         
  print *, '   Almost negligible compared to one  ', epsilon(re3)    
  print *, '   Largest number                     ', huge(re3)       
  print *, '   Maximum model exponent             ', maxexponent(re3) 
  print *, '   Minimum model exponent             ', minexponent(re3) 
  print *, '   Decimal precision                  ', precision(re3)  
  print *, '   Base of the model                  ', radix(re3)      
  print *, '   Decimal exponent range             ', range(re3)      
  print *, '   Smallest positive number           ', tiny(re3)       

  print *
  print *, 'Double (dp3) Info'
  print *, '   Number of significant digits       ', digits(dp3)         
  print *, '   Almost negligible compared to one  ', epsilon(dp3)    
  print *, '   Largest number                     ', huge(dp3)       
  print *, '   Maximum model exponent             ', maxexponent(dp3) 
  print *, '   Minimum model exponent             ', minexponent(dp3) 
  print *, '   Decimal precision                  ', precision(dp3)  
  print *, '   Base of the model                  ', radix(dp3)      
  print *, '   Decimal exponent range             ', range(dp3)      
  print *, '   Smallest positive number           ', tiny(dp3)       

  print *
  print *, 'Double (qp3) Info'
  print *, '   Number of significant digits       ', digits(qp3)         
  print *, '   Almost negligible compared to one  ', epsilon(qp3)    
  print *, '   Largest number                     ', huge(qp3)       
  print *, '   Maximum model exponent             ', maxexponent(qp3) 
  print *, '   Minimum model exponent             ', minexponent(qp3) 
  print *, '   Decimal precision                  ', precision(qp3)  
  print *, '   Base of the model                  ', radix(qp3)      
  print *, '   Decimal exponent range             ', range(qp3)      
  print *, '   Smallest positive number           ', tiny(qp3)       

end program real_kinds
