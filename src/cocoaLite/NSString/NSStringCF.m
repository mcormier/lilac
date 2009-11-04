#import "NSStringCF.h"

#import <cocoaLite/NSArray.h>

@implementation NSStringCF

- (id)init {

  if ( self = [super init] ) {
  }

  return self;

}

- (id)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding {
  if ( [self init] ) {
    // TODO -- dealloc string in dealloc method
    NSInteger strLen = strlen(nullTerminatedCString);
    c_string = (char *) malloc (strLen + 1);
    strcpy( c_string, nullTerminatedCString );

    value = CFStringCreateWithCString(NULL, nullTerminatedCString, encoding);
  }

  return self;
}

-(void)print {
   // Add one extra character for null termination
   CFIndex strLen = [self length] + 1;
   char cString[strLen];
   Boolean success = CFStringGetCString(value, cString, strLen, kCFStringEncodingWindowsLatin1);
   // TODO -- check success value.
   printf( "%s \n", cString );
}


-(const char *) cString {
  return (c_string);
}

-(NSUInteger) length {
  return CFStringGetLength(value);
}

@end
