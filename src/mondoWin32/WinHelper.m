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

   NSString *regValue = [[NSString alloc] initWithCString: buffer 
                                                 encoding:NSISOLatin1StringEncoding];
   free(buffer); 
   NSArray *array = [regValue componentsSeparatedByString:@"\""]; 

   if ( [array count] >= 2 ) {
     return (NSString*) [array objectAtIndex:1];
   }


  return defaultBrowser;
}

// Windows is an example on how not to design an API.  10 arguments for CreateProcess, Ugh.
+ (BOOL) runExecutable:(NSString*)fullEXEPathName withCommandLine:(NSString*)commandLine {
  PROCESS_INFORMATION pi;
  STARTUPINFO si;
  
  memset(&si,0,sizeof(si));
  si.cb= sizeof(si);
  
  LPCSTR applicationName = [fullEXEPathName cString];
  LPSTR commandArg = (char *)[commandLine cString];
  
  
  return  CreateProcess ( applicationName , commandArg, 
                 NULL, NULL, FALSE, 0, NULL, NULL, 
                 &si, &pi );
}

+ (BOOL) openInBrowser:(NSString*)url {

  NSString* browserPath = [WinHelper defaultBrowserPath];

  NSArray *brokenString = [browserPath componentsSeparatedByString:@"\\"];
  NSString *exe = [brokenString objectAtIndex:[brokenString count]-1];

  // TODO -- this is leaky, replace with initWithFormat when available
  NSString* commandLine = [exe stringByAppendingString:[@" " stringByAppendingString:url]]; 

  return [ WinHelper runExecutable:browserPath withCommandLine:commandLine];
}


+ (NSString*)getURLFromWeblocFile:(NSString*)weblocFilename {

  CFDataRef data = NULL;
  NSString* urlString;

  FILE *file = fopen( [weblocFilename cString], "r" );

  if ( file != NULL ) {
       int result = fseek( file, 0, SEEK_END );
       result = ftell( file );
       rewind( file );

       char * buffer = ( char * )calloc( 1, result );

       if ( buffer != NULL ) {
           if ( fread( buffer, result, 1, file ) > 0 ) {
               data = CFDataCreate( NULL, buffer, result );
           }

           free( buffer );
       }

       fclose( file );
   }

   if ( data != NULL ) {
       CFPropertyListRef propertyList = CFPropertyListCreateFromXMLData( NULL, data,
           kCFPropertyListImmutable, NULL );


       CFTypeID typeID = CFGetTypeID(propertyList);
       if ( typeID == CFDictionaryGetTypeID() ) {
         CFDictionaryRef dict = (CFDictionaryRef)propertyList;
         CFStringRef value = CFDictionaryGetValue(dict, CFSTR( "URL" ) );
         if (value != NULL ) {
            char url[2048];
            Boolean success = CFStringGetCString(value, url, 2048, kCFStringEncodingWindowsLatin1);
            if (success) {
              urlString = [[NSString alloc] initWithCString:url encoding:NSISOLatin1StringEncoding];
            }
         }
       }
   }

   CFRelease( data );

  return urlString;
}

@end
