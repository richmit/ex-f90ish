! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      real_kinds_ieee.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Declaring IEEE-like variables.@EOL
! @keywords  real kind iso_fortran_env iso_c_binding double single IEEE
! @std       F95 
! @see       real_kinds.f90 real_kinds_2008.f90
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
!  These techniques won't guarantee IEEE types, but they will get whatever the platform has to offer.  On machines with IEEE
!  floating point types, the selected_real_kind calls used below will *generally* produce kinds corresponding to the standard
!  IEEE floating types.  For the quad precision type, we set P=16 to get whatever is bigger than a double precision type on the
!  current platform -- that might be a 80bit or a 128bit type for example.  Note that using real kind parameters from
!  ISO_FORTRAN_ENV or ISO_C_BINDING are just as reliable in produceing IEEE types.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program real_kinds_ieee
  implicit none

  integer, parameter :: ieee_sp = selected_real_kind(p=6,r=37)     ! IEEE Single Precision (32-bit)
  integer, parameter :: ieee_dp = selected_real_kind(p=15,r=307)   ! IEEE Double Precision (64-bit)
  integer, parameter :: ieee_qp = selected_real_kind(p=16)         ! IEEE Quad Precision   (128-bit or 80-bit)

  real(kind=ieee_sp) :: a_sp
  real(kind=ieee_dp) :: a_dp
  real(kind=ieee_qp) :: a_qp

  print *
  print *, 'Kind for single                       ', ieee_sp
  print *, '   Number of significant digits       ', digits(a_sp)         
  print *, '   Almost negligible compared to one  ', epsilon(a_sp)    
  print *, '   Largest number                     ', huge(a_sp)       
  print *, '   Maximum model exponent             ', maxexponent(a_sp) 
  print *, '   Minimum model exponent             ', minexponent(a_sp) 
  print *, '   Decimal precision                  ', precision(a_sp)  
  print *, '   Base of the model                  ', radix(a_sp)      
  print *, '   Decimal exponent range             ', range(a_sp)      
  print *, '   Smallest positive number           ', tiny(a_sp)       

  print *
  print *, 'Kind for double                       ', ieee_dp
  print *, '   Number of significant digits       ', digits(a_dp)         
  print *, '   Almost negligible compared to one  ', epsilon(a_dp)    
  print *, '   Largest number                     ', huge(a_dp)       
  print *, '   Maximum model exponent             ', maxexponent(a_dp) 
  print *, '   Minimum model exponent             ', minexponent(a_dp) 
  print *, '   Decimal precision                  ', precision(a_dp)  
  print *, '   Base of the model                  ', radix(a_dp)      
  print *, '   Decimal exponent range             ', range(a_dp)      
  print *, '   Smallest positive number           ', tiny(a_dp)       

  print *
  print *, 'Kind for single                       ', ieee_qp
  print *, '   Number of significant digits       ', digits(a_qp)         
  print *, '   Almost negligible compared to one  ', epsilon(a_qp)    
  print *, '   Largest number                     ', huge(a_qp)       
  print *, '   Maximum model exponent             ', maxexponent(a_qp) 
  print *, '   Minimum model exponent             ', minexponent(a_qp) 
  print *, '   Decimal precision                  ', precision(a_qp)  
  print *, '   Base of the model                  ', radix(a_qp)      
  print *, '   Decimal exponent range             ', range(a_qp)      
  print *, '   Smallest positive number           ', tiny(a_qp)       

end program real_kinds_ieee
