//
//  DDLogonViewController.m
//  DORMSDB
//
//  Created by Alex Mitchell on 3/30/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import "DDLogonViewController.h"
#import <Parse/Parse.h>

@interface DDLogonViewController ()

@end

@implementation DDLogonViewController
- (IBAction)logOnButtonWasClicked:(id)sender {
    [PFFacebookUtils logInWithPermissions:@[@"basic_info",@"email"] block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
            [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                if (!error) {
                    // Store the current user's Facebook ID on the user
                    [[PFUser currentUser] setObject:[result objectForKey:@"id"]
                                             forKey:@"username"];
                    [[PFUser currentUser] setObject:[result objectForKey:@"email"]
                                             forKey:@"email"];
                    [[PFUser currentUser] saveInBackground];
                }
            }];
            [self performSegueWithIdentifier:@"loggedIn" sender:self];
        } else {
            NSLog(@"User logged in through Facebook!");
            [self performSegueWithIdentifier:@"loggedIn" sender:self];
        }
    }];
}



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    
    if ([PFUser currentUser]){
        [self performSegueWithIdentifier:@"loggedIn" sender:self];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
