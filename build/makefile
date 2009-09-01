#
# GNU make manual
# http://www.gnu.org/software/make/manual/make.html
#

objects = NSString.o NSConstantString.o test.o NSObject.o NSArray.o NSStringCF.o

INCLUDES=-I/cygdrive/c/Dev/usr/include
DLL_LIB_DIR=-L/cygdrive/c/Dev/usr/lib 
LIBS=$(DLL_LIB_DIR) -lCoreFoundation -lpthread -lobjc -lm
OPTS=-mno-cygwin -Wno-import -fconstant-string-class=NSConstantString

LINK= gcc $(LIBS) -o
COMPILE= gcc $(INCLUDES) -c $(OPTS)


vpath %.m ../src
vpath %.h ../src


test : $(objects)
		$(LINK) test $(OPTS) $(objects) -lobjc


test.o : test.m
		$(COMPILE) ../src/test.m 

NSObject.o : NSObject.h NSObject.m
		$(COMPILE) ../src/NSObject.m 

NSArray.o : NSArray.h NSArray.m
		$(COMPILE) ../src/NSArray.m 

NSConstantString.o : NSConstantString.h NSConstantString.m
		$(COMPILE) ../src/NSConstantString.m 

NSString.o : NSString.h NSString.m
		$(COMPILE) ../src/NSString.m 

NSStringCF.o : NSStringCF.h NSStringCF.m
		$(COMPILE) ../src/NSStringCF.m 

.PHONY : clean
clean :
		rm *.o test.exe

