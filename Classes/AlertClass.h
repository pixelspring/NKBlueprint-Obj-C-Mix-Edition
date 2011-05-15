//
//  AlertClass.h
//  MyAlert
//
//  Created by Mike Seaby on 4/11/11.
//  
//

#import <Foundation/Foundation.h>


@interface AlertClass : NSObject {
    NSDictionary* _parameters;
}
@property(retain) NSDictionary* _parameters;
@property(retain,nonatomic)  UITextField *textField;
@end
