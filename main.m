//
//  main.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 21/01/2011.
//  Copyright Mike Seaby 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
