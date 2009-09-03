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

   // TODO -- check for leaks
   NSString *regValue = [[NSString alloc] initWithCString: buffer encoding:NSISOLatin1StringEncoding];
   NSArray *array = [regValue componentsSeparatedByString:@"\""]; 

   printf("What is in the buffer %s \n", buffer);
//   free( buffer); 

   printf("Array count is %i \n", [array count]);
   if ( [array count] >= 2 ) {
     return (NSString*) [array objectAtIndex:1];
   }


  return defaultBrowser;
}

@end
