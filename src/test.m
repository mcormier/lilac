
const char* value = "\"C:\\Users\\Matthieu.Cormier\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe\" -- \"%1\"";

#import <objc/Object.h>
#import "cocoaLite/Cocoa.h"

int main ( int argc, const char * argv[] ) {

  NSString *regValue = [[NSString alloc] initWithCString: value encoding:NSISOLatin1StringEncoding];

  NSArray *array = [regValue componentsSeparatedByString:@"\""];
  int count = [array count];
  printf("the count is %i \n", count);

  int i;
  for (i = 0; i < [array count]; i++ ) {
    NSString* blah = [array objectAtIndex:i];
    [blah print];  
  }

  [regValue release];

  return 0;
}

