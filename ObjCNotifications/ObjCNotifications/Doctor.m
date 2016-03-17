//
//  Doctor.m
//  ObjCNotifications
//
//  Created by Eugene Mekhedov on 10.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

#pragma mark - Initialize

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(salaryChangedNotification:)
                                                     name:GovernmentSalaryDidChangeNotification
                                                        object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];
        NSLog(@"------------------------------------PODPISALSYA");
           }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"----------------------------OTPISALYA");
}

#pragma mark - Notifications



- (void) salaryChangedNotification: (NSNotification*) notification{
    NSNumber *value = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    CGFloat salaryChangedPersent = (self.salary - [value floatValue])/100;
    
    if(salaryChangedPersent < 0){
        NSLog(@"Doctors said that Government are good pidors");
        }
    else{
        NSLog(@"Doctors said that Government are fucking  pidors");
    }
    
    self.salary = [value floatValue];
    
    NSLog(@"Doctor have new salary = %@", notification.userInfo);
}

-(void) averagePriceChangedNotification: (NSNotification*) notification{
    NSNumber* value = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    CGFloat averagePriceChangedPersent = (self.averagePrice - [value floatValue])/100;
    
    if (averagePriceChangedPersent < 0){
            NSLog(@"Doctors said that Government is fucking pidors");
        }
    
    else{
            NSLog(@"Doctors said that Government are good pidors");
        }
    
    NSLog(@"Doctors get new average price = %@", notification.userInfo);
}
@end









