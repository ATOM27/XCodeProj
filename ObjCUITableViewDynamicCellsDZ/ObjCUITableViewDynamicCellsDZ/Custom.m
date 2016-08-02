//
//  Custom.m
//  ObjCUITableViewDynamicCellsDZ
//
//  Created by Eugene Mekhedov on 02.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Custom.h"

@implementation Custom

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithColor:(UIColor*) color
{
    self = [super init];
    if (self) {
        self.color = color;
    }
    return self;
}

@end
