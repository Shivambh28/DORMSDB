//
//  DDAPICall.h
//  DORMSDB
//
//  Created by Alex Mitchell on 4/14/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDAPICall : NSObject
@property NSDictionary* results;


-(void) dormQueryWithAC:(BOOL)ac laundry:(BOOL)laundry printer:(BOOL)printer subfree:(BOOL)subfree campus:(NSString*)campus floor:(NSString*)floor type:(NSString*)type;
@end
