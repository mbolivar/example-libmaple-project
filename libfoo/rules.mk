# foolib rules.mk file.

include $(MAKEDIR)/header.mk

FOO_INCLUDES := -I$(d)/include
CFLAGS_$(d) := $(WIRISH_INCLUDES) $(LIBMAPLE_INCLUDES) $(FOO_INCLUDES)
cppSRCS_$(d) := foo.cpp

include $(MAKEDIR)/footer.mk
