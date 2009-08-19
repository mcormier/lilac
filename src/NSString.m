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
   // TODO -- magic number + hard limit..
   char url[2048];
    Boolean success = CFStringGetCString(value, url, 2048, kCFStringEncodingWindowsLatin1);
    // TODO -- check success value.
    printf( "The value is : %s \n", url );
}

- (NSArray *)componentsSeparatedByString:(NSString *)separator {
  CFArrayRef array = CFStringCreateArrayBySeparatingStrings(NULL, value, separator->value); 

  if ( array ) {
    NSArray *toReturn = [[NSArray alloc] initWithCFArray:array];
    return toReturn;
  } 

  return NULL;
}


-(const char *) cString {
  return "";
}

-(unsigned int) length {
  return 0;
}

@end
