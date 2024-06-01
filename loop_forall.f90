! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      loop_forall.f90
! @author    Mitch Richling http://www.mitchr.me/
! @date      2024-05-28
! @version   VERSION
! @brief     @EOL
! @keywords  
! @std       F95 
! @see       
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
!  FORALL loops have mostly been replaced with DO CONCURRENT in modern code, but you still seem them in old code.  Note that some
!  compilers fail to optimize FORALL, or optimize regular DO LOOP or DO CONCURRENT better.  In my opinion, FORALL is best avoided
!  in new projects.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program loop_forall

  real, dimension(5)   :: x = (/1,2,3,4,5/)
  real, dimension(3)   :: y = (/1,2,3/)
  real, dimension(3,2) :: a = 0
  integer              :: i, j

  ! forall 'statement' syntax 
  print *, 'FORALL Example 1'
  print *, ' BEFORE X=', x
  print *, ' BEFORE Y=', y
  forall(i=2:4) x(i)=x(i)+y(i-1)
  print *, '  AFTER X=', x

  ! forall 'construct' syntax
  print *, 'FORALL Example 2'
  print *, ' BEFORE X=', x
  forall(i=2:4)
     x(i)=x(i)+y(i-1)
  end forall
  print *, ' BEFORE X=', x

  ! Multiple indexes are OK
  print *, 'FORALL Example 3'
  print *, ' BEFORE A=', A
  forall(i=1:3, j=1:2)
     a(i,j) = x(j) + y(i)
  end forall
  print *, '  AFTER A=', A

end program loop_forall
