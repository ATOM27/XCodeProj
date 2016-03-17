//
//  Government.m
//  ObjCNotifications
//
//  Created by Eugene Mekhedov on 09.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Government.h"

NSString* const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSString* const GovernmentSalaryDidChangeNotification = @"GovernmentSalaryDidChangeNotification";
NSString* const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSString* const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";

NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString* const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString* const GovernmentPensionUserInfoKey = @"GovernmentPensionUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";

@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
       self.taxLevel = 5.f;
        self.salary = 1000.f;
        self.pension = 500.f;
        self.averagePrice = 10.f;
    }
    return self;
}

-(void) setTaxLevel:(CGFloat)taxLevel{
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:GovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo: dictionary];
}

-(void) setSalary:(CGFloat)salary{
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:GovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo: dictionary];
}

-(void) setPension:(CGFloat)pension{
    _pension = pension;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:GovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

-(void) setAveragePrice:(CGFloat)averagePrice{
    _averagePrice = averagePrice;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:GovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

@end














