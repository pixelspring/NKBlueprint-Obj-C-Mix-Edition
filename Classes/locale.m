//
//  locale.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 26/03/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "locale.h"

@implementation locale

@synthesize result;


#pragma mark getLocation
 - (void)getLocation
 {
 NSLocale *currentUsersLocale = [NSLocale currentLocale];
 self.result = [currentUsersLocale localeIdentifier];
 NSLog(@"Current Locale: %@", self.result);
 } 






#pragma mark getLocale
- (void)getLocale
{    
    NSNumberFormatter *fmtr = [[[NSNumberFormatter alloc] init] autorelease];
    [fmtr setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    self.result = [fmtr currencySymbol];
    NSLog(@"Current Currency Symbol: %@", self.result);
}


#pragma mark getLang
- (void)getLang {
    self.result = [[NSLocale preferredLanguages] objectAtIndex:0]; 
	
    
}


#pragma mark methodResult
- (NSString*)methodResult
{
    return self.result;
} 

@end
