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
FFLAGS   = -Wall -Wextra
%: %.f90
	 $(FC) -pedantic $(shell sed -nr 's/^! @std.* F(.+)/--std=f\1/p' $<)  $(FFLAGS) $? -o $@	

################################################################################################################################################################
# INTEL
# FC = ifort
# %: %.f90
#	 $(FC) -pedantic $(shell sed -nr 's/^! @std.* F(.+)/-std=f\1 -e\1/p' $<)  $(FFLAGS) $? -o $@	

# Put targets here
TARGETS  = func_opt_arg func_recursive overloading 
TARGETS += prog_struct
TARGETS += case_statement loop_do loop_forall loopless_where
TARGETS += real_kinds real_kinds_ieee int_kind int_kind_c int_kind_2008 real_kinds_2008
TARGETS += no_advance_print format  
TARGETS += proc_env proc_args 
TARGETS += array_dynamic array_dynamic2 array_sections array_elemental
TARGETS += array_reduction array_linear_alg array_init2003 array_init1995
TARGETS += pointers_linked_list
TARGETS += variable_decl

all : $(TARGETS)
	@echo Make Complete

clean :
	rm -rf a.out *~ *.bak *.mod *.obj *.o *.exe $(TARGETS)
	@echo Clean Complete

prog_struct : mod_struct.f90 prog_struct.f90 
	$(FC) -pedantic $(shell sed -nr 's/^! @std.* F(.+)/--std=f\1/p' $<)  $(FFLAGS) $(TARGET_ARCH) $? -o $@	


