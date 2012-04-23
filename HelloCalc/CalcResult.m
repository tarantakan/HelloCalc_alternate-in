//
//  CalcResult.m
//  HelloCalc
//
//  Created by Anton on 12/4/3.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalcResult.h"

@implementation CalcResult

@synthesize value = _value;

-(id)initWithValue:(double)value {
    
    self = [super init];
    
    if (self) {
        
        _value = value;
        
        return self;
        
    }
    
    return nil;
    
}

@end
