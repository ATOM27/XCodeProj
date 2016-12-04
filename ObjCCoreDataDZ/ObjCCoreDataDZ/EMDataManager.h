//
//  EMDataManager.h
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 22.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EMUsers;

@interface EMDataManager : NSObject

+(EMDataManager*) sharedManager;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
-(EMUsers*) addUserWithName:(NSString*)name lastName:(NSString*)lastName email:(NSString*)email;

@end
