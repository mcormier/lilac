#import "NSArray.h"

@implementation NSArray

- (id)init {

  if ( self = [super init] ) {
  }

  return self;

}

- (id)initWithCFArray:(CFArrayRef) arrayRef {

  if ( [self init] ) {
    value = arrayRef;
  }

  return self;
}

- (unsigned int)count {
 return CFArrayGetCount(value);
}
@end
