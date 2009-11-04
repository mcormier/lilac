#import "NSString.h"
#import <cocoaLite/NSObjCRuntime.h>

@class NSArray;

@interface NSStringCF : NSString {
  char *c_string;
  CFStringRef value; 
}

@end

