//
//  DDObject.m
//  DORMSDB
//
//  Created by Alex Mitchell on 4/3/14.
//  Copyright (c) 2014 Alex Mitchell. All rights reserved.
//

#import "DDObject.h"

@implementation DDObject

+(DDObject*) roomWithNumber:(NSString*)number Hall:(NSString *)hall AC:(BOOL)ac Laundry:(BOOL)laundry Printer:(BOOL)printer SubstanceFree:(BOOL)substanceFree GenderNeutral:(BOOL)genderNeutral LoggiaAccess:(BOOL)loggiaAccess Campus:(NSString *)campus Cluster:(NSString *)cluster Type:(NSString *)type Floor:(NSUInteger)floor{
    DDObject *room = [DDObject new];
    room.hall = hall;
    room.number=number;
    room.airConditioning = ac;
    room.laundry = laundry;
    room.printer = printer;
    room.substanceFree = substanceFree;
    room.genderNeutral = genderNeutral;
    room.loggiaAccess = loggiaAccess;
    room.campus = campus;
    room.cluster = cluster;
    room.type = type;
    room.floor = floor;
    
    
    return room;
}



@end
