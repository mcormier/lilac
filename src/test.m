
const char* value = "\"C:\\Users\\Matthieu.Cormier\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe\" -- \"%1\"";

// CFStringCreateArrayBySeparatingStrings

#import <objc/Object.h>
#import "NSString.h"

int main ( int argc, const char * argv[] ) {
  printf("Value --> %s\n", value);

  id hello;

  //hello = [[NSString alloc] init];
  hello = [[NSString alloc] initWithCString: value encoding:NSISOLatin1StringEncoding];
  [hello world];
  [hello release];

  return 0;
}

