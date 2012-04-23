//
//  HelloCalcDataController.m
//  HelloCalc
//
//  Created by Anton on 12/4/3.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "HelloCalcDataController.h"
#import "CalcResult.h"


@interface HelloCalcDataController ()

- (void)initializeDefaultDataList;
- (void)initializeDefaultBuffer;
- (void)initializeFeedbackMsg;

@end


@implementation HelloCalcDataController


@synthesize resultsList = _resultsList;
@synthesize calcBuffer = _calcBuffer;
@synthesize feedbackMsg = _feedbackMsg;


- (id)init {
    
    if (self = [super init]) {
        
        [self initializeDefaultDataList];
        
        [self initializeDefaultBuffer];
        
        [self initializeFeedbackMsg];
        
        return self;
        
    }
    
    return nil;
    
}

- (void)initializeDefaultDataList {
    
    NSMutableArray *answersList = [[NSMutableArray alloc] init];
    
    self.resultsList = answersList;
    
    [self addResult:0.0];
    
}

- (void)initializeDefaultBuffer {
    
    NSMutableString *emptyBuf = [[NSMutableString alloc] init];
    
    self.calcBuffer = emptyBuf;
    
}

- (void)initializeFeedbackMsg {
    
    NSMutableString *feedback = [[NSMutableString alloc] initWithString:@"Feedback string initialized."];
    
    self.feedbackMsg = feedback;
    
}

- (NSUInteger)countOfList {
    
    return [self.resultsList count];
    
}

- (CalcResult *)objectInListAtIndex:(NSUInteger)theIndex {
    
    return [self.resultsList objectAtIndex:theIndex];
    
}

- (void)addToBuffer:(NSString *)toAdd {
    
    [self.calcBuffer appendString:toAdd];
    
    [self.feedbackMsg setString:@"Number entered."];
    
}

- (void)addOpToBuffer:(NSString *)toAdd {
    
    if ([self.calcBuffer length]) {
        
        if ([self.calcBuffer characterAtIndex:([self.calcBuffer length] - 1)] != ' ') {
            
            [self.calcBuffer appendString:@" "];
            
            [self.calcBuffer appendString:toAdd];
            
            [self.calcBuffer appendString:@" "];
            
            [self.feedbackMsg setString:@"Operator entered."];
            
        }
        
        else {
            
            [self.feedbackMsg setString:@"This operator CANNOT follow the previous operator."];
            // Notify user that operation CANNOT follow another operation.
            
        }
        
    }
    
    else {
        
        [self.feedbackMsg setString:@"This operator MUST follow a number."];
        // Notify user that operation MUST follow number.
        
    }
    
}

- (void)truncBuf {
    
    // Remove last item from buffer.
    
    [self.feedbackMsg setString:@"Sorry, not implemented yet!"];
    
}

- (void)clearBuf {
    
    [self.calcBuffer setString:@""];
    
    [self.feedbackMsg setString:@"Buffer cleared."];
    
}

- (void)computeResult {
    
    double rslt = 0.0;
    
    // Implement with regular expressions or something.
    
    [self addResult:rslt];
    
    [self.feedbackMsg setString:@"Result computed and added to list."];
    
}


- (void)addResult:(double)theResult {
    
    CalcResult *rslt = [[CalcResult alloc] initWithValue:theResult];
    
    [self.resultsList addObject:rslt];
    
    [self.feedbackMsg setString:@"New result added to list."];
    
}

- (void)clearResults {
    
    [self.resultsList removeAllObjects];
    
    [self.feedbackMsg setString:@"List cleared."];
    
}

@end
