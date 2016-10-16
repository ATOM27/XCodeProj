//
//  AppDelegate.m
//  ObjCKVCKVODZ
//
//  Created by Eugene Mekhedov on 05.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "EMStudent.h"

@interface AppDelegate ()

@property (strong, nonatomic) EMStudent* student5;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    EMStudent* student1 = [[EMStudent alloc] initWithRandoom];
    EMStudent* student2 = [[EMStudent alloc] initWithRandoom];
    EMStudent* student3 = [[EMStudent alloc] initWithRandoom];
    EMStudent* student4 = [[EMStudent alloc] initWithRandoom];
    EMStudent* student5 = [[EMStudent alloc] initWithRandoom];
    
    student1.friend = student2;
    student2.friend = student3;
    student3.friend = student4;
    student4.friend = student5;
    student5.friend = student1;
    
    self.student5 = student5;
    
    [self.student5 addObserver:self
               forKeyPath:@"firstName"
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:nil];
    
    [self.student5 setValue:@"sfsdf" forKey:@"firstName"];
    
    //NSArray* arrayOfStudents = [[NSArray alloc] initWithObjects:student1, student2, student3, student4, student5, nil];
    
    [student1 setValue:@"stud1" forKey:@"firstName"];
    [student1.friend setValue:@"stud2" forKey:@"firstName"];
    [student1.friend.friend setValue:@"stud3" forKey:@"firstName"];
    [student1.friend.friend.friend setValue:@"stud4" forKey:@"firstName"];
    [student1.friend.friend.friend.friend setValue:@"stud5" forKey:@"firstName"];
    
    [student5 setValue:@"dsdfsdfsd" forKey:@"firstName"];
    [self.student5 setValue:@"sdfsdfsd" forKey:@"firstName"];
    return YES;
}

#pragma mark - Observing
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@\n", keyPath, object, change);
}

-(void)dealloc{
    [self.student5 removeObserver:self forKeyPath:@"firstName"];
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
}


@end
