! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      array_dynamic.f95
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Demonstrate automatic and allocated arrays.@EOL
! @std       F95 
! @see       array_elemental.f95 dynamic_array.f95
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
!  The allocated technique below works well for arrays that are too big to fit on the stack.
!  For another example of allocated, see dynamic_array.f95.
!  
!  The swap subroutines here are quite wasteful in terms of RAM, see array_elemental.f95 for a better implementation.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program array_dynamic

  implicit none

  integer, dimension(4) :: i = (/ 1, 2, 3, 4 /) 
  integer, dimension(4) :: j = (/ 4, 3, 2, 1 /) 

  print *, 'i=', i
  print *, 'j=', j
  call swap1(i, j)
  print *
  print *, 'i=', i
  print *, 'j=', j
  call swap2(i, j)
  print *
  print *, 'i=', i
  print *, 'j=', j
  call swap3(i, j)
  print *
  print *, 'i=', i
  print *, 'j=', j

contains

  subroutine swap1(a, b)
    implicit none
    integer, dimension(:), intent(inout) :: a, b      ! assumed size arrays    
    integer, dimension(size(a)) :: tmp                ! space allocated (normally on stack) here
    tmp = a
    a = b
    b = tmp
                                                      ! space for tmp is automatically released now
  end subroutine swap1

  subroutine swap2(a, b)
    integer                              :: ierror    ! Used error code
    integer, dimension(:), intent(inout) :: a, b      ! assumed size arrays
    integer, dimension(:), allocatable   :: tmp       ! No space is allocated here
    allocate(tmp(size(a)), stat=ierror)               ! allocate space (normally on the heap)
    if(ierror .ne. 0) then
       print *, 'ERROR: Could not allocate vector'    ! die if we could not allocate space
       stop
    end if
    if (.not.allocated(tmp)) then                     ! die if we could not allocate space
       print *, 'ERROR: Could not allocate vector'      ! It is not necessary to test this after the previous
       stop                                             ! IF/THEN, but it is a good demonstration of the ALLOCATE
    end if                                              ! function. :)
    tmp = a
    a = b
    b = tmp
    deallocate(tmp)                                   ! Not required.  Here to remind us that space for tmp released
                                                      ! when it falls out of scope (no SAVE attribute on tmp).
  end subroutine swap2

  subroutine swap3(a, b)
    implicit none
    integer, dimension(:), intent(inout) :: a, b      ! assumed size arrays
    integer, dimension(:), pointer :: tmp             ! No space is allocated here
    allocate(tmp(size(a)))                            ! allocate space (normally on the heap)
    if (.not.associated(tmp)) stop                    ! die if we could not allocate space
    tmp = a
    a = b
    b = tmp
    deallocate(tmp)                                   ! REQUIRED (pointers don't get automatic cleanup)
  end subroutine swap3

end program array_dynamic
