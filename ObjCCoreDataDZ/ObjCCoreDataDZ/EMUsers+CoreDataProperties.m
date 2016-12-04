//
//  EMUsers+CoreDataProperties.m
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 22.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUsers+CoreDataProperties.h"

@implementation EMUsers (CoreDataProperties)

+ (NSFetchRequest<EMUsers *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EMUsers"];
}

@dynamic firstName;
@dynamic lastName;
@dynamic email;

@end
