#import <cocoaLite/Cocoa.h>

#import <mondoWin32/WinHelper.h>

void readPropertyListFromFile( char* weblocFilename ); 

// TODO -- remove global variable.
FILE *logFile;

int main ( int argc, const char * argv[] ) {


    logFile = fopen("testlog", "w");

    //printf( "Number of arguments is %i\n", argc);
    if ( argc > 1 ) {
      fprintf(logFile, "Second arg is %s\n", argv[1]);
      // Read the plist.
      readPropertyListFromFile((char*)argv[1]); 
    }

    [WinHelper openInBrowser:@"http://www.cs.dal.ca"];
    //printf("If this is printed then the process was not stomped on.\n");
    return 0;
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
             // TODO -- use WinHelper
             //openURLinBrowser( url );
          }
        }
    }

    CFRelease( data );
}
