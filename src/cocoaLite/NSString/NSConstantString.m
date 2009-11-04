#import "NSString.h"

@implementation NSConstantString

-(const char *) cString
{
  return (c_string);
} 

-(unsigned int) length
{
  return (len);
} 

@end
