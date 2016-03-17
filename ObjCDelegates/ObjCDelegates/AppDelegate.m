//
//  AppDelegate.m
//  ObjCDelegates
//
//  Created by Eugene Mekhedov on 05.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "Doctor.h"
#import "Patient.h"
#import "BadDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Patient* patient1 = [[Patient alloc] init];
    patient1.name = @"Mark";
    patient1.temperature = 39.9f;
    patient1.headache = arc4random() % 2;
    patient1.stomache = arc4random() %2;

    Patient* patient2 = [[Patient alloc] init];
    patient2.name = @"Odin";
    patient2.temperature = 37.1f;
    patient2.headache = arc4random() % 2;
    patient2.stomache = arc4random() %2;

    Patient* patient3 = [[Patient alloc] init];
    patient3.name = @"Bruce";
    patient3.temperature = 40.f;
    patient3.headache = arc4random() % 2;
    patient3.stomache = arc4random() %2;
    
    Doctor* doctor1 = [[Doctor alloc] init];
    BadDoctor* badDoctor = [[BadDoctor alloc] init];
    
    NSArray* patients = [NSArray arrayWithObjects:patient1, patient2, patient3, nil];
    
    void (^block) (Patient*) = ^(Patient* patient){
            if (patient.headache && patient.stomache){
                [patient makeShoot];
                patient.headache = false;
                patient.stomache = false;
                NSLog(@"Patient %@ fell not good because of headache and stomache", patient.name);
            }
        
            if (patient.temperature >39.f && patient.temperature <= 42.f){
                [patient makeShoot];
                patient.temperature = 36.6f;
                  NSLog(@"Patient %@ fell not good because of tempriture", patient.name);
            }
        
        
            if (patient.temperature >=37.f && patient.temperature <= 39.f){
                [patient takePill];
                patient.temperature = 36.6f;
                  NSLog(@"Patient %@ fell not good because of tempriture", patient.name);
            }
            if (patient.headache) {
                [patient takePill];
                patient.headache = false;
                  NSLog(@"Patient %@ fell not good because of headache", patient.name);
            }
            if (patient.stomache) {
                [patient takePill];
                patient.stomache = false;
                  NSLog(@"Patient %@ fell not good because of stomache", patient.name);
            }

    };
    
    for (id patient in patients)
    {
        Patient* patientCicle = (Patient*) patient;
        if (arc4random() % 2){
            [patientCicle howAreYou:block];
            }
        else{
           // patientCicle.delegate = badDoctor;
        }
       // [patientCicle howAreYou];
      //  if (arc4random() % 2)
            //[patientCicle feelWarse];

    }
    
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
