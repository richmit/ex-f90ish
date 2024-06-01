! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      array_reduction.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Array reduction functions COUNT, ALL, and ANY.@EOL
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
!  COUNT, ALL, ANY are very powerful constructs when combined with element-wise binary operators.  ex: ALL(a>b)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program array_reduction

  implicit none

  logical, dimension(3) :: mixd = (/ .true.,  .true.,  .false. /)          
  logical, dimension(3) :: allt = (/ .true.,  .true.,  .true.  /)          
  logical, dimension(3) :: allf = (/ .false., .false., .false. /)          

  real, dimension(5)    :: a = (/ 5, 4, 3, 2, 1 /)          

  print *
  print *, 'mixd=', mixd
  print *, 'allt=', allt
  print *, 'allf=', allf

  print *
  print "(a6,a5,a5,a5)",      '', 'mixd',      'allt',      'allf'
  print "(a6,i5,i5,i5)", 'COUNT', count(mixd), count(allt), count(allf)
  print "(a6,l5,l5,l5)", '  ALL',   all(mixd),   all(allt),   all(allf)
  print "(a6,l5,l5,l5)", '  ANY',   any(mixd),   any(allt),   any(allf)

  print *
  print *, '         a=', a
  print *, '    SUM(a)=', sum(a)
  print *, 'PRODUCT(a)=', product(a)
  print *, ' MAXVAL(a)=', maxval(a)
  print *, ' MINVAL(a)=', minval(a)
  print *, ' MAXLOC(a)=', maxloc(a)
  print *, ' MINLOC(a)=', minloc(a)

end program array_reduction
