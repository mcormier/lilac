#import <cocoaLite/Cocoa.h>

@interface WinHelper : NSObject {
}

+ (NSString*)defaultBrowserPath;

// Opens the supplied url string in the
// default browser.
+ (void) openInBrowser:(NSString*)url;

@end
