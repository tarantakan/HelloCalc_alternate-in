//
//  HelloCalcAppDelegate.m
//  HelloCalc
//
//  Created by Anton on 12/4/9.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HelloCalcAppDelegate.h"

#import "HelloCalcViewController.h"
#import "HelloCalcDataController.h"
#import "HelloCalcTableViewController.h"

@implementation HelloCalcAppDelegate

@synthesize window = _window;
@synthesize vwCtrlr = _vwCtrlr;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

{

    [window addSubview:[vwCtrlr view]];
    [window makeKeyAndVisible];
    
    HelloCalcViewController *theViewCtrlr = (HelloCalcViewController *)self.window.rootViewController;
    
    HelloCalcDataController *theDataCtrlr = [[HelloCalcDataController alloc] init];
    
    HelloCalcTableViewController *theTblCtrlr = [[HelloCalcTableViewController alloc] init];
    
    theViewCtrlr.dataController = theDataCtrlr;
    
    theViewCtrlr.rsltTblVwCtrlr = theTblCtrlr;
    
    theViewCtrlr.rsltTblVwCtrlr.tblDataController = theDataCtrlr;
    
    return YES;
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Save data if appropriate.
}


- (void)dealloc {
    // Clean stuff up.
} 

@end

