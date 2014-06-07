//
//  DDSearchTableViewController.m
//  DORMSDB
//
//  Created by Alex Mitchell on 4/2/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import "DDSearchTableViewController.h"
#import <Parse/Parse.h>
#import "SWRevealViewController.h"

@interface DDSearchTableViewController (){
    NSArray *roomtypes;
    NSMutableDictionary *roomPreferences;
}

@end

@implementation DDSearchTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    roomPreferences = [NSMutableDictionary dictionaryWithObjects:@[@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",[NSMutableArray new],[NSMutableArray new],@"Single"] forKeys:@[@"Air Conditioning", @"Laundry", @"Printer", @"Substance Free", @"Gender Neutral", @"Loggia Access", @"Campus", @"Floor", @"Type"]];
    
    roomtypes = @[@"Single",@"Cubby Single", @"Double", @"Two-Room Double", @"Three-Room Double", @"Triple", @"Two Room Triple", @"Quad", @"Student Advisor", @"Co-op", @"Apartment Living"];

}


#pragma mark- pickerView Delegate Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return roomtypes.count;
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return roomtypes[row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    roomPreferences[@"Type"] = roomtypes[row];
}


#pragma mark- tableView Delegate Methods

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section != 4)
        [[[tableView cellForRowAtIndexPath:indexPath] imageView] setImage:[UIImage imageNamed:@"SelectedSearch"]];
    if (indexPath.section == 0) { //Campuses
        if (indexPath.row == 0) { //North
            [(NSMutableArray*) roomPreferences[@"Campus"] addObject:@"North"];
        }
        else if (indexPath.row == 1) { //South
            [(NSMutableArray*) roomPreferences[@"Campus"] addObject:@"South"];
        }
        else if (indexPath.row == 2) { //East
            [(NSMutableArray*) roomPreferences[@"Campus"] addObject:@"East"];
        }
    }

    else if (indexPath.section == 1) { //Amenities
        if (indexPath.row == 0) { //Air Conditioning
            roomPreferences[@"Air Conditioning"] = @"YES";
        }
        else if (indexPath.row == 1) { //Laundry
            roomPreferences[@"Laundry"] = @"YES";
        }
        else if (indexPath.row == 2) { //Printer
            roomPreferences[@"Printer"] = @"YES";
        }
        else if (indexPath.row == 3) { //Substance Free
            roomPreferences[@"Substance Free"] = @"YES";
        }
        else if (indexPath.row == 4) { //Gender Neutral
            roomPreferences[@"Gender Neutral"] = @"YES";
        }
        else if (indexPath.row == 5) { //Loggia Access
            roomPreferences[@"Loggia Access"] = @"YES";
        }
        
    }
    
    else if (indexPath.section == 2) { //Floor
        if (indexPath.row == 0){ //Pit
            [(NSMutableArray*)roomPreferences[@"Floor"] addObject:@"0"];

        }
        else if (indexPath.row == 1){ //First
            [(NSMutableArray*)roomPreferences[@"Floor"] addObject:@"1"];

        }
        else if (indexPath.row == 2){ //Second
            [(NSMutableArray*)roomPreferences[@"Floor"] addObject:@"2"];

        }
        else if (indexPath.row == 3){ //Third
            [(NSMutableArray*)roomPreferences[@"Floor"] addObject:@"3"];

        }
        else if (indexPath.row == 4){ //Fourth
            [(NSMutableArray*)roomPreferences[@"Floor"] addObject:@"4"];

        }
        
    }

             
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section != 4)
        [[[tableView cellForRowAtIndexPath:indexPath] imageView] setImage:[UIImage imageNamed:@"SelectedSearch"]];
    if (indexPath.section == 0) { //Campuses
        if (indexPath.row == 0) { //North
            [(NSMutableArray*) roomPreferences[@"Campus"]removeObject:@"North"];
        }
        else if (indexPath.row == 1) { //South
            [(NSMutableArray*) roomPreferences[@"Campus"] removeObject:@"South"];
        }
        else if (indexPath.row == 2) { //East
            [(NSMutableArray*) roomPreferences[@"Campus"] removeObject:@"East"];
        }
    }
    
    else if (indexPath.section == 1) { //Amenities
        if (indexPath.row == 0) { //Air Conditioning
            roomPreferences[@"Air Conditioning"] = @"NO";
        }
        else if (indexPath.row == 1) { //Laundry
            roomPreferences[@"Laundry"] = @"NO";
        }
        else if (indexPath.row == 2) { //Printer
            roomPreferences[@"Printer"] = @"NO";
        }
        else if (indexPath.row == 3) { //Substance Free
            roomPreferences[@"Substance Free"] = @"NO";
        }
        else if (indexPath.row == 4) { //Gender Neutral
            roomPreferences[@"Gender Neutral"] = @"NO";
        }
        else if (indexPath.row == 5) { //Loggia Access
            roomPreferences[@"Loggia Access"] = @"NO";
        }
        
    }
    
    else if (indexPath.section == 2) { //Floor
        if (indexPath.row == 0){ //Pit
            [(NSMutableArray*)roomPreferences[@"Floor"] removeObject:@"0"];
            
        }
        else if (indexPath.row == 1){ //First
            [(NSMutableArray*)roomPreferences[@"Floor"] removeObject:@"1"];
            
        }
        else if (indexPath.row == 2){ //Second
            [(NSMutableArray*)roomPreferences[@"Floor"] removeObject:@"2"];
            
        }
        else if (indexPath.row == 3){ //Third
            [(NSMutableArray*)roomPreferences[@"Floor"] removeObject:@"3"];
            
        }
        else if (indexPath.row == 4){ //Fourth
            [(NSMutableArray*)roomPreferences[@"Floor"] removeObject:@"4"];
            
        }
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.0;
}


@end
