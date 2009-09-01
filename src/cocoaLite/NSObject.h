#import <objc/Object.h>

@interface NSObject : Object {
}

-(void)dealloc;
-(oneway void)release;

+(Class)class; 
@end
