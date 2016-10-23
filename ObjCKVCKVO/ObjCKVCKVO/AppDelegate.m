//
//  AppDelegate.m
//  ObjCKVCKVO
//
//  Created by Eugene Mekhedov on 02.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "EMStudent.h"
#import "EMGroup.h"

@interface AppDelegate ()

@property (strong, nonatomic) EMStudent* student;
@property (strong, nonatomic) NSArray* groups;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
   
    EMStudent* student = [[EMStudent alloc] init];
   
    [student addObserver:self
                   forKeyPath:@"name"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil]; // but if we make some method in EMStudent where change name with _name observer won't see this change and addObserver will not call. So addObserver doesn't work with ivar.
    //but there is some methods wich can say that the name was changed with iVar:
    //- (void)willChangeValueForKey:(NSString *)key;
    //- (void)didChangeValueForKey:(NSString *)key;
    
    //For example
    [student changeNameWithIVar];
    
    student.name = @"Alex";
    student.age = 20;
    
    NSLog(@"%@", student);
    
    [student setValue:@"Roger" forKey:@"name"];
    [student setValue:@25 forKey:@"age"]; // @25 is the same as [NSNumber numberWithInt:25]
    
    NSLog(@"name1 = %@, name2 = %@", student.name, [student valueForKey:@"name"]);
    NSLog(@"%@", student);
    
    self.student = student;
   
    
    EMStudent* student1 = [[EMStudent alloc] init];
    student1.name = @"Alex";
    student1.age = 20;
//
//    EMStudent* student2 = [[EMStudent alloc] init];
//    student2.name = @"Roger";
//    student2.age = 25;
//    
//    EMStudent* student3 = [[EMStudent alloc] init];
//    student3.name = @"Jack";
//    student3.age = 22;
//    
//    EMStudent* student4 = [[EMStudent alloc] init];
//    student4.name = @"Vova";
//    student4.age = 28;
//    
//    EMGroup* group1 = [[EMGroup alloc] init];
//    group1.students = @[student1, student2, student3, student4];
    
    /*[group1 addObserver:self
             forKeyPath:@"students"
                options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                context:nil];
    
    NSLog(@"%@", group1.students);
    
    NSMutableArray* array = [group1 mutableArrayValueForKey:@"students"];
    
    [array removeLastObject]; there is also will change in group1.students
    
    NSLog(@"%@", array);
    
    [group1 removeObserver:self forKeyPath:@"students"];
     
     */
 
   // /*
    self.student = student1;
    
    NSLog(@"Student1 name = %@", [self valueForKeyPath:@"student.name"]);
    
    //NSString* name = @"Alex111";
    NSNumber* name = @6;
    
    NSError* error = nil;
    
    if (![self.student validateValue:&name forKey:@"name" error:&error]){
        NSLog(@"%@", error);
    } 
     //*/
    
//    EMStudent* student5 = [[EMStudent alloc] init];
//    student5.name = @"Vasya";
//    student5.age = 18;
//    
//    EMStudent* student6 = [[EMStudent alloc] init];
//    student6.name = @"Kolya";
//    student6.age = 24;
//    
//    EMGroup* group2 = [[EMGroup alloc] init];
//    group2.students = @[student5, student6];
//    
//    self.groups = @[group1, group2];
//    
//    NSLog(@"groups count %@", [self valueForKeyPath:@"groups.@count"]);
//    
//    NSArray* allStudents = [self.groups valueForKeyPath:@"@distinctUnionOfArrays.students"];
//    
//    NSLog(@"all students = %@", allStudents);
//    
//    NSNumber* minAge = [allStudents valueForKeyPath:@"@min.age"];
//    NSNumber* maxAge = [allStudents valueForKeyPath:@"@max.age"];
//    NSNumber* sumAge = [allStudents valueForKeyPath:@"@sum.age"];
//    NSNumber* avgAge = [allStudents valueForKeyPath:@"@avg.age"];
//    
//    NSLog(@"minAge = %@", minAge);
//    NSLog(@"maxAge = %@", maxAge);
//    NSLog(@"sumAge = %@", sumAge);
//    NSLog(@"avgAge = %@", avgAge);
//    
//    NSArray* allNames = [allStudents valueForKeyPath:@"@distinctUnionOfObjects.name"];
//    
//    NSLog(@"all names = %@", allNames);
    [student removeObserver:self forKeyPath:@"name" context:nil];
    return YES;
}

-(void)dealloc{
    [self.student removeObserver:self forKeyPath:@"name"];
}

#pragma mark - Observing

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@\n", keyPath, object, change);
    
    //id value = [change objectForKey:NSKeyValueChangeNewKey];
    
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
