//
//  EMCar+CoreDataProperties.h
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMCar+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EMCar (CoreDataProperties)

+ (NSFetchRequest<EMCar *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *model;
@property (nullable, nonatomic, retain) EMStudent *owner;

@end

NS_ASSUME_NONNULL_END
