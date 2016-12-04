//
//  EMUsers+CoreDataProperties.h
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 22.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUsers+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EMUsers (CoreDataProperties)

+ (NSFetchRequest<EMUsers *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSString *email;

@end

NS_ASSUME_NONNULL_END
