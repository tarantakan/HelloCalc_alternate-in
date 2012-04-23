//
//  HelloCalcAppDelegate.h
//  HelloCalc
//
//  Created by Anton on 12/4/9.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HelloCalcAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UIViewController *vwCtrlr;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *vwCtrlr;

@end
