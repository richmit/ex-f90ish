! -*- Mode:F90; Coding:us-ascii-unix; fill-column:129 -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!.H.S.!!
!!
! @file      array_linear_alg.f95
! @author    Mitch Richling http://www.mitchr.me/
! @brief     Common linear algebra computations.@EOL
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
program array_linear_alg

  implicit none

  ! Array initialization (assignments work outside of declarations too)
  real, dimension(3, 3) :: a = reshape((/  1,  2,  3,  4,  5,  6,  7,  8,  9 /),             (/ 3, 3 /))
  real, dimension(3, 3) :: ap
  real, dimension(3, 4) :: b = reshape((/ 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21 /), (/ 3, 4 /))
  real, dimension(3, 4) :: bp
  real, dimension(3)    :: x =         (/ 22, 23, 24/)
  real, dimension(4)    :: y =         (/ 25, 26, 27, 28/)

  print *
  print '(a,9f7.1)',  '               a=', a
  print '(a,3f7.1)',  '               a=', a(1,:)
  print '(a,3f7.1)',  '                 ', a(2,:)
  print '(a,3f7.1)',  '                 ', a(3,:)
  print '(a,12f7.1)', '               b=', b
  print '(a,4f7.1)',  '               b=', b(1,:)
  print '(a,4f7.1)',  '                 ', b(2,:)
  print '(a,4f7.1)',  '                 ', b(3,:)
  print '(a,3f7.1)',  '               x=', x
  print '(a,4f7.1)',  '               y=', y

  print *
  print '(a,3f7.1)',  '             2*x=', 2*x
  print '(a,3f7.1)',  '             x+x=', x+x
  print '(a,9f7.1)',  '             2*a=', 2*a

  print *
  ap=transpose(a)
  print '(a,9f7.1)',  '    transpose(a)=', ap
  print '(a,3f7.1)',  '    transpose(a)=', ap(1,:)
  print '(a,3f7.1)',  '                 ', ap(2,:)
  print '(a,3f7.1)',  '                 ', ap(3,:)

  print *
  print '(a,f7.1)',   'dot_product(y,y)=', dot_product(y,y)
  print '(a,3f7.1)',  '     matmul(a,x)=', matmul(a,x)
  print '(a,3f7.1)',  '     matmul(b,y)=', matmul(b,y)

  print *
  bp=matmul(a,b)
  print '(a,12f7.1)', '     matmul(a,b)=', bp
  print '(a,4f7.1)',  '     matmul(a,b)=', bp(1,:)
  print '(a,4f7.1)',  '                 ', bp(2,:)
  print '(a,4f7.1)',  '                 ', bp(3,:)

  print *
  print '(a,3f7.1)',  '  a(1,:) . a(:,1)=', dot_product(a(1,:), a(:,1))
  ap=matmul(a, a)
  print '(a,3f7.1)',  '       (a*a)(1,1)=', ap(1,1)

  print *
  ap=a
  ap(2,:)=-2*ap(1,:)+ap(2,:) ! rank 1 update
  print '(a,9f7.1)',  'a: r2 <- -2*r1+r2=', ap
  print '(a,3f7.1)',  'a: r2 <- -2*r1+r2=', ap(1,:)
  print '(a,3f7.1)',  '                  ', ap(2,:)
  print '(a,3f7.1)',  '                  ', ap(3,:)

end program array_linear_alg
