//
//  Businessman.h
//  ObjCNotifications
//
//  Created by Eugene Mekhedov on 10.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Government.h"

@interface Businessman : NSObject

@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat taxLevel;

@end
