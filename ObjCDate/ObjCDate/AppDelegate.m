//
//  AppDelegate.m
//  ObjCDate
//
//  Created by Eugene Mekhedov on 28.04.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "AppDelegate.h"
#import "EMStudent.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSDate* dateToday;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    NSDate* date = [NSDate date];
//    NSLog(@"%@", date);
//    
//    NSLog(@"%@", [date dateByAddingTimeInterval:5000]);
//    NSLog(@"%@", [date dateByAddingTimeInterval:-5000]);
//    
//    NSDate* date2 = [NSDate dateWithTimeIntervalSinceReferenceDate:10];
//    
//    NSLog(@"%@", date2);
//    #pragma mark - dateFormatter
//    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//    
//    [dateFormatter setDateStyle: NSDateFormatterShortStyle];
//    NSLog(@"%@",[dateFormatter stringFromDate:date]);
//    
//    [dateFormatter setDateStyle: NSDateFormatterMediumStyle];
//    NSLog(@"%@",[dateFormatter stringFromDate:date]);
//    
//    [dateFormatter setDateStyle: NSDateFormatterLongStyle];
//    NSLog(@"%@",[dateFormatter stringFromDate:date]);
//    
//    [dateFormatter setDateStyle: NSDateFormatterFullStyle];
//    NSLog(@"%@",[dateFormatter stringFromDate:date]);
//    
//    [dateFormatter setDateFormat:@"yyyy M MM MMM MMMM MMMMM"]; // M MM MMM this means how many letters would be in month
//    NSLog(@"%@", [dateFormatter stringFromDate:date]);
//
//    [dateFormatter setDateFormat:@"yyyy /MM/dd EEE EEEE EEEEE HH:mm:SS"]; // HH - 0..23 hh - 0..12
//    NSLog(@"%@", [dateFormatter stringFromDate:date]);
//    
//    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
//    NSDate* date3 = [dateFormatter dateFromString:@"1995/12/23"];
//    NSLog(@"%@",date3);
//    
//    #pragma mark - components
//    
  //  NSDate* date4 = [NSDate date];
//    NSDate* date5 = [NSDate dateWithTimeIntervalSinceNow:-10005000];
//    
//    NSCalendar* calendar = [NSCalendar currentCalendar];
//    
   // NSDateComponents* components = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth |
   //                                 NSCalendarUnitDay | NSCalendarUnitHour |
//                                    NSCalendarUnitMinute | NSCalendarUnitSecond
//                                    fromDate:date4];
//   // NSLog(@"%@", components);
//    NSLog(@"%@", date4);
//    NSLog(@"%@", date5);
//
//    NSDateComponents* components = [calendar components:NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour fromDate:date4 toDate:date5 options:0];
//    NSLog(@"%@",components);
//    
//    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTest:) userInfo:nil repeats:true];
//    [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    NSMutableArray* students = [[NSMutableArray alloc] init];
    //NSDate* dateToday = [NSDate date];
    self.dateToday = [NSDate date];
    NSLog(@"%@", self.dateToday);
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSInteger secInDay = 24 * 60 * 60;
    NSInteger secInYear = 364 * secInDay;
    
    for (NSInteger i = 0; i < 30; i++){
        EMStudent* student = [[EMStudent alloc] init];
        NSInteger bla = ((secInYear * ((arc4random()%35)+16)) + (((secInDay)%364)+1));
        student.dateOfBirth = [self.dateToday dateByAddingTimeInterval:-bla];
        [student setNameAndSername:arc4random()%5+1 surname:arc4random()%5+1];
        [students addObject:student];
    }
    
    [students sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 dateOfBirth] compare:[obj2 dateOfBirth]];
    }];

    for (EMStudent* student in students){
        NSLog(@"%@ and date of birth: %@",[NSString stringWithFormat:@"%@ %@", student.name, student.surname], [formatter stringFromDate:student.dateOfBirth]);
    }
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* oldStudent = [[students objectAtIndex:0] dateOfBirth];
    NSDate* youngStudent = [[students objectAtIndex:[students count] -1] dateOfBirth];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:oldStudent toDate:youngStudent options:0];
    NSLog(@"The difference are: %d, %d, %d, %d", components.year, components.month, components.weekday, components.day);
    
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerMethod:) userInfo:students repeats:true];
    
    return YES;
}

//- (void) timerTest:(NSTimer*) timer{
//    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"HH:mm:ss"];
//    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
//
//}

-(void)timerMethod:(NSTimer*) timer{
    NSMutableArray* arr = [timer userInfo];
    self.dateToday = [self.dateToday dateByAddingTimeInterval: + 86400];
    NSLog(@"%@", self.dateToday);
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth fromDate:self.dateToday];
    NSDateFormatter* formatter2 = [[NSDateFormatter alloc] init];
    
    for (EMStudent* student in arr){
        NSDateComponents* components2 = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth fromDate:student.dateOfBirth];
        if (components.day == components2.day && components.month == components2.month){
            NSLog(@"Happy birthday %@ %@ %@", student.name, student.surname, [formatter2 stringFromDate:student.dateOfBirth]);
        }
    }
    
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
