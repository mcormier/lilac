#
# GNU make manual
# http://www.gnu.org/software/make/manual/make.html
#


# The following two lines force the standard make to recognize the 
# Objective-C .m suffix.
.SUFFIXES: .o .m
.m.o: ; $(COMPILE) $<


objects = NSString.o NSConstantString.o main.o NSObject.o NSArray.o NSStringCF.o WinHelper.o 

CC = gcc
CFLAGS = -g

INCLUDES=-I/cygdrive/c/Dev/usr/include -I../src
DLL_LIB_DIR=-L/cygdrive/c/Dev/usr/lib 
LIBS=$(DLL_LIB_DIR) -lCoreFoundation -lpthread -lobjc -lm

COMPILEOPTS=-Wno-import -fconstant-string-class=NSConstantString
LINKOPTS=-mno-cygwin -fconstant-string-class=NSConstantString

LINK= gcc $(LIBS) -o
COMPILE= gcc $(INCLUDES) -c $(COMPILEOPTS)

vpath %.m ../src:../src/cocoaLite:../src/mondoWin32:../src/cocoaLite/NSString:../src/cocoaLite/NSZone
vpath %.h ../src:../src/cocoaLite:../src/mondoWin32:../src/cocoaLite/NSString:../src/cocoaLite/NSZone



.PHONY : main
main : $(objects)
		$(LINK) lilac $(LINKOPTS) $(objects) -lobjc


main.o : main.m

WinHelper.o : WinHelper.h WinHelper.m

#####################
# Make CocoaLite
#####################
NSObject.o : NSObject.h NSObject.m
NSArray.o : NSArray.h NSArray.m
NSConstantString.o : NSString.h NSConstantString.m
NSString.o : NSString.h NSString.m
NSStringCF.o : NSStringCF.h NSStringCF.m



.PHONY : clean
clean :
		rm *.o main.exe

