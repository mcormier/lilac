#import "NSString.h"
#import "NSStringCF.h"

#import <cocoaLite/NSArray.h>

@implementation NSString

// NSString is a stub class that creates another class
// that extends NSString.  We need to do this
// so that the variable signature does not interfere
// with NSConstantString which allows us to use @"blah"
// to construct strings.
+ (id)alloc {
  return (id)class_create_instance([NSStringCF class]); 
}

- (id)init {

  if ( self = [super init] ) {
  }

  return self;

}

- (id)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding {
  printf( "This method should not be called \n");
  if ( [self init] ) {
  } 

  return self;
}



-(id)initWithFormat:(NSString *)format arguments:(va_list)arguments {
  
   // TODO -- call NSStringNewWithFormat(format,locale,arguments,NULL); from impl classes.
  
   //return [self initWithFormat:format locale:nil arguments:arguments];
   return NULL;
}

-(id)initWithFormat:(NSString *)format, ... {
   va_list arguments;

   va_start(arguments,format);
   id result=[self initWithFormat:format arguments:arguments];
   va_end(arguments);

   return result;
}

-(void)getCharacters:(unichar *)buffer {
   printf( "This method should not be called \n");
}

-(void)print {
   printf( "This method should not be called \n");
}


- (NSArray *)componentsSeparatedByString:(NSString *)separator {
  CFStringRef otherValue = CFStringCreateWithCString(NULL, [separator cString], NSISOLatin1StringEncoding);
  CFStringRef thisValue = CFStringCreateWithCString(NULL, [self cString], NSISOLatin1StringEncoding);

  // TODO -- do we need to release otherValue?
  CFArrayRef array = CFStringCreateArrayBySeparatingStrings(NULL, thisValue, otherValue);
  NSUInteger arySz = CFArrayGetCount(array);
  CFRelease(otherValue);
  CFRelease(thisValue);

  if ( array ) {
    NSString *strings[arySz];

    NSInteger i;
    for ( i = 0; i < arySz ; i++ ) {
      CFStringRef str = CFArrayGetValueAtIndex(array,i);
      // Add one for null char termination
      CFIndex strLen = CFStringGetLength(str) + 1;
      char cString[strLen];
      Boolean success = CFStringGetCString(str, cString, strLen, kCFStringEncodingWindowsLatin1);
      // TODO -- check success value.
      strings[i] = [[NSString alloc] initWithCString: cString encoding:NSISOLatin1StringEncoding];
    }

  NSArray *toReturn = [[NSArray alloc] initWithObjects:strings count:arySz];
  CFRelease(array);
  // TODO -- autoRelease
  return toReturn;
  }

  return NULL;

}


- (NSString *)stringByAppendingString:(NSString *)aString {
  NSStringEncoding encoding = NSISOLatin1StringEncoding;
  CFStringRef firstString = CFStringCreateWithCString(NULL, [self cString], encoding);
  CFStringRef secondString = CFStringCreateWithCString(NULL, [aString cString], encoding);
  
  // Combine the strings using a mutable string
  CFMutableStringRef mutString = CFStringCreateMutableCopy(NULL, 0, firstString);
  CFStringAppend(mutString, secondString);
  CFRelease( firstString );
  CFRelease( secondString ); 

  // Get the cString version of the mutable string
  CFIndex strLen = CFStringGetLength(mutString) + 1;
  char cString[strLen];
  Boolean success = CFStringGetCString(mutString, cString, strLen, encoding);
  
  // Create the NSString
  NSString *appendedString = NULL;
  if (success) {
    appendedString  = [[NSString alloc] initWithCString:cString encoding:encoding];
  }
  CFRelease(mutString);

  return appendedString;
}

-(const char *) cString {
  printf( "This method should not be called \n");
  return "";
}

-(NSUInteger) length {
  printf( "This method should not be called \n");
  return 0;
}

@end
