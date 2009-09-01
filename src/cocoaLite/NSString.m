#import "NSString.h"
#import "NSArray.h"
#import "NSStringCF.h"

@implementation NSString

// NSString is a stub class that creates another class
// that extends NSString.  We need to do this
// so that the variable signature does not interfere
// with NSConstantString which allows us to use @"blah"
// to construct strings.
+ (id)alloc {
  return (id)class_create_instance([NSStringCF class]); 
}

- (id)init {

  if ( self = [super init] ) {
  }

  return self;

}

- (id)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding {
  printf( "This method should not be called \n");
  if ( [self init] ) {
  } 

  return self;
}

-(void)print {
   printf( "This method should not be called \n");
}

- (NSArray *)componentsSeparatedByString:(NSString *)separator {
  // TODO -- encoding is hardcoded
  CFStringRef otherValue = CFStringCreateWithCString(NULL, [separator cString], NSISOLatin1StringEncoding);
  CFStringRef thisValue = CFStringCreateWithCString(NULL, [self cString], NSISOLatin1StringEncoding);

  // TODO -- do we need to release otherValue?
  CFArrayRef array = CFStringCreateArrayBySeparatingStrings(NULL, thisValue, otherValue);
  NSUInteger arySz = CFArrayGetCount(array);

  if ( array ) {
    NSString *strings[arySz];

    NSInteger i;
    for ( i = 0; i < arySz ; i++ ) {
      CFStringRef str = CFArrayGetValueAtIndex(array,i);
      // Add one for null char termination
      CFIndex strLen = CFStringGetLength(str) + 1;
      char cString[strLen];
      Boolean success = CFStringGetCString(str, cString, strLen, kCFStringEncodingWindowsLatin1);
      // TODO -- check success value.
      strings[i] = [[NSString alloc] initWithCString: cString encoding:NSISOLatin1StringEncoding];
    }

  NSArray *toReturn = [[NSArray alloc] initWithObjects:strings count:arySz];
  // TODO -- autoRelease
  return toReturn;
  }

  return NULL;

}


-(const char *) cString {
  printf( "This method should not be called \n");
  return "";
}

-(NSUInteger) length {
  printf( "This method should not be called \n");
  return 0;
}

@end
