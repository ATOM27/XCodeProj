//
//  EMDataManager.h
//  ObjCCoreDataPart3-Fetching
//
//  Created by Eugene Mekhedov on 02.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EMUniversity;
@interface EMDataManager : NSObject

+(EMDataManager*) sharedManager;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

-(void) generateAndAddUniversity;
-(NSArray*) allObjects;
-(void) printArray:(NSArray*) array;

@end
