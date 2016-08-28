//
//  NSString+Random.h
//  ObjCUITableViewSearch
//
//  Created by Eugene Mekhedov on 29.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)

+ (NSString *)randomAlphanumericString;
+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length;

@end
