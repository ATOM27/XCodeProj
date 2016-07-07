//
//  AppDelegate.m
//  ObjCMultithreading
//
//  Created by Eugene Mekhedov on 24.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "EMStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    dispatch_queue_t personalQueue = dispatch_queue_create("com.eugenemekhedov", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue,^(){
//        
//        CGFloat startTime = CACurrentMediaTime();
//        for (NSInteger i = 0; i < 200000; i++){
//            NSLog(@"%d", i);
//        }
//        NSLog(@"finished counting in %f", CACurrentMediaTime() - startTime);
//        
//    });
    EMStudent* student1 = [[EMStudent alloc] init];
    student1.name = @"Vasya_1";

    NSArray* array = [NSArray arrayWithObjects:student1, nil];
    for (EMStudent *student in array){
        __weak EMStudent* stud1Pointer = student;
        [student1 studentFindAnswer:35 a:0 b:100 andBlock:^(NSString* name, CGFloat startTime){
            NSLog(@"%@ found it for %.4f!", name, CACurrentMediaTime() - startTime);
        }];
    }
    
    
    
//    EMStudent* student2 = [[EMStudent alloc] init];
//    student2.name = @"Vasya_2";
//    __weak EMStudent* stud2Pointer = student2;
//    
//    EMStudent* student3 = [[EMStudent alloc] init];
//    student3.name = @"Vasya_3";
//    __weak EMStudent* stud3Pointer = student3;
//    
//    EMStudent* student4 = [[EMStudent alloc] init];
//    student4.name = @"Vasya_4";
//    __weak EMStudent* stud4Pointer = student4;
//    
//    EMStudent* student5 = [[EMStudent alloc] init];
//    student5.name = @"Vasya_5";
//    __weak EMStudent* stud5Pointer = student5;
    
        //[student2 studentFindAnswer:40 a:0 b:100];
    //[student3 studentFindAnswer:10 a:0 b:100];
    //[student4 studentFindAnswer:67 a:0 b:100];
    //[student5 studentFindAnswer:84 a:0 b:100];
    
    return YES;
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
