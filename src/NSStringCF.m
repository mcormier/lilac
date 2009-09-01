#import "NSStringCF.h"
#import "NSArray.h"

@implementation NSStringCF

- (id)init {

  if ( self = [super init] ) {
  }

  return self;

}

- (id)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding {
  if ( [self init] ) {
    value = CFStringCreateWithCString(NULL, nullTerminatedCString, encoding);
    c_string = (char *)nullTerminatedCString;
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


-(const char *) cString {
  return (c_string);
}

-(NSUInteger) length {
  return CFStringGetLength(value);
}

@end
