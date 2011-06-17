//
//  webViewLoading.h
//  ObjC-Mix
//
//  Created by Florian Knorn on 15/06/2011.
//  Copyright 2011 Florian Knorn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface listFilesInDocumentsFolder : NSObject {
	UIWebView* _webView;
}

- (void)doList;

@property (retain) UIWebView* _webView;

@end
