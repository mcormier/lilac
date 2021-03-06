#import <cocoaLite/NSObject.h>
#import <cocoaLite/NSObjCRuntime.h>

typedef uint16_t unichar;

@class NSArray;

typedef enum {
   NSASCIIStringEncoding=1,
   NSNEXTSTEPStringEncoding=2,
   NSJapaneseEUCStringEncoding=3,
   NSUTF8StringEncoding=4,
   NSISOLatin1StringEncoding=5,
   NSSymbolStringEncoding=6,
   NSNonLossyASCIIStringEncoding=7,
   NSShiftJISStringEncoding=8,
   NSISOLatin2StringEncoding=9,
   NSUnicodeStringEncoding=10,
   NSWindowsCP1251StringEncoding=11,
   NSWindowsCP1252StringEncoding=12,
   NSWindowsCP1253StringEncoding=13,
   NSWindowsCP1254StringEncoding=14,
   NSWindowsCP1250StringEncoding=15,
   NSISO2022JPStringEncoding=21,
   NSMacOSRomanStringEncoding=30,
   NSProprietaryStringEncoding=0x00010000,
   NSUTF16BigEndianStringEncoding=0x90000100,
   NSUTF16LittleEndianStringEncoding=0x94000100,
   NSUTF32StringEncoding=0x8c000100,
   NSUTF32BigEndianStringEncoding=0x98000100,
   NSUTF32LittleEndianStringEncoding=0x9c000100,
} NSStringEncoding;

@interface NSString : NSObject {
}

-(const char *) cString;
-(NSUInteger) length;

-(id)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding;

-(NSArray *)componentsSeparatedByString:(NSString *)separator;
-(NSString *)stringByAppendingString:(NSString *)aString;


-(void)getCharacters:(unichar *)buffer;



@end

@interface NSConstantString: NSString {
  char *c_string;
  unsigned int len;
}

@end
