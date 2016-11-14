//
//  EMObject+CoreDataProperties.h
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 25.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EMObject (CoreDataProperties)

+ (NSFetchRequest<EMObject *> *)fetchRequest;


@end

NS_ASSUME_NONNULL_END
