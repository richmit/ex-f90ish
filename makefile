##
# @file      makefile
# @author    Mitch Richling <https://www.mitchr.me/>
# @Copyright Copyright 1996,1998,2006,2009,2012 by Mitch Richling.  All rights reserved.
# @brief     @EOL
# @Keywords  
# @Std       GNU Make

################################################################################################################################################################
# GCC
FC       = gfortran
FFLAGS   = -pedantic -Wall -Wextra
%: %.f90
	 $(FC) $(shell sed -nr 's/^! @std.* F(.+)/--std=f\1/p' $<)  $(FFLAGS) $? -o $@	

################################################################################################################################################################
# LLVM FLANG -- At the time of this witeing, flang dosen't suport anyting but F2018 and has limited command line options
# FC       = flang
# FFLAGS   = -pedantic -Werror -std=f2018
# %: %.f90
# 	 $(FC) $(FFLAGS) $? -o $@	

################################################################################################################################################################
# INTEL
# FC = ifx
# FFLAGS = -warn:all
# %: %.f90
# 	 intel-dev-msys2-wrapper.sh $(FC) $(shell sed -nr 's/^! @std.* F[0-9]*([0-9][0-9])/-stand:f\1/p' $<)  $(FFLAGS) $? -o $@	

# Put targets here
TARGETS  = func_opt_arg func_recursive overloading 
#TARGETS += prog_struct
TARGETS += case_statement loop_do loop_forall loopless_where
TARGETS += real_kinds real_kinds_ieee int_kind int_kind_c int_kind_2008 real_kinds_2008 
TARGETS += no_advance_print format  
TARGETS += proc_env proc_args 
TARGETS += array_dynamic array_sections array_elemental
TARGETS += array_reduction array_linear_alg array_init2003 array_init1995
TARGETS += pointers_linked_list
TARGETS += variable_decl

all : $(TARGETS)
	@echo Make Complete

clean :
	rm -rf a.out *~ *.bak *.mod *.obj *.o *.exe *__genmod.f90 $(TARGETS)
	@echo Clean Complete

prog_struct : mod_struct.f90 prog_struct.f90 


