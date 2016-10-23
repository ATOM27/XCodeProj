//
//  EMStudent+CoreDataProperties.h
//  ObjCCoreDataPart1-Basics
//
//  Created by Eugene Mekhedov on 22.10.16.
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

@end

NS_ASSUME_NONNULL_END
