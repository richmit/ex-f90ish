! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      prog_struct.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     The typical structure of a program file. @EOL
! @std       F95 
! @see       mod_struct.f90
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
program prog_struct
  use mod_struct

  implicit none

  integer  :: i = 2

  interface                                             
     pure function outside_func(x)                       ! outside_func is not in the CONTAINS section or in a USEd module
       integer, intent(in) :: x                    
       integer             :: outside_func         
     end function outside_func                     
  end interface                                    
                                                   
  call a_sub_no_args                                     ! You don't need empty () to call a subroutine with no args...
                                                   
  print *, 'i=', i                                 
  call a_sub_with_args(1, i)                             ! Note the second arg must be a variable that can be set in this case...
  print *, 'i=', i                                 
                                                   
  print *, 'osf=', outside_func(i)                 
                                                   
  call hi_ma(i)                                    
                                                   
contains                                           
                                                   
  subroutine a_sub_no_args                               ! Can't be pure because it prints!
    print *, 'hello, world!'                             ! variable and routine declarations go here
    return                                               ! return is not required at the end..
  end subroutine a_sub_no_args                           ! Note the name.  It's optional, but good practice to include it.

  pure subroutine a_sub_with_args(an_in_arg, an_out_arg) ! You can have intent(out) arguments in pure subroutines...
    integer, intent(in)  :: an_in_arg             
    integer, intent(out) :: an_out_arg            
    an_out_arg = an_in_arg                               ! This will change the an_out_arg var in caller!!
    return                                               ! return is not required at the end..
  end subroutine a_sub_with_args                  
                                                  
  pure function a_func(an_arg, another_arg)              ! Stick to pure procedures whenever you can!
    integer, intent(in) :: an_arg                        ! intent(in) on all args -- God fearing functions never modify args!
    integer, intent(in) :: another_arg            
    integer             :: a_func                        ! Must declare return type.  Can also be on the function line.
    a_func = an_arg + another_arg                        ! This sets the return value
    return                                               ! return is not required at the end..
  end function a_func                             
                                                  
end program prog_struct                           
                                                  
pure function outside_func(x)                     
  implicit none                                          ! Necessary because it's outside PROGRAM.
  integer, intent(in) :: x
  integer             :: outside_func
  outside_func = x * x
  return                                                 ! return is not required at the end..
end function outside_func
