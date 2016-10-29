//
//  EMStudent+CoreDataProperties.h
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 25.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EMStudent (CoreDataProperties)

+ (NSFetchRequest<EMStudent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateOfBirth;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nonatomic) double score;
@property (nullable, nonatomic, retain) EMCar *car;
@property (nullable, nonatomic, retain) EMUniversity *university;
@property (nullable, nonatomic, retain) NSSet<EMCourse *> *courses;

@end

@interface EMStudent (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(EMCourse *)value;
- (void)removeCoursesObject:(EMCourse *)value;
- (void)addCourses:(NSSet<EMCourse *> *)values;
- (void)removeCourses:(NSSet<EMCourse *> *)values;

@end

NS_ASSUME_NONNULL_END
