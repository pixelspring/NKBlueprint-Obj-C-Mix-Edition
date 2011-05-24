//
//  MyUISearchBar.h
//  SearchBar
//
//  Created by Chris Kunicki on 21.9.09..
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyUISearchBar : NSObject <UISearchBarDelegate> {	
	NSDictionary* _parameters;
	UIWebView* _webView;
	NSString* _pageTitle;
	NSString* _lastReturnResult;
	UISearchBar* _searchBar;
	NSMutableArray* _components;
}

@property (retain) NSDictionary* _parameters;
@property (retain) UIWebView* _webView;
@property (retain) NSString* _pageTitle;
@property (retain) NSString* _lastReturnResult;


@end
