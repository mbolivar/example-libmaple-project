What's This?
============

This is an example project, which shows how to use the libmaple build
system to compile and upload your own projects.

It works with libmaple fetched from the LeafLabs GitHub repository:

   https://github.com/leaflabs/libmaple

IMPORTANT: To hack around the libmaple build system (the poor thing
           gets so confused), you MUST have an empty main.cpp in the
           libmaple directory. I know that's annoying; sorry.

How Do I Use It?
================

Look at rules.mk. It's a Makefile fragment that tells libmaple's
Makefile how to build your project's sources. Use it as a template for
starting your own project.

Build this project and link it with libmaple like this:

1. Set the environment variable LIB_MAPLE_HOME to point to where you
   have the libmaple Git repository.

2. Tell make to use libmaple's Makefile, and have it pay attention to
   your rules.mk, like this:

   $ make -f $LIB_MAPLE_HOME/Makefile USER_MODULES='/path/to/this/project/foolib /path/to/this/project'

   The first part of USER_MODULES tells libmaple to use this
   directory's rules.mk. The second part tells it about an extra
   library, foolib, that your project uses, which has its own
   rules.mk.

What Else?
==========

You're using the libmaple Makefile, so you can also use any of the
variables it respects. For instance, to compile for Maple Mini, use
BOARD=maple_mini in the usual way:

$ make -f $LIB_MAPLE_HOME/Makefile BOARD=maple_mini USER_MODULES='/path/to/this/project/foolib /path/to/this/project'

You can also use any of the libmaple Makefile targets. For example, to
"make install":

$ make -f $LIB_MAPLE_HOME/Makefile USER_MODULES='/path/to/this/project/foolib /path/to/this/project

To save typing, there's a shell script, make-helper.sh, that you can
call which just runs the above command line, and passes any additional
arguments along to make (note: it puts the build path in the directory
you call it from). Examples:

$ ./make-helper.sh clean
$ ./make-helper.sh BOARD=maple_mini install

Happy hacking!
