//
//  AppDelegate.m
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 22.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "EMDataManager.h"
#import "EMUsers+CoreDataProperties.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //EMUsers* user = [[EMDataManager sharedManager] addUser];
    //[[[[EMDataManager sharedManager] persistentContainer] viewContext] save:nil];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];// we are creating a query in SQL
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"EMObject"
                                                   inManagedObjectContext:[[[EMDataManager sharedManager] persistentContainer] viewContext]];
    
    [request setEntity:description];
    //[request setResultType:NSDictionaryResultType];// then the execute will return NSDictionary!!!
    
    NSArray* resultArray = [[[[EMDataManager sharedManager] persistentContainer] viewContext]executeFetchRequest:request error:nil];
    
    for(id object in resultArray){
        
        EMUsers* user = (EMUsers*)object;
        NSLog(@"%@ %@",user.firstName, user.lastName);
    }
    

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [[EMDataManager sharedManager] saveContext];
}

@end
