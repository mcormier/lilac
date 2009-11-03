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

-(void)print {
	printf("%s\n", c_string);
}

@end
