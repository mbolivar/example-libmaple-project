# Template rules.mk file.

# First, include the standard libmaple rules.mk header. Leave this
# line alone.
include $(MAKEDIR)/header.mk

###############################################################################

### Change this middle section for your project.

### Source subdirectories

# If any subdirectories contain source files, we have to add them to
# the variable BUILDDIRS, like this. $(BUILD_PATH) is the directory
# where compilation output (like object files) goes. The variable $(d)
# gets expanded to the directory containing this rules.mk file.
PROJECT_BUILD_DIRS := getter
PROJECT_BUILD_DIRS += randomizer

BUILDDIRS += $(addprefix $(BUILD_PATH)/$(d)/, $(PROJECT_BUILD_DIRS))

### Local flags: these control how the compiler gets called.

# Here we set a variable for our project's include directories.  Note
# that the project top-level directory (i.e., the one containing this
# rules.mk file) is automatically used for include files, so you don't
# need to add it here.
PROJECT_INCLUDE_DIRS := include
PROJECT_INCLUDE_DIRS += libfoo/include

#EXTERNAL_INCLUDE_DIRS := /some/external/include/dir/with/absolute/path

FLAGS_ABS_INCLUDE := $(addprefix -I$(d)/, $(PROJECT_INCLUDE_DIRS))
FLAGS_ABS_INCLUDE += $(addprefix -I/, $(EXTERNAL_INCLUDE_DIRS))

# CFLAGS_$(d) are additional flags you want to give the C compiler.
# WIRISH_INCLUDES and LIBMAPLE_INCLUDES provide the appropriate GCC -I
# switches to let you include libmaple headers. FOO_INCLUDES gives the
# include switches you need for the foolib headers.
CFLAGS_$(d) := $(WIRISH_INCLUDES) $(LIBMAPLE_INCLUDES) $(FOO_INCLUDES)
# We'll also want our local include directory
CFLAGS_$(d) += $(FLAGS_ABS_INCLUDE)

# CXXFLAGS_$(d) are extra flags passed to the C++ compiler. We'll need
# our include directory, and we'll also add an extra definition as a
# demo (look in getter.cpp for how it's used).
CXXFLAGS_$(d) := -DMY_MAGIC_NUMBER=0x1eaf1ab5 $(FLAGS_ABS_INCLUDE)

# ASFLAGS_$(d) are extra flags passed to the assembler. We don't
# have any assembly language files in this example, so we'll just
# leave it empty.
ASFLAGS_$(d) :=

### Local rules

# You can add any additional rules you want here. We don't have
# any extra rules to add.

### Source files

# cSRCS_$(d) are the C source files we want compiled.
cSRCS_$(d) := randomizer/randomizer.c

# cppSRCS_$(d) are the C++ sources we want compiled.  We have our own
# main.cpp, and one additional file.
#
# We can't call our main file main.cpp, or libmaple's build system
# will get confused and try to build it without our CXXFLAGS. So call
# it something else. Annoying! Hopefully LeafLabs will fix it soon.
cppSRCS_$(d) := real-main.cpp
cppSRCS_$(d) += getter/getter.cpp

# sSRCS_$(d) are the assembly sources. We don't have any.
sSRCS_$(d) :=

###############################################################################

# Include the libmaple rules.mk footer. Leave this line alone.
include $(MAKEDIR)/footer.mk
