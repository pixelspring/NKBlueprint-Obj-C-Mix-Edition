//
//  getFreeSpace.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 12/07/2011.
//  Taken from code by cactuscraig on the NK Forums
//

#import "getFreeSpace.h"

@implementation getFreeSpace

@synthesize result;

- (void)getDeviceFreeSpace {  
	
    NSError *error = nil;  
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];  
    
    if (dictionary) {  
        NSNumber *fileSystemFreeSizeInBytes = [dictionary objectForKey: NSFileSystemFreeSize];  
        self.result = [fileSystemFreeSizeInBytes stringValue];  
    }  
	
}




#pragma mark methodResult
- (NSString*)methodResult
{
    return self.result;
} 

@end