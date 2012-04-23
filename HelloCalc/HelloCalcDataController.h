//
//  HelloCalcDataController.h
//  HelloCalc
//
//  Created by Anton on 12/4/3.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalcResult;

@interface HelloCalcDataController : NSObject

@property (nonatomic, retain) NSMutableArray *resultsList;
@property (nonatomic, retain) NSMutableString *calcBuffer;
@property (nonatomic, retain) NSMutableString *feedbackMsg;

- (NSUInteger)countOfList;

- (CalcResult *)objectInListAtIndex:(NSUInteger)theIndex;

- (void)addToBuffer:(NSString *)toAdd;

- (void)addOpToBuffer:(NSString *)toAdd;

- (void)truncBuf;

- (void)clearBuf;

- (void)computeResult;

- (void)addResult:(double)theResult;

- (void)clearResults;


@end
