#import <cocoaLite/Cocoa.h>
#import <mondoWin32/WinHelper.h>


int main ( int argc, const char * argv[] ) {

    if ( argc > 1 ) {
      NSString* weblocFilename = [[NSString alloc] initWithCString:(char*)argv[1] 
                                                          encoding:NSISOLatin1StringEncoding];
      
      NSString* weblocURL = [WinHelper getURLFromWeblocFile:weblocFilename];
      [WinHelper openInBrowser:weblocURL];
    }

    return 0;
}

