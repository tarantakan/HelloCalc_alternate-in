//
//  ExpInputAccessoryView.m
//  HelloCalc
//
//  Created by Anton on 12/4/20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExpInputAccessoryView.h"

@implementation ExpInputAccessoryView

@synthesize fieldToMod = _fieldToMod;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        
        UIButton *testButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        testButton.frame = CGRectMake(4.0, 4.0, 48.0, 24.0);
        [testButton setTitle:@"Test" forState:UIControlStateNormal];
        [testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [testButton addTarget:self action:@selector(insTestTxt) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:testButton];
        
        UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        doneBtn.frame = CGRectMake(252.0, 4.0, 48.0, 24.0);
        [doneBtn setTitle:@"Enter" forState:UIControlStateNormal];
        [doneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [doneBtn addTarget:self action:@selector(sendDone) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:doneBtn];
    }
    return self;
}

- (void)insTestTxt {
    [self.fieldToMod replaceRange:self.fieldToMod.selectedTextRange withText:@"Success"];
}

- (void)sendDone {
    [self.fieldToMod resignFirstResponder];
    [self resignFirstResponder];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

     
@end
