! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      loop_do.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Simple examples of do loops and labels.@EOL
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
program loop_do

  implicit none
  integer :: i, j
  
  ! end do is finally part of the language.  i MUST be an integer.
  print *, 'Example Loop 1'
  do i=1,20,2
     print *, '  PRE-CYCLE: ', i
     if( (i .gt. 2) .and. (i .lt. 12) ) then
        cycle
     end if
     print *, ' POST-CYCLE: ', i
     if(i .gt. 14) then
        exit
     end if
  end do

  ! Loops can have names, and cycle/exit can use them
  print *, 'Example Loop 2'
  out_loop: do i=1,3
     in_loop: do j=1,3
        print *, '  PRE-CYCLE: ', i, j
        if(i .eq. 2) then
           cycle out_loop
        end if
     print *, ' POST-CYCLE: ', i, j
  end do in_loop
  end do out_loop

  ! Do WHILE, and end do are in the standard too! Like regular do loops, they can have names too.
  print *, 'Example Loop 3'
  i=0
  while_loop: do while (i .lt. 5)
     i=i+1
     if(i .eq. 3) then
        cycle
     end if
     print *, ' i=', i
  end do while_loop

  ! Infinite loops are easy too:
  print *, 'example loop 3'
  i=0
  do
     i=i+1
     if(i .eq. 3) then
        exit
     end if
     print *, ' i=', i
  end do

end program loop_do
