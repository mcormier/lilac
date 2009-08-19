#import "NSConstantString.h"

@implementation NSConstantString

-copy {
   return self;
}

-retain {
   return self;
}

-(void)release {
}

-autorelease {
   return self;
}

-(void)dealloc {
   return;
   [super dealloc];
}


-(void)print {
  printf("Constant String implementation with length of %i \n", len);
}

@end
