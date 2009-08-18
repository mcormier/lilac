// TODO -- figure out why....
#if defined(__CYGWIN__)
    //CYGWIN gives annoying warning about runtime stuff if we don't do this
  #define USE_SYS_TYPES_FD_SET
  #include <sys/types.h>

#endif

#include <CoreFoundation/CoreFoundation.h>

void readPropertyListFromFile( char* weblocFilename ); 
void openURLinBrowser( char* url );

// TODO -- remove global variable.
FILE *logFile;

// TODO -- turn off CFLogTemp.txt
int main ( int argc, const char * argv[] ) {
    // This doesn't work.  Try something else.
    CFSetLogFile(NULL, kCFStringEncodingUTF8);

    logFile = fopen("testlog", "w");

    fprintf(logFile, "Number of arguments is %i\n", argc);
    if ( argc > 1 ) {
      fprintf(logFile, "Second arg is %s\n", argv[1]);
      // Read the plist.
      readPropertyListFromFile((char*)argv[1]); 
    }
 
    return 0;
}


// TODO -- create get browser exe method
void openURLinBrowser( char* url ) {


    int regerr; 
    HKEY regPtr;

    regerr = RegOpenKeyEx( HKEY_CLASSES_ROOT, "http\\shell\\open\\command",
                    0, KEY_READ, &regPtr); 

    if (regerr != ERROR_SUCCESS) {
      fprintf(logFile, "Error reading key\n");
      return;
    }

    char *buffer = NULL;
    DWORD regtype = REG_SZ; 
    DWORD size = 0;

    // Blank string requests the default value
    regerr = RegQueryValueEx(regPtr, "", NULL, &regtype, (LPBYTE) buffer, &size); 


    if (regerr != ERROR_SUCCESS) {
      fprintf(logFile, "Error reading key data\n");
      return;
    }

    fprintf(logFile, "Size is now %i \n", size);

    buffer = (char *) malloc (size + 1);
    if (NULL == buffer) {
      fprintf(logFile, "Could not allocate buffer\n");
      return;
    }

   regerr = RegQueryValueEx (regPtr,
                                "", 0, &regtype, (LPBYTE) buffer, &size);

    if (regerr != ERROR_SUCCESS) {
      fprintf(logFile, "Error reading key data\n");
      return;
    }

      fprintf(logFile, "End of method retrieved: %s \n", buffer);

    return;

    // TODO -- load registry key to get default browser
    // information. 
    // HKEY_CLASSES_ROOT\http\shell\open\command
    // http://stackoverflow.com/questions/813058/windows-regkey-default-browser-application-path

}

void readPropertyListFromFile( char* weblocFilename ) {
    CFDataRef data = NULL;
    
    FILE *file = fopen( weblocFilename, "r" );

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
             // TODO -- check success value.
             fprintf(logFile, "The URL is : %s", url );
             openURLinBrowser( url );
          }
        }
    }

    CFRelease( data );
}
