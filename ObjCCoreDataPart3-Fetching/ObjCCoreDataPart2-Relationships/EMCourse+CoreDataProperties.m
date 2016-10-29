//
//  EMCourse+CoreDataProperties.m
//  ObjCCoreDataPart3-Fetching
//
//  Created by Eugene Mekhedov on 29.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMCourse+CoreDataProperties.h"

@implementation EMCourse (CoreDataProperties)

+ (NSFetchRequest<EMCourse *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EMCourse"];
}

@dynamic name;
@dynamic students;
@dynamic university;
@dynamic bestStudents;
@dynamic studentsWithManyCourses;

@end
