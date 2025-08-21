# -*- Mode:make; Coding:us-ascii-unix; fill-column:158 -*-
#########################################################################################################################################################.H.S.##
##
# @file      makefile
# @author    Mitch Richling http://www.mitchr.me/
# @brief     Make file for fortran 90'ish examples.@EOL
# @std       GNUmake
# @see       https://github.com/richmit/ex-f90ish/
# @copyright 
#  @parblock
#  Copyright (c) 1996,1998,2006,2009,2012,2025, Mitchell Jay Richling <http://www.mitchr.me/> All rights reserved.
#  
#  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#  
#  1. Redistributions of source code must retain the above copyright notice, this list of conditions, and the following disclaimer.
#  
#  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions, and the following disclaimer in the documentation
#     and/or other materials provided with the distribution.
#  
#  3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software
#     without specific prior written permission.
#  
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
#  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
#  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
#  DAMAGE.
#  @endparblock
#########################################################################################################################################################.H.E.##

#---------------------------------------------------------------------------------------------------------------------------------------------------------------
## GCC
FC       = gfortran
FFLAGS   = -pedantic -Wall -Wextra -std=f2023
%: %.f90
	 $(FC) $(shell sed -nr 's/^! @std.* F(.+)/--std=f\1/p' $<)  $(FFLAGS) $? -o $@	

#---------------------------------------------------------------------------------------------------------------------------------------------------------------
## LLVM FLANG
# FC       = flang
# FFLAGS   = -pedantic -Werror -std=f2023
# %: %.f90
# 	 $(FC) $(FFLAGS) $? -o $@	

#---------------------------------------------------------------------------------------------------------------------------------------------------------------
## INTEL
# FC = ifx
# FFLAGS = -warn:all
# %: %.f90
# 	 $(FC) $(shell sed -nr 's/^! @std.* F[0-9]*([0-9][0-9])/-stand:f\1/p' $<)  $(FFLAGS) $? -o $@	

# Put targets here
TARGETS  = func_opt_arg func_recursive overloading file_io array_rank
#TARGETS += prog_struct
TARGETS += case_statement loop_do loop_forall loopless_where
TARGETS += real_kinds real_kinds_ieee int_kind int_kind_c int_kind_2008 real_kinds_2008 
TARGETS += no_advance_print format  
TARGETS += proc_env proc_args 
TARGETS += array_dynamic array_sections array_elemental
TARGETS += array_reduction array_linear_alg array_init2003 array_init1995
TARGETS += pointers_linked_list
TARGETS += variable_decl
TARGETS += namelist_read namelist_write

all : $(TARGETS)
	@echo Make Complete

clean :
	rm -rf a.out *~ *.bak *.mod *.obj *.o *.exe *__genmod.f90 file_io.txt $(TARGETS)
	@echo Clean Complete

prog_struct : mod_struct.f90 prog_struct.f90 


