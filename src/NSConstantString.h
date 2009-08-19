#import "NSString.h"

// TODO -- figure out how to get  -fconstant-string-class=NSConstantString to
// work 
//
// Currently it works but when methods are called the variables aren't set.

@interface NSConstantString : NSString {
    char    *c_string;
    unsigned int  len;
}
@end
