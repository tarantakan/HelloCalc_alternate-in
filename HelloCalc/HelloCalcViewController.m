//
//  HelloCalcViewController.m
//  HelloCalc
//
//  Created by Anton on 12/4/3.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "HelloCalcViewController.h"
#import "HelloCalcTableViewController.h"
#import "ExpInputAccessoryView.h"
#import "HelloCalcDataController.h"
#import "CalcResult.h"


/*
 
 @interface HelloCalcViewController ()
 
 @end
 
 */


@implementation HelloCalcViewController


//@synthesize delegate = _delegate;

@synthesize inputScrlVw = _inputScrlVw;
@synthesize dataController = _dataController;
@synthesize rsltTblVwCtrlr = _rsltTblVwCtrlr;
@synthesize resultsTable = _resultsTable;
@synthesize bufferOutLbl = _bufferOutLbl;
@synthesize numberInField = _numberInField;
@synthesize feedbackLbl = _feedbackLbl;


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.numberInField) {
        
        [textField resignFirstResponder];
        
    }
    
    return YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.resultsTable.dataSource = self.rsltTblVwCtrlr;
    self.numberInField.keyboardType = UIKeyboardTypeDecimalPad;
    CGRect accessFrame = CGRectMake(0.0, 0.0, 320.0, 72.0);
    ExpInputAccessoryView *accViewToAdd = [[ExpInputAccessoryView alloc] initWithFrame:accessFrame];
    accViewToAdd.fieldToMod = self.numberInField;
    self.numberInField.inputAccessoryView = accViewToAdd;
    [self registerForKeyboardNotifications];
    self.inputScrlVw.alwaysBounceVertical = YES;
    self.inputScrlVw.contentSize = CGSizeMake(320, 460);
    
    [self updateFeedback];
}

- (void)viewDidUnload
{
    [self setNumberInField:nil];
    [self setBufferOutLbl:nil];
    [self setResultsTable:nil];
    [self setFeedbackLbl:nil];
    [self setInputScrlVw:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


// Call this method somewhere in your view controller setup code.

- (void)registerForKeyboardNotifications

{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
    
}



// Called when the UIKeyboardDidShowNotification is sent.

- (void)keyboardWasShown:(NSNotification*)aNotification

{
    
    NSDictionary* info = [aNotification userInfo];
    
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    self.inputScrlVw.contentInset = contentInsets;
    
    self.inputScrlVw.scrollIndicatorInsets = contentInsets;
    
    
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    
    // Your application might not need or want this behavior.
    
    CGRect aRect = self.view.frame;
    
    aRect.size.height -= kbSize.height;
    
    if (!CGRectContainsPoint(aRect, self.numberInField.frame.origin) ) {
        
        CGPoint scrollPoint = CGPointMake(0.0, self.numberInField.frame.origin.y-kbSize.height);
        
        [self.inputScrlVw  setContentOffset:scrollPoint animated:YES];
        
    }
    
}



// Called when the UIKeyboardWillHideNotification is sent

- (void)keyboardWillBeHidden:(NSNotification*)aNotification

{
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    
    self.inputScrlVw.contentInset = contentInsets;
    
    self.inputScrlVw.scrollIndicatorInsets = contentInsets;
    
}


- (IBAction)numEnterBtn:(id)sender {
    
    if ([[self.numberInField text] length]) {
        
        [self.dataController addToBuffer:self.numberInField.text];
        
    }
    
    [self.bufferOutLbl setText:self.dataController.calcBuffer];
    
    //[self dismissModalViewControllerAnimated:YES];
    
    [self.numberInField resignFirstResponder];
    
    [self updateFeedback];
    
}

- (IBAction)computeBtn:(id)sender {
    
    // Compute buffered expression.
    
    // Using fake for now, uncomment the following block when it works.
    /*
     [self.dataController computeResult];
     [self updateFeedback];
     */
    
    [self.dataController addResult:rand()];
    
    [self.feedbackLbl setText:@"Actually just made up a number, didn't really compute anything. SORRY!"];
    
    [self.resultsTable reloadData];
    
}

- (IBAction)cEBtn:(id)sender {
    
    // Clear last number entry.
    
    [self.dataController truncBuf];
    
    [self updateFeedback];
    
}

- (IBAction)flushBufBtn:(id)sender {
    
    [self.dataController clearBuf];
    
    [self.bufferOutLbl setText:self.dataController.calcBuffer];
    
    [self updateFeedback];
    
}

- (IBAction)plusBtn:(id)sender {
    
    [self.dataController addOpToBuffer:@"+"];
    
    [self.bufferOutLbl setText:self.dataController.calcBuffer];
    
    [self dismissModalViewControllerAnimated:YES];
    
    [self.numberInField resignFirstResponder];
    
    [self updateFeedback];
    
}

- (IBAction)minusBtn:(id)sender {
    
    [self.dataController addOpToBuffer:@"-"];
    
    [self.bufferOutLbl setText:self.dataController.calcBuffer];
    
    [self dismissModalViewControllerAnimated:YES];
    
    [self.numberInField resignFirstResponder];
    
    [self updateFeedback];
    
}

- (IBAction)multBtn:(id)sender {
    
    [self.dataController addOpToBuffer:@"*"];
    
    [self.bufferOutLbl setText:self.dataController.calcBuffer];
    
    [self dismissModalViewControllerAnimated:YES];
    
    [self.numberInField resignFirstResponder];
    
    [self updateFeedback];
    
}

- (IBAction)divBtn:(id)sender {
    
    [self.dataController addOpToBuffer:@"/"];
    
    [self.bufferOutLbl setText:self.dataController.calcBuffer];
    
    [self dismissModalViewControllerAnimated:YES];
    
    [self.numberInField resignFirstResponder];
    
    [self updateFeedback];
    
}

- (IBAction)clearResults:(id)sender {
    
    [self.dataController clearResults];
    
    [self.resultsTable reloadData];
    
    [self updateFeedback];
    
}

- (void)updateFeedback {
    
    [self.feedbackLbl setText:self.dataController.feedbackMsg];
    
}


@end
