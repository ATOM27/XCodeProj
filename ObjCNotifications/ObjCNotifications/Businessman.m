//
//  Businessman.m
//  ObjCNotifications
//
//  Created by Eugene Mekhedov on 10.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Businessman.h"

@implementation Businessman

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(TaxLevelChangedNotification:)
                                                     name:GovernmentTaxLevelDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];

    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void) TaxLevelChangedNotification: (NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:GovernmentTaxLevelUserInfoKey];
    CGFloat taxLevelChangedPersent = (self.taxLevel - [value floatValue])/100;
    if (taxLevelChangedPersent < 0){
        NSLog(@"Businessman said that Government are fucking pidors");
    }

    NSLog(@"Businessman get the tax level from government = %@", notification.userInfo);
}

-(void) averagePriceChangedNotification: (NSNotification*) notification{
    NSNumber* value = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    CGFloat averagePriceChangedPersent = (self.averagePrice - [value floatValue])/100;
    
    if (averagePriceChangedPersent < 0){
        NSLog(@"Businessman said that Government are fucking pidors");
    }
    
    else{
        NSLog(@"Businessman said that Government are good pidors");
    }
    
    NSLog(@"Businessman get new average price = %@", notification.userInfo);
}

@end
