//
//  AppDelegate.m
//  ObjCBlocks
//
//  Created by Eugene Mekhedov on 13.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

//1. В апп делегате создайте блок с без возвращаемой переменной и без параметров и вызовите его.
//2. Создайте блоки с параметрами и передайте туда строку, которую выведите на экран в последствии.
//3. Если вы не определили тип данных для ваших блоков, то сделайте это сейчас и используйте их
//4. Создайте метод который принимает блок и вызывает его и вызовите этот метод.


#import "AppDelegate.h"
#import "EMStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    #pragma mark - BLOCK
    void (^testBlock)(void) = ^(){
        NSLog(@"TEST BLOCK without paramethers");
    };
    #pragma mark - BLOCK WITH PARAMS
    void (^testBlockWithParamethers)(NSString*, NSInteger) = ^(NSString* string1, NSInteger intValue){
        NSLog(@"%@ %ld", string1, (long)intValue);
    };
    
   #pragma mark - RETURN BLOCK
    
    NSString* (^testBlockWithResult)(NSString*, NSInteger) = ^(NSString* string1, NSInteger intValue){
        return [NSString stringWithFormat:@"%@ %ld", string1, (long)intValue];
    };
    
#pragma mark - STRING BLOCK
    __block NSInteger i = 0;
    __block NSString* string2 = @"Test string2";
    void (^testBlockString)(void) = ^(){
        i++;
        string2 = @"sdkjghkejr ewlnfgk ewlkfj";
    };
    
    
    testBlock();
    testBlockWithParamethers(@"HI", 111);
    NSString* returnStringFromBlock = testBlockWithResult(@"RETURN STRING", 111);
    NSLog(@"%@", returnStringFromBlock);
    
    testBlockString();
    NSLog(@"%@", string2);
    
    [self testMethod:^{
        NSLog(@"INSIDE BLOCK METHOD");
    }];
    
    
    #pragma mark - STUDENT
    
    EMStudent* student1 = [[EMStudent alloc] init];
    student1.name = @"Ivan";
    student1.secondName = @"Pergoz";
    
    EMStudent* student2 = [[EMStudent alloc] init];
    student2.name = @"Evgen";
    student2.secondName = @"Mekhedov";
    
    EMStudent* student3 = [[EMStudent alloc] init];
    student3.name = @"Victor";
    student3.secondName = @"Koshevoi";
    
    EMStudent* student4 = [[EMStudent alloc] init];
    student4.name = @"Boris";
    student4.secondName = @"Pergoz";
    
    NSArray* studentArray = [NSArray arrayWithObjects:student1, student2, student3, student4, nil];
    
    
    studentArray = [studentArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 secondName] == [obj2 secondName])
            return [[obj1 name] compare:[obj2 name]];
        else
        return [[obj1 secondName] compare:[obj2 secondName]];
    }];
    
    for (EMStudent* student in studentArray){
        NSLog(@"student: %@ %@", student.name , student.secondName);
    }

    
    // Override point for customization after application launch.
    return YES;
}
-(void) testMethod: (void (^)(void)) bodyBlock{
    NSLog(@"testMethod calls");
    bodyBlock();
};

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
