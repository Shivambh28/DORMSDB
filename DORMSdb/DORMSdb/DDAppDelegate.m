//
//  DDAppDelegate.m
//  DORMSdb
//
//  Created by Alex Mitchell on 3/17/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import "DDAppDelegate.h"
#import <Crashlytics/Crashlytics.h>
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>
#import "DDAPICall.h"

@implementation DDAppDelegate
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Store the deviceToken in the current Installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
    [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DDAPICall* query = [DDAPICall new];
    [query dormQueryWithAC:NO laundry:YES printer:YES subfree:NO campus:nil floor:nil type:nil];
    
    [Parse setApplicationId:@"lxt3Onk4IfZUqJr4CfpvS35lWxj9Q8fhsZuCJjRO"
                  clientKey:@"5difY7k7YZ06syUgoGt00p1WoBY7BmIiOnMbs3yP"];
    [PFFacebookUtils initializeFacebook];
    // Register for push notifications
    [application registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeBadge |
     UIRemoteNotificationTypeAlert |
     UIRemoteNotificationTypeSound];
    
    
    [Crashlytics startWithAPIKey:@"b7a2a503d3dffcb4aa1898c4a0bbe7472f4cfa2a"];
    
    
    
    
    return YES;
}



- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    if (application.applicationState == UIApplicationStateInactive) {
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}



@end
