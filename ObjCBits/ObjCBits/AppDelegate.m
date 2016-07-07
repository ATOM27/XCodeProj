//
//  AppDelegate.m
//  ObjCBits
//
//  Created by Eugene Mekhedov on 28.04.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "EMStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSMutableArray* students = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 10; i++){
         EMStudent* student1 = [[EMStudent alloc] init];
        for (NSInteger j = 0; j < 7; j++){
            if (arc4random()%2)
               student1.subjectType = student1.subjectType | [student1 randomSubjectType:j];
        }
        [students addObject:student1];
    }
    
    
   // EMStudent* student1 = [[EMStudent alloc] init];
    
   // student1.subjectType = EMStudentSubjectTypeDevelopment | EMStudentSubjectTypeMath |
                           EMStudentSubjectTypePhylosophy | EMStudentSubjectTypeAnatomy;
    
   // NSLog(@"%@", student1);
    
    NSMutableArray* gumanitarii = [[NSMutableArray alloc] init];
    NSMutableArray* technari = [[NSMutableArray alloc] init];
    
    for (EMStudent* student in students){
        if ((student.subjectType & EMStudentSubjectTypeMath) ||
            (student.subjectType & EMStudentSubjectTypeDevelopment) ||
            (student.subjectType & EMStudentSubjectTypeEngineering)){
            [technari addObject:student];
        }
        else{
            [gumanitarii addObject:student];
        }
    }
    
    
    NSInteger countDeveloperLearners = 0;
    for (EMStudent* student in students){
        //NSLog(@"%@", student);
        if (student.subjectType & EMStudentSubjectTypeDevelopment)
            countDeveloperLearners++;
        if (student.subjectType & EMStudentSubjectTypeBiology){
            student.subjectType = student.subjectType ^ EMStudentSubjectTypeBiology;
        }
        //NSLog(@"%@", student);
    }
    NSLog(@"Developer Learners: %d", countDeveloperLearners);
    
    
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
