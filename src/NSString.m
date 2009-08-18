#import "NSString.h"

@implementation NSString

- (id)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding {
  // TODO -- throw an exception if the encoding isn't tested/supported.
  
  return self;
}

-(void)world {
  printf("Hello World!\n");
}

// TODO -- this should go in an NSObject class.
- (oneway void)release {
  [self free];
  self = nil;
}

@end
