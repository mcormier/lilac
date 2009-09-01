#import <objc/Object.h>

#import "Lilac.h"
#import "CFLite.h"
#import "NSObject.h"

@interface NSArray : NSObject {
  CFArrayRef value;  
}

- (id)initWithObjects:(const id *)objects count:(NSUInteger)count;
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;


@end
