//
//  DDObject.h
//  DORMSDB
//
//  Created by Alex Mitchell on 4/3/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDObject : NSObject
@property BOOL airConditioning;
@property BOOL laundry;
@property BOOL printer;
@property BOOL substanceFree;
@property BOOL genderNeutral;
@property BOOL loggiaAccess;
@property NSString* campus;
@property NSString* cluster;
@property NSString* type;
@property NSUInteger floor;
@property NSString* number;
@property NSString* hall;


+(DDObject*) roomWithNumber: (NSString*)number Hall:(NSString*)hall AC:(BOOL)ac Laundry:(BOOL)laundry Printer:(BOOL)printer SubstanceFree: (BOOL)substanceFree GenderNeutral: (BOOL)genderNeutral LoggiaAccess:(BOOL)loggiaAccess Campus:(NSString*)campus Cluster:(NSString*)cluster Type:(NSString*)type Floor:(NSUInteger)floor;
@end