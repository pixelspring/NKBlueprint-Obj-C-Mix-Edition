//
//  CompassObject.h
//  NKCompass
//
//  Created by Can Durakci on 11/22/11.
//  Jazzbass 
//  Copyright (c) 2011 Unimedisys. All rights reserved. visit www.unimedisys.com 
//

#import <Foundation/Foundation.h>
#import "CompassClass.h"
@interface CompassObject : NSObject
{
    
        
        CompassClass *locationController;
        NSDictionary* _parameters;
        UIWebView* _webView;
        NSString* _pageTitle;
        NSString* _lastReturnResult;
        NSMutableArray* _components;
        
}
    
    @property (retain) NSDictionary* _parameters;
    @property (retain) UIWebView* _webView;
    @property (retain) NSString* _pageTitle;
    @property (retain) NSString* _lastReturnResult;
    
    @end


