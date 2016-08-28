//
//  NSString+Random.m
//  ObjCUITableViewSearch
//
//  Created by Eugene Mekhedov on 29.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)randomAlphanumericString{
    
    int lenght = arc4random() % 11 + 5;
    
    return [self randomAlphanumericStringWithLength:lenght];
}

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
