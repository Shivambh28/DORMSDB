//
//  DDAPICall.m
//  DORMSDB
//
//  Created by Alex Mitchell on 4/14/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import "DDAPICall.h"

@implementation DDAPICall


-(void) dormQueryWithAC:(BOOL)ac laundry:(BOOL)laundry printer:(BOOL)printer subfree:(BOOL)subfree campus:(NSString*)campus floor:(NSString*)floor type:(NSString*)type{
    NSMutableString* urlString = [NSMutableString stringWithFormat:@"?roomquery=true"];
    if (ac)
        [urlString appendFormat:@"&ac=1"];
    if (laundry)
        [urlString appendFormat:@"&laundry=1"];
    if (printer)
        [urlString appendFormat:@"&printer=1"];
    if (subfree)
        [urlString appendFormat:@"&subfree=1"];
    if (campus)
        [urlString appendFormat:@"&campus=%@",campus];
    if (floor)
        [urlString appendFormat:@"&floor=%@",floor];
    if (type)
        [urlString appendFormat:@"&type=%@",type];
    
    NSLog(@"%@",urlString);
    [self sendHTTPRequestWithURLString:urlString bodyData:nil completionHandler:^(NSString *response, NSError *error) {
        NSLog(@"%@",response);
    }];
}


-(void) sendHTTPRequestWithURLString: (NSString*)urlString bodyData: (NSString*)body completionHandler: (void (^)(NSString *response, NSError *error))completionHandler{
    // Set query URL
    NSURL *queryURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://dormsdb.alexthemitchell.com/api.php%@",urlString]];
    
    // Setup request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:queryURL];
    
    NSData *requestBodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod=@"POST";
    request.HTTPBody = requestBodyData;
    NSURLSession *URLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *SessionDatatask =[URLSession dataTaskWithRequest:request completionHandler:^(NSData *responsedata, NSURLResponse *response, NSError *error){
        if (error){
            NSLog(@"%@",error.userInfo);
            
        }
        else {
            NSString *responseString = [NSString stringWithUTF8String:[responsedata bytes]];
            
            completionHandler(responseString, error);
        }
    }];
    [SessionDatatask resume];
}

@end
