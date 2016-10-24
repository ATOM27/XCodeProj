//
//  EMUniversity+CoreDataProperties.m
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUniversity+CoreDataProperties.h"

@implementation EMUniversity (CoreDataProperties)

+ (NSFetchRequest<EMUniversity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EMUniversity"];
}

@dynamic name;
@dynamic students;

@end
