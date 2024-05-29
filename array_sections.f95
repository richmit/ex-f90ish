! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      array_sections.f95
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Using array sections.@EOL
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
program array_sections

  implicit none

  ! We put TARGET on a because we will point a pointer at a subsection later. 
  real, dimension(3, 3), target  :: a = reshape(source=(/  1,  2,  3,  4,  5,  6,  7,  8,  9 /), shape=(/ 3, 3 /))
  real, dimension(3)             :: x = (/ 10, 11, 12/)
  real, dimension(:, :), pointer :: ap

  print *
  print '(a,9f7.1)',  '                a=', a
  print '(a,3f7.1)',  '                a=', a(1,:)
  print '(a,3f7.1)',  '                  ', a(2,:)
  print '(a,3f7.1)',  '                  ', a(3,:)
  print '(a,3f7.1)',  '                x=', x
  print *
  print '(a,9f7.1)',  '           a(2,2)=', a(2,2)
  print '(a,9f7.1)',  '         a(2,2:3)=', a(2,2:3)
  print '(a,9f7.1)',  '       a(1:2,2:3)=', a(1:2,2:3)
  print '(a,9f7.1)',  '         a(1:2,2)=', a(1:2,2)
  print '(a,9f7.1)',  '      a(3:1:-1,2)=', a(3:1:-1,2)
  print '(a,9f7.1)',  '       a(1:2:2,2)=', a(1:3:2,2)
  print '(a,9f7.1)',  '    a((/1, 3/),2)=', a((/1, 3/),2)
  print '(a,9f7.1)',  '           a(2,:)=', a(2,:)
  print '(a,3f7.1)',  '           x(2:3)=', x(2:3)
  print '(a,3f7.1)',  '       x((/1,3/))=', x((/1,3/))
  ap => a(2:3, 1:3)
  print '(a,9f7.1)',  '               ap=', ap
  print '(a,3f7.1)',  '               ap=', ap(1,:)
  print '(a,3f7.1)',  '                  ', ap(2,:)

end program array_sections
