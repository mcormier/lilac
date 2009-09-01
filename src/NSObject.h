#import <objc/Object.h>
#import "CFLite.h"

@interface NSObject : Object {
}

-(void)dealloc;
-(oneway void)release;

+(Class)class; 
@end
