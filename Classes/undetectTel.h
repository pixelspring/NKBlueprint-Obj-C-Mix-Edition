//
//  undetectTel.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 01/09/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface undetectTel : NSObject {
    UIWindow *window;
    NSDictionary* _parameters;
    NSString* _lastReturnResult;
}


@property (retain) NSDictionary* _parameters;
@property (retain) NSString* _lastReturnResult;

@end