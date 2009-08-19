#import "NSObject.h"

@implementation NSObject

// TODO -- check ref count before releasing.
- (oneway void)release {
  [self free];
  self = nil;
}

-(void)dealloc {
}

@end
