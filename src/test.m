
const char* value = "\"C:\\Users\\Matthieu.Cormier\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe\" -- \"%1\"";

// TODO -- get @"" notation working..

#import <objc/Object.h>
#import <objc/NXConstStr.h>
#import "NSString.h"
#import "NSArray.h"
#import "NSConstantString.h"

int main ( int argc, const char * argv[] ) {

  NSString *regValue = [[NSString alloc] initWithCString: value encoding:NSISOLatin1StringEncoding];
  [regValue print];

  NSString *sepValue = [[NSString alloc] initWithCString:"\"" encoding:NSISOLatin1StringEncoding];

  NSArray *array = [regValue componentsSeparatedByString:sepValue];
  int count = [array count];
  printf("the count is %i \n", count);

  int i;
  for (i = 0; i < [array count]; i++ ) {
    NSString* blah = [array objectAtIndex:i];
    [blah print];  
  }

  [regValue release];
  [sepValue release];

  NSConstantString *cnstString = @"constant String";
  printf("The length is %i \n", [cnstString length]);

  return 0;
}

