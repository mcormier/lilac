#import "NSString.h"
#import "NSArray.h"

@implementation NSString


- (id)init {

  if ( self = [super init] ) {
  }

  return self;

}

- (id)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding {

  if ( [self init] ) {
    value = CFStringCreateWithCString(NULL, nullTerminatedCString, encoding);
  } 

  return self;
}

-(void)print {
   // Add one extra character for null termination
   CFIndex strLen = CFStringGetLength(value) + 1;
   char cString[strLen];
   Boolean success = CFStringGetCString(value, cString, strLen, kCFStringEncodingWindowsLatin1);
   // TODO -- check success value.
   printf( "The value is : %s \n", cString );
}

- (NSArray *)componentsSeparatedByString:(NSString *)separator {
  CFArrayRef array = CFStringCreateArrayBySeparatingStrings(NULL, value, separator->value); 
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
  return "";
}

-(NSUInteger) length {
  return CFStringGetLength(value);
}

@end
