#
# GNU make manual
# http://www.gnu.org/software/make/manual/make.html
#

objects = NSString.o NSConstantString.o main.o NSObject.o NSArray.o NSStringCF.o WinHelper.o

INCLUDES=-I/cygdrive/c/Dev/usr/include -I../src
DLL_LIB_DIR=-L/cygdrive/c/Dev/usr/lib 
LIBS=$(DLL_LIB_DIR) -lCoreFoundation -lpthread -lobjc -lm

COMPILEOPTS=-Wno-import -fconstant-string-class=NSConstantString
LINKOPTS=-mno-cygwin -fconstant-string-class=NSConstantString

LINK= gcc $(LIBS) -o
COMPILE= gcc $(INCLUDES) -c $(COMPILEOPTS)


vpath %.m ../src:../src/cocoaLite:../src/mondoWin32
vpath %.h ../src:../src/cocoaLite:../src/mondoWin32


.PHONY : main
main : $(objects)
		$(LINK) main $(LINKOPTS) $(objects) -lobjc


main.o : main.m
		$(COMPILE) ../src/main.m 

WinHelper.o : WinHelper.h WinHelper.m
		$(COMPILE) ../src/mondoWin32/WinHelper.m 

NSObject.o : NSObject.h NSObject.m
		$(COMPILE) ../src/cocoaLite/NSObject.m 

NSArray.o : NSArray.h NSArray.m
		$(COMPILE) ../src/cocoaLite/NSArray.m 

NSConstantString.o : NSString.h NSConstantString.m
		$(COMPILE) ../src/cocoaLite/NSConstantString.m 

NSString.o : NSString.h NSString.m
		$(COMPILE) ../src/cocoaLite/NSString.m 

NSStringCF.o : NSStringCF.h NSStringCF.m
		$(COMPILE) ../src/cocoaLite/NSStringCF.m 

.PHONY : clean
clean :
		rm *.o main.exe

