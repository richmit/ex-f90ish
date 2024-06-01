! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      mod_struct.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     The typical structure of a module file. @EOL
! @std       F95 
! @see       prog_struct.f90
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
module mod_struct
  implicit none  
  private                        ! IMO most every module should be private, and explicit about what is shared

  integer, public  :: modint = 5 ! Add PUBLIC We want to export modint
  integer, private :: i      = 6 ! PRIVATE is the default, but I like to include it.
                                 ! This I variable will not collide with I in the main program because it is privite

  public  :: hi_ma               ! We include this to "export" the subroutine

contains

  subroutine hi_ma(an_int)
    implicit none                ! Not necessary because module is IMPLICIT NONE.  I include it anyway. ;)
    integer, intent(in)  :: an_int
    print *, 'hello ma! ', i, an_int
  end subroutine hi_ma

end module mod_struct
