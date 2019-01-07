# **********************************************************************
#
# Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir	= ..\..

NAME		= $(top_srcdir)\bin\slice2py.exe

TARGETS		= $(NAME)

OBJS		= .\Main.obj

!include $(top_srcdir)/config/Make.rules.mak

CPPFLAGS	= -I. $(CPPFLAGS) -DWIN32_LEAN_AND_MEAN

!if "$(GENERATE_PDB)" == "yes"
PDBFLAGS        = /pdb:$(NAME:.exe=.pdb)
!endif

RES_FILE        = Slice2Py.res

$(NAME): $(OBJS) Slice2Py.res
	$(LINK) $(LD_EXEFLAGS) $(PDBFLAGS) $(OBJS) $(SETARGV) $(PREOUT)$@ $(PRELIBS) \
		$(BASELIBS) $(RES_FILE)
	@if exist $@.manifest echo ^ ^ ^ Embedding manifest using $(MT) && \
	    $(MT) -nologo -manifest $@.manifest -outputresource:$@;#1 && del /q $@.manifest

clean::
	del /q $(NAME:.exe=.*)
	del /q Slice2Py.res

install:: all
	copy $(NAME) "$(install_bindir)"

!if "$(GENERATE_PDB)" == "yes"

install:: all
	copy $(NAME:.exe=.pdb) "$(install_bindir)"

!endif