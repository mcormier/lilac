
const char* value = "\"C:\\Users\\Matthieu.Cormier\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe\" -- \"%1\"";

// CFStringCreateArrayBySeparatingStrings

#import <objc/Object.h>
#import <objc/NXConstStr.h>
#import "NSString.h"
#import "NSArray.h"

int main ( int argc, const char * argv[] ) {

  NSString *regValue = [[NSString alloc] initWithCString: value encoding:NSISOLatin1StringEncoding];
  [regValue print];

  NSString *sepValue = [[NSString alloc] initWithCString:"\"" encoding:NSISOLatin1StringEncoding];

  NSArray *array = [regValue componentsSeparatedByString:sepValue];
  int count = [array count];
  printf("the count is %i \n", count);

  [regValue release];
  [sepValue release];

  return 0;
}

