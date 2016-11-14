//
//  EMCar+CoreDataClass.m
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMCar+CoreDataClass.h"
#import "EMStudent+CoreDataClass.h"
@implementation EMCar

- (BOOL)validateForDelete:(NSError **)error{
    
    NSLog(@"Car validate");
    
    return YES;
}


@end
