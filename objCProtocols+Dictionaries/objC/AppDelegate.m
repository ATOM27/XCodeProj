//
//  AppDelegate.m
//  objC
//
//  Created by Eugene Mekhedov on 25.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Bicyclist.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Animal.h"
#import "Kangaroo.h"
#import "Gepard.h"
#import "Shark.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#pragma mark - protocols
//    Human* human1 = [[Human alloc] init];
//        human1.name = @"Vasya";
//        human1.height = 1.8f;
//        human1.age = 18;
//        human1.gender = Male;
//    
//    Bicyclist* bicyclist1 = [[Bicyclist alloc] init];
//        bicyclist1.name = @"Ivan";
//        bicyclist1.height = 1.75f;
//        bicyclist1.age = 23;
//        bicyclist1.gender = Male;
//
//    Runner* runner1 = [[Runner alloc] init];
//        runner1.name = @"Ann";
//        runner1.height = 1.73f;
//        runner1.age = 20;
//        runner1.gender = Female;
//    
//    Swimmer* swimmer1 = [[Swimmer alloc] init];
//        swimmer1.name = @"Pete";
//        swimmer1.height = 1.73f;
//        swimmer1.age = 20;
//        swimmer1.gender = Male;
//
//    Animal* animal1 = [[Animal alloc] init];
//        animal1.typeOfAnimal = @"Squirle";
//    
//    Kangaroo* kangaroo1 = [[Kangaroo alloc] init];
//        kangaroo1.typeOfAnimal = @"Kangaroo";
//        kangaroo1.name = @"Jack";
//        kangaroo1.colorOfEyes = @"Blue";
//        kangaroo1.high = 2;
//    
//    Gepard* gepard1 = [[Gepard alloc] init];
//        gepard1.typeOfAnimal = @"Gepard";
//        gepard1.maxSpeed = 120.0f;
//    
//    Shark* shark1 = [[Shark alloc] init];
//        shark1.typeOfAnimal = @"White Shark";
//        shark1.timeWithoutBreathing = INT_MAX;
//    NSDictionary* dic = @{@"Key":@"asdjkl"};
//    
//    NSArray* creations = [NSArray arrayWithObjects:human1, bicyclist1, runner1, swimmer1, animal1, kangaroo1, gepard1, shark1, nil];
//    
//    for(id creation in creations){
//            if ([creation conformsToProtocol: @protocol(Jumpers)]){
//                if ([creation isKindOfClass: [Kangaroo class]]){
//                    Kangaroo* kang = (Kangaroo*) creation;
//                    NSLog(@"%@ class, and type of animal is %@, and high is %d", NSStringFromClass([creation class]), kang.typeOfAnimal, kang.high);
//                    [kang movement];
//                }
//                
//                if ([creation isKindOfClass: [Gepard class]]){
//                    Gepard* gep = (Gepard*) creation;
//                    NSLog(@"%@ class, and type of animal is %@, and max speed is %.2f", NSStringFromClass([creation class]), gep.typeOfAnimal, gep.maxSpeed);
//                    [gep movement];
//                }
//                
//                if ([creation isKindOfClass: [Shark class]]){
//                    Shark* shr = (Shark*) creation;
//                    NSLog(@"%@ class, and type of animal is %@, and max speed is %.2f", NSStringFromClass([creation class]), shr.typeOfAnimal, shr.timeWithoutBreathing);
//                    [shr movement];
//                }
//                                
//                if ([creation isKindOfClass: [Runner class]]){
//                    Runner* run = (Runner*) creation;
//                    NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), run.gender, run.name);
//                    [run movement];
//                }
//                
//                if ([creation isKindOfClass: [Swimmer class]]){
//                    Swimmer* swim = (Swimmer*) creation;
//                    NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), swim.gender, swim.name);
//                    [swim movement];
//                }
//                
//                if ([creation isKindOfClass: [Bicyclist class]]){
//                    Bicyclist* bic = (Bicyclist*) creation;
//                    NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), bic.gender, bic.name);
//                    [bic movement];
//                }
//
//                
//                [creation jump];
//                
//                
//                if ([creation respondsToSelector:@selector(name)] == true){
//                    NSLog(@"Name = %@", [creation name]);
//                }
//                
//                
//                if ([creation respondsToSelector:@selector(colorOfEyes)]){
//                    NSLog(@"Color of eyes - %@", [creation colorOfEyes]);
//                }
//            }
//        
//        if ([creation conformsToProtocol: @protocol(Swimmers)]){
//            if ([creation isKindOfClass: [Kangaroo class]]){
//                Kangaroo* kang = (Kangaroo*) creation;
//                NSLog(@"%@ class, and type of animal is %@, and high is %d", NSStringFromClass([creation class]), kang.typeOfAnimal, kang.high);
//                [kang movement];
//            }
//            
//            if ([creation isKindOfClass: [Gepard class]]){
//                Gepard* gep = (Gepard*) creation;
//                NSLog(@"%@ class, and type of animal is %@, and max speed is %.2f", NSStringFromClass([creation class]), gep.typeOfAnimal, gep.maxSpeed);
//                [gep movement];
//            }
//            
//            if ([creation isKindOfClass: [Shark class]]){
//                Shark* shr = (Shark*) creation;
//                NSLog(@"%@ class, and type of animal is %@, and max speed is %.2f", NSStringFromClass([creation class]), shr.typeOfAnimal, shr.timeWithoutBreathing);
//                [shr movement];
//            }
//            
//            if ([creation isKindOfClass: [Runner class]]){
//                Runner* run = (Runner*) creation;
//                NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), run.gender, run.name);
//                [run movement];
//            }
//            
//            if ([creation isKindOfClass: [Swimmer class]]){
//                Swimmer* swim = (Swimmer*) creation;
//                NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), swim.gender, swim.name);
//                [swim movement];
//            }
//            
//            if ([creation isKindOfClass: [Bicyclist class]]){
//                Bicyclist* bic = (Bicyclist*) creation;
//                NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), bic.gender, bic.name);
//                [bic movement];
//            }
//            
//            
//            [creation swim];
//            
//            
//            if ([creation respondsToSelector:@selector(name)]){
//                NSLog(@"Name = %@", [creation name]);
//            }
//            
//            
//            if ([creation respondsToSelector:@selector(numberOfTooth)]){
//                NSLog(@"Number of tooth - %d", [creation numberOfTooth]);
//            }
//        }
//        
//        if ([creation conformsToProtocol: @protocol(Runners)]){
//            if ([creation isKindOfClass: [Kangaroo class]]){
//                Kangaroo* kang = (Kangaroo*) creation;
//                NSLog(@"%@ class, and type of animal is %@, and high is %d", NSStringFromClass([creation class]), kang.typeOfAnimal, kang.high);
//                [kang movement];
//            }
//            
//            if ([creation isKindOfClass: [Gepard class]]){
//                Gepard* gep = (Gepard*) creation;
//                NSLog(@"%@ class, and type of animal is %@, and max speed is %.2f", NSStringFromClass([creation class]), gep.typeOfAnimal, gep.maxSpeed);
//                [gep movement];
//            }
//            
//            if ([creation isKindOfClass: [Shark class]]){
//                Shark* shr = (Shark*) creation;
//                NSLog(@"%@ class, and type of animal is %@, and max speed is %.2f", NSStringFromClass([creation class]), shr.typeOfAnimal, shr.timeWithoutBreathing);
//                [shr movement];
//            }
//            
//            if ([creation isKindOfClass: [Runner class]]){
//                Runner* run = (Runner*) creation;
//                NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), run.gender, run.name);
//                [run movement];
//            }
//            
//            if ([creation isKindOfClass: [Swimmer class]]){
//                Swimmer* swim = (Swimmer*) creation;
//                NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), swim.gender, swim.name);
//                [swim movement];
//            }
//            
//            if ([creation isKindOfClass: [Bicyclist class]]){
//                Bicyclist* bic = (Bicyclist*) creation;
//                NSLog(@"%@ class, and gender is %d, and name is %@", NSStringFromClass([creation class]), bic.gender, bic.name);
//                [bic movement];
//            }
//            
//            
//            [creation run];
//            
//            
//            if ([creation respondsToSelector:@selector(name)]){
//                NSLog(@"Name = %@", [creation name]);
//            }
//            
//            
//            if ([creation respondsToSelector:@selector(colorOfHair)]){
//                NSLog(@"Color of hair - %d", [creation colorOfHair]);
//            }
//        }
//        
//        if ([creation isKindOfClass:[Human class]]){
//            Human* human = (Human*) creation;
//            NSLog(@"It's human and his(her) name is %@. It's height is %.2f, age is %d. Gender is %d", human.name, human.height, human.age, human.gender);
//        }
//        
//        if ([creation isKindOfClass:[Bicyclist class]]){
//            Bicyclist* bic = (Bicyclist*) creation;
//            NSLog(@"Bic name is %@", bic.name);
//        }
//        
//        if ([creation isKindOfClass:[Animal class]]){
//            Animal* animal = (Animal*) creation;
//            NSLog(@"Animal's type - %@", animal.typeOfAnimal);
//            [animal movement];
//        }
//        
//        
//        
//
//    }
#pragma mark - Array
    
  /*  NSMutableArray* array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 20; i++){
   
        CGPoint point = CGPointMake((arc4random() % 11), (arc4random() % 11));
        
        [array addObject:[NSValue valueWithCGPoint:point]];
        }
    NSLog(@"%@", [array objectAtIndex:1]);
    
    for (NSValue* value in array){
        CGPoint point = [value CGPointValue];
        NSLog(@"%.2f , %.2f", point.x, point.y);
        
    }*/
    
