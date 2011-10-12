//
//  undetectTel.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 01/09/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "undetectTel.h"
#import "NKBridge.h"

@implementation undetectTel

@synthesize _parameters, _lastReturnResult;





- (void)removeDetector 
{
	NSString *page = [self._parameters objectForKey:@"page"];
	UIWebView* view = [[NKBridge sharedInstance] webViewForPage:page];
	view.dataDetectorTypes = UIDataDetectorTypeNone;
}



- (void)setNKParameters:(NSDictionary *)parameters
{
	self._parameters = parameters;
}




- (NSString*)methodResult
{
	return self._lastReturnResult;
}



@end
