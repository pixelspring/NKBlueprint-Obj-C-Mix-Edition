//
//  myscheme.m
//  ObjC-Mix
//
//  Created by cactuscraig
//

#import "myscheme.h"

@implementation myscheme

@synthesize _parameters,result;


#pragma mark canOpenScheme

- (void)canOpenScheme
{    
    NSString *scheme = [self._parameters objectForKey:@"scheme"];
    NSLog(@"Scheme to lookup: %@",scheme);
    
    BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]];
    NSLog(@"Scheme: %@", canOpen?@"TRUE":@"FALSE");
    self.result = (canOpen?@"TRUE":@"FALSE");
    
}

#pragma mark setNKParameters

- (void)setNKParameters:(NSDictionary *)parameters
{
	self._parameters = parameters;
}


#pragma mark methodResult

- (NSString*)methodResult
{
    return self.result;
} 

@end
