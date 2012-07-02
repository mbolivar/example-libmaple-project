#!/bin/bash

SCRIPT=`readlink -f $0`
SCRIPTDIR=`dirname $SCRIPT`
USER_MODULES="$SCRIPTDIR/libfoo $SCRIPTDIR" make -f $LIB_MAPLE_HOME/Makefile $@
