#import "NSArray.h"

@implementation NSArray

- (id)init {

  if ( self = [super init] ) {
  }

  return self;

}

- (id)initWithObjects:(const id *)objects count:(NSUInteger)count {
  if ( [self init] ) {
    const void **values = (const void **)objects;
    value = CFArrayCreate(NULL, values, count, NULL);
  }

  return self;
}

- (NSUInteger)count {
 return CFArrayGetCount(value);
}
 
- (id)objectAtIndex:(NSUInteger)index {
  CFIndex idx = index;
   
  return (id)CFArrayGetValueAtIndex(value, idx);
}

@end
