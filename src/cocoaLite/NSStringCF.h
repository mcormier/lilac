#import "NSString.h"
#import "NSObjCRuntime.h"

@class NSArray;

@interface NSStringCF : NSString {
  char *c_string;
  CFStringRef value; 
}

@end

