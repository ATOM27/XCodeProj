//
//  Runners.h
//  objC
//
//  Created by Eugene Mekhedov on 28.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Runners <NSObject>
typedef enum {
    Red,
    White,
    Brown,
    Black
} hairColor;

@required
@property (assign, nonatomic) float maxSpeed;

-(void) run;

@optional
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) hairColor colorOfHair;

@end
