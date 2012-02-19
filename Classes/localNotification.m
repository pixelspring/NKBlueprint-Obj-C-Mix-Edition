//
//  localNotification.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 19/02/2012.
//  Copyright (c) 2012 Mike Seaby. All rights reserved.
//

#import "LocalNotification.h"
#import "Nimble.h"
#import "NKBridge.h"


@implementation localNotification

@synthesize _parameters, _webView, _pageTitle, _lastReturnResult;
@synthesize localNotification = notification;

	// -----------------------------------------------------------------------------------------------------
	// Add A Local Notification
	// -----------------------------------------------------------------------------------------------------
	- (void) addNotification {
		
		UIApplication *app                = [UIApplication sharedApplication];
		notification = [[UILocalNotification alloc] init];
		NSArray *oldNotifications         = [app scheduledLocalNotifications];
		
		if ([oldNotifications count] > 0) {
			[app cancelAllLocalNotifications];
		}
		
		if (notification == nil)
			return;
		
		// -----------------------------------------------------------------------------------------------------
		// Testing: Set for 10 secs from current time
		// -----------------------------------------------------------------------------------------------------
		//
		// NSDate *notificationDate = [NSDate dateWithTimeIntervalSinceNow:10]; 
		//
		// -----------------------------------------------------------------------------------------------------
		
		NSString *firingDate = [_parameters objectForKey:@"fire"];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
		NSDate *notificationDate = [formatter dateFromString:firingDate];
		[formatter release];
		
		notification.fireDate  = notificationDate;
		notification.timeZone  = [NSTimeZone systemTimeZone];	
		notification.alertBody = [_parameters objectForKey:@"body"];
		notification.alertAction = [_parameters objectForKey:@"action"];
		notification.hasAction = [[_parameters objectForKey:@"hasAction"]intValue];
		
		//notification.applicationIconBadgeNumber = [[_parameters valueForKey:@"badgeNum"]intValue];// or = 41; // Hardcode Badge Number
		notification.applicationIconBadgeNumber += 1; //increases the icon badge number
		
		notification.soundName = [_parameters objectForKey:@"sound"];
		
		
		NSInteger repeating = [[_parameters objectForKey:@"repInt"]intValue];
		switch (repeating) {
			case 1:
				notification.repeatInterval = NSMinuteCalendarUnit;
				break;
			case 2:
				notification.repeatInterval = NSHourCalendarUnit;
				break;
			case 3:
				notification.repeatInterval = NSDayCalendarUnit;
				break;
			case 4:
				notification.repeatInterval = NSWeekCalendarUnit;
				break;
			case 5:
				notification.repeatInterval = NSMonthCalendarUnit;
				break;
			default:
				notification.repeatInterval = 0;
				break;
		}
		
		// -----------------------------------------------------------------------------------------------------
		// TODO
		// -----------------------------------------------------------------------------------------------------
		// Custom Data - Using this to identify the notification. 
		// Handy in case we want to delete a specific notification later, or return to app with data.
		// -----------------------------------------------------------------------------------------------------
		//NSDictionary *userDict = [NSDictionary dictionaryWithObject:notification 
		//													 forKey:@"notificationId"];
		//notification.userInfo = userDict;
		
		
		// -----------------------------------------------------------------------------------------------------
		// Log the notification details for debug:
		// -----------------------------------------------------------------------------------------------------
		/*
		NSLog(@"SHOULD FIRE AT: %@", [_parameters objectForKey:@"fire"]);
		NSLog(@"NOTIFICATIONDATE: %@", notificationDate);
		NSLog(@"CURRENT DATE & TIME: %@", [NSDate date]);
		NSLog(@"ALERT BODY: %@", [_parameters objectForKey:@"body"]);
		NSLog(@"ALERT ACTION: %@", [_parameters objectForKey:@"action"]);
		NSLog(@"FIRINGDATE: %@", firingDate);
		NSLog(@"REPEAT VALUE: %@", [_parameters objectForKey:@"repInt"]);
		*/
		// -----------------------------------------------------------------------------------------------------
		
		[app scheduleLocalNotification:notification];
		[notification release];
		
	}



	// -----------------------------------------------------------------------------------------------------
	// Cancel ALL The Notifications!
	// -----------------------------------------------------------------------------------------------------
		- (void)cancelAllNotifications {
			
			[[UIApplication sharedApplication] cancelAllLocalNotifications];
			NSLog(@"All Notifications Cancelled");
			
		}


	// -----------------------------------------------------------------------------------------------------
	// TODO: Cancel A Specific Notification - NEED TO IMPLEMENT DICTIONARY
	// -----------------------------------------------------------------------------------------------------
		-(void)cancelNotification
		{
			if(notification || [UIApplication sharedApplication].applicationIconBadgeNumber > 0)//If local notification item in existence, call this.
			{
				[[UIApplication sharedApplication] cancelAllLocalNotifications];
				NSLog(@"Local Notifications Cancelled");
			}
			else //If there is no local notification to actually cancel, show a UIAlert.
			{
				UIAlertView *noNotif = [[UIAlertView alloc] initWithTitle:@"No Notifications" message:@"There are no notifications to cancel" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
				[noNotif show];
			}
		}

#pragma mark -
#pragma mark automatic setter methods

- (void)setNKParameters:(NSDictionary*)parameters
{
	self._lastReturnResult = nil;
	self._parameters = parameters;
}

- (void)setNKCurrentPage:(NSString*)pageTitle
{
	self._pageTitle = pageTitle;
}

- (void)setNKWebView:(UIWebView*)webView
{
	self._webView = webView;
}

@end