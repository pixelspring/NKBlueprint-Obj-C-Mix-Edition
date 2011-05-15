//
//  MyPickerController.h
//  code_mix
//
//  Created by Alexander Voloshyn on 05/08/09.
//  Copyright 2009 VolnaTech. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyPickerController : NSObject <UIPickerViewDataSource, UIPickerViewDelegate> {
	
	NSDictionary* _parameters;
	UIWebView* _webView;
	NSString* _pageTitle;
	NSString* _lastReturnResult;
	UIPickerView* _picker;
	NSMutableArray* _components;
}

@property (retain) NSDictionary* _parameters;
@property (retain) UIWebView* _webView;
@property (retain) NSString* _pageTitle;
@property (retain) NSString* _lastReturnResult;

@end
