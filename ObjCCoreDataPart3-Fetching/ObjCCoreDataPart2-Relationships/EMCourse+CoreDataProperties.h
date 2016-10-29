//
//  EMCourse+CoreDataProperties.h
//  ObjCCoreDataPart3-Fetching
//
//  Created by Eugene Mekhedov on 29.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMCourse+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EMCourse (CoreDataProperties)

+ (NSFetchRequest<EMCourse *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<EMStudent *> *students;
@property (nullable, nonatomic, retain) EMUniversity *university;
@property (nullable, nonatomic, retain) NSArray *bestStudents;//Fetch Properties are not created with subclass. If you want to use them through "." you need to declare them by yourself. Type NSArray. Don't forget about dynamic.
@property (nullable, nonatomic, retain) NSArray* studentsWithManyCourses;
@end

@interface EMCourse (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(EMStudent *)value;
- (void)removeStudentsObject:(EMStudent *)value;
- (void)addStudents:(NSSet<EMStudent *> *)values;
- (void)removeStudents:(NSSet<EMStudent *> *)values;

@end

NS_ASSUME_NONNULL_END
