//
//  EMStudent+CoreDataProperties.h
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EMStudent (CoreDataProperties)

+ (NSFetchRequest<EMStudent *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nonatomic) double score;
@property (nullable, nonatomic, copy) NSDate *dateOfBirth;

@end

NS_ASSUME_NONNULL_END
