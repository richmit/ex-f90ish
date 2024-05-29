! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      variable_decl.f95
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Basic variable declarations.@EOL
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
program variable_decl
  implicit none

  ! General Syntax:
  !   basic_type (KIND=NN), attribute,... :: var1, var2,...
  !   basic_type: integer, real, complex, character, logical
  !   Attributes:
  !      ALLOCATABLE -- no memory used here, allocate later
  !      DIMENSION   -- array                              
  !      EXTERNAL    -- defined outside this compilation   
  !      INTENT      -- argument intent: in, inout or out  
  !      OPTIONAL    -- argument is optional               
  !      INTRINSIC   -- declaring a function as intrinsic  
  !      PARAMETER   -- declaring a constant               
  !      POINTER     -- declaring a pointer                
  !      PRIVATE     -- private declaration (in a module)  
  !      PUBLIC      -- public declaration (in a module)   
  !      SAVE        -- keep value from between calls (in a function or subroutine)
  !      TARGET      -- can be pointed to by a pointer     


  ! This also simplifies modifying the program, should the value of pi change.  -- Early FORTRAN manual for Xerox Computers
  real,    parameter :: my_pi = 3.14
  integer            :: two   = 2

  print *, my_pi, two

end program variable_decl
