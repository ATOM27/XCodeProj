//
//  EMStudent+CoreDataClass.m
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent+CoreDataClass.h"
#import "EMCar+CoreDataClass.h"
#import "EMUniversity+CoreDataClass.h"

@implementation EMStudent

- (BOOL)validateForDelete:(NSError **)error{
    
    NSLog(@"Student validate");
    
    return YES;
}


@end