#pragma mark - dictionary
    
    Student* student1 = [[Student alloc] init];
        student1.name = @"Vasia";
        student1.secondName = @"Ivanov";
        student1.introduce = @"Hello, I'm Vasia";
    
    Student* student2 = [[Student alloc] init];
        student2.name = @"Ivan";
        student2.secondName = @"Horlamov";
        student2.introduce = @"Hello, I'm Ivan";
    
    Student* student3 = [[Student alloc] init];
        student3.name = @"Petya";
        student3.secondName = @"Byikov";
        student3.introduce = @"Hello, I'm Petya";
    
    Student* student4 = [[Student alloc] init];
        student4.name = @"Eugene";
        student4.secondName = @"Mekhedov";
        student4.introduce = @"Hello, I'm Eugene";
    
    Student* student5 = [[Student alloc] init];
        student5.name = @"Anton";
        student5.secondName = @"Tretyanov";
        student5.introduce = @"Hello, I'm Anton";
    
    NSDictionary* dictioanry = [NSDictionary dictionaryWithObjectsAndKeys:
                                student1, [student1.name stringByAppendingString:student1.secondName],
                                student2, [student2.name stringByAppendingString:student2.secondName],
                                student3, [student3.name stringByAppendingString:student3.secondName],
                                student4, [student4.name stringByAppendingString:student4.secondName],
                                student5, [student5.name stringByAppendingString:student5.secondName],
                                nil];
   // NSLog(@"%@", dictioanry);
//    for (NSString* keys in [dictioanry allKeys]){
//        id obj = [dictioanry objectForKey:keys];
//        NSLog(@"%@", obj);
//    }
    
    NSObject
    
    NSArray* arr = [dictioanry keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [[obj1 name] compare:[obj2 name]];
    }];
    
    for (NSInteger i = 0; i< [dictioanry count]; i++){
        NSLog(@"%@", [dictioanry objectForKey:[arr objectAtIndex:i]]);
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
