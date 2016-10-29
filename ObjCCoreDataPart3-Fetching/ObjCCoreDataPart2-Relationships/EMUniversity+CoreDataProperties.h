//
//  EMUniversity+CoreDataProperties.h
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 25.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUniversity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EMUniversity (CoreDataProperties)

+ (NSFetchRequest<EMUniversity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<EMStudent *> *students;
@property (nullable, nonatomic, retain) NSSet<EMCourse *> *courses;

@end

@interface EMUniversity (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(EMStudent *)value;
- (void)removeStudentsObject:(EMStudent *)value;
- (void)addStudents:(NSSet<EMStudent *> *)values;
- (void)removeStudents:(NSSet<EMStudent *> *)values;

- (void)addCoursesObject:(EMCourse *)value;
- (void)removeCoursesObject:(EMCourse *)value;
- (void)addCourses:(NSSet<EMCourse *> *)values;
- (void)removeCourses:(NSSet<EMCourse *> *)values;

@end

NS_ASSUME_NONNULL_END
