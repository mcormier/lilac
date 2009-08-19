#import <objc/Object.h>
#import "CFLite.h"
#import "NSObject.h"

@interface NSArray : NSObject {
  CFArrayRef value;  
}

- (id)initWithCFArray:(CFArrayRef) arrayRef;
- (unsigned int)count;
@end
