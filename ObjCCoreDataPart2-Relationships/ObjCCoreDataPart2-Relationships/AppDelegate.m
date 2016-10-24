//
//  AppDelegate.m
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "EMStudent+CoreDataClass.h"
#import "EMCar+CoreDataClass.h"
#import "EMUniversity+CoreDataClass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

static NSString* carModelNames[] = {
    @"Doodge", @"Toyota", @"BMW", @"Lada", @"Volga"
};

-(EMStudent*) addStudent {
    //This method show how to work with object of model's class
    EMStudent* student = [NSEntityDescription insertNewObjectForEntityForName:@"EMStudent"
                                                       inManagedObjectContext:self.persistentContainer.viewContext];
    
    student.firstName = @"Mark";
    student.lastName = @"Bla";
    student.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:60 * 60 * 24 * 365 * arc4random_uniform(31)];
    student.score = 3.55f;
    
    return student;
}

-(EMCar*) addCar {
    //This method show how to work with object of model's class
    EMCar* car = [NSEntityDescription insertNewObjectForEntityForName:@"EMCar"
                                                       inManagedObjectContext:self.persistentContainer.viewContext];
    
    car.model = carModelNames[arc4random_uniform(5)];
    return car;
}

-(EMUniversity*) addUniversity {
    //This method show how to work with object of model's class
    EMUniversity* university = [NSEntityDescription insertNewObjectForEntityForName:@"EMUniversity"
                                               inManagedObjectContext:self.persistentContainer.viewContext];
    
    university.name = @"KPI";
    return university;
}

-(NSArray*) allObjects {
    NSFetchRequest* request = [[NSFetchRequest alloc] init];// we are creating a query in SQL
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"EMObject"
                                                   inManagedObjectContext:self.persistentContainer.viewContext];
    
    [request setEntity:description];
    //[request setResultType:NSDictionaryResultType];// then the execute will return NSDictionary!!!
    
    NSArray* resultArray = [self.persistentContainer.viewContext executeFetchRequest:request error:nil];
    
    return resultArray;

}

-(void) printAllObjects {
    
    NSArray* allObjest = [self allObjects];
    
    for (id object in allObjest){
        
        if ([object isKindOfClass:[EMCar class]]){
            
            EMCar* car = (EMCar*) object;
            NSLog(@"CAR: %@, OWNER: %@ %@", car.model, car.owner.firstName, car.owner.lastName);
            
        } else if ([object isKindOfClass:[EMStudent class]]){
            
            EMStudent* student = (EMStudent*) object;
            NSLog(@"STUDENT: %@ %@, CAR: %@, UNIVERSITY: %@", student.firstName, student.lastName, student.car.model, student.university.name);
            
        }else if ([object isKindOfClass:[EMUniversity class]]){
            
            EMUniversity* university = (EMUniversity*) object;
            NSLog(@"UNIVERSITY: %@, STUENTS: %lu", university.name, [university.students count]);
            
        }
    }
}

-(void) deleteAllObjects {
    
    NSArray* allObjest = [self allObjects];
    
    for (id object in allObjest){
        [self.persistentContainer.viewContext deleteObject:object];
    }

    NSError* error = nil;
    if (![self.persistentContainer.viewContext save:&error]){
        NSLog(@"%@", [error localizedDescription]);
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSError* error = nil;

    EMUniversity* university = [self addUniversity];
    
    for (int i = 0; i < 30; i++){
        
        EMStudent* s1 = [self addStudent];
        
        if (arc4random_uniform(1000) < 500){
            EMCar* c1 = [self addCar];
            s1.car = c1;// with help of inverse we don't need to define car's owner because it's already done;
        }
        
        s1.university = university;// the same as below
        //[university addStudentsObject:s1];
    }
    
    
    if (![self.persistentContainer.viewContext save:&error]){
        NSLog(@"%@", error);
    }
    
    [self printAllObjects];
    /// DELETING
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];// we are creating a query in SQL
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"EMStudent"//EMUniversity
                                                   inManagedObjectContext:self.persistentContainer.viewContext];// If we are delete car, student will not delete because car's owner delete rule is Nullify
    
    [request setEntity:description];
    //[request setResultType:NSDictionaryResultType];// then the execute will return NSDictionary!!!
    
    NSArray* resultArray = [self.persistentContainer.viewContext executeFetchRequest:request error:nil];
    
    if ([resultArray count] > 0){
        EMStudent* stud = [resultArray firstObject];
        [self.persistentContainer.viewContext deleteObject:stud];
        //EMUniversity* univ = [resultArray firstObject];
        //[self.persistentContainer.viewContext deleteObject:univ];
    }
    
    if (![self.persistentContainer.viewContext save:&error]){
        NSLog(@"%@", error);
    }
    
    [self printAllObjects];
    /// END DELETING
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
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ObjCCoreDataPart2_Relationships"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
