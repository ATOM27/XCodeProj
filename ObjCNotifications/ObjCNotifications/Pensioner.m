//
//  Pensioner.m
//  ObjCNotifications
//
//  Created by Eugene Mekhedov on 10.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Pensioner.h"


@implementation Pensioner

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(pensionChangedNotification:)
                                                     name:GovernmentPensionDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];

    }
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void) pensionChangedNotification: (NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:GovernmentPensionUserInfoKey];
    self.pension = [value floatValue];
    NSLog(@"Pension did change = %.2f", self.pension);
}

-(void) averagePriceChangedNotification: (NSNotification*) notification{
    NSLog(@"Pensioners get new average price = %@", notification.userInfo);
}
@end
