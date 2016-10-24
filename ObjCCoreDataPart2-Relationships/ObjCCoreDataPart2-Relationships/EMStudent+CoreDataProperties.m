//
//  EMStudent+CoreDataProperties.m
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent+CoreDataProperties.h"

@implementation EMStudent (CoreDataProperties)

+ (NSFetchRequest<EMStudent *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EMStudent"];
}

@dynamic dateOfBirth;
@dynamic firstName;
@dynamic lastName;
@dynamic score;
@dynamic car;
@dynamic university;

@end
