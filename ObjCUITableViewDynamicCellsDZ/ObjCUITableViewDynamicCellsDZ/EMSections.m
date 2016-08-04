//
//  EMSections.m
//  ObjCUITableViewDynamicCellsDZ
//
//  Created by Eugene Mekhedov on 04.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMSections.h"

@implementation EMSections

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arrayOfStudentsInSection = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
