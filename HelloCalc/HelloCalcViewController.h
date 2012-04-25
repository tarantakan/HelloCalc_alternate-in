//
//  HelloCalcViewController.h
//  HelloCalc
//
//  Created by Anton on 12/4/3.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>


@class HelloCalcDataController;
@class HelloCalcTableViewController;


@interface HelloCalcViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIScrollView *inputScrlVw;

@property (strong, nonatomic) HelloCalcDataController *dataController;
@property (strong, nonatomic) HelloCalcTableViewController *rsltTblVwCtrlr;
@property (weak, nonatomic) IBOutlet UITableView *resultsTable;
//@property (weak, nonatomic) IBOutlet UILabel *bufferOutLbl;
@property (weak, nonatomic) IBOutlet UITextField *numberInField;
@property (weak, nonatomic) IBOutlet UILabel *feedbackLbl;

//- (IBAction)numEnterBtn:(id)sender;
- (IBAction)computeBtn:(id)sender;
//- (IBAction)cEBtn:(id)sender;
//- (IBAction)flushBufBtn:(id)sender;
//- (IBAction)plusBtn:(id)sender;
//- (IBAction)minusBtn:(id)sender;
//- (IBAction)multBtn:(id)sender;
//- (IBAction)divBtn:(id)sender;
- (IBAction)clearResults:(id)sender;

//- (void)registerForKeyboardNotifications;
- (void)updateFeedback;


@end
