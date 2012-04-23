//
//  HelloCalcTableViewController.h
//  HelloCalc
//
//  Created by Anton on 12/4/16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>


@class HelloCalcDataController;


@protocol NSTableViewDataSource, NSTableViewDelegate;


@interface HelloCalcTableViewController : UITableViewController


@property (strong, nonatomic) HelloCalcDataController *tblDataController;


@end
