//
//  Animal.m
//  objC
//
//  Created by Eugene Mekhedov on 29.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(void) movement{
    NSLog(@"Animal is moving");
}

-(void)dealloc{
    NSLog(@"Animal is dellocated");
}

@end
