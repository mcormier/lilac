#!/usr/bin/bash

# TODO -- use a proper build framework instead of just
#  a shell script.
# TODO -- use strict mode
# W -Wall -ansi -pedantic -O2 foo.c

#WARN_OPTIONS=-pedantic

INCLUDES="-I/cygdrive/c/Dev/usr/include " 
DLL_LIB_DIR="-L/cygdrive/c/Dev/usr/lib "
LIBS="${DLL_LIB_DIR} -lCoreFoundation -lpthread -lobjc -lm" 
OPTS="-mno-cygwin -Wno-import "


# TODO - check that the build directory exists.

cd build

gcc $INCLUDES -c $OPTS ../src/NSString.m ../src/NSArray.m ../src/NSObject.m ../src/NSConstantString.m ../src/test.m 


gcc $LIBS -o test $OPTS NSString.o NSConstantString.o test.o NSObject.o NSArray.o -lobjc





exit

if [ -z "$1" ] ; then
  echo "I'm hungry give me a parameter."
  exit
fi

OUTFILE=output.txt
gcc  -o reader $WARN_OPTIONS -I/cygdrive/c/Dev/usr/include \
     -L/cygdrive/c/Dev/usr/lib \
     $LIBS $OPTS $1 > $OUTFILE 2>&1

if [ -s "$OUTFILE" ] ; then
  less output.txt
fi

#mv reader.exe lib/
