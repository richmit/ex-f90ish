! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      pointers_linked_list.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Pointer demo with a linked list. @EOL
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
program pointers_linked_list

  implicit none

  type node
     type(node), pointer :: next
     character(len=100)  :: data
  end type node

  type(node), pointer :: the_list
  the_list => null()
  call dump
  call push('foo')
  call dump
  call push('bar')
  call dump
  call push('foobar')
  call dump

contains

  subroutine push(string)                                                  ! Push a string on the list
    implicit none
    character(len=*), intent(in)  :: string
    type(node), pointer           :: new_node                              ! The node we will add
    allocate(new_node)                                                     ! Allocate space for the new node
    if(.not.(associated(new_node))) then                                   ! Make sure the allocation worker
       print *, 'Could not allocate node'
       stop
    end if
    new_node%data = string                                                 ! Copy the input string into our new node
    if(associated(the_list)) then                                          ! If the list is not empty
       new_node%next => the_list                                             ! we set the next node to the previous first node
    else
       new_node%next => null()                                               ! else we set it to NULL
    end if
    the_list => new_node                                                   ! Link the new node at the top of the list
    return
  end subroutine push

  subroutine dump()                                                        ! Print out the list
    implicit none
    type(node), pointer :: cur_node
    cur_node => the_list                                                   ! Start with the first element
    write (*,fmt="(a)",advance='no') 'LIST: '                              ! Print the list tag
    do
       if(associated(cur_node)) then                                       ! Check to see if we have a node
          write (*,fmt="(a,a)",advance='no') trim(cur_node%data), ' '        ! If so, then print it
          cur_node => cur_node%next                                          ! advance the cur_node
          if(associated(cur_node)) write (*,fmt="(a)",advance='no') '-> '    ! and print the -> for the next element
       else
          write (*,*)                                                        ! else, print the newline and return
          return
       end if
    end do
  end subroutine dump

end program pointers_linked_list


