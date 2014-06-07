//
//  DDSettingsViewController.m
//  DORMSDB
//
//  Created by Alex Mitchell on 3/31/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import "DDSettingsViewController.h"
#import <Parse/Parse.h>

@interface DDSettingsViewController ()


@end

@implementation DDSettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) logoutButtonWasClicked {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"logOut" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [PFUser logOut];
}

#pragma mark - Navigation

 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 if ([segue.identifier isEqualToString:@"logOut"])
 [PFUser logOut];
 
 }


@end
