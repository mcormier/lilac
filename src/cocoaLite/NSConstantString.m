#import "NSString.h"

@implementation NSConstantString

-(const char *) cString
{
  return (c_string);
} /* -cString */

-(unsigned int) length
{
  return (len);
} /* -length */

@end
