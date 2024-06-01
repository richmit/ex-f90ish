! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      proc_args.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     How to access command line arguments. @EOL
! @std       F2003 
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
program proc_args

  implicit none

  integer                       :: i, ierror, str_len
  character(len=:), allocatable :: argument
  
  ! First we grab the entire command line.  This isn't normally very useful because it may be impossible to parse the entire
  ! command line produced by get_command because quotes on the command line are frequently lost.  For example the following two
  ! command lines will usually produce the same string from get_command:
  !  - foo a b
  !  - foo 'a b'
  ! But the command_argument_count will be correct (2 for the first and 1 for the second), and get_command_argument will
  ! also do the correct thing.  

  ! get_command can be used to simply query the string length by only providing the length argument to the call
  call get_command(length=str_len)
  ! Now that we know how long the string is, we allocate the argument variable
  allocate(character(len=str_len) :: argument)
  ! Now that we have space for the string, we query it.
  call get_command(argument, str_len, ierror)
  ! It is  extraordinarily unlikely the above call will fail; however, it's never a bad idea to check. ;)
  if(ierror <= 0) then
     print *, 'Entire command line: ', argument
  else
     print *, 'Command line could not be retrieved'
  end if

  ! Now we pull the each command argument from the command line with get_command_argument.  

  ! get_command_argument works just like get_command -- you can query the length and then allocate a string for the argument.
  ! I'm going to be lazy and just reuse the argument string we allocated above -- it's big enough for the entire command line, so
  ! it must be big enough for each argument individually.

  do i = 1, command_argument_count()
     call get_command_argument(i, argument, str_len, ierror)
     ! Again, very unlikely the previous call would fail given argument is guaranteed to be big enough.  Still we check.
     if(ierror <= 0) then
        print '(a,i0.0,a,a)', 'Argument: ', i, ' was: ', trim(argument)
     else
        print '(a,i0.0,a)', 'Argument ', i, 'could not be retrieved'
     end if
  end do

end program proc_args
