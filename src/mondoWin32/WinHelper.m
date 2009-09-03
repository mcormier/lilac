#import "WinHelper.h"

@implementation WinHelper

static NSString* defaultBrowser =  @"C:\\Program Files\\Internet Explorer\\iexplore.exe";

// Gets the default browser executable path from the Windows registry.
// If an error occurs iexplore.exe is returned in the default location.
+ (NSString*)defaultBrowserPath {

   // Access the Windows registry to get the default browser path
   int regerr;
   HKEY regPtr;
   char *buffer = NULL;
   DWORD regtype = REG_SZ;
   DWORD size = 0;

   regerr = RegOpenKeyEx( HKEY_CLASSES_ROOT, "http\\shell\\open\\command",
                   0, KEY_READ, &regPtr);
   if (regerr != ERROR_SUCCESS) { return defaultBrowser; }

   // Blank string requests the default value
   regerr = RegQueryValueEx(regPtr, "", NULL, &regtype, (LPBYTE) buffer, &size);
   if (regerr != ERROR_SUCCESS) { return defaultBrowser; }

   buffer = (char *) malloc (size + 1);
   if (NULL == buffer) { return defaultBrowser; }
 
   regerr = RegQueryValueEx (regPtr,"", 0, &regtype, (LPBYTE) buffer, &size);
   if (regerr != ERROR_SUCCESS) { free(buffer); return defaultBrowser; }

   NSString *regValue = [[NSString alloc] initWithCString: buffer encoding:NSISOLatin1StringEncoding];
   free(buffer); 
   NSArray *array = [regValue componentsSeparatedByString:@"\""]; 

   if ( [array count] >= 2 ) {
     return (NSString*) [array objectAtIndex:1];
   }


  return defaultBrowser;
}

+ (void) openInBrowser:(NSString*)url {

  NSString* browserPath = [WinHelper defaultBrowserPath];
  
  // TODO -- don't hardcode chrome as first arg...
  //char *urlPtr = [url cString]
  char *args[] = { "chrome", (char *)[url cString] , (char *)0 };
  // TODO -- look @ exec return value and return a BOOL of yes or 
  // or NO to indicate whether it was successful.
 
  // TODO - don't want to use just exec...
  // it stomps on the current process if it is successful.
  
  // TODO -- use CreateProcess Windows command...
  NSInteger retVal = execv( [browserPath cString], args);
  printf("retVal is %i \n", retVal ); 

}

@end
