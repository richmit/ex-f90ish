! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      array_init1995.f95
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Array assignment and initialization with F95.@EOL
! @std       F95 
! @see       array_init2003.f03
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
program array_init1995

  implicit none

  ! Array initialization (assignments work outside of declarations too)
  real,    dimension(5) :: x = (/ 1.2, 2.3, 3.4, 4.5, 5.6 /)          ! floating point list
  real,    dimension(5) :: y = (/   5,   4,   3,   2,   1 /)          ! Don't need the dot
  real,    dimension(5) :: z = 3                                      ! Set all elements to 3
  integer, dimension(4) :: i = (/   2,   3,   4,   5 /)         
  integer               :: j                                          ! Declared for the implicit loops next
  real,    dimension(8) :: v = (/ (1.0*j,j=1,4), (2.0*j,j=1,4) /)     ! Implicit loop
  logical, dimension(3) :: m = (/ .true.,  .true.,  .false. /)          

  print *, 'integer'
  print *, '  i=          ', i

  print *, 'logical'
  print *, '  m=          ', m

  print *, 'real'
  print *, '  x=          ', x
  print *, '  x(2:4)=     ', x(2:4)
  print *, '  x(1:5:2)=   ', x(1:5:2)
  print *, '  x(i)=       ', x(i)
  print *, '  2*x(1:5:2)= ', 2*x(1:5:2)
  print *, '  x(1:5:2)**2=', x(1:5:2)**2
  print *, '  tan(x)=     ', tan(x)
  print *, '  y=          ', y
  print *, '  x+y=        ', x+y
  print *, '  z=          ', z
  print *, '  v=          ', v

end program array_init1995
