#import "NSObject.h"
#import "NSObjCRuntime.h"

@interface NSArray : NSObject {
  CFArrayRef value;  
}

- (id)initWithObjects:(const id *)objects count:(NSUInteger)count;
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;


@end
