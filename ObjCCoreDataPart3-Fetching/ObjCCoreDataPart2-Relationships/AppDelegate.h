//
//  AppDelegate.h
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

