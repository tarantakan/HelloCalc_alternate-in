//
//  ExpInputAccessoryView.h
//  HelloCalc
//
//  Created by Anton on 12/4/20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpInputAccessoryView : UIView

@property (nonatomic, retain) UITextField *fieldToMod;

- (void)insTestTxt;
- (void)sendDone;

@end
