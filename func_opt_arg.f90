! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      func_opt_arg.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Optional function arguments. @EOL
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
! @filedetails   
!
!  Optional arguments work the same for subroutines
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program func_opt_arg

  implicit none

  print '(a,i3)', 'a_func(1, 2)                 =', a_func(1, 2)
  print '(a,i3)', 'a_func(1, 2, 3)              =', a_func(1, 2, 3)
  print '(a,i3)', 'a_func(1, 2, arg3=3)         =', a_func(1, 2, arg3=3)
  print '(a,i3)', 'a_func(1, 2, 3,      4)      =', a_func(1, 2, 3,      4)
  print '(a,i3)', 'a_func(1, 2, arg3=3, arg4=4) =', a_func(1, 2, arg3=3, arg4=4)
  print '(a,i3)', 'a_func(1, 2,         arg4=4) =', a_func(1, 2,         arg4=4)

contains

  function a_func(arg1, arg2, arg3, arg4)
    integer, intent(in)           :: arg1, arg2
    integer, intent(in), optional :: arg3, arg4
    integer                       :: a_func
    a_func = arg1 + 2*arg2
    if(present(arg3)) a_func = a_func + 3*arg3
    if(present(arg4)) a_func = a_func + 4*arg4
    return
  end function a_func

end program func_opt_arg
