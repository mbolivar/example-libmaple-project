#!/bin/bash

SCRIPT=`readlink -f $0`
USER_MODULES=`dirname $SCRIPT` make -f $LIB_MAPLE_HOME/Makefile $@
