//
//  EMObject+CoreDataProperties.m
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMObject+CoreDataProperties.h"

@implementation EMObject (CoreDataProperties)

+ (NSFetchRequest<EMObject *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EMObject"];
}


@end
