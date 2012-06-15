What's This?
============

This is an example libmaple project which illustrates how to use the
libmaple build system to compile and link your source code correctly.

It works with libmaple fetched from the LeafLabs GitHub repository:

   https://github.com/leaflabs/libmaple

libmaple's build system is a little complicated, and the library makes
a lot of assumptions about how it gets compiled and linked. For that
reason, the easiest thing to do when starting a new project is just to
use libmaple's Makefile, and inform it to build your sources.

How Do I Use It?
================

The file rules.mk is a Makefile fragment that tells libmaple's own
Makefile how to build your project's sources. Use it as a template for
starting your own project.

You can build this project and link it with libmaple by:

1. Setting the environment variable LIB_MAPLE_HOME to point to where
   you have the libmaple Git repository.

2. Telling make to use libmaple's Makefile, and telling that Makefile
   to pay attention to this rules.mk, like this:

   $ make -f $LIB_MAPLE_HOME/Makefile USER_MODULES=/path/to/this/project

What Else?
==========

You're using the libmaple Makefile, so you can also use any of the
variables it respects. For instance, to compile for Maple Mini, use
BOARD=maple_mini in the usual way:

$ make -f $LIB_MAPLE_HOME/Makefile BOARD=maple_mini USER_MODULES=/path/to/this/project

You can also use any of the libmaple Makefile targets. For example, to
"make install":

$ make -f $LIB_MAPLE_HOME/Makefile USER_MODULES=/path/to/this/project install

To save typing, there's a shell script, make-helper.sh, that you can
call which just runs the above command line, and passes any additional
arguments along to make. Examples:

$ ./make-helper.sh clean
$ ./make-helper.sh BOARD=maple_mini install

Happy hacking!
