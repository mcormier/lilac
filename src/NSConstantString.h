
#include <objc/Object.h>
#import "NSString.h"
#import "TestObj.h"

// TODO -- extend NSString.
// Extending NSString appears to change the signature
// and this doesn't work.

@interface NSConstantString: NSString {
  char *c_string;
  unsigned int len;
}

-(const char *) cString;
-(unsigned int) length;

@end


