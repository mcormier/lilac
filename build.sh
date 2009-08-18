#!/usr/bin/bash



# TODO -- use strict mode
# W -Wall -ansi -pedantic -O2 foo.c

#WARN_OPTIONS=-pedantic

LIBS="-lCoreFoundation -lpthread -lobjc -lm" 
OPTS="-g -mno-cygwin"

OUTFILE=output.txt

# TODO - check that the build directory exists.

cd build

gcc -c ../src/NSString.m ../src/test.m
gcc -o test NSString.o test.o -lobjc


exit
# Core foundation stuff...

if [ -z "$1" ] ; then
  echo "I'm hungry give me a parameter."
  exit
fi

gcc  -o reader $WARN_OPTIONS -I/cygdrive/c/Dev/usr/include \
     -L/cygdrive/c/Dev/usr/lib \
     $LIBS $OPTS $1 > $OUTFILE 2>&1

if [ -s "$OUTFILE" ] ; then
  less output.txt
fi

#mv reader.exe lib/
