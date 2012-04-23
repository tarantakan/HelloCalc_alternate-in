//
//  HelloCalcTableViewController.m
//  HelloCalc
//
//  Created by Anton on 12/4/16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "HelloCalcTableViewController.h"
#import "HelloCalcViewController.h"
#import "HelloCalcDataController.h"
#import "CalcResult.h"


@implementation HelloCalcTableViewController


@synthesize tblDataController = _tblDataController;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"Results";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.tblDataController countOfList];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"ResultCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    CalcResult *resultAtIndex = [self.tblDataController objectInListAtIndex:indexPath.row];
    
    NSString *resultAsString = [NSString stringWithFormat:@"%lf", resultAtIndex.value];
    
    [[cell textLabel] setText:resultAsString];
    
    return cell;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;

}

//---
/*
 
 - (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
 
 
 
 // get an existing cell with the MyView identifier if it exists
 
 NSTextField *result = [tableView makeViewWithIdentifier:@"ResultCell" owner:self];
 
 // There is no existing cell to reuse so we will create a new one
 
 if (result == nil) {
 
 // create the new NSTextField with a frame of the {0,0} with the width of the table
 
 // note that the height of the frame is not really relevant, the row-height will modify the height
 
 // the new text field is then returned as an autoreleased object
 
 result = [[[NSTextField alloc] initWithFrame:...] autorelease];
 
 // the identifier of the NSTextField instance is set to MyView. This
 
 // allows it to be re-used
 
 result.identifier = @"ResultCell";
 
 }
 
 // result is now guaranteed to be valid, either as a re-used cell
 
 // or as a new cell, so set the stringValue of the cell to the
 
 // nameArray value at row
 
 result.stringValue = [self.rsltTable objectAtIndex:row];
 
 // return the result.
 
 return result;
 
 }
 
*/
//---


@end
