#import <objc/Object.h>
#import "Lilac.h"
#import "NSString.h"

@class NSArray;

@interface NSStringCF : NSString {
  char *c_string;
  CFStringRef value; 
}

@end

