//
//  EMObject+CoreDataProperties.m
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 22.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMObject+CoreDataProperties.h"

@implementation EMObject (CoreDataProperties)

+ (NSFetchRequest<EMObject *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EMObject"];
}


@end
