//
//  DrawingView.m
//  ObjCDrawings
//
//  Created by Eugene Mekhedov on 06.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    NSLog(@"Draw rect in: %@", NSStringFromCGRect(rect));
}


@end
