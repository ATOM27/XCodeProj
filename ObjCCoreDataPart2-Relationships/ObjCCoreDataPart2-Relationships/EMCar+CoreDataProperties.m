//
//  EMCar+CoreDataProperties.m
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMCar+CoreDataProperties.h"

@implementation EMCar (CoreDataProperties)

+ (NSFetchRequest<EMCar *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EMCar"];
}

@dynamic model;
@dynamic owner;

@end
