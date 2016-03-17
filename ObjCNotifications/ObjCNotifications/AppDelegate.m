//
//  AppDelegate.m
//  ObjCNotifications
//
//  Created by Eugene Mekhedov on 09.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h" 
#import "Government.h"
#import "Doctor.h"
#import "Businessman.h"
#import "Pensioner.h"

@interface AppDelegate ()

@property (strong, nonatomic) Government* government;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.government = [[Government alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:GovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(EnterBackgroundChangedNotification:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(WillEnterForegroundChangedNotification:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
    
    Doctor* doctor1 = [[Doctor alloc] init];
    doctor1.salary = self.government.salary;
    doctor1.averagePrice = self.government.averagePrice;
    
    Businessman* businessman = [[Businessman alloc] init];
    businessman.averagePrice = self.government.averagePrice;
    businessman.taxLevel = self.government.taxLevel;
    
    Pensioner* pensioner1 = [[Pensioner alloc] init];
    pensioner1.pension = self.government.pension;
    
    self.government.taxLevel = 5.5f;
    self.government.salary = 1100;
    self.government.pension = 550;
    self.government.averagePrice = 15;
    
    
    return YES;
}

- (void) WillEnterForegroundChangedNotification: (NSNotification*) notification{
    NSLog(@"IT IS TIME TO WAKE UP!!!");
}

-(void) governmentNotification:(NSNotification*) notification{
   NSLog(@"governmentNotification user info = %@", notification.userInfo);
}

-(void) EnterBackgroundChangedNotification:(NSNotification*) notification{
    NSLog(@"IT IS SLEPPING TIMEE!!!");
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
