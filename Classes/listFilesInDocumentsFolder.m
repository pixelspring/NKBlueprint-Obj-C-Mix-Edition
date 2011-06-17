//
//  listFilesInDocumentsFolder.m
//  ObjC-Mix
//
//  Created by Florian Knorn on 15/06/2011.
//  Copyright 2011 Florian Knorn. All rights reserved.
//

#import "listFilesInDocumentsFolder.h"

@implementation listFilesInDocumentsFolder

@synthesize _webView;

- (void)setNKWebView:(UIWebView*)webView {
	self._webView = webView;
}

- (void)doList {
	NSFileManager *manager = [NSFileManager defaultManager];
	NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSArray *fileList = [manager contentsOfDirectoryAtPath:documentsDirectory error:NULL];
	[self._webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:[NSString stringWithFormat:@"documentsDirectoryContent = new Array%@",fileList] waitUntilDone:NO];
}

- (void)dealloc {
	self._webView = nil;
 	[super dealloc];
}

@end