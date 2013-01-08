What's This?
============

This is an example project, which shows how to use the libmaple build
system to compile and upload your own projects.

It works with libmaple fetched from the LeafLabs GitHub repository:

   https://github.com/leaflabs/libmaple

IMPORTANT: To hack around the libmaple build system (the poor thing
           gets so confused), you MUST have an empty main.cpp in the
           libmaple directory. I know that's annoying; sorry. Just
           copy this empty main.cpp file to the root directory of
           libmaple.

How Do I Use It?
================

There are two configuration files: Makefile and rules.mk.

Look at Makefile. It's your project Makefile which behaves like a proxy
to libmaple Makefile. Use it as a template for starting your own project.

The following variables needs to be configured:

LIB_MAPLE_HOME - should point to the root directory of libmaple project,
                 may be defined as relative path, say '~/maple/libmaple'. 

BOARD          - board type. Use 'make list-boards' to see the list of
                 supported boards.

MEMORY_TARGET  - binary deployment type: 'flash', 'ram' or 'jtag'. See
                 'make help' for details. 

Also, custom libmaple modules may be configured with USER_MODULES variable.
Your project is a user module and it is configured implicitly. Libfoo is
another user module defined inside of your project (user module inside of
user module).

It is important not to confuse a concept of user module with a concept
of source files directory. User modules are concepts of higher level, they
are configured in Makefile. Each user module consists of some number of
source file directories and its own rules.mk file. Source file directories
of user module are configured in rules.mk file.

The rules.mk file is a Makefile fragment that is used in libmaple's build
system. It tells libmaple's Makefile how to build your project's sources.
Use it as a template for starting your own project.

Use 'make clean' command to clean your project. Use 'make sketch' to build
your project and link it with libmaple

How Do I Use It with Eclipse CDT?
=================================

1) perform 'git clone' for libmaple and example-libmaple-project
   repositories
2) import libmaple project with:
   File -> New -> Project -> C/C++ -> Makefile Project with Existing Code  
3) import example-libmaple-project project the same way
4) right click on example-libmaple-project project, open:
   Properties -> C/C++ Build -> Behaviour tab
   and change default target name 'all' to 'sketch'
5) set LIB_MAPLE_HOME value in example-libmaple-project Makefile
6) copy main.cpp file from example-libmaple-project and paste it to the
   root of libmaple project
7) perform example-libmaple-project project clean and build

From this point you can start tweaking example-libmaple-project to
implement your own project. 

If you will have unresolved symbol errors in a Problems view for your
project, then fix it as follow:
1) right click on project and go Properties -> C/C++ General -> Indexer
2) turn on 'Enable project specific settings'
3) turn on 'Index unused headers as C files'
4) turn on 'Index unused headers as C++ files'
5) don't forget to save your settings with Apply or OK button

Also, you can add/use any Makefile targets to the Make Target view of
Eclipse CDT. It is located at top-right corner of workspace while using
C/C++ perspective. 

What Else?
==========

You're using the libmaple Makefile, so you can also use any of the
variables it respects. For instance, to compile for Maple Mini, use
BOARD=maple_mini in the usual way:

$ make BOARD=maple_mini USER_MODULES='/path/to/this/project/foolib /path/to/this/project'

You can also use any of the libmaple Makefile targets. For example, to
"make install":

$ make install USER_MODULES='/path/to/this/project/foolib /path/to/this/project'

Happy hacking!
