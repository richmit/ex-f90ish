! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      file_io.f90
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Demonstrates File I/O with NEWUNIT, IOSTAT, & ERR.@EOL
! @keywords  error unit numbers file system
! @std       F2008
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
!  It is very common to see Fortran programs that fail to preform any kind of I/O error checking.  This is a bit odd because
!  Fortran makes I/O error checking easy!  I illustrate my favorite method here, using IOSTAT and/or IOMSG, but Fortran provides
!  other options as well (like an automatic GOTO on error, and external status functions).
!
!  A very common error in Fortran programs is manually selecting a unit number that is already used.  Fortran 2008 gives us a
!  very nice way, via NEWUNIT, to have the compiler pick a unit number for us.  The reason this code requires Fortran 2008
!  instead of Fortran 95 is the use of NEWUNIT.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.E.!!

!##################################################################################################################################
program file_io
  implicit none

  integer :: io_stat, io_unit
  character(len=512) :: io_msg
  integer :: i

  !--------------------------------------------------------------------------------------------------------------------------------
  ! First we write a file (named file_io.txt)

  ! Open the file.  Open can have quite a few specifiers, here are the most common
  ! Most common specifiers:
  !   NEWUNIT=var ... Allocate a unit and assign it to var
  !   UNIT=int ...... unit number
  !   FILE=str ...... 'INPUT'   - STDIN
  !                   'OUTPUT'  - STDOUT
  !                   Other     - String is filename
  !   STATUS=str .... 'OLD'     - File must already exist
  !                   'NEW'     - File must not exist already
  !                   'SCRATCH' - Nuke file at program end
  !                   'UNKNOWN' - Platform dependent
  !                   'READ'      - READ 
  !                   'WRITE'     - WRITE, DELETE, and ENDFILE
  !                   'READWRITE' - READ, WRITE, DELETE, and ENDFILE (default)
  !   ACCESS=str .... 'DIRECT'     - Direct access.
  !                   'SEQUENTIAL' - Sequential access (default)
  !                   'STREAM'     - Stream access is a combo of direct & sequential
  !                   'APPEND'     - Sequential access, but initial position is EOF
  !   FORM=str ...... 'FORMATTED'   The Default for 'SEQUENTIAL'
  !                   'UNFORMATTED' The Default for 'DIRECT'
  !   RECL=int ...... positive int representing record length
  !   BLANK=str ..... 'NULL' - blanks in numeric fields ignored (default)
  !                   'ZERO' - blanks are treated as zeros.
  !   IOMSG=str ..... Character variable to hold error message
  !   IOSTAT=var .... Integer variable to hold status
  open(newunit=io_unit, file='file_io.txt', form='formatted', action='write', iostat=io_stat, iomsg=io_msg)
  if (io_stat /= 0) then
     print *, trim(io_msg)
     stop 1
  end if
  print '(a,i0.0)', 'io_unit = ', io_unit

  ! Now let's write some data!
  do i=1,10
     print '(a,i0.0)', 'Write a value = ', i
     write (io_unit, iostat=io_stat, iomsg=io_msg, fmt='(i0.0)') i
     if (io_stat /= 0) then
        print *, trim(io_msg)
        stop 2
     end if
  end do

  ! Now we close the file with CLOSE.  
  ! Note STATUS can take several options, most common are:
  !     'KEEP'   - Keep the file at program end (default)
  !     'DELETE' - Delete the file at program end
  ! It is rare that a close can fail; however, we check anyhow
  close(unit=io_unit, status='keep', iostat=io_stat, iomsg=io_msg)
  if (io_stat /= 0) then
     print *, trim(io_msg)
     stop 3
  end if

  !--------------------------------------------------------------------------------------------------------------------------------
  ! Last we read the file back in

  ! As before we open the file.  Note the action='read' bit...
  open(newunit=io_unit, file='file_io.txt', form='formatted', action='read', iostat=io_stat, iomsg=io_msg)
  if (io_stat /= 0) then
     print *, trim(io_msg)
     stop 1
  end if
  print '(a,i0.0)', 'io_unit = ', io_unit

  ! Now we read the file
  do
     read (io_unit, iostat=io_stat, iomsg=io_msg, fmt=*) i
     if (io_stat /= 0) then
        if (io_stat < 0) then
           ! A negative I/O stat means EOF
           print *, 'All Data Read'
           exit
        else
           ! A positive I/O stat means ERROR
           print *, 'Read error condition!'
           print *, trim(io_msg)
           stop 1
        end if
     end if
     print '(a,i0.0)', 'Got a value = ', i
  end do

  ! Now we close the file with CLOSE.  
  ! Again, it is rare that a close can fail.  Still, we check anyhow
  close(unit=io_unit, status='keep', iostat=io_stat, iomsg=io_msg)
  if (io_stat /= 0) then
     print *, trim(io_msg)
     stop 3
  end if

  ! Print something just to prove we got this far. ;)
  print *, 'Normal Program Termination'

end program file_io
